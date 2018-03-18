=begin
#+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
# Advanced Pathfinding
# Author: ForeverZer0
# Version: 1.1
# Date: 5.30.2011
#+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
#
# Introduction:
#   This is an advanced an highly intelligent pathfinding system. It allows for
#   the user to either through script or script call quickly and easily have
#   events or the game player automatically walk a path to a given set of
#   coordinates. The system is smart enough to quickly find paths through
#   relatively complex areas, and adjust on the fly for any obstacle that moves
#   to block its path. I used the A* algorithm, basic search algorithm used 
#   often for robotics. More on this algorithm can be read about here:
#
#               http://en.wikipedia.org/wiki/A*_search_algorithm
#
# Features:
#   - Fast and intelligent pathfinding
#   - Easy to use script calls
#   - Optional "range" parameter can have character find alternate locations
#     if the preferred one is blocked and they are within the given range.
#   - Optional callbacks can be given to have something execute if when the
#     character reaches its goal, or when it fails to do so.
#
# Instructions:
#   - Place script below default scripts, and above "Main".
#   - Use the following script call:
#
#     pathfind(X, Y, CHARACTER, RANGE, SUCCESS_PROC, FAIL_PROC)
#     
#     The X and Y are the only required arguments. The others can be omitted.
#     
#     X - The x-coordinate to pathfind to.
#     Y - The y-coordinate to pathfind to.
#
#     CHARACTER - Either an instance of the character ($game_player, 
#                 $game_map.events[ID], etc) or the ID of a character. The ID
#                 will be the event ID. Use -1 for the game player.
#
#     SUCCESS_PROC - A Proc object that will be executed when the player
#                    reaches the defined coordinates.
#     FAILURE_PROC - A Proc object that will be executed when the player
#                    cannot reach the defined coordinates.
#
#   - As default, the pathfinder will make 35 attempts to recalculate a route
#     that gets blocked. This value can be changed in game with the script
#     call:
#           $game_map.collision_retry = NUMBER
#
#     You can change the default value if desired by looking down to the first
#     class below in the main script.
#   - For longer pathfind routes, it is sometimes necessary to reset the 
#     search limiter. This may cause increased lag when an object blocks the
#     character from being able to move, but will increase the range that the
#     system can work with. Use the following script call:
#
#         $game_map.search_limiter = NUMBER  (Default 1000)
#
#   - If you are experiencing any compatibility problems, go to the Game_Map
#     class below and set @recalculate_paths to false. This will take away some
#     of the efficiency of recalculating collisions, but will improve may fix
#     your problem. 
#
# Compatibility:
#   Highly compatible. May experience issues with Custom Movement scripts,
#   but even then, it is unlikely.
#
# Credits/Thanks:
#   - ForeverZer0, for the script
#   - Special thanks to Jragyn for help making the big maze for the demo and
#     help testing.
#   - Credit goes to the Peter Hart, Nils Nilsson and Bertram Raphael for the
#     original search algorithm that was implemented
#
#+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+

#===============================================================================
# ** Game_Map
#===============================================================================

class Game_Map
  
  attr_accessor :collision_retry
  attr_accessor :recalculate_paths
  attr_accessor :search_limiter
  
  alias zer0_pathfinding_init initialize
  def initialize
    # Initialize instance variables used for pathfinding.
    @collision_retry = 35
    @recalculate_paths = true
    @search_limiter = 1000
    # Original method
    zer0_pathfinding_init
  end
end

#===============================================================================
# ** Interpreter
#===============================================================================

class Interpreter
  
  def pathfind(x, y, *args)
    args[0] = @event_id if args[0] == nil
    args[1] = 0 if args[1] == nil
    # Add a simpler call for using as a script call
    Pathfind.new(Node.new(x, y), *args)
  end
end

#==============================================================================
# ** Pathfind
#==============================================================================

