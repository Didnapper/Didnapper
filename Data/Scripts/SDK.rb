#==============================================================================
# ** RMXP Standard Development Kit (SDK)
#------------------------------------------------------------------------------
# Build Date - 2005-11-22
# Version 1.0 - Near Fantastica - 2005-11-22
# Version 1.1 - SephirothSpawn - 2005-12-18 - (Near Fantastica)
# Version 1.2 - Near Fantastica - 2005-12-18
# Version 1.3 - Wachunga - 2005-12-19
# Version 1.4 - Prexus - 2006-03-02
# Version 1.5 - Jimme Reashu - 2006-03-25 - (Near Fantastica)
#------------------------------------------------------------------------------
=begin
  1.0 - Outline

  The Standard Development Kit (SDK) aims to increase compatibility between
  RGSS scripts by:

  a) defining a set of scripting standards (see section 3)
  b) restructuring often-used default classes and methods (see section 4)
  c) providing a scripting tools module (see section 5)
#------------------------------------------------------------------------------
  2.0 - Modifications to the RMXP Standard Development Kit

  Since edits to the SDK may cause massive capability errors, any and all
  modifications must first be approved by a member of the RMXP SDK Team. 

  The author of any modifications must be sure to update all relevant
  documentation. This also includes the header, where the author is to put
  the next version number with his or her name and the name of the approval
  member (from the SDK Team) under the latest version in the following format.

  Version # - Name - Date - (Approval Member Name)
#------------------------------------------------------------------------------
  3.0 - Coding Standards

  To be compliant with the SDK, a script must compy with the following
  coding standards:

  3.1 - Commenting
  3.2 - Classes
  3.3 - Variables
  3.4 - Aliases
  3.5 - Strings
  3.6 - Line Length
  3.7 - White Space
  3.8 - Constants
  3.9 - Parentheses
#------------------------------------------------------------------------------
  3.1 - Commenting

  Scripts must begin with the following header:
 
  #==============================================================================
  # ** Script Name
  #------------------------------------------------------------------------------
  # Your Name
  # Version
  # Date
  #==============================================================================

  All classes and methods must have a comment describing the process or what
  was added. All code added to methods that can not be aliased must be
  formatted as follows:

  #------------------------------------------------------------------------------
  # Begin Script Name Edit
  #------------------------------------------------------------------------------
  [Code]  
  #------------------------------------------------------------------------------
  # End Script Name Edit
  #------------------------------------------------------------------------------

  Single line comments should precede the described block of code and should be
  indented at the same level. Code that is not self-documenting should be
  commented.
  
  However, very short comments can appear on the same line as the described
  code, but should be shifted far enough to separate them from the statements.
  If more than one short comment appears in a chunk of code, they should all be
  indented to the same tab setting. Attribute declarations should always have a
  trailing comment.
#------------------------------------------------------------------------------
  3.2 - Classes

  All classes must be named consistently with the default code, namely:
 
    Data - Any class that holds data
    Game - Any class that processes data
    Sprite - Any class that defines a sprite
    Spriteset - Any class that defines multiple sprites
    Window - Any class that defines a window
    Arrow - Any class that defines an arrow
    Scene - Any class that defines a scene
#------------------------------------------------------------------------------
  3.3 - Variables

  All variable names must be reasonably descriptive. Use of class and global
  variables should be limited. Any variable used by the default system can not
  have its use changed.
#------------------------------------------------------------------------------
  3.4 - Aliases

  Aliasing a method is preferable to overriding it; an alias should be used
  whenever possible to increase compatibility with other scripts. All alias
  names must have the following format:

  yourname_scriptname_classname_methodname
#------------------------------------------------------------------------------
  3.5 – Strings
 
  Strings should normally be defined with single quotes ('example'); this
  decreases the processing time of the engine. Double quotes are useful when
  using the following features:
  a) substitutions, i.e. sequences that start with a backslash character
     (e.g. \n for the newline character)
  b) expression interpolation, i.e. #{ expression } is replaced by the value
     of expression
#------------------------------------------------------------------------------
  3.6 - Line Length
  
  Lines should not cause the the viewer to have to scroll sideways to view them
  in the script editor. When the line needs to be broken, it should follow the
  following guidelines, in preferential order:
  
    Break after a comma.
    Break before an operator.
    Prefer higher-level breaks to lower-level breaks.
    Align the new line with the beginning of the expression at the same level 
    on the previous line.
  
  If the above rules lead to confusing code or to code that’s squished up 
  against the right margin, just indent 4 spaces instead.
#------------------------------------------------------------------------------
  3.7 - White Space
  
  A blank line(s) should be used in the following places:
  
    Between sections of a source file
    Between class and module definitions
    Between attributes and the class definition
    Between methods
    Between the local variables in a method and its first statement
    Before a block or single-line comment
    Between logical sections inside a method to improve readability

  Blank spaces should be used in the following places:
  
    A keyword followed by a parenthesis, e.g. if (some_boolean_statements)
    After commas in argument lists, e.g. def method (arg1, arg2, ...)
    All binary operators except '.', e.g. a + b; c = 1
#------------------------------------------------------------------------------
  3.8 - Constants
  
  New numerical values should not be "hard-coded", except for -1, 0, and 1,
  which can appear in for loops as counter values. Instead, these numerical
  values should be made into constant variables and these used instead.
#------------------------------------------------------------------------------
  3.9 - Parentheses
  
  It is generally a good idea to use parentheses liberally in expressions 
  involving mixed operators to avoid operator precedence problems. Even if 
  the operator precedence seems clear to you, it might not be to others -— you 
  shouldn’t assume that other programmers know precedence as well as you do.
#------------------------------------------------------------------------------
  4.0 - Engine Updates

  The following is a list of classes and methods that have been updated by the
  SDK to help improve compatibility:

    Game_Map - setup
    Game_Map - update
    Game_Character - update
    Game_Event - refresh
    Game_Player - update
    Sprite_Battler - update
    Spriteset_Map - initialize
    Spriteset_Map - update
    Scene_Tile - main
    Scene_Map - main
    Scene_Map - update
    Scene_Save - write_save_data
    Scene_Load - read_save_data
    Scene_Menu - initialize    
    Scene_Menu - main
    Scene_Menu - update & command input
    Scene_Battle - main
    Scene_Battle - update
    Scene_Battle - update_phase3_basic_command 
    Scene_Battle - make_basic_action_result
#------------------------------------------------------------------------------
  5.0 - SDK Tools

  The following tools are included in the SDK to help improve the development
  process:

  5.1 - Logging Scripts
  5.2 - Enabling/Disabling Scripts
  5.3 - Script Dependencies
  5.4 - Standard Text Box Input
  5.5 - Standard Event Comment Input
#------------------------------------------------------------------------------
  5.1 – Logging Scripts

  All SDK-compliant scripts should be logged. This is done by calling the
  SDK.log(script, name, ver, date) method, where

  script = script name
  name = your name
  ver = version
  date = date last updated
#------------------------------------------------------------------------------
  5.2 – Enabling/Disabling Scripts

  When a script is logged it is also enabled. A script can be enabled and
  disabled using the following calls:

  SDK.enable('Script Name') 
  SDK.disable('Script Name')

  All non-default scripts (and code added to default scripts) must be enclosed
  in an if statement that checks whether or not they have been enabled, as
  follows:
  
  #--------------------------------------------------------------------------
  # Begin SDK Enabled Check
  #--------------------------------------------------------------------------
  if SDK.state('Script Name') == true
    [Script or Code]
  end
  #--------------------------------------------------------------------------
  # End SDK Enabled Test
  #--------------------------------------------------------------------------

  Keep in mind that this if statement can not continue on to other pages and
  every page needs its own if statement testing the state of the script. As
  well every script should have its own test.
#------------------------------------------------------------------------------
  5.3 – Script Dependencies

  Any script that requires (i.e. has a dependency on) another script can check
  if that dependency is met provided that the required script is set up before
  the script in question. This would be done in the following way:

  p 'Script Name not found' if SDK.state('Script Name') != true
#------------------------------------------------------------------------------
  5.4 – Standard Text Box Input
  
  Any script that requires input from a database text field should use the
  following:
  
  SDK.text_box_input(element, index)
  
  where:
  element = an object of the text field
  index = the index in which your script call falls
    
  The text field should be formatted in the following way:
  
  "Default value | script call | script call"
#------------------------------------------------------------------------------
  5.5 – Standard Event Comment Input
  
  Any script that requires input from an event comment should use the 
  following:
  
  SDK.event_comment_input(event, elements, trigger)
  
  where:
  event = an object of the event
  elements = the number of elements the method is to process
  trigger = the text value triggering the script to start processing
  
  or 
  
  SDK.event_comment_input(page, elements, trigger)
  
  where:
  page = an object of the event.page
  elements = the number of elements the method is to process
  trigger = the text value triggering the script to start processing
  
  The method returns nil if the trigger can not be found; otherwise, it
  returns a list of the parameters from the event.
