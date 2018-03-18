=begin
WORLD_MAP_ID = 1

#==============================================================================
# ** Game_Map
#==============================================================================

class Game_Map
  #--------------------------------------------------------------------------
  # * Event At
  #--------------------------------------------------------------------------
  def event_at(x, y)
    for event in @events.values
        return event if event.x == x && event.y == y
    end
    return nil
  end
  
  #--------------------------------------------------------------------------
  # * Events At (returns multiple events at the same position in an array)
  #--------------------------------------------------------------------------
  def events_at(x, y)
    eventarray = []
    for event in @events.values
      eventarray.push event if event.x == x && event.y == y
    end
    return eventarray if eventarray.size > 0
    return nil
  end

end

#==============================================================================
# ** Game_Event
#==============================================================================

class Game_Event
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader   :erased                  # trigger
  attr_accessor :mouse_autostart         # mouse autostart boolean
  attr_accessor :mouse_cursor_icon       # mouse cursor icon
  attr_accessor :mouse_cursor_desc       # mouse cursor desc
  attr_reader   :name                    # name of event
  #--------------------------------------------------------------------------
  # * Alias Listings
  #--------------------------------------------------------------------------
  alias_method :sephlamchop_mousesys_gmevt_refresh, :refresh
  #--------------------------------------------------------------------------
  # * Start Event
  #--------------------------------------------------------------------------
  def start
    # If list of event commands is not empty
    if @list && @list.size > 1
      @starting = true
    end
  end  

  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------  
  def refresh
    # Original Refresh
    sephlamchop_mousesys_gmevt_refresh
    # Click triggers event for action button, player or event touch
    @mouse_autostart   = [0, 1, 2].include?(@trigger)
    @mouse_cursor_icon = MouseCursor::Event_Cursor
    @mouse_cursor_desc = nil
    # Return if Erased or Nil List
    #return if @erased || @list.nil?
    
  end
end

#==============================================================================
# ** Game_Character
#==============================================================================
class Game_Character
  
  def passable?(x, y, d, step = 999, tx = nil, ty = nil)
    
    # Get new coordinates
    new_x = x + (d == 6 ? 1 : d == 4 ? -1 : 0)
    new_y = y + (d == 2 ? 1 : d == 8 ? -1 : 0)
    
    # If coordinates are outside of map
    unless $game_map.valid?(new_x, new_y)
      return false
    end
    
    # If through is ON
    if @through
      return true
    end
    
    # Able to leave current tile in desired direction?
    # SHAZ: for counter, must be old, counter, new, in a straight line
    unless $game_map.passable?(x, y, d, self) || (step == 2 && $game_map.event_at(x, y)) ||
      (step == 3 && $game_map.counter?(x, y) && tx != nil && ty != nil &&
      new_x - x == x - tx && new_y - y == y - ty)
      return false
    end
    
    # Able to enter adjoining tile in current direction?
    unless $game_map.passable?(new_x, new_y, 10 - d) ||
      (step == 2 && $game_map.counter?(new_x, new_y))
      return false
    end

    # SHAZ - ignore events sitting on a counter next to the destination
    if step != 2 || !$game_map.counter?(new_x, new_y)          
      # Loop all events
      for event in $game_map.events.values
        # If event coordinates are consistent with move destination
        if event.x == new_x and event.y == new_y
          @state = true
          # If through is OFF
          unless event.through
            # If self is event
            if self != $game_player
              return false
            end
            # With self as the player and partner graphic as character
            if event.character_name != ""
              return false
            end
          end
        end
      end
    end
    
    # If on world map, don't allow to go through events.  Otherwise,
    # the event will be triggered while the PC is walking
    if $game_map.map_id == WORLD_MAP_ID && @state == false
      return false
    end      

    # If player coordinates are consistent with move destination
    if $game_player.x == new_x && $game_player.y == new_y && self != $game_player
      # If through is OFF
      unless $game_player.through
        # If your own graphic is the character
        if @character_name != ""
          return false
        end
      end
    end

    return true
    
  end
end

#==============================================================================
# ** Game_Player
#==============================================================================