class Pathfind

  attr_reader   :route                  
  attr_accessor :range   
  attr_reader   :goal
  attr_reader   :found
  attr_reader   :character                                
  attr_accessor :success_proc          
  attr_accessor :failure_proc         
  attr_accessor :target    
  attr_accessor :collisions       
  
  def initialize(node, char = -1, range = 0, *callbacks)
    # Set the character. Can either us an ID or an instance of a Game_Character.
    # A value of -1, which is default, is the Game_Player.
    if char.is_a?(Integer)
      @character = (char == -1) ? $game_player : $game_map.events[char]
    elsif char.is_a?(Game_Character)
      @character = char
    end
    # Set forcing flag. Will be disabled for recalculating on the fly.
    @forcing = true
    # Call a public method, since this method may need to be used again,
    # and "initialize" is private.
    setup(node, range, *callbacks)
  end
  
  def setup(node, range = 0, *callbacks)
    # Initialize the node we are trying to get to.
    @target = Node.new(node.x, node.y)
    @goal = @target.clone
    # Set beginning nodes and required variables.
    @start_node = Node.new(@character.x, @character.y)
    @nearest = Node.new(0, 0, 0, -1)
    @range, @found, @collisions = range, false, 0
    # Set callbacks for success and failure if included, else nil.
    @success_proc = callbacks[0]
    @failure_proc= callbacks[1]
    # Initialize sets to track open and closed nodes
    @open_set, @close_set = [@start_node], {}  
    # Find the optimal path
    calculate_path
  end

  def calculate_path
    # Only do calculation if goal is actually passable, unless we only
    # need to get close or within range
    if @character.passable?(@goal.x, @goal.y, 0) || @range > 0
      # Initialize counter
      counter, wait = 0, 0
      until @open_set.empty?

        counter += 1
        # Give up if pathfinding is taking more than 500 iterations
        if counter >= $game_map.search_limiter
          @found = false
          break
        end
        # Get the node with lowest cost and add it to the closed list
        @current_node = get_current
        @close_set[[@current_node.x, @current_node.y]] = @current_node
        if @current_node == @goal ||
           (@range > 0 && @goal.in_range?(@current_node, @range))
          # We reached goal, exit the loop!
          @target = @goal
          @goal, @found = @current_node, true
          break
        else # if not goal
          # Keep track of the node with the lowest cost so far
          if @current_node.heuristic < @nearest.heuristic || 
            @nearest.heuristic < 1
            @nearest = @current_node
          end
          # Get adjacent nodes and check if they can be added to the open list
          neighbor_nodes(@current_node).each {|neighbor|
            # Skip Node if it already exists in one of the lists.
            next if can_skip?(neighbor)
            # Add node to open list following the binary heap conventions
            @open_set.push(neighbor)
            arrange(@open_set.size - 1)
          }
        end
      end
    end
    # If no path was found, see if we can get close to goal
    unless @found
      if @range > 0 && @nearest.heuristic > 0  
        # Create an alternate path.
        setup(@nearest, @range, @success_proc, @failure_proc)
      elsif @failure_proc != nil && (($game_map.collision_retry == 0) ||
        (@collisions > $game_map.collision_retry))
        # If out of retries, call the Proc for failure if defined 
        @failure_proc.call
      end
    end
    # Create the move route using the generated path
    create_move_route 
  end

  def create_move_route
    # There's no path to generate if no path was found
    return if !@found
    # Create a new move route that isn't repeatable
    @route = RPG::MoveRoute.new
    @route.repeat = false
    # Generate path by starting from goal and following parents
    node = @goal
    while node.parent
      # Get direction from parent to node as RPG::MoveCommand
      code = case direction(node.parent.x, node.parent.y, node.x, node.y)
      when 2 then 4 # Up
      when 4 then 3 # Left
      when 6 then 2 # Right
      when 8 then 1 # Down
      else; 0
      end
      # Add movement code to the start of the array
      @route.list.unshift(RPG::MoveCommand.new(code)) if code != 0
      node = node.parent
    end
    # If the path should be assigned to the character
    if (@forcing && !@route.list.empty?)
      @collisions = 0
      @character.paths.push(self) 
      @character.force_move_route(@route) if @character.paths.size == 1
    end
    # Reset forcing flag if needed
    @forcing = true
    # Return the constructed RPG::MoveRoute
    return @route
  end
  
  def arrange(index)
    # Rearrange nodes in the open_set
    while index > 0
      # Break loop unless current item's cost is less than parent's
      break if @open_set[index].score > @open_set[index / 2].score
      # Bring lowest value to the top.
      temp = @open_set[index / 2]
      @open_set[index / 2] = @open_set[index]
      @open_set[index] = temp
      index /= 2
    end
  end
  
  def get_current
    return if @open_set.empty?
    return @open_set[0] if @open_set.size == 1
    # Set current node to local variable and replace it with the last
    current = @open_set[0]
    @open_set[0] = @open_set.pop
    # Loop and rearrange array according to the A* algorithm until done.
    y = 0   
    loop {
      x = y
      # If two children exist
      if 2 * x + 1 < @open_set.size
        if @open_set[2 * x].score <= @open_set[x].score
          y = 2 * x
          if @open_set[2 * x + 1].score <= @open_set[y].score
            y = 2 * x + 1 
          end
        end
      # If only one child exists
      elsif 2 * x < @open_set.size && 
        @open_set[2 * x].score <= @open_set[x].score
        y = 2 * x 
      end
      # Swap a child if it is less than the parent.
      break if x == y
      temp = @open_set[x]
      @open_set[x] = @open_set[y]
      @open_set[y] = temp
    }
    # Return the original first node (which was removed)
    return current
  end

  def direction(x1, y1, x2, y2)
    # Return the numerical direction between coordinates.
    return 6 if x1 > x2 # Right
    return 4 if x1 < x2 # Left
    return 2 if y1 > y2 # Bottom
    return 8 if y1 < y2 # Top
    return 0            
  end
  
  def neighbor_nodes(node)
    # Create array to hold the nodes, then check each direction.
    nodes = []
    nodes.push(get_neighbor(node.x + 1, node.y, node)) # Right
    nodes.push(get_neighbor(node.x - 1, node.y, node)) # Left
    nodes.push(get_neighbor(node.x, node.y + 1, node)) # Down
    nodes.push(get_neighbor(node.x, node.y - 1, node)) # Up
    # Remove any nil elements, then return results.
    return nodes.compact
  end
  
  def get_neighbor(x, y, parent)
    # Calculate direction, return new node if passable.
    direction = direction(x, y, parent.x, parent.y)
    if @character.passable?(parent.x, parent.y, direction)
      # The heuristic is simply the distance
      heuristics = ((x - @goal.x).abs + (y - @goal.y).abs)
      return Node.new(x, y, parent, parent.cost + 1, heuristics)
    end
  end
  
  def can_skip?(node)
    # Branch by if node is in either the open or closed set.
    if @open_set.include?(node)
      index = @open_set.index(node)
      return true if @open_set[index].score <= node.score
      # Swap them and update list order
      @open_set[index] = node
      arrange(index)
      return true
    elsif @close_set[[node.x, node.y]] != nil
      # If the existing passed node has a lower score than this one.
      return true if @close_set[[node.x, node.y]].score <= node.score
      # Update the existing node
      @close_set[[node.x, node.y]] = node
    end
    # Return false if no criteria was met.
    return false
  end