#==============================================================================
=end
=begin
module SDK
  @list = {}
  @enabled = {}
  #--------------------------------------------------------------------------
  # * Logs a custom script
  #--------------------------------------------------------------------------
  def self.log(script, name, ver, date)
    @list[script] = [name,ver,date]
    @enabled[script] = true
  end
  #--------------------------------------------------------------------------
  # * Returns a list of custom scripts
  #--------------------------------------------------------------------------
  def self.print(script = '')
    if script == ''
      return @list
    else
      return @list[script]
    end
  end
  #--------------------------------------------------------------------------
  # * Writes a list of the custom scripts to a file
  #--------------------------------------------------------------------------
  def self.write
    file = File.open('Scripts List.txt', 'wb')
    for key in @list.keys
      file.write("#{@list[key][0]} : #{key} Version #{@list[key][1]}\n")
    end
    file.close
  end
  #--------------------------------------------------------------------------
  # * Returns the state of the passed script
  #--------------------------------------------------------------------------
  def self.state(script)
    return @enabled[script]
  end
  #--------------------------------------------------------------------------
  # * Enables the passed script
  #--------------------------------------------------------------------------
  def self.enable(script)
    @enabled[script] = true
  end
  #--------------------------------------------------------------------------
  # * Disables the passed script
  #--------------------------------------------------------------------------
  def self.disable(script)
    @enabled[script] = false
  end
  #--------------------------------------------------------------------------
  # * Evals text from an input source
  #--------------------------------------------------------------------------
  def self.text_box_input(element, index)
    return if index == 0
    commands = element.split('|')
    eval(commands[index])
  end
  #--------------------------------------------------------------------------
  # * Returns a list of parameters from an event's comments
  #--------------------------------------------------------------------------
  def self.event_comment_input(*args)
    parameters = []
    list = *args[0].list
    elements = *args[1]
    trigger = *args[2]
    return nil if list == nil
    return nil unless list.is_a?(Array)
    for item in list
      next if item.code != 108
      if item.parameters[0] == trigger
        start = list.index(item) + 1
        finish = start + elements
        for id in start...finish
          next if !list[id]
          parameters.push(list[id].parameters[0])
        end
        return parameters
      end
    end
    return nil
  end
end

#==============================================================================
# ** Object
#------------------------------------------------------------------------------
# automatic_dispose looks after disposing all windows and sprites in a scene
# when called.
#==============================================================================

class Object
  #--------------------------------------------------------------------------
  # * Automatic Dispose
  #--------------------------------------------------------------------------
  def automatic_dispose
    self.instance_variables.each do |item|
      eval("#{item}.dispose if (#{item}.is_a?(Sprite) or #{item}.is_a?(Window_Base)) and (!#{item}.disposed?)")
    end
  end
end

#==============================================================================
# ** Game_Map
#------------------------------------------------------------------------------
#  This class handles the map. It includes scrolling and passable determining
#  functions. Refer to "$game_map" for the instance of this class.
#==============================================================================

class Game_Map
  #--------------------------------------------------------------------------
  # * Setup
  #     map_id : map ID
  #--------------------------------------------------------------------------
  def setup(map_id)
    setup_map_id(map_id)
    setup_load
    setup_tileset
    setup_display
    setup_refresh
    setup_events
    setup_common_events
    setup_fog
    setup_scroll
  end
  #--------------------------------------------------------------------------
  # * Setup Map ID
  #--------------------------------------------------------------------------
  def setup_map_id(map_id)
    # Put map ID in @map_id memory
    @map_id = map_id
  end
  #--------------------------------------------------------------------------
  # * Load Map Data
  #--------------------------------------------------------------------------
  def setup_load
    # Load map from file and set @map
    @map = load_data(sprintf("Data/Map%03d.rxdata", @map_id))
  end
  #--------------------------------------------------------------------------
  # * Setup Tileset
  #--------------------------------------------------------------------------
  def setup_tileset
    # set tile set information in opening instance variables
    tileset = $data_tilesets[@map.tileset_id]
    @tileset_name = tileset.tileset_name
    @autotile_names = tileset.autotile_names
    @panorama_name = tileset.panorama_name
    @panorama_hue = tileset.panorama_hue
    @fog_name = tileset.fog_name
    @fog_hue = tileset.fog_hue
    @fog_opacity = tileset.fog_opacity
    @fog_blend_type = tileset.fog_blend_type
    @fog_zoom = tileset.fog_zoom
    @fog_sx = tileset.fog_sx
    @fog_sy = tileset.fog_sy
    @battleback_name = tileset.battleback_name
    @passages = tileset.passages
    @priorities = tileset.priorities
    @terrain_tags = tileset.terrain_tags
  end
  #--------------------------------------------------------------------------
  # * Setup Display
  #--------------------------------------------------------------------------
  def setup_display
    # Initialize displayed coordinates
    @display_x = 0
    @display_y = 0
  end
  #--------------------------------------------------------------------------
  # * Setup Refresh
  #--------------------------------------------------------------------------
  def setup_refresh
    # Clear refresh request flag
    @need_refresh = false
  end
  #--------------------------------------------------------------------------
  # * Setup Events
  #--------------------------------------------------------------------------
  def setup_events
    # Set map event data
    @events = {}
    for i in @map.events.keys
      @events[i] = Game_Event.new(@map_id, @map.events[i])
    end
  end
  #--------------------------------------------------------------------------
  # * Setup Common Events
  #--------------------------------------------------------------------------
  def setup_common_events
    # Set common event data
    @common_events = {}
    for i in 1...$data_common_events.size
      @common_events[i] = Game_CommonEvent.new(i)
    end
  end
  #--------------------------------------------------------------------------
  # * Setup Fog
  #--------------------------------------------------------------------------
  def setup_fog
    # Initialize all fog information
    @fog_ox = 0
    @fog_oy = 0
    @fog_tone = Tone.new(0, 0, 0, 0)
    @fog_tone_target = Tone.new(0, 0, 0, 0)
    @fog_tone_duration = 0
    @fog_opacity_duration = 0
    @fog_opacity_target = 0
  end
  #--------------------------------------------------------------------------
  # * Setup Scroll
  #--------------------------------------------------------------------------
  def setup_scroll
    # Initialize scroll information
    @scroll_direction = 2
    @scroll_rest = 0
    @scroll_speed = 4
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    update_refresh
    update_scrolling
    update_events
    update_common_events
    update_fog_scroll
    update_fog_colour
    update_fog
  end
  #--------------------------------------------------------------------------
  # * Refresh Game Map
  #--------------------------------------------------------------------------
  def update_refresh
    # Refresh map if necessary
    if $game_map.need_refresh
      refresh
    end
  end
  #--------------------------------------------------------------------------
  # * Update Scrolling
  #--------------------------------------------------------------------------
  def update_scrolling
    # If scrolling
    if @scroll_rest > 0
      # Change from scroll speed to distance in map coordinates
      distance = 2 ** @scroll_speed
      # Execute scrolling
      case @scroll_direction
      when 2  # Down
        scroll_down(distance)
      when 4  # Left
        scroll_left(distance)
      when 6  # Right
        scroll_right(distance)
      when 8  # Up
        scroll_up(distance)
      end
      # Subtract distance scrolled
      @scroll_rest -= distance
    end
  end
  #--------------------------------------------------------------------------
  # * Update Events
  #--------------------------------------------------------------------------
  def update_events
    # Update map event
    for event in @events.values
      event.update
    end
  end
  #--------------------------------------------------------------------------
  # * Update Common Events
  #--------------------------------------------------------------------------
  def update_common_events
    # Update common event
    for common_event in @common_events.values
      common_event.update
    end
  end
  #--------------------------------------------------------------------------
  # * Update Fog Scroll
  #--------------------------------------------------------------------------
  def update_fog_scroll
    # Manage fog scrolling
    @fog_ox -= @fog_sx / 8.0
    @fog_oy -= @fog_sy / 8.0
  end
  #--------------------------------------------------------------------------
  # * Update Fog Color
  #--------------------------------------------------------------------------
  def update_fog_colour
    # Manage change in fog color tone
    if @fog_tone_duration >= 1
      d = @fog_tone_duration
      target = @fog_tone_target
      @fog_tone.red = (@fog_tone.red * (d - 1) + target.red) / d
      @fog_tone.green = (@fog_tone.green * (d - 1) + target.green) / d
      @fog_tone.blue = (@fog_tone.blue * (d - 1) + target.blue) / d
      @fog_tone.gray = (@fog_tone.gray * (d - 1) + target.gray) / d
      @fog_tone_duration -= 1
    end
  end
  #--------------------------------------------------------------------------
  # * Update Fog
  #--------------------------------------------------------------------------
  def update_fog
    # Manage change in fog opacity level
    if @fog_opacity_duration >= 1
      d = @fog_opacity_duration
      @fog_opacity = (@fog_opacity * (d - 1) + @fog_opacity_target) / d
      @fog_opacity_duration -= 1
    end
  end
end

#==============================================================================
# ** Game_Character
#------------------------------------------------------------------------------
#  This class deals with characters. It's used as a superclass for the
#  Game_Player and Game_Event classes.
#==============================================================================

class Game_Character
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    unless update_wait == true
      update_movement_type
      update_animation
      return if update_force? == true
      return if update_event_execution? == true
      update_movement
    end
  end
  #--------------------------------------------------------------------------
  # * Update Movement Type
  #--------------------------------------------------------------------------
  def update_movement_type
    # Branch with jumping, moving, and stopping
    if jumping?
      update_jump
    elsif moving?
      update_move
    else
      update_stop
    end
  end
  #--------------------------------------------------------------------------
  # * Update Animation
  #--------------------------------------------------------------------------
  def update_animation
    # If animation count exceeds maximum value
    # * Maximum value is move speed * 1 taken from basic value 18
    if @anime_count > 18 - @move_speed * 2
      # If stop animation is OFF when stopping
      if not @step_anime and @stop_count > 0
        # Return to original pattern
        @pattern = @original_pattern
      # If stop animation is ON when moving
      else
        # Update pattern
        @pattern = (@pattern + 1) % 4
      end
      # Clear animation count
      @anime_count = 0
    end
  end
  #--------------------------------------------------------------------------
  # * Update Wait
  #--------------------------------------------------------------------------
  def update_wait
    # Reduce wait count
    @wait_count -= 1 if @wait_count > 0
    return (@wait_count > 0)
  end
  #--------------------------------------------------------------------------
  # * Update Force
  #--------------------------------------------------------------------------
  def update_force?
    # If move route is forced
    if @move_route_forcing
      # Custom move
      move_type_custom
      return true
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Update Event Execution
  #--------------------------------------------------------------------------
  def update_event_execution?
    # When waiting for event execution or locked
    if @starting or lock?
      # Not moving by self
      return true
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Update Movement
  #--------------------------------------------------------------------------
  def update_movement
    # If stop count exceeds a certain value (computed from move frequency)
    if @stop_count > (40 - @move_frequency * 2) * (6 - @move_frequency)
      # Branch by move type
      case @move_type
      when 1  # Random
        move_type_random
      when 2  # Approach
        move_type_toward_player
      when 3  # Custom
        move_type_custom
      end
    end
  end
end

#==============================================================================
# ** Game_Event
#------------------------------------------------------------------------------
#  This class deals with events. It handles functions including event page 
#  switching via condition determinants, and running parallel process events.
#  It's used within the Game_Map class.
#==============================================================================

class Game_Event < Game_Character
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    # Initialize local variable: new_page
    new_page = nil
    # If not temporarily erased
    unless @erased
      new_page = refresh_trigger_conditions
    end
    # If event page is the same as last time
    if new_page == @page
      # End method
      return
    end
    # Set @page as current event page
    @page = new_page
    # Clear starting flag
    clear_starting
    # If no page fulfills conditions
    if @page == nil
      # Reset values
      refresh_reset
      # End method
      return
    end
    # Set page variables
    refresh_set_page
    # Check parallel processing
    refresh_check_process
    # Auto event start determinant
    check_event_trigger_auto
  end
  #--------------------------------------------------------------------------
  # * Refresh Trigger Conditions
  #--------------------------------------------------------------------------
  def refresh_trigger_conditions
    # Check in order of large event pages
    for page in @event.pages.reverse
      # Make possible referrence for event condition with c
      c = page.condition
      # Switch 1 condition confirmation
      if c.switch1_valid
        if $game_switches[c.switch1_id] == false
          next
        end
      end
      # Switch 2 condition confirmation
      if c.switch2_valid
        if $game_switches[c.switch2_id] == false
          next
        end
      end
      # Variable condition confirmation
      if c.variable_valid
        if $game_variables[c.variable_id] < c.variable_value
          next
        end
      end
      # Self switch condition confirmation
      if c.self_switch_valid
        key = [@map_id, @event.id, c.self_switch_ch]
        if $game_self_switches[key] != true
          next
        end
      end
      # Set local variable: new_page
      new_page = page
      # Remove loop
      break
    end
    # Return new page
    return new_page
  end
  #--------------------------------------------------------------------------
  # * Refresh Reset
  #--------------------------------------------------------------------------
  def refresh_reset
    # Set each instance variable
    @tile_id = 0
    @character_name = ""
    @character_hue = 0
    @move_type = 0
    @through = true
    @trigger = nil
    @list = nil
    @interpreter = nil
  end
  #--------------------------------------------------------------------------
  # * Refresh Set Page
  #--------------------------------------------------------------------------
  def refresh_set_page
    # Set each instance variable
    @tile_id = @page.graphic.tile_id
    @character_name = @page.graphic.character_name
    @character_hue = @page.graphic.character_hue
    if @original_direction != @page.graphic.direction
      @direction = @page.graphic.direction
      @original_direction = @direction
      @prelock_direction = 0
    end
    if @original_pattern != @page.graphic.pattern
      @pattern = @page.graphic.pattern
      @original_pattern = @pattern
    end
    @opacity = @page.graphic.opacity
    @blend_type = @page.graphic.blend_type
    @move_type = @page.move_type
    @move_speed = @page.move_speed
    @move_frequency = @page.move_frequency
    @move_route = @page.move_route
    @move_route_index = 0
    @move_route_forcing = false
    @walk_anime = @page.walk_anime
    @step_anime = @page.step_anime
    @direction_fix = @page.direction_fix
    @through = @page.through
    @always_on_top = @page.always_on_top
    @trigger = @page.trigger
    @list = @page.list
    @interpreter = nil
  end
  #--------------------------------------------------------------------------
  # * Refresh Check Process
  #--------------------------------------------------------------------------
  def refresh_check_process
    # If trigger is [parallel process]
    if @trigger == 4
      # Create parallel process interpreter
      @interpreter = Interpreter.new
    end
  end
end

#==============================================================================
# ** Game_Player
#------------------------------------------------------------------------------
#  This class handles the player. Its functions include event starting
#  determinants and map scrolling. Refer to "$game_player" for the one
#  instance of this class.
#==============================================================================

class Game_Player < Game_Character
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    # Remember whether or not moving in local variables
    last_moving = moving?
    # If moving, event running, move route forcing, and message window
    # display are all not occurring
    unless moving? or $game_system.map_interpreter.running? or
    @move_route_forcing or $game_temp.message_window_showing
      update_player_movement
    end
    # Remember coordinates in local variables
    last_real_x = @real_x
    last_real_y = @real_y
    super
    # Scroll map
    update_scroll_down(last_real_y)
    update_scroll_left(last_real_x)
    update_scroll_right(last_real_x)
    update_scroll_up(last_real_y)
    # If not moving
    unless moving?
      # If player was moving last time
      if last_moving
        update_encounter
      end
      update_action_trigger
    end
  end
  #--------------------------------------------------------------------------
  # * Player Movement Update
  #--------------------------------------------------------------------------
  def update_player_movement
    # Move player in the direction the directional button is being pressed
    case Input.dir4
    when 2
      move_down
    when 4
      move_left
    when 6
      move_right
    when 8
      move_up
    end
  end
  #--------------------------------------------------------------------------
  # * Scroll Down
  #--------------------------------------------------------------------------
  def update_scroll_down(last_real_y)
    # If character moves down and is positioned lower than the center
    # of the screen
    if @real_y > last_real_y and @real_y - $game_map.display_y > CENTER_Y
      # Scroll map down
      $game_map.scroll_down(@real_y - last_real_y)
    end
  end
  #--------------------------------------------------------------------------
  # * Scroll Left
  #--------------------------------------------------------------------------
  def update_scroll_left(last_real_x)
    # If character moves left and is positioned more let on-screen than
    # center
    if @real_x < last_real_x and @real_x - $game_map.display_x < CENTER_X
      # Scroll map left
      $game_map.scroll_left(last_real_x - @real_x)
    end
  end
  #--------------------------------------------------------------------------
  # * Scroll Right
  #--------------------------------------------------------------------------
  def update_scroll_right(last_real_x)
    # If character moves right and is positioned more right on-screen than
    # center
    if @real_x > last_real_x and @real_x - $game_map.display_x > CENTER_X
      # Scroll map right
      $game_map.scroll_right(@real_x - last_real_x)
    end
  end
  #--------------------------------------------------------------------------
  # * Scroll Up
  #--------------------------------------------------------------------------
  def update_scroll_up(last_real_y)
    # If character moves up and is positioned higher than the center
    # of the screen
    if @real_y < last_real_y and @real_y - $game_map.display_y < CENTER_Y
      # Scroll map up
      $game_map.scroll_up(last_real_y - @real_y)
    end
  end
  #--------------------------------------------------------------------------
  # * Update Action Trigger
  #--------------------------------------------------------------------------
  def update_action_trigger
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Same position and front event determinant
      check_event_trigger_here([0])
      check_event_trigger_there([0,1,2])
    end
  end
  #--------------------------------------------------------------------------
  # * Scroll Encounter
  #--------------------------------------------------------------------------
  def update_encounter
    # Event determinant is via touch of same position event
    result = check_event_trigger_here([1,2])
    # If event which started does not exist
    if result == false
      # Disregard if debug mode is ON and ctrl key was pressed
      unless $DEBUG and Input.press?(Input::CTRL)
        # Encounter countdown
        if @encounter_count > 0
          @encounter_count -= 1
        end
      end
    end
  end