class Game_Player < Game_Character
  #--------------------------------------------------------------------------
  # * Alias Listings
  #--------------------------------------------------------------------------
  alias_method :sephlamchop_mousesys_gmplyr_update, :update
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    # Unless Interpreter Running, Forcing a Route or Message Showing
    unless $game_system.map_interpreter.running? or
           @move_route_forcing or $game_temp.message_window_showing
           
      # Find Path If Mouse Triggered
      if Mouse.trigger?(0) && Mouse.grid != nil

        # Check if mouse is over HUD on map 
        screen_x,screen_y = Mouse.pos
        
        # Gets Mouse X & Y
        mx, my = *Mouse.grid
        
        # Turn Character in direction
        newd_x = (@x - mx).abs
        newd_y = (@y - my).abs
        
        if @x > mx 
            turn_left if newd_x >= newd_y 
        elsif @x < mx
            turn_right if newd_x >= newd_y 
        end  
            
        if @y > my
            turn_up if newd_x < newd_y 
        elsif @y < my
            turn_down if newd_x < newd_y 
        end 

        # Run Pathfinding
        find_path(mx, my, false)
        
        # Gets Event
        @eventarray = @runpath ? $game_map.events_at(mx, my) : nil
        # If Event At Grid Location
        unless @eventarray.nil?
          @eventarray.each do |event|
            # If Event Autostart
            if !event.mouse_autostart
              @eventarray.delete(event)
            end
          end
          @eventarray = nil if @eventarray.size == 0
        end
        
      end
    end
    
    if @move_route_forcing
      clear_path
      @eventarray = nil
    end
    
    # Original Update
    sephlamchop_mousesys_gmplyr_update
    # If Non-nil Event Autostarter
    if @eventarray != nil && !moving? &&
      (!@ovrdest || @map.nil? || @map[@x,@y] == 1)
      # Gets Event
      @eventarray.each do |event|
      
        # If Event Within Range
        if event and (@x == event.x or @y == event.y)
          # SHAZ - trigger event when:
          # - Action button and standing on or beside, or with a counter between
          # - player/event touch and standing as close as possible (on, if possible)
          distance = Math.hypot(@x - event.x, @y - event.y)
          dir = @x < event.x ? 6 : @x > event.x ? 4 : @y < event.y ? 2 : @y > event.y ? 8 : 0
          if (event.trigger == 0 and (distance < 2 or (distance == 2 and 
            $game_map.counter?((@x+event.x)/2, (@y+event.y)/2)))) or 
            ([1,2].include?(event.trigger) and ((distance == 0 and 
            $game_player.passable?(@x, @y, dir)) or (distance == 1 and
            !$game_player.passable?(@x, @y, dir))))
            # Turn toward Event
            if @x == event.x
              turn_up if @y > event.y
              turn_down if @y < event.y
            else
              turn_left if @x > event.x
              turn_right if @x < event.x
            end
            # Start Event
            clear_path
            event.start
            @eventarray.delete(event)
            @eventarray = nil if @eventarray.size == 0
          end
        end
      
      end      
    end

  end
  
  def passable?(x1, y1, d, step = 999, tx = nil, ty = nil)
    super
  end
  
end

#==============================================================================
# ** Mouse Selectable Windows
#------------------------------------------------------------------------------
# SephirothSpawn
# Version 2.1
#==============================================================================
#==============================================================================
# ** Window_Base
#==============================================================================

class Window_Base
  #--------------------------------------------------------------------------
  # * Frame Update : Mouse Cursor - Item
  #--------------------------------------------------------------------------
  def update_mouse_cursors_item(item, cursor, show)
    # Return if not Active
    return unless self.active
    # Return if nil Position
    return if Mouse.position.nil?
    # Gets Mouse Position
    mx, my = Mouse.position
    # Gets Cursor Position
    cr = self.cursor_rect
    cx, cy = cr.x + self.x + 16, cr.y + self.y + 16
    cw, ch = cr.width, cr.height
    # If Not on Item
    if mx.between?(self.x, self.x + self.width) == false ||
       my.between?(self.y, self.y + self.height) == false || item.nil? ||
       @item_max == 0 || mx.between?(cx, cx + cw) == false ||
       my.between?(cy, cy + ch) == false
      # Clear Mouse Index
      @mouse_index = nil
      # Set Mouse to Default Cursor
      $mouse_sprite.set_bitmap(MouseCursor::Default_Cursor)
      return
    end
    # If Index is different than mouse index and window active
    if @mouse_index != @index
      # Reset Index
      @mouse_index = @index
      # set to item icon if cursor is true
      cursor = item.icon_name if cursor
      # Set Bitmap
      $mouse_sprite.set_bitmap(cursor) 
    end
  end
  
end