end

#==============================================================================
# ** Game_Character 
#==============================================================================

class Game_Character
  
  attr_accessor :paths 
  attr_accessor :move_route_forcing
  attr_accessor :move_route

  alias zer0_pathfinding_init initialize
  def initialize
    # Add public instance variable for paths
    @paths = []
    # Original method
    zer0_pathfinding_init
  end
  
  def next_route
    # Stop any custom move route that may be occuring.
    if @move_route != nil
      # Set index and disable forcing of current route
      @move_route_index = @move_route.list.size
      @move_route_forcing = false
      # Reset to what it was originally
      @move_route = @original_move_route
      @move_route_index = @original_move_route_index
      @original_move_route = nil
    end
    # Remove first path from the paths array.
    @paths.shift
    # If there is another path to follow...
    if @paths[0] != nil
      # Setup path again to reflect any changes since original creation
      @forcing = false
      @paths[0].setup(@paths[0].target, @paths[0].range, 
        @paths[0].success_proc, @paths[0].failure_proc)
      force_move_route(@paths[0].route) if @paths[0].found
    end
  end
  
  alias zer0_recalculate_paths_move move_type_custom
  def move_type_custom
    if $game_map.recalculate_paths
      # Interrupt if not stopping
      return if jumping? || moving?
      # Loop until finally arriving at move command list
      while @move_route_index < @move_route.list.size
        # Get the move command at index
        command = @move_route.list[@move_route_index]
        # If command code is 0 (end of list)
        if command.code == 0
          # If [repeat action] option is ON
          if @move_route.repeat
            # Reset move route index to the top of the list
            @move_route_index = 0
          end
          # If [repeat action] option is OFF
          unless @move_route.repeat
            # If move route is forced and not repeating
            if @move_route_forcing and not @move_route.repeat
              # The move route is no longer forced (moving ended)
              @move_route_forcing = false
              # Restore original move route
              @move_route = @original_move_route
              @move_route_index = @original_move_route_index
              @original_move_route = nil
              # If there was a path to follow and we reached goal
              if @paths[0] != nil
                if self.x == @paths[0].goal.x && 
                  y == @paths[0].goal.y && @paths[0].success_proc
                  # Call success Proc if goal is reached and it is defined.
                  @paths[0].success_proc.call
                end
                next_route
              end
            end
            # Clear stop count
            @stop_count = 0
          end
          return
        end # if command.code == 0
        # For move commands (from move down to jump)
        if command.code <= 14
          # Branch by command code
          case command.code
          when 1 then move_down                 # Move down
          when 2 then move_left                 # Move left
          when 3 then move_right                # Move right
          when 4 then move_up                   # Move up
          when 5 then move_lower_left           # Move lower left
          when 6 then move_lower_right          # Move lower right
          when 7 then move_upper_left           # Move upper left
          when 8 then move_upper_right          # Move upper right
          when 9 then move_random               # Move random
          when 10 then move_toward_player       # Move toward player
          when 11 then move_away_from_player    # Move away from player
          when 12 then move_forward             # Step forward
          when 13 then move_backward            # Step backward
          when 14 then jump(command.parameters[0], command.parameters[1]) # Jump
          end
          # If movement failure occurs when "Ignore If Can't Move" is unchecked. 
          if !@move_route.skippable && !moving? && !jumping?
            # If path is current and collision limit is not reached
            if @paths[0] != nil && 
              @paths[0].collisions < $game_map.collision_retry
              # Setup path again to update starting location.
              # original goal node is used because pathfinding changes
              # the goal node to current node
              goal, range = @paths[0].target, @paths[0].range
              reach = @paths[0].success_proc
              fail = @paths[0].failure_proc
              counter = @paths[0].collisions + 1
              # Find another path to goal
              @paths[0] = Pathfind.new(goal, self, range, reach, fail)
              @paths[0].collisions = counter
              force_move_route(@paths[0].route) if @paths[0].found
              # Wait a bit before starting to follow the new path
              @wait_count = 6
              return
            elsif paths[0] != nil
              # Call failure Proc if defined and set move index.
              @move_route_index = @move_route.list.size
              @paths[0].failure_proc.call if @paths[0].failure_proc != nil
              next_route
            end
            # End method
            return
          end
          # Advance index
          @move_route_index += 1
          return
        end # if command.code <= 14
        # If waiting
        if command.code == 15
          # Set wait count (from provided parameter)
          @wait_count = command.parameters[0] * 2 - 1
          @move_route_index += 1
          return
        end # if command.code == 15
        # If direction change (turning) command
        if command.code >= 16 and command.code <= 26
          # Branch by command code
          case command.code
          when 16 then turn_down                      # Turn down
          when 17 then turn_left                      # Turn left
          when 18 then turn_right                     # Turn right
          when 19 then turn_up                        # Turn up
          when 20 then turn_right_90                  # Turn 90° right
          when 21 then turn_left_90                   # Turn 90° left
          when 22 then turn_180                       # Turn 180°
          when 23 then turn_right_or_left_90          # Turn 90° right or left
          when 24 then turn_random                    # Turn at Random
          when 25 then turn_toward_player             # Turn toward player
          when 26 then turn_away_from_player          # Turn away from player
          end
          @move_route_index += 1
          return
        end 
        # If other command (commands that don't 'return')
        if command.code >= 27
          # Branch by command code
          case command.code
          when 27                                              # Switch ON
            $game_switches[command.parameters[0]] = true
            $game_map.need_refresh = true
          when 28                                              # Switch OFF
            $game_switches[command.parameters[0]] = false
            $game_map.need_refresh = true
          when 29 then @move_speed = command.parameters[0]     # Change speed
          when 30 then @move_frequency = command.parameters[0] # Change freq
          when 31 then @walk_anime = true                      # Move ON
          when 32 then @walk_anime = false                     # Move OFF
          when 33 then @step_anime = true                      # Stop ON
          when 34 then @step_anime = false                     # Stop OFF
          when 35 then @direction_fix = true                   # Direction ON
          when 36 then @direction_fix = false                  # Direction OFF
          when 37 then @through = true                         # Through ON
          when 38 then @through = false                        # Through OFF
          when 39 then @always_on_top = true                   # On top ON
          when 40 then @always_on_top = false                  # On top OFF
          when 41                                              # Change Graphic
            # Can't change into a tile
            @tile_id = 0
            @character_name = command.parameters[0]
            @character_hue = command.parameters[1]
            # Update direction
            if @original_direction != command.parameters[2]
              @direction = command.parameters[2]
              @original_direction = @direction
              @prelock_direction = 0
            end
            # Update frame
            if @original_pattern != command.parameters[3]
              @pattern = command.parameters[3]
              @original_pattern = @pattern
            end
          when 42 then @opacity = command.parameters[0]        # Change Opacity
          when 43 then @blend_type = command.parameters[0]     # Change Blending
          when 44 then $game_system.se_play(command.parameters[0]) # Play SE
          when 45 then result = eval(command.parameters[0])    # Script
          end
          # Increment move index.
          @move_route_index += 1
        end
      end 
    else
      # Original method
      zer0_recalculate_paths_move
    end
  end 
end

#==============================================================================
# ** Node
#==============================================================================

class Node

  attr_accessor :x                      
  attr_accessor :y                       
  attr_accessor :parent                  
  attr_accessor :cost                 
  attr_accessor :heuristic                  

  def initialize(x, y, parent = nil, cost = 0, heuristic = 0)
    # Set public instance variables.
    @x, @y, @parent, @cost, @heuristic = x, y, parent, cost, heuristic
  end

  def score
    # Return the current "score" of this node
    return @cost + @heuristic
  end
  
  def in_range?(node, range)
    # Return true/false if Nodes are within RANGE of each other.
    return (@x - node.x).abs + (@y - node.y).abs <= range
  end

  def ==(node)
    # Returns true/false of whether self and other are equal.
    return ((node.is_a?(Node)) && (node.x == @x) && (node.y == @y))
  end
end
=end