end

#==============================================================================
# ** Sprite_Battler
#------------------------------------------------------------------------------
#  This sprite is used to display the battler.It observes the Game_Character
#  class and automatically changes sprite conditions.
#==============================================================================

class Sprite_Battler
  #--------------------------------------------------------------------------
  # * Update
  #--------------------------------------------------------------------------
  def update
    super
    # If battler is nil
    if @battler == nil
      remove_battler
      return
    end
    # If file name or hue are different than current ones
    redraw_battler
    # If animation ID is different than current one
    loop_anim
    # If actor which should be displayed
    adjust_actor_opacity
    # Blink
    adjust_blink
    # If invisible
    adjust_visibility
    # If visible
    if @battler_visible
      # Escape
      sprite_escape
      # White flash
      sprite_white_flash
      # Animation
      sprite_animation
      # Damage
      sprite_damage
      # Collapse
      sprite_collapse
    end
    # Set sprite coordinates
    self.x = @battler.screen_x
    self.y = @battler.screen_y
    self.z = @battler.screen_z
  end
  #--------------------------------------------------------------------------
  # * Remove Battler
  #--------------------------------------------------------------------------
  def remove_battler      
    self.bitmap = nil
    loop_animation(nil)
  end
  #--------------------------------------------------------------------------
  # * Redraw Battler
  #--------------------------------------------------------------------------
  def redraw_battler
    if @battler.battler_name != @battler_name or
        @battler.battler_hue != @battler_hue
      # Get and set bitmap
      @battler_name = @battler.battler_name
      @battler_hue = @battler.battler_hue
      self.bitmap = RPG::Cache.battler(@battler_name, @battler_hue)
      @width = bitmap.width
      @height = bitmap.height
      self.ox = @width / 2
      self.oy = @height
      # Change opacity level to 0 when dead or hidden
      if @battler.dead? or @battler.hidden
        self.opacity = 0
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Loop Sprite Animation
  #--------------------------------------------------------------------------
  def loop_anim
    if @battler.damage == nil and
        @battler.state_animation_id != @state_animation_id
      @state_animation_id = @battler.state_animation_id
      loop_animation($data_animations[@state_animation_id])
    end
  end
  #--------------------------------------------------------------------------
  # * Adjust Actor Opacity
  #--------------------------------------------------------------------------
  def adjust_actor_opacity
    if @battler.is_a?(Game_Actor) and @battler_visible
      # Bring opacity level down a bit when not in main phase
      if $game_temp.battle_main_phase
        self.opacity += 3 if self.opacity < 255
      else
        self.opacity -= 3 if self.opacity > 207
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Adjust Blink
  #--------------------------------------------------------------------------
  def adjust_blink
    if @battler.blink
      blink_on
    else
      blink_off
    end
  end
  #--------------------------------------------------------------------------
  # * Adjust Visibility
  #--------------------------------------------------------------------------
  def adjust_visibility
    unless @battler_visible
      # Appear
      if not @battler.hidden and not @battler.dead? and
         (@battler.damage == nil or @battler.damage_pop)
        appear
        @battler_visible = true
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Sprite: Escape
  #--------------------------------------------------------------------------
  def sprite_escape
    if @battler.hidden
      $game_system.se_play($data_system.escape_se)
      escape
      @battler_visible = false
    end
  end
  #--------------------------------------------------------------------------
  # * Sprite: White Flash
  #--------------------------------------------------------------------------
  def sprite_white_flash
    if @battler.white_flash
      whiten
      @battler.white_flash = false
    end
  end
  #--------------------------------------------------------------------------
  # * Sprite: Animation
  #--------------------------------------------------------------------------
  def sprite_animation
    if @battler.animation_id != 0
      animation = $data_animations[@battler.animation_id]
      animation(animation, @battler.animation_hit)
      @battler.animation_id = 0
    end
  end
  #--------------------------------------------------------------------------
  # * Sprite: Damage
  #--------------------------------------------------------------------------
  def sprite_damage
    if @battler.damage_pop
      damage(@battler.damage, @battler.critical)
      @battler.damage = nil
      @battler.critical = false
      @battler.damage_pop = false
    end
  end
  #--------------------------------------------------------------------------
  # * Sprite: Collapse
  #--------------------------------------------------------------------------
  def sprite_collapse
    if @battler.damage == nil and @battler.dead?
      if @battler.is_a?(Game_Enemy)
        $game_system.se_play($data_system.enemy_collapse_se)
      else
        $game_system.se_play($data_system.actor_collapse_se)
      end
      collapse
      @battler_visible = false
    end
  end
end

#==============================================================================
# ** Spriteset_Map
#------------------------------------------------------------------------------
#  This class brings together map screen sprites, tilemaps, etc.
#  It's used within the Scene_Map class.
#==============================================================================

class Spriteset_Map
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    init_viewports
    init_tilemap
    init_panorama
    init_fog
    init_characters
    init_player
    init_weather
    init_pictures
    init_timer
    # Frame update
    update
  end
  #--------------------------------------------------------------------------
  # * Viewport Initialization
  #--------------------------------------------------------------------------
  def init_viewports
    # Make viewports
    @viewport1 = Viewport.new(0, 0, 640, 480)
    @viewport2 = Viewport.new(0, 0, 640, 480)
    @viewport3 = Viewport.new(0, 0, 640, 480)
    @viewport2.z = 200
    @viewport3.z = 5000
  end
  #--------------------------------------------------------------------------
  # * Tilemap Initialization
  #--------------------------------------------------------------------------
  def init_tilemap
    # Make tilemap
    @tilemap = Tilemap.new(@viewport1)
    @tilemap.tileset = RPG::Cache.tileset($game_map.tileset_name)
    for i in 0..6
      autotile_name = $game_map.autotile_names[i]
      @tilemap.autotiles[i] = RPG::Cache.autotile(autotile_name)
    end
    @tilemap.map_data = $game_map.data
    @tilemap.priorities = $game_map.priorities
  end
  #--------------------------------------------------------------------------
  # * Panorama Initialization
  #--------------------------------------------------------------------------
  def init_panorama
    # Make panorama plane
    @panorama = Plane.new(@viewport1)
    @panorama.z = -1000
  end
  #--------------------------------------------------------------------------
  # * Fog Initialization
  #--------------------------------------------------------------------------
  def init_fog
    # Make fog plane
    @fog = Plane.new(@viewport1)
    @fog.z = 3000
  end
  #--------------------------------------------------------------------------
  # * Character Sprite Initialization
  #--------------------------------------------------------------------------
  def init_characters
    # Make character sprites
    @character_sprites = []
    for i in $game_map.events.keys.sort
      sprite = Sprite_Character.new(@viewport1, $game_map.events[i])
      @character_sprites.push(sprite)
    end
  end
  #--------------------------------------------------------------------------
  # * Player Initialization
  #--------------------------------------------------------------------------
  def init_player
    @character_sprites.push(Sprite_Character.new(@viewport1, $game_player))
  end
  #--------------------------------------------------------------------------
  # * Weather Initialization
  #--------------------------------------------------------------------------
  def init_weather
    # Make weather
    @weather = RPG::Weather.new(@viewport1)
  end
  #--------------------------------------------------------------------------
  # * Picture Initialization
  #--------------------------------------------------------------------------
  def init_pictures
    # Make picture sprites
    @picture_sprites = []
    for i in 1..50
      @picture_sprites.push(Sprite_Picture.new(@viewport2,
        $game_screen.pictures[i]))
    end
  end
  #--------------------------------------------------------------------------
  # * Timer Initialization
  #--------------------------------------------------------------------------
  def init_timer
    # Make timer sprite
    @timer_sprite = Sprite_Timer.new
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    update_panorama
    update_fog
    update_tilemap
    update_panorama_plane
    update_fog_plane
    update_character_sprites
    update_weather
    update_picture_sprites
    # Update timer sprite
    @timer_sprite.update
    # Set screen color tone and shake position
    @viewport1.tone = $game_screen.tone
    @viewport1.ox = $game_screen.shake
    # Set screen flash color
    @viewport3.color = $game_screen.flash_color
    # Update viewports
    @viewport1.update
    @viewport3.update
  end
  #--------------------------------------------------------------------------
  # * Update Panorama
  #--------------------------------------------------------------------------
  def update_panorama
    # If panorama is different from current one
    if @panorama_name != $game_map.panorama_name or
       @panorama_hue != $game_map.panorama_hue
      @panorama_name = $game_map.panorama_name
      @panorama_hue = $game_map.panorama_hue
      if @panorama.bitmap != nil
        @panorama.bitmap.dispose
        @panorama.bitmap = nil
      end
      if @panorama_name != ""
        @panorama.bitmap = RPG::Cache.panorama(@panorama_name, @panorama_hue)
      end
      Graphics.frame_reset
    end
  end
  #--------------------------------------------------------------------------
  # * Update Fog
  #--------------------------------------------------------------------------
  def update_fog
    # If fog is different than current fog
    if @fog_name != $game_map.fog_name or @fog_hue != $game_map.fog_hue
      @fog_name = $game_map.fog_name
      @fog_hue = $game_map.fog_hue
      if @fog.bitmap != nil
        @fog.bitmap.dispose
        @fog.bitmap = nil
      end
      if @fog_name != ""
        @fog.bitmap = RPG::Cache.fog(@fog_name, @fog_hue)
      end
      Graphics.frame_reset
    end
  end
  #--------------------------------------------------------------------------
  # * Update Tilemap
  #--------------------------------------------------------------------------
  def update_tilemap
    # Update tilemap
    @tilemap.ox = $game_map.display_x / 4
    @tilemap.oy = $game_map.display_y / 4
    @tilemap.update
  end
  #--------------------------------------------------------------------------
  # * Update Panorama Plane
  #--------------------------------------------------------------------------
  def update_panorama_plane
    # Update panorama plane
    @panorama.ox = $game_map.display_x / 8
    @panorama.oy = $game_map.display_y / 8
  end
  #--------------------------------------------------------------------------
  # * Update Fog Plane
  #--------------------------------------------------------------------------
  def update_fog_plane
    # Update fog plane
    @fog.zoom_x = $game_map.fog_zoom / 100.0
    @fog.zoom_y = $game_map.fog_zoom / 100.0
    @fog.opacity = $game_map.fog_opacity
    @fog.blend_type = $game_map.fog_blend_type
    @fog.ox = $game_map.display_x / 4 + $game_map.fog_ox
    @fog.oy = $game_map.display_y / 4 + $game_map.fog_oy
    @fog.tone = $game_map.fog_tone
  end
  #--------------------------------------------------------------------------
  # * Update Character Sprites
  #--------------------------------------------------------------------------
  def update_character_sprites
    # Update character sprites
    for sprite in @character_sprites
      sprite.update
    end
  end
  #--------------------------------------------------------------------------
  # * Update Weather
  #--------------------------------------------------------------------------
  def update_weather
    # Update weather graphic
    @weather.type = $game_screen.weather_type
    @weather.max = $game_screen.weather_max
    @weather.ox = $game_map.display_x / 4
    @weather.oy = $game_map.display_y / 4
    @weather.update
  end
  #--------------------------------------------------------------------------
  # * Update Picture Sprites
  #--------------------------------------------------------------------------
  def update_picture_sprites
    # Update picture sprites
    for sprite in @picture_sprites
      sprite.update
    end
  end
end

#==============================================================================
# ** Scene_Title
#------------------------------------------------------------------------------
#  This class performs title screen processing.
#==============================================================================

class Scene_Title
  #--------------------------------------------------------------------------
  # * Main Processing
  #--------------------------------------------------------------------------
  def main
    return if main_battle_test?
    main_database
    main_background
    main_menu
    main_test_continue
    main_audio
    # Execute transition
    Graphics.transition
    # Main loop
    loop do
      main_loop
      break if main_scenechange?
    end
    # Prepare for transition
    Graphics.freeze
    main_dispose
  end
  #--------------------------------------------------------------------------
  # * Battle Test Check
  #--------------------------------------------------------------------------
  def main_battle_test?
    # If battle test
    if $BTEST
      battle_test
      return true
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Load Database
  #--------------------------------------------------------------------------
  def main_database
    # Load database
    $data_actors        = load_data("Data/Actors.rxdata")
    $data_classes       = load_data("Data/Classes.rxdata")
    $data_skills        = load_data("Data/Skills.rxdata")
    $data_items         = load_data("Data/Items.rxdata")
    $data_weapons       = load_data("Data/Weapons.rxdata")
    $data_armors        = load_data("Data/Armors.rxdata")
    $data_enemies       = load_data("Data/Enemies.rxdata")
    $data_troops        = load_data("Data/Troops.rxdata")
    $data_states        = load_data("Data/States.rxdata")
    $data_animations    = load_data("Data/Animations.rxdata")
    $data_tilesets      = load_data("Data/Tilesets.rxdata")
    $data_common_events = load_data("Data/CommonEvents.rxdata")
    $data_system        = load_data("Data/System.rxdata")
    # Make system object
    $game_system = Game_System.new
  end
  #--------------------------------------------------------------------------
  # * Background Initialization
  #--------------------------------------------------------------------------
  def main_background
    # Make title graphic
    @sprite = Sprite.new
    @sprite.bitmap = RPG::Cache.title($data_system.title_name)
  end
  #--------------------------------------------------------------------------
  # * Main Menu Initialization
  #--------------------------------------------------------------------------
  def main_menu
    # Make command window
    s1 = "New Game"
    s2 = "Continue"
    s3 = "Shutdown"
    @command_window = Window_Command.new(192, [s1, s2, s3])
    @command_window.back_opacity = 160
    @command_window.x = 320 - @command_window.width / 2
    @command_window.y = 288
  end
  #--------------------------------------------------------------------------
  # * Main Test Initialization
  #--------------------------------------------------------------------------
  def main_test_continue
    # Continue enabled determinant
    # Check if at least one save file exists
    # If enabled, make @continue_enabled true; if disabled, make it false
    @continue_enabled = false
    for i in 0..3
      if FileTest.exist?("Save#{i+1}.rxdata")
        @continue_enabled = true
      end
    end
    # If continue is enabled, move cursor to "Continue"
    # If disabled, display "Continue" text in gray
    if @continue_enabled
      @command_window.index = 1
    else
      @command_window.disable_item(1)
    end
  end
  #--------------------------------------------------------------------------
  # * Main Audio Initialization
  #--------------------------------------------------------------------------
  def main_audio
    # Play title BGM
    $game_system.bgm_play($data_system.title_bgm)
    # Stop playing ME and BGS
    Audio.me_stop
    Audio.bgs_stop
  end
  #--------------------------------------------------------------------------
  # * Main Loop
  #--------------------------------------------------------------------------
  def main_loop
    # Update game screen
    Graphics.update
    # Update input information
    Input.update
    # Frame update
    update
  end
  #--------------------------------------------------------------------------
  # * Main Scene Scene Change
  #--------------------------------------------------------------------------
  def main_scenechange?
    # Abort loop if screen is changed
    if $scene != self
      return true
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Main Dispose
  #--------------------------------------------------------------------------
  def main_dispose
    automatic_dispose
  end
end

#==============================================================================
# ** Scene_Map
#------------------------------------------------------------------------------
#  This class performs map screen processing.
#==============================================================================