class Window_Selectable
  #--------------------------------------------------------------------------
  # * Default Settings
  #--------------------------------------------------------------------------
  Default_Mouse_Selectable = true
  Default_Window_Padding   = 16
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_accessor :mouse_selectable
  attr_accessor :window_padding
  #--------------------------------------------------------------------------
  # * Alias Listings
  #--------------------------------------------------------------------------
  alias_method :seph_mouseselectable_wndslct_init,   :initialize
  alias_method :seph_mouseselectable_wndslct_update, :update
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(x, y, width, height)
    # Original Initialization
    seph_mouseselectable_wndslct_init(x, y, width, height)
    # Set Mouse Selectable Flag
    @mouse_selectable = Default_Mouse_Selectable
    @window_padding   = Default_Window_Padding
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    
    # agf = hide mouse
    if $mouse_sprite.visible == true
    
    # If Mouse Selectable, Active, at Least 1 Item and Non-negitive index
    if self.mouse_selectable && self.active && @item_max > 0 && @index >= 0
      # Gets Mouse Position
      mouse_x, mouse_y = *Mouse.position
      
      # If Mouse Within Window       
      if mouse_x.between? (self.x, self.x + self.width) &&
         mouse_y.between? (self.y, self.y + self.height)
        # Calculates Mouse X and Y Position Within Window
        mouse_x -= self.x ; mouse_y -= self.y
        # Subtracts Window Padding
        mouse_x -= @window_padding ; mouse_y -= @window_padding
        # Subtracts Mouse Oh
        mouse_y -= self.mouse_oh
        # Gets Cursor Width
        cursor_width = (self.width / @column_max - 32)
        # Passes Through Item Max
        for i in 0...@item_max
          # Calculates Index Position
          x = i % @column_max * (cursor_width + 32)
          y = i / @column_max * self.oh - self.oy
          # If Mouse Between Rect
          if mouse_x.between?(x, x + cursor_width) && 
             mouse_y.between?(y, y + self.oh)
            # Set Index
            prev_index = @index
            @index = i
            if prev_index != @index
              $game_system.se_play($data_system.cursor_se)
            end
            break
          end
        end
      end
    end
    
    end
    
    # Original Update
    seph_mouseselectable_wndslct_update
  end
  #--------------------------------------------------------------------------
  # * Oh
  #--------------------------------------------------------------------------
  def oh
    return 32
  end
  #--------------------------------------------------------------------------
  # * Mouse Oh
  #--------------------------------------------------------------------------
  def mouse_oh
    return 0
  end  
  
end


#==============================================================================
# ** Window_MenuStatus
#==============================================================================

class Window_MenuStatus < Window_Selectable
  #--------------------------------------------------------------------------
  # * Oh
  #--------------------------------------------------------------------------
  def oh
    return 60 
  end
end

#==============================================================================
# ** Window_Target
#==============================================================================

class Window_Target < Window_Selectable
  #--------------------------------------------------------------------------
  # * Oh
  #--------------------------------------------------------------------------
  def oh
    return 105 
  end
end

#==============================================================================
# ** Window_BattleReserve
#==============================================================================

class Window_BattleReserve < Window_Selectable
  #--------------------------------------------------------------------------
  # * Oh
  #--------------------------------------------------------------------------
  def oh
    return 105 
  end
end

#==============================================================================
# ** Window_EquipRight
#==============================================================================

class Window_EquipRight < Window_Selectable
  #--------------------------------------------------------------------------
  # * Oh
  #--------------------------------------------------------------------------
  def oh
    return 50 
  end
  
  #--------------------------------------------------------------------------
  # * Mouse Oh
  #--------------------------------------------------------------------------
  def mouse_oh
    return 140
  end  
  
end

#==============================================================================
# ** Window_Message
#==============================================================================

class Window_Message < Window_Selectable
  #--------------------------------------------------------------------------
  # * Mouse Oh
  #--------------------------------------------------------------------------
  def mouse_oh
    return $game_temp.choice_start * 32
  end
end

#==============================================================================
# ** Window_Party
#==============================================================================

class Window_Party < Window_Selectable
  #--------------------------------------------------------------------------
  # * Oh
  #--------------------------------------------------------------------------
  def oh
    return 52 
  end
end


#==============================================================================
# ** Window_Menu
#==============================================================================

class Window_Menu < Window_Selectable
  #--------------------------------------------------------------------------
  # * Oh
  #--------------------------------------------------------------------------
  def oh
    return 35 
  end
end

#==============================================================================
# ** Window_ActorCommand
#==============================================================================

class Window_ActorCommand < Window_Selectable
  #--------------------------------------------------------------------------
  # * Update
  #--------------------------------------------------------------------------
  def update
    if $mouse_sprite.visible
      
      # if Mouse sleectable, active, at least 1 item and non-negative index
      if self.mouse_selectable && self.active && @item_max > 0 && @index >= 0
        # Get / check mouse position
        mouse_x, mouse_y = *Mouse.position
        
        if mouse_x.between?(self.x, self.x + self.width) && 
          mouse_y.between?(self.y, self.y + self.height)
          
          # Calculates mouse position within window
          mouse_x -= self.x
          mouse_y -= self.y
          
          # Subtracts widnow padding and overhead
          mouse_x -= @window_padding
          mouse_y -= @window_padding - self.mouse_oh
          
          # Look through all items
          for i in 0...@item_max
            ix,iy = @positions[i]
            if mouse_x.between?(ix, ix + 32) && mouse_y.between?(iy, iy + self.oh)
              if i != @index
                $game_system.se_play($data_system.cursor_se)
              end
              @index = i
              break
            end
          end
        end
      end
    end
    
    super
  end
  
  #--------------------------------------------------------------------------
  # * Oh
  #--------------------------------------------------------------------------
  def oh
    return 32  
  end
end


#==============================================================================
# ** Window_NameInput
#==============================================================================

class Window_NameInput < Window_Base
  #--------------------------------------------------------------------------
  # * Default Settings
  #--------------------------------------------------------------------------
  Default_Mouse_Selectable = true
  Default_Window_Padding = 16
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_accessor :mouse_selectable
  attr_accessor :window_padding
  #--------------------------------------------------------------------------
  # * Alias Listings
  #--------------------------------------------------------------------------
  alias_method :shaz_mouseselectable_wndslct_init,   :initialize
  alias_method :shaz_mouseselectable_wndslct_update, :update
  #--------------------------------------------------------------------------
  # ● Initialize the Name Input window
  #--------------------------------------------------------------------------
  def initialize
    # Original Initialization
    shaz_mouseselectable_wndslct_init
    # Set Mouse Selectable Flag
    @mouse_selectable = Default_Mouse_Selectable
    @window_padding = Default_Window_Padding
  end

  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------

  def update
    
    # if mouse selectable, visible, active, and non-negative index
    if $mouse_sprite.visible && self.mouse_selectable && self.active &&
      @index >= 0
      
      # Get mouse position
      mouse_x, mouse_y = *Mouse.position
      
      # If mouse within window
      if mouse_x.between? (self.x, self.x + self.width) &&
        mouse_y.between? (self.y, self.y + self.height)
        
        # Calculates mouse X and Y positions within window
        mouse_x -= self.x ; mouse_y -= self.y
        
        # Subtracts window padding
        mouse_x -= @window_padding ; mouse_y -= @window_padding
        
        # Subtracts mouse oh
        mouse_y -= self.mouse_oh
        
        # Gets cursor width
        cursor_width = 28
        
        # If not Submit button, pass through all items
        if mouse_x.between?(428, 428+48) && mouse_y.between?(9*32, 9*32+32)
          $game_system.se_play($data_system.cursor_se) if @index != 180
          @index = 180
        else
          for i in 0..90  
            
            # Calculate index position
            x = 140 + i / 5 / 9 * 180 + i % 5 * 32
            y = i / 5 % 9 * 32
            
            # If mouse between rect
            if mouse_x.between?(x, x + cursor_width) && 
              mouse_y.between?(y, y + self.oh)
              # set index
              prev_index = @index
              @index = i
              if prev_index != @index
                $game_system.se_play($data_system.cursor_se)
              end
              break
            end
          end
        end
      end
    end
    
    # Original update
    shaz_mouseselectable_wndslct_update
  end
  
  #--------------------------------------------------------------------------
  # * Oh
  #--------------------------------------------------------------------------
  
  def oh
    return 32
  end
  
  #--------------------------------------------------------------------------
  # * Mouse Oh
  #--------------------------------------------------------------------------
  
  def mouse_oh
    return 0
  end
  
end


#==============================================================================
# ** Scene_File
#==============================================================================

class Scene_File
  #--------------------------------------------------------------------------
  # * Alias Listings
  #--------------------------------------------------------------------------
  alias_method :sephlamchop_mousesys_scnfl_update, :update
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    
    # agf = hide mouse
    if $mouse_sprite.visible == true    
    
    # If Mouse Position isn't Nil
    if Mouse.pos != nil
      
      # Gets Mouse Position
      x, y = Mouse.pos 
      y = y + 32
      
      # Pass Through Savefile Windows
      for i in 0...@savefile_windows.size
        
        # Gets Window
        w = @savefile_windows[i]
        
        # Don't allow user to select autosave slot in Load Menu
        if @autosave_slot == false
          i = 1 if i == 0
        end
        
        # If Within Window Range
        if x.between?(w.x, w.x + w.width) &&
           y.between?(w.y, w.y + w.height) && w.active
                      
          prev_index = @file_index
           
          # Set File Index
          @file_index = i
          
          # Turns Window On
          w.selected = true
          
          # Play SE
          if prev_index != @file_index
            $game_system.se_play($data_system.cursor_se)
          end          
          
          # Unhighlight remaining windows
          for j in 0...@savefile_windows.size
            if j != i
               @savefile_windows[j].selected = false
            end
          end         

          # Don't select autosave slot in Load Menu
          if @autosave_slot == false
            @savefile_windows[0].selected = false if i == 1
          end
          
          # Break Main Loop
          break            
        end
      end
    end
  
    end
  
    # Original Update
    sephlamchop_mousesys_scnfl_update
  end
end


#==============================================================================
# ** Game_Battler
#==============================================================================

class Game_Battler
  #--------------------------------------------------------------------------
  # * Battler Width
  #--------------------------------------------------------------------------
  def battler_width
    return RPG::Cache.battler(@battler_name, @battler_hue).width
  end
  #--------------------------------------------------------------------------
  # * Battler Height
  #--------------------------------------------------------------------------
  def battler_height
    return RPG::Cache.battler(@battler_name, @battler_hue).height
  end
end

#==============================================================================
# ** Arrow_Enemy
#==============================================================================

class Arrow_Enemy < Arrow_Base
  #--------------------------------------------------------------------------
  # * Alias Listings
  #--------------------------------------------------------------------------
  alias_method :seph_mouseselectablewindows_arrenmy_update, :update
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    # Original Update
    seph_mouseselectablewindows_arrenmy_update
    
    if $mouse_sprite.visible == true
      # Return if Nil Mouse Position
      return if Mouse.position.nil?
      # Gets Mouse Position
      mx, my = *Mouse.position
      # Pass Through Enemies
      $game_troop.enemies.each do |enemy|
        # Skip if Non-Existing Enemy
        next unless enemy.exist?
        # Gets Paddings
        w, h = enemy.battler_width / 2, enemy.battler_height
        # If Within Mouse Padding Range
        if mx.between?(enemy.screen_x - w, enemy.screen_x + w) &&
           my.between?(enemy.screen_y - h, enemy.screen_y + 10)
          # Set Index
          @index = $game_troop.enemies.index(enemy)
          # Set mouse cursor to bitmap
          $mouse_sprite.set_bitmap(MouseCursor::Enemy_Cursor) 
          return
          # break
        end
      end
    
      # Set Mouse to Default Cursor
      $mouse_sprite.set_bitmap(MouseCursor::Default_Cursor)
    end
    
  end
end

#==============================================================================
# ** Arrow_Actor
#==============================================================================

class Arrow_Actor < Arrow_Base
  #--------------------------------------------------------------------------
  # * Alias Listings
  #--------------------------------------------------------------------------
  alias_method :seph_mouseselectablewindows_arractr_update, :update
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    # Original Update
    seph_mouseselectablewindows_arractr_update
    # Return if Nil Mouse Position
    return if Mouse.position.nil?
    # Gets Mouse Position
    mx, my = *Mouse.position
    # Pass Through Actors
    $game_party.actors.each do |actor|
      # Gets Paddings
      w, h = actor.battler_width / 2, actor.battler_height
      # If Within Mouse Padding Range
      if mx.between?(actor.screen_x - w, actor.screen_x + w) &&
         my.between?(actor.screen_y - h, actor.screen_y + 10)
        # Set Index
        @index = $game_party.actors.index(actor)
      end
    end
  end
end

#==============================================================================
# ** Scene_Map
#==============================================================================

class Scene_Map
  #--------------------------------------------------------------------------
  # * Alias Listings
  #--------------------------------------------------------------------------
  alias_method :sephlamchop_mousesys_scnmap_update, :update
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    # Unless Message Showing
    unless $game_temp.message_text
      # Update Event Cursors
      $mouse_sprite.update_event_cursors
    end
    # Original Update
    sephlamchop_mousesys_scnmap_update
  end
end

#==============================================================================
# ** Interpreter
#==============================================================================

class Interpreter
  #--------------------------------------------------------------------------
  # * Alias Listings
  #--------------------------------------------------------------------------
  alias_method :shaz_mousesys_intrprtr_command_101, :command_101
  #--------------------------------------------------------------------------
  # * Show Text
  #--------------------------------------------------------------------------
  def command_101
    # return mouse sprite to default cursor
    $mouse_sprite.set_bitmap(MouseCursor::Default_Cursor)
    # original command_101
    shaz_mousesys_intrprtr_command_101
  end
end

$mouse_sprite = Sprite_Mouse.new

# game mouse is visible, system mouse is hidden
$mouse_sprite.visible = true
=end