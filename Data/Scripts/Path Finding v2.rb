=begin
#======================================
# ■ Path Finding
#------------------------------------------------------------------------------
# 　By: Near Fantastica
#   Date: 21.06.05
#   Verion 2
#
#   Path Fiding Element By Fuso
#======================================

class Path_Finding
  #--------------------------------------------------------------------------
  def initialize
    @player_path = nil
    @player_points = []
  end
  #--------------------------------------------------------------------------
  def setup_event(index, repeat = false, skippable = false)
    event = $game_map.events[index]
    event.points = []
    event.path = RPG::MoveRoute.new
    event.path.repeat = repeat
    event.path.skippable = skippable
    event.path.list.clear
    key = [event.x,event.y]
    event.points.push(key)
  end
  #--------------------------------------------------------------------------
  def add_command_event(index, code, parameters = [])
    event = $game_map.events[index]
    event.path.list.push RPG::MoveCommand.new(code, parameters)
  end
  #--------------------------------------------------------------------------
  def add_paths_event(index, trg_x, trg_y)
    event = $game_map.events[index]
    key = event.points.last
    paths = $game_map.find_short_paths(key[0], key[1], trg_x, trg_y, event)
    if paths == nil
      print "Target " + trg_x.to_s + ","+ trg_y.to_s + " Is Unreachable for Event " + index.to_s 
      return
    end
    key = [trg_x, trg_y]
    event.points.push(key)
    for path in paths
      event.path.list.push RPG::MoveCommand.new(4) if path == 2
      event.path.list.push RPG::MoveCommand.new(2) if path == 4
      event.path.list.push RPG::MoveCommand.new(3) if path == 6
      event.path.list.push RPG::MoveCommand.new(1) if path == 8
    end
  end
  #--------------------------------------------------------------------------
  def start_event(index)
    event = $game_map.events[index]
    event.path.list.push RPG::MoveCommand.new(0)
    event.move_route = event.path
    event.move_route_index = 0
  end
  #--------------------------------------------------------------------------
  def setup_player(repeat = false, skippable = false)
    @player_points = []
    @player_path = RPG::MoveRoute.new
    @player_path.repeat = repeat
    @player_path.skippable = skippable
    @player_path.list.clear
    key = [$game_player.x, $game_player.y]
    @player_points.push(key)
  end
  #--------------------------------------------------------------------------
  def add_command_player(code, parameters = [])
    @player_path.list.push RPG::MoveCommand.new(code, parameters)
  end
  #--------------------------------------------------------------------------
  def add_paths_player(trg_x, trg_y)
    key = @player_points.last
    paths = $game_map.find_short_paths(key[0], key[1], trg_x, trg_y, $game_player, [$game_player])
    if paths == nil
      print "Target " + trg_x.to_s + "," + trg_y.to_s + " Is Unreachable for Player"
      return
    end
    key = [trg_x, trg_y]
    @player_points.push(key)
    for path in paths
      @player_path.list.push RPG::MoveCommand.new(4) if path == 2
      @player_path.list.push RPG::MoveCommand.new(2) if path == 4
      @player_path.list.push RPG::MoveCommand.new(3) if path == 6
      @player_path.list.push RPG::MoveCommand.new(1) if path == 8
    end
  end
  #--------------------------------------------------------------------------
  def start_player
    @player_path.list.push RPG::MoveCommand.new(0)
    $game_player.force_move_route(@player_path)
  end
end
#======================================
# ■ Path Finding
#------------------------------------------------------------------------------
# 　By: Fuso
#======================================
class Game_Character
  attr_accessor :move_route
  attr_accessor :move_route_index
  #--------------------------------------------------------------------------
  def pf_passable?(x, y, d, ignore_events = [self], check_player = (self != $game_player))
    ignore_event = [ignore_event] if not ignore_event.is_a?(Array)
    new_x = x + (d == 6 ? 1 : d == 4 ? -1 : 0)
    new_y = y + (d == 2 ? 1 : d == 8 ? -1 : 0)
   unless $game_map.valid?(new_x, new_y)
     return false
   end
   if @through
     return true
   end
   unless $game_map.pf_passable?(x, y, d, ignore_events, check_player)
     return false
   end
   unless $game_map.pf_passable?(new_x, new_y, 10 - d, ignore_events, check_player)
     return false
   end
   for event in $game_map.events.values
     if event.x == new_x and event.y == new_y
       if not ignore_events.include?(event) and not event.through and not event == self
         if self != $game_player
           return false
         end
         if event.character_name != ""
           return false
         end
       end
     end
   end
   if $game_player.x == new_x and $game_player.y == new_y
     unless $game_player.through or ignore_events.include?($game_player) or not check_player
       if @character_name != ""
         return false
       end
     end
   end
   return true
 end
end
#======================================
class Game_Player < Game_Character
  def pf_passable?(x, y, d, ignore_events = [self], check_player = false)
    passable?(x,y,d)
  end
end
#======================================
class Game_Map
 #--------------------------------------------------------------------------
  attr_accessor :events
  #--------------------------------------------------------------------------
  UP = 2
  LEFT = 4
  RIGHT = 6
  DOWN = 8
  #--------------------------------------------------------------------------
  def find_short_paths(src_x,src_y,trg_x,trg_y, passable_owner = self, ignore_events = [], option_close = false, depth = 200)
   return [] if not (passable_owner.pf_passable?(trg_x, trg_y, UP, ignore_events) or
                   passable_owner.pf_passable?(trg_x, trg_y, LEFT, ignore_events) or
                   passable_owner.pf_passable?(trg_x, trg_y, RIGHT, ignore_events) or
                   passable_owner.pf_passable?(trg_x, trg_y, DOWN, ignore_events))
   # Paths will hold the succeeding paths.
   paths = []
   #  path_map will hold what paths has already been visited, to prevent that we attempt to
   #  walk on the same tile twice.
   path_map = [src_x + src_y / 10000.0]
   trackers = []
   new_trackers = [[src_x, src_y, []]]
   if not option_close
     depth.times {
       break if new_trackers.empty?
       trackers = new_trackers
       new_trackers = []
       for tracker in trackers
         if tracker[0] == trg_x and tracker[1] == trg_y
           paths.push tracker[2].compact
           next
         end
         path_map.push tracker[0] + tracker[1] / 10000.0
         if passable_owner.pf_passable?(tracker[0], tracker[1], DOWN, ignore_events, true) and
             not path_map.include? tracker[0] + (tracker[1] - 1) / 10000.0
           path_map.push tracker[0] + (tracker[1] - 1) / 10000.0
           new_trackers.push [tracker[0], tracker[1] - 1, [tracker[2], UP].flatten]
         end
         if passable_owner.pf_passable?(tracker[0], tracker[1], LEFT, ignore_events, true) and
             not path_map.include? tracker[0] - 1 + tracker[1] / 10000.0
           path_map.push tracker[0] - 1 + tracker[1] / 10000.0
           new_trackers.push [tracker[0] - 1, tracker[1], [tracker[2], LEFT].flatten]
         end
         if passable_owner.pf_passable?(tracker[0], tracker[1], RIGHT, ignore_events, true) and
             not path_map.include? tracker[0] + 1 + tracker[1] / 10000.0
           path_map.push tracker[0] + 1 + tracker[1] / 10000.0
           new_trackers.push [tracker[0] + 1, tracker[1], [tracker[2], RIGHT].flatten]
         end
         if passable_owner.pf_passable?(tracker[0], tracker[1], UP, ignore_events, true) and
             not path_map.include? tracker[0] + (tracker[1] + 1) / 10000.0
           path_map.push tracker[0] + (tracker[1] + 1) / 10000.0
           new_trackers.push [tracker[0], tracker[1] + 1, [tracker[2], DOWN].flatten]
         end
       end
       break if paths.size > 0
     }
   else
     paths_distance = 10000 ** 2 * 2
     depth.times {
       trackers = new_trackers
       new_trackers = []
       for tracker in trackers

         if tracker[0] == trg_x and tracker[1] == trg_y
           if paths_distance > 0
             paths_distance = 0
             paths.clear
           end
           paths.push tracker[2].compact
           next
         end
         distance = (tracker[0] - trg_x) ** 2 + (tracker[1] - trg_y) ** 2
         if distance <= paths_distance
           if distance < paths_distance
             paths.clear
             paths_distance = distance
           end
           paths.push tracker[2].compact
         end
         path_map.push tracker[0] + tracker[1] / 10000.0
         if passable_owner.pf_passable?(tracker[0], tracker[1], DOWN, ignore_events, true) and
             not path_map.include? tracker[0] + (tracker[1] - 1) / 10000.0
           path_map.push tracker[0] + (tracker[1] - 1) / 10000.0
           new_trackers.push [tracker[0], tracker[1] - 1, [tracker[2], UP].flatten]
         end
         if passable_owner.pf_passable?(tracker[0], tracker[1], LEFT, ignore_events, true) and
             not path_map.include? tracker[0] - 1 + tracker[1] / 10000.0
           path_map.push tracker[0] - 1 + tracker[1] / 10000.0
           new_trackers.push [tracker[0] - 1, tracker[1], [tracker[2], LEFT].flatten]
         end
         if passable_owner.pf_passable?(tracker[0], tracker[1], RIGHT, ignore_events, true) and
             not path_map.include? tracker[0] + 1 + tracker[1] / 10000.0
           path_map.push tracker[0] + 1 + tracker[1] / 10000.0
           new_trackers.push [tracker[0] + 1, tracker[1], [tracker[2], RIGHT].flatten]
         end
         if passable_owner.pf_passable?(tracker[0], tracker[1], UP, ignore_events, true) and
             not path_map.include? tracker[0] + (tracker[1] + 1) / 10000.0
           path_map.push tracker[0] + (tracker[1] + 1) / 10000.0
           new_trackers.push [tracker[0], tracker[1] + 1, [tracker[2], DOWN].flatten]
         end
       end
       break if distance == 0 and paths.size > 0
     }
   end
   route = paths[0]
   return route
 end
 #--------------------------------------------------------------------------
 def pf_passable?(x, y, d, ignore_events = [], check_player = false)
   ignore_events = [ignore_events].compact if not ignore_events.is_a?(Array)
   unless valid?(x, y)
     return false
   end
   bit = (1 << (d / 2 - 1)) & 0x0f
   checks = events.values
   checks.push $game_player if check_player
   for event in checks
     if event.tile_id >= 0 and not ignore_events.include?(event) and
         event.x == x and event.y == y and not event.through
       return false if event == $game_player and check_player
       if @passages[event.tile_id] & bit != 0
         return false
       elsif @passages[event.tile_id] & 0x0f == 0x0f
         return false
       elsif @priorities[event.tile_id] == 0
         return true
       end
     end
   end
   for i in [2, 1, 0]
     tile_id = data[x, y, i]
     if tile_id == nil
       return false
     elsif @passages[tile_id] & bit != 0
       return false
     elsif @passages[tile_id] & 0x0f == 0x0f
       return false
     elsif @priorities[tile_id] == 0
       return true
     end
   end
   return true
 end
end
#======================================
class Scene_Title
 #--------------------------------------------------------------------------
 alias pf_scene_title_update update
 #--------------------------------------------------------------------------
 def update
   $path_finding = Path_Finding.new
   pf_scene_title_update
 end
end
#======================================
class Game_Event < Game_Character
  #--------------------------------------------------------------------------
  alias pf_game_event_initialize initialize
  #--------------------------------------------------------------------------
  attr_accessor :path
  attr_accessor :points
  #--------------------------------------------------------------------------
  def initialize(map_id, event)
    @path = []
    @points = nil
    pf_game_event_initialize(map_id, event)
  end
end
=end