class Scene_Map
  #--------------------------------------------------------------------------
  # * Main Processing
  #--------------------------------------------------------------------------
  def main
    main_draw    
    # Main loop
    loop do
      main_loop
      break if main_scenechange?
    end
    main_dispose
    main_tiletrigger
  end
  #--------------------------------------------------------------------------
  # * Main Draw
  #--------------------------------------------------------------------------
  def main_draw
    # Make sprite set
    @spriteset = Spriteset_Map.new
    # Make message window
    @message_window = Window_Message.new
    # Transition run
    Graphics.transition
  end
  #--------------------------------------------------------------------------
  # * Main Loop
  #--------------------------------------------------------------------------
  def main_loop
    # Update game screen
    Graphics.update
    # Update input information
    Input.update
    # Frame update
    update
  end
  #--------------------------------------------------------------------------
  # * Main Scene Change
  #--------------------------------------------------------------------------
  def main_scenechange?
    # Abort loop if screen is changed
    if $scene != self
      return true
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Main Dispose
  #--------------------------------------------------------------------------
  def main_dispose
    Graphics.freeze
    @spriteset.dispose
    automatic_dispose
  end
  #--------------------------------------------------------------------------
  # * Main Tiletrigger
  #--------------------------------------------------------------------------
  def main_tiletrigger
    # If switching to title screen
    if $scene.is_a?(Scene_Title)
      # Fade out screen
      Graphics.transition
      Graphics.freeze
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    # Loop
    loop do
      update_systems
      # Abort loop if player isn't place moving
      unless $game_temp.player_transferring
        break
      end
      # Run place move
      transfer_player
      # Abort loop if transition processing
      if $game_temp.transition_processing
        break
      end
    end
    update_graphics
    return if update_game_over? == true
    return if update_to_title? == true
    # If transition processing
    if $game_temp.transition_processing
      # Clear transition processing flag
      $game_temp.transition_processing = false
      # Execute transition
      if $game_temp.transition_name == ""
        Graphics.transition(20)
      else
        Graphics.transition(40, "Graphics/Transitions/" +
          $game_temp.transition_name)
      end
    end
    # If showing message window
    if $game_temp.message_window_showing
      return
    end
    # If encounter list isn't empty, and encounter count is 0
    if $game_player.encounter_count == 0 and $game_map.encounter_list != []
      # If event is running or encounter is not forbidden
      unless $game_system.map_interpreter.running? or
             $game_system.encounter_disabled
        # Confirm troop
        n = rand($game_map.encounter_list.size)
        troop_id = $game_map.encounter_list[n]
        # If troop is valid
        if $data_troops[troop_id] != nil
          # Set battle calling flag
          $game_temp.battle_calling = true
          $game_temp.battle_troop_id = troop_id
          $game_temp.battle_can_escape = true
          $game_temp.battle_can_lose = false
          $game_temp.battle_proc = nil
        end
      end
    end
    update_call_menu
    update_call_debug
    # If player is not moving
    unless $game_player.moving?
      update_scene
    end
  end
  #--------------------------------------------------------------------------
  # * Update Systems
  #--------------------------------------------------------------------------
  def update_systems
    # Update map, interpreter, and player order
      # (this update order is important for when conditions are fulfilled 
      # to run any event, and the player isn't provided the opportunity to
      # move in an instant)
      $game_map.update
      $game_system.map_interpreter.update
      $game_player.update
      # Update system (timer), screen
      $game_system.update
      $game_screen.update
  end
  #--------------------------------------------------------------------------
  # * Update Graphics
  #--------------------------------------------------------------------------
  def update_graphics
    # Update sprite set
    @spriteset.update
    # Update message window
    @message_window.update
  end
  #--------------------------------------------------------------------------
  # * Update Game Over
  #--------------------------------------------------------------------------
  def update_game_over?
     # If game over
    if $game_temp.gameover
      # Switch to game over screen
      $scene = Scene_Gameover.new
      return true
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Update To Title
  #--------------------------------------------------------------------------
  def update_to_title?
    # If returning to title screen
    if $game_temp.to_title
      # Change to title screen
      $scene = Scene_Title.new
      return true
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Update Menu Call
  #--------------------------------------------------------------------------
  def update_call_menu
    # If B button was pressed
    if Input.trigger?(Input::B)
      # If event is running, or menu is not forbidden
      unless $game_system.map_interpreter.running? or
             $game_system.menu_disabled
        # Set menu calling flag or beep flag
        $game_temp.menu_calling = true
        $game_temp.menu_beep = true
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Update Debug Call
  #--------------------------------------------------------------------------
  def update_call_debug
    # If debug mode is ON and F9 key was pressed
    if $DEBUG and Input.press?(Input::F9)
      # Set debug calling flag
      $game_temp.debug_calling = true
    end
  end
  #--------------------------------------------------------------------------
  # * Update Scene
  #--------------------------------------------------------------------------
  def update_scene
    # Run calling of each screen
    if $game_temp.battle_calling
       call_battle
     elsif $game_temp.shop_calling
       call_shop
     elsif $game_temp.name_calling
       call_name
     elsif $game_temp.menu_calling
       call_menu
     elsif $game_temp.save_calling
       call_save
     elsif $game_temp.debug_calling
       call_debug
     end
  end
end

#==============================================================================
# ** Scene_Menu
#------------------------------------------------------------------------------
#  This class performs menu screen processing.
#==============================================================================

class Scene_Menu
  #--------------------------------------------------------------------------
  # * Object Initialization
  #     menu_index : command cursor's initial position
  #--------------------------------------------------------------------------
  def initialize(menu_index = 0)
    @menu_index = menu_index
    commands_init
  end
  #--------------------------------------------------------------------------
  # * Set Commands
  #--------------------------------------------------------------------------
  def commands_init
    @commands = []
    s1 = $data_system.words.item
    s2 = $data_system.words.skill
    s3 = $data_system.words.equip
    s4 = "Status"
    s5 = "Save"
    s6 = "End Game"
    @commands.push(s1, s2, s3, s4, s5, s6).flatten!
  end
  #--------------------------------------------------------------------------
  # * Main Processing
  #--------------------------------------------------------------------------
  def main
    main_command_window
    main_windows
    # Execute transition
    Graphics.transition
    # Main loop
    loop do
      main_loop
      break if main_scenechange?
    end
    # Refresh map
    $game_map.refresh
    # Prepare for transition
    Graphics.freeze
    main_dispose
  end
  #--------------------------------------------------------------------------
  # * Main Command Window
  #--------------------------------------------------------------------------
  def main_command_window
    @command_window = Window_Command.new(160, @commands)
    @command_window.index = @menu_index
    @command_window.height = 224
    # If number of party members is 0
    if $game_party.actors.size == 0
      # Disable items, skills, equipment, and status
      @command_window.disable_item(0)
      @command_window.disable_item(1)
      @command_window.disable_item(2)
      @command_window.disable_item(3)
    end
    # If save is forbidden
    if $game_system.save_disabled
      # Disable save
      @command_window.disable_item(4)
    end
  end
  #--------------------------------------------------------------------------
  # * Main Command Window
  #--------------------------------------------------------------------------
  def main_windows
    # Make play time window
    @playtime_window = Window_PlayTime.new
    @playtime_window.x = 0
    @playtime_window.y = 224
    # Make steps window
    @steps_window = Window_Steps.new
    @steps_window.x = 0
    @steps_window.y = 320
    # Make gold window
    @gold_window = Window_Gold.new
    @gold_window.x = 0
    @gold_window.y = 416
    # Make status window
    @status_window = Window_MenuStatus.new
    @status_window.x = 160
    @status_window.y = 0
   end
  #--------------------------------------------------------------------------
  # * Main Loop
  #--------------------------------------------------------------------------
   def main_loop 
     # Update game screen
     Graphics.update
     # Update input information
     Input.update
     # Frame update
     update
   end
  #--------------------------------------------------------------------------
  # * Scene Change
  #--------------------------------------------------------------------------
  def main_scenechange?
    # Abort loop if screen is changed
    if $scene != self
      return true
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Main Dispose
  #--------------------------------------------------------------------------
  def main_dispose
    # Dispose of windows
    @command_window.dispose
    @playtime_window.dispose
    @steps_window.dispose
    @gold_window.dispose
    @status_window.dispose
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    # Update windows
    @command_window.update
    @playtime_window.update
    @steps_window.update
    @gold_window.update
    @status_window.update
    # If command window is active: call update_command
    if @command_window.active
      update_command
      return
    end
    # If status window is active: call update_status
    if @status_window.active
      update_status
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (when command window is active)
  #--------------------------------------------------------------------------
  def update_command
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Switch to map screen
      $scene = Scene_Map.new
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      update_command_check
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (when status window is active)
  #--------------------------------------------------------------------------
  def update_status
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Make command window active
      @command_window.active = true
      @status_window.active = false
      @status_window.index = -1
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      buzzer_check
      update_status_check unless buzzer_check
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Buzzer Check
  #--------------------------------------------------------------------------
  def buzzer_check
    # If command other than save or end game, and party members = 0
    if $game_party.actors.size == 0 and @command_window.index < 4
      # Play buzzer SE
      $game_system.se_play($data_system.buzzer_se)
      return true
    end
  end
  #--------------------------------------------------------------------------
  # * Update Command Check
  #--------------------------------------------------------------------------
  def update_command_check
    # Loads Current Command
    command = @commands[@command_window.index]
    # Checks Commands
    if command == $data_system.words.item
      command_item
    elsif command == $data_system.words.skill
      command_start_skill
    elsif command == $data_system.words.equip
      command_start_equip
    elsif command == 'Status'
      command_start_status
    elsif command == 'Save'
      command_save
    elsif command == 'End Game'
      command_endgame
    end
  end
  #--------------------------------------------------------------------------
  # * Update Status Check
  #--------------------------------------------------------------------------
  def update_status_check
    # Loads Current Command
    command = @commands[@command_window.index]
    # Checks Command By Name
    if command == $data_system.words.skill
      command_skill
    elsif command == $data_system.words.equip
      command_equip
    elsif command == 'Status'
      command_status
    end
  end
  #--------------------------------------------------------------------------
  # * Command Item
  #--------------------------------------------------------------------------
  def command_item
    # Play decision SE
    $game_system.se_play($data_system.decision_se)
    # Switch to item screen
    $scene = Scene_Item.new
  end
  #--------------------------------------------------------------------------
  # * Command Start Skill
  #--------------------------------------------------------------------------
  def command_start_skill
    activate_status
  end
  #--------------------------------------------------------------------------
  # * Command Skill
  #--------------------------------------------------------------------------
  def command_skill
    # If this actor's action limit is 2 or more
    if $game_party.actors[@status_window.index].restriction >= 2
      # Play buzzer SE
      $game_system.se_play($data_system.buzzer_se)
      return
    end
    # Play decision SE
    $game_system.se_play($data_system.decision_se)
    # Switch to skill screen
    $scene = Scene_Skill.new(@status_window.index)
  end
  #--------------------------------------------------------------------------
  # * Command Start Equip
  #--------------------------------------------------------------------------
  def command_start_equip
    activate_status
  end
  #--------------------------------------------------------------------------
  # * Command Equip
  #--------------------------------------------------------------------------
  def command_equip
    # Play decision SE
    $game_system.se_play($data_system.decision_se)
    # Switch to equipment screen
    $scene = Scene_Equip.new(@status_window.index)
  end
  #--------------------------------------------------------------------------
  # * Command Start Status
  #--------------------------------------------------------------------------
  def command_start_status
    activate_status
  end
  #--------------------------------------------------------------------------
  # * Command Status
  #--------------------------------------------------------------------------
  def command_status
    # Play decision SE
    $game_system.se_play($data_system.decision_se)
    # Switch to status screen
    $scene = Scene_Status.new(@status_window.index)
  end
  #--------------------------------------------------------------------------
  # * Command Save
  #--------------------------------------------------------------------------
  def command_save
    # If saving is forbidden
    if $game_system.save_disabled
      # Play buzzer SE
      $game_system.se_play($data_system.buzzer_se)
      return
    end
    # Play decision SE
    $game_system.se_play($data_system.decision_se)
    # Switch to save screen
    $scene = Scene_Save.new
  end
  #--------------------------------------------------------------------------
  # * Command End Game
  #--------------------------------------------------------------------------
  def command_endgame
    # Play decision SE
    $game_system.se_play($data_system.decision_se)
    # Switch to end game screen
    $scene = Scene_End.new
  end
  #--------------------------------------------------------------------------
  # * Activate Status Window
  #--------------------------------------------------------------------------
  def activate_status
    # Play decision SE
    $game_system.se_play($data_system.decision_se)
    # Make status window active
    @command_window.active = false
    @status_window.active = true
    @status_window.index = 0
  end
end

#==============================================================================
# ** Scene_Save
#------------------------------------------------------------------------------
#  This class performs save screen processing.
#==============================================================================

class Scene_Save < Scene_File
  #--------------------------------------------------------------------------
  # * Write Save Data
  #     file : write file object (opened)
  #--------------------------------------------------------------------------
  def write_save_data(file)
    write_characters(file)
    write_frame(file)
    write_setup(file)
    write_data(file)
  end
  #--------------------------------------------------------------------------
  # * Make Character Data
  #--------------------------------------------------------------------------
  def write_characters(file)
    # Make character data for drawing save file
    characters = []
    for i in 0...$game_party.actors.size
      actor = $game_party.actors[i]
      characters.push([actor.character_name, actor.character_hue])
    end
    # Write character data for drawing save file
    Marshal.dump(characters, file)
  end
  #--------------------------------------------------------------------------
  # * Write Frame Count
  #--------------------------------------------------------------------------
  def write_frame(file)
    # Wrire frame count for measuring play time
    Marshal.dump(Graphics.frame_count, file)
  end
  #--------------------------------------------------------------------------
  # * Write Setup
  #--------------------------------------------------------------------------
  def write_setup(file)
    # Increase save count by 1
    $game_system.save_count += 1
    # Save magic number
    # (A random value will be written each time saving with editor)
    $game_system.magic_number = $data_system.magic_number
  end
  #--------------------------------------------------------------------------
  # * Write Data
  #--------------------------------------------------------------------------
  def write_data(file)
    # Write each type of game object
    Marshal.dump($game_system, file)
    Marshal.dump($game_switches, file)
    Marshal.dump($game_variables, file)
    Marshal.dump($game_self_switches, file)
    Marshal.dump($game_screen, file)
    Marshal.dump($game_actors, file)
    Marshal.dump($game_party, file)
    Marshal.dump($game_troop, file)
    Marshal.dump($game_map, file)
    Marshal.dump($game_player, file)
  end
end

#==============================================================================
# ** Scene_Load
#------------------------------------------------------------------------------
#  This class performs load screen processing.
#==============================================================================

class Scene_Load < Scene_File
  #--------------------------------------------------------------------------
  # * Read Save Data
  #     file : file object for reading (opened)
  #--------------------------------------------------------------------------
  def read_save_data(file)
    read_characters(file)
    read_frame(file)
    read_data(file)
    read_edit
    read_refresh
  end
  #--------------------------------------------------------------------------
  # * Read Character Data
  #--------------------------------------------------------------------------
  def read_characters(file)
    # Read character data for drawing save file
    characters = Marshal.load(file)
  end
  #--------------------------------------------------------------------------
  # * Read Frame Count
  #--------------------------------------------------------------------------
  def read_frame(file)
    # Read frame count for measuring play time
    Graphics.frame_count = Marshal.load(file)
  end
  #--------------------------------------------------------------------------
  # * Read Data
  #--------------------------------------------------------------------------
  def read_data(file)
    # Read each type of game object
    $game_system        = Marshal.load(file)
    $game_switches      = Marshal.load(file)
    $game_variables     = Marshal.load(file)
    $game_self_switches = Marshal.load(file)
    $game_screen        = Marshal.load(file)
    $game_actors        = Marshal.load(file)
    $game_party         = Marshal.load(file)
    $game_troop         = Marshal.load(file)
    $game_map           = Marshal.load(file)
    $game_player        = Marshal.load(file)
  end
  #--------------------------------------------------------------------------
  # * Read Edit
  #--------------------------------------------------------------------------
  def read_edit
    # If magic number is different from when saving
    # (if editing was added with editor)
    if $game_system.magic_number != $data_system.magic_number
      # Load map
      $game_map.setup($game_map.map_id)
      $game_player.center($game_player.x, $game_player.y)
    end
  end
  #--------------------------------------------------------------------------
  # * Refresh Game Party
  #--------------------------------------------------------------------------
  def read_refresh
    # Refresh party members
    $game_party.refresh
  end
end

#==============================================================================
# ** Scene_Battle
#------------------------------------------------------------------------------
#  This class performs battle screen processing.
#==============================================================================
  
class Scene_Battle
  #--------------------------------------------------------------------------
  # * Object Initialization
  #     menu_index : command cursor's initial position
  #--------------------------------------------------------------------------
  def initialize
    commands_init
  end
  #--------------------------------------------------------------------------
  # * Set Commands
  #--------------------------------------------------------------------------
  def commands_init
    @commands = []
    s1 = $data_system.words.attack
    s2 = $data_system.words.skill
    s3 = $data_system.words.guard
    s4 = $data_system.words.item
    @commands.push(s1, s2, s3, s4).flatten!
  end
  #--------------------------------------------------------------------------
  # * Main Processing
  #--------------------------------------------------------------------------
  def main
    main_temp
    main_troop
    main_command
    main_windows
    main_spriteset
    main_transition
    # Start pre-battle phase
    start_phase1
    # Execute transition
    Graphics.transition
    # Main loop
    loop do
      main_loop
      break if main_scenechange?
    end
    # Refresh map
    $game_map.refresh
    # Prepare for transition
    Graphics.freeze
    main_dispose
    main_end
  end
  #--------------------------------------------------------------------------
  # * Game Temp Variable Setup
  #--------------------------------------------------------------------------
  def main_temp
    # Initialize each kind of temporary battle data
    $game_temp.in_battle = true
    $game_temp.battle_turn = 0
    $game_temp.battle_event_flags.clear
    $game_temp.battle_abort = false
    $game_temp.battle_main_phase = false
    $game_temp.battleback_name = $game_map.battleback_name
    $game_temp.forcing_battler = nil
    # Initialize battle event interpreter
    $game_system.battle_interpreter.setup(nil, 0)
  end
  #--------------------------------------------------------------------------
  # * Troop Setup
  #--------------------------------------------------------------------------
  def main_troop
    # Prepare troop
    @troop_id = $game_temp.battle_troop_id
    $game_troop.setup(@troop_id)
  end
  #--------------------------------------------------------------------------
  # * Main Command Setup
  #--------------------------------------------------------------------------
  def main_command
    @actor_command_window = Window_Command.new(160, @commands)
    @actor_command_window.height = 160
    @actor_command_window.y = 160
    @actor_command_window.back_opacity = 160
    @actor_command_window.active = false
    @actor_command_window.visible = false
  end
  #--------------------------------------------------------------------------
  # * Scene Window Setup
  #--------------------------------------------------------------------------
  def main_windows
    # Make other windows
    @party_command_window = Window_PartyCommand.new
    @help_window = Window_Help.new
    @help_window.back_opacity = 160
    @help_window.visible = false
    @status_window = Window_BattleStatus.new
    @message_window = Window_Message.new
  end
  #--------------------------------------------------------------------------
  # * Spriteset Setup
  #--------------------------------------------------------------------------
  def main_spriteset
    # Make sprite set
    @spriteset = Spriteset_Battle.new
    # Initialize wait count
    @wait_count = 0
  end
  #--------------------------------------------------------------------------
  # * Main Transition
  #--------------------------------------------------------------------------
  def main_transition
    # Execute transition
    if $data_system.battle_transition == ""
      Graphics.transition(20)
    else
      Graphics.transition(40, "Graphics/Transitions/" +
        $data_system.battle_transition)
    end
  end
  #--------------------------------------------------------------------------
  # * Main Loop
  #--------------------------------------------------------------------------
  def main_loop
    # Update game screen
    Graphics.update
    # Update input information
    Input.update
    # Frame update
    update
  end
  #--------------------------------------------------------------------------
  # * Scene Change
  #--------------------------------------------------------------------------
  def main_scenechange?
    # Abort loop if screen is changed
    if $scene != self
      return true
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Main Dispose
  #--------------------------------------------------------------------------
  def main_dispose
    # Dispose of windows
    @actor_command_window.dispose
    @party_command_window.dispose
    @help_window.dispose
    @status_window.dispose
    @message_window.dispose
    @skill_window.dispose unless @skill_window == nil
    @item_window.dispose unless @item_window == nil
    @result_window.dispose unless @result_window == nil
    # Dispose of sprite set
    @spriteset.dispose
  end
  #--------------------------------------------------------------------------
  # * Main End
  #--------------------------------------------------------------------------
  def main_end
    # If switching to title screen
    if $scene.is_a?(Scene_Title)
      # Fade out screen
      Graphics.transition
      Graphics.freeze
    end
    # If switching from battle test to any screen other than game over screen
    if $BTEST and not $scene.is_a?(Scene_Gameover)
      $scene = nil
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    update_event
    update_system
    update_objects
    update_transition
    # If message window is showing
    if $game_temp.message_window_showing
      return
    end
    # If effect is showing
    if @spriteset.effect?
      return
    end
    update_scene_exit
    update_abort
    update_waiting
    update_phase
  end
  #--------------------------------------------------------------------------
  # * Event Update
  #--------------------------------------------------------------------------
  def update_event
    # If battle event is running
    if $game_system.battle_interpreter.running?
      # Update interpreter
      $game_system.battle_interpreter.update
      # If a battler which is forcing actions doesn't exist
      if $game_temp.forcing_battler == nil
        # If battle event has finished running
        unless $game_system.battle_interpreter.running?
          # Rerun battle event set up if battle continues
          unless judge
            setup_battle_event
          end
        end
        # If not after battle phase
        if @phase != 5
          # Refresh status window
          @status_window.refresh
        end
      end
    end
  end
  #--------------------------------------------------------------------------
  # * System Update
  #--------------------------------------------------------------------------
  def update_system
    # Update system (timer) and screen
    $game_system.update
    $game_screen.update
    # If timer has reached 0
    if $game_system.timer_working and $game_system.timer == 0
      # Abort battle
      $game_temp.battle_abort = true
    end
  end
  #--------------------------------------------------------------------------
  # * Windows and Sprites Update
  #--------------------------------------------------------------------------
  def update_objects
    # Update windows
    @help_window.update
    @party_command_window.update
    @actor_command_window.update
    @status_window.update
    @message_window.update
    # Update sprite set
    @spriteset.update
  end
  #--------------------------------------------------------------------------
  # * Transition Update
  #--------------------------------------------------------------------------
  def update_transition
    # If transition is processing
    if $game_temp.transition_processing
      # Clear transition processing flag
      $game_temp.transition_processing = false
      # Execute transition
      if $game_temp.transition_name == ""
        Graphics.transition(20)
      else
        Graphics.transition(40, "Graphics/Transitions/" +
          $game_temp.transition_name)
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Scene Exit Update
  #--------------------------------------------------------------------------
  def update_scene_exit
    # If game over
    if $game_temp.gameover
      # Switch to game over screen
      $scene = Scene_Gameover.new
      return
    end
    # If returning to title screen
    if $game_temp.to_title
      # Switch to title screen
      $scene = Scene_Title.new
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Abort Update
  #--------------------------------------------------------------------------
  def update_abort
    # If battle is aborted
    if $game_temp.battle_abort
      # Return to BGM used before battle started
      $game_system.bgm_play($game_temp.map_bgm)
      # Battle ends
      battle_end(1)
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Waiting Update
  #--------------------------------------------------------------------------
  def update_waiting
    # If waiting
    if @wait_count > 0
      # Decrease wait count
      @wait_count -= 1
      return
    end
    # If battler forcing an action doesn't exist,
    # and battle event is running
    if $game_temp.forcing_battler == nil and
       $game_system.battle_interpreter.running?
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Phase Update
  #--------------------------------------------------------------------------
  def update_phase
    # Branch according to phase
    case @phase
    when 1  # pre-battle phase
      update_phase1
    when 2  # party command phase
      update_phase2
    when 3  # actor command phase
      update_phase3
    when 4  # main phase
      update_phase4
    when 5  # after battle phase
      update_phase5
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (actor command phase : basic command)
  #--------------------------------------------------------------------------
  def update_phase3_basic_command
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Go to command input for previous actor
      phase3_prior_actor
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      check_commands
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Check Commands
  #--------------------------------------------------------------------------
  def check_commands
    # Loads Current Command
    command = @commands[@actor_command_window.index]
    # Branches Possible Commands
    if command == $data_system.words.attack
      update_phase3_command_attack
    elsif command == $data_system.words.skill
      update_phase3_command_skill
    elsif command == $data_system.words.guard
      update_phase3_command_guard
    elsif command == $data_system.words.item
      update_phase3_command_item
    end
  end
  #--------------------------------------------------------------------------
  # * Command : Attack
  #--------------------------------------------------------------------------
  def update_phase3_command_attack
    # Play decision SE
    $game_system.se_play($data_system.decision_se)
    # Set action
    @active_battler.current_action.kind = 0
    @active_battler.current_action.basic = 0
    # Start enemy selection
    start_enemy_select
  end
  #--------------------------------------------------------------------------
  # * Command : Skill
  #--------------------------------------------------------------------------
  def update_phase3_command_skill
    # Play decision SE
    $game_system.se_play($data_system.decision_se)
    # Set action
    @active_battler.current_action.kind = 1
    # Start skill selection
    start_skill_select
  end
  #--------------------------------------------------------------------------
  # * Command : Guard
  #--------------------------------------------------------------------------
  def update_phase3_command_guard
    # Play decision SE
    $game_system.se_play($data_system.decision_se)
    # Set action
    @active_battler.current_action.kind = 0
    @active_battler.current_action.basic = 1
    # Go to command input for next actor
    phase3_next_actor
  end
  #--------------------------------------------------------------------------
  # * Command : Item
  #--------------------------------------------------------------------------
  def update_phase3_command_item
    # Play decision SE
    $game_system.se_play($data_system.decision_se)
    # Set action
    @active_battler.current_action.kind = 2
    # Start item selection
    start_item_select
  end
  #--------------------------------------------------------------------------
  # * Make Basic Action Results
  #--------------------------------------------------------------------------
  def make_basic_action_result
    # If attack
    if @active_battler.current_action.basic == 0
      make_basic_action_result_attack
      return
    end
    # If guard
    if @active_battler.current_action.basic == 1
      make_basic_action_result_guard
      return
    end
    # If escape
    if @active_battler.is_a?(Game_Enemy) and
       @active_battler.current_action.basic == 2
      make_basic_action_result_escape
      return
    end
    # If doing nothing
    if @active_battler.current_action.basic == 3
      make_basic_action_result_nothing
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Make Basic Action Results - Attack
  #--------------------------------------------------------------------------
  def make_basic_action_result_attack
    # Set anaimation ID
    @animation1_id = @active_battler.animation1_id
    @animation2_id = @active_battler.animation2_id
    # If action battler is enemy
    if @active_battler.is_a?(Game_Enemy)
      if @active_battler.restriction == 3
        target = $game_troop.random_target_enemy
      elsif @active_battler.restriction == 2
        target = $game_party.random_target_actor
      else
        index = @active_battler.current_action.target_index
        target = $game_party.smooth_target_actor(index)
      end
    end
    # If action battler is actor
    if @active_battler.is_a?(Game_Actor)
      if @active_battler.restriction == 3
        target = $game_party.random_target_actor
      elsif @active_battler.restriction == 2
        target = $game_troop.random_target_enemy
      else
        index = @active_battler.current_action.target_index
        target = $game_troop.smooth_target_enemy(index)
      end
    end
    # Set array of targeted battlers
    @target_battlers = [target]
    # Apply normal attack results
    for target in @target_battlers
      target.attack_effect(@active_battler)
    end
  end
  #--------------------------------------------------------------------------
  # * Make Basic Action Results - Guard
  #--------------------------------------------------------------------------
  def make_basic_action_result_guard
    # Display "Guard" in help window
    @help_window.set_text($data_system.words.guard, 1)
  end
  #--------------------------------------------------------------------------
  # * Make Basic Action Results - Escape
  #--------------------------------------------------------------------------
  def make_basic_action_result_escape
    # Display "Escape" in help window
    @help_window.set_text("Escape", 1)
    # Escape
    @active_battler.escape
  end
  #--------------------------------------------------------------------------
  # * Make Basic Action Results - Nothing
  #--------------------------------------------------------------------------
  def make_basic_action_result_nothing
    # Clear battler being forced into action
    $game_temp.forcing_battler = nil
    # Shift to step 1
    @phase4_step = 1
  end
end
=end