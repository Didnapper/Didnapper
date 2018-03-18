=begin
#============================================================================== 
# ** Modules.Mouse Input (7.0)              By Near Fantastica & SephirothSpawn
#==============================================================================
module Mouse
  #--------------------------------------------------------------------------
  # * Mouse to Input Triggers
  #
  #   key => Input::KeyCONSTANT (key: 0 - Left, 1 - Middle, 2 - Right)
  #--------------------------------------------------------------------------
  Mouse_to_Input_Triggers = {0 => Input::C, 1 => Input::B, 2 => Input::A}
  #--------------------------------------------------------------------------
  # * API Declaration
  #--------------------------------------------------------------------------
  GAKS          = Win32API.new('user32',    'GetAsyncKeyState', 'i',     'i')
  GSM           = Win32API.new('user32',    'GetSystemMetrics', 'i',     'i')
  Cursor_Pos    = Win32API.new('user32',    'GetCursorPos',     'p',     'i')
  $ShowCursor   = Win32API.new('user32',    'ShowCursor',       'i',     'l')
  Scr2cli       = Win32API.new('user32',    'ScreenToClient',   %w(l p), 'i')
  Client_rect   = Win32API.new('user32',    'GetClientRect',    %w(l p), 'i')
  Findwindow    = Win32API.new('user32',    'FindWindowA',      %w(p p), 'l')
  Readini       = Win32API.new('kernel32',  'GetPrivateProfileStringA', 
                               %w(p p p p l p), 'l')
                               
  # if graphical effects turned on, show fancy cursor
  $ShowCursor.call($game_mouse ? 0 : 1)
  
  @triggers     =   [[0, 1], [0, 2], [0, 4]] 
  @old_pos      =   0
  @pos_i        =   0
    
  #--------------------------------------------------------------------------
  # * Mouse Grid Position
  #--------------------------------------------------------------------------
  def self.grid    
    # Return Nil if Position is Nil
    return nil if @pos.nil?
    
    # Get X & Y Locations  
    x = (@pos[0] + $game_map.display_x / 4) / 32
    y = (@pos[1] + $game_map.display_y / 4) / 32
    
    # Vehicle Stuff
    $mouse_x = x
    $mouse_y = y 
    
    # Return X & Y
    return [x, y]
    
  end
  #--------------------------------------------------------------------------
  # * Mouse Position
  #--------------------------------------------------------------------------
  def self.position
    return @pos == nil ? [0, 0] : @pos
  end
  #--------------------------------------------------------------------------
  # * Mouse Global Position
  #--------------------------------------------------------------------------
  def self.global_pos
    # Packs 0 Position
    pos = [0, 0].pack('ll')
    # Returns Unpacked Cursor Position Call
    return Cursor_Pos.call(pos) == 0 ? nil : pos.unpack('ll')
  end
  
  #--------------------------------------------------------------------------
  # * Screen to Client
  #--------------------------------------------------------------------------
  def self.screen_to_client(x=0, y=0)
    pos = [x, y].pack('ll')
    return Scr2cli.call(self.hwnd, pos) == 0 ? nil : pos.unpack('ll')
  end  
    
  #--------------------------------------------------------------------------
  # * Mouse Position
  #-------------------------------------------------------------------------- 
  def self.pos

    global_pos = [0, 0].pack('ll')    
    gx, gy = Cursor_Pos.call(global_pos) == 0 ? nil : global_pos.unpack('ll')

    local_pos = [gx, gy].pack('ll')
    x, y = Scr2cli.call(self.hwnd, local_pos) == 0 ? nil : local_pos.unpack('ll')
    
    # Begins Test
    begin
      # Return X & Y or Nil Depending on Mouse Position
      if (x >= 0 && y >= 0 && x <= 640 && y <= 480)
        return x, y
      else
        return -20, -20
      end
    rescue
      return 0, 0 #nil
    end
    
  end  
    
  #--------------------------------------------------------------------------
  # * Update Mouse Position
  #--------------------------------------------------------------------------
  def self.update
    
    # Update Position
    old_pos = @pos
    @pos = self.pos
    
    # agf = hide system mouse
    if !$mouse_sprite.visible && old_pos != @pos
      $mouse_sprite.visible = true
    end
    
    # when mouse leaves game window, show system mouse
    if old_pos != [-20, -20] && @pos == [-20, -20]
      $ShowCursor.call(1)
    # when mouse is in game window, show custom mouse if it's turned on
    elsif old_pos == [-20, -20] && @pos != [-20, -20]
      $ShowCursor.call($game_mouse ? 0 : 1)
    end

    # Update Triggers
    for i in @triggers
      # Gets Async State
      n = GAKS.call(i[1])
      # If 0 or 1
      if [0, 1].include?(n)
        i[0] = (i[0] > 0 ? i[0] * -1 : 0)
      else
        i[0] = (i[0] > 0 ? i[0] + 1 : 1)
      end
    end
    
  end
  #--------------------------------------------------------------------------
  # * Trigger?
  #     id : 0:Left, 1:Right, 2:Center
  #--------------------------------------------------------------------------
  def self.trigger?(id = 0)
    
    #only user trigger if in range of screen
    pos = self.pos
    if pos != [-20,-20]
    
    case id
      when 0  # Left
        return @triggers[id][0] == 1
      when 1  # Right (only when menu enabled)
        if @triggers[1][0] == 1 && !$game_system.menu_disabled
          return @triggers[id][0] == 1      
        end
      when 2  # Center
        return @triggers[id][0] == 1
    end    
    
    end
    
  end
  #--------------------------------------------------------------------------
  # * Repeat?
  #     id : 0:Left, 1:Right, 2:Center
  #--------------------------------------------------------------------------
  def self.repeat?(id = 0)
    if @triggers[id][0] <= 0
      return false
    else
      return @triggers[id][0] % 5 == 1 && @triggers[id][0] % 5 != 2
    end
  end
  #--------------------------------------------------------------------------
  # * Screen to Client
  #--------------------------------------------------------------------------
  def self.screen_to_client(x=0, y=0)
    # Pack X & Y
    pos = [x, y].pack('ll')
    # Return Unpacked Position or Nil
    return Scr2cli.call(self.hwnd, pos) == 0 ? nil : pos.unpack('ll')
  end
  #--------------------------------------------------------------------------
  # * Hwnd - window handle
  #--------------------------------------------------------------------------
  def self.hwnd
    if @hwnd.nil?
      # Finds Game Name from ini file
      game_name = "\0" * 256
      Readini.call('Game', 'Title', '', game_name, 255, ".\\Game.ini")
      game_name.delete!("\0")
      # Finds Window
      @hwnd = Findwindow.call('RGSS Player', game_name)
    end
    return @hwnd
  end
  #--------------------------------------------------------------------------
  # * Client Size
  #--------------------------------------------------------------------------
  def self.client_size
    # Packs Empty Rect
    rect = [0, 0, 0, 0].pack('l4')
    # Gets Game Window Rect
    Client_rect.call(self.hwnd, rect)
    # Unpacks Right & Bottom
    right, bottom = rect.unpack('l4')[2..3]
    # Returns Right & Bottom
    return right, bottom
  end
end

#==============================================================================
# ** Input
#==============================================================================

class << Input
  #------------------------------------------------------------------------
  # * Alias Listings
  #------------------------------------------------------------------------
  unless self.method_defined?(:seph_mouse_input_update)
    alias_method :seph_mouse_input_update,   :update
    alias_method :seph_mouse_input_trigger?, :trigger?
    alias_method :seph_mouse_input_repeat?,  :repeat?
  end
  #------------------------------------------------------------------------
  # * Frame Update
  #------------------------------------------------------------------------
  def update
    # Update Mouse
    Mouse.update
    # Original Update
    seph_mouse_input_update
  end
  #--------------------------------------------------------------------------
  # * Trigger? Test
  #--------------------------------------------------------------------------
  def trigger?(constant)
    # Return true if original test is true
    return true if seph_mouse_input_trigger?(constant)
    # If Mouse Position isn't Nil
    unless Mouse.pos.nil?
      # If Mouse Trigger to Input Trigger Has Constant
      if Mouse::Mouse_to_Input_Triggers.has_value?(constant)
        # Return True if Mouse Triggered
        mouse_trigger = Mouse::Mouse_to_Input_Triggers.index(constant)
        return true if Mouse.trigger?(mouse_trigger)      
      end
    end
    # Return False
    return false
  end
  #--------------------------------------------------------------------------
  # * Repeat? Test
  #--------------------------------------------------------------------------
  def repeat?(constant)
    # Return true if original test is true
    return true if seph_mouse_input_repeat?(constant)
    # If Mouse Position isn't Nil
    unless Mouse.pos.nil?
      # If Mouse Trigger to Input Trigger Has Constant
      if Mouse::Mouse_to_Input_Triggers.has_value?(constant)
        # Return True if Mouse Triggered
        mouse_trigger = Mouse::Mouse_to_Input_Triggers.index(constant)     
        return true if Mouse.repeat?(mouse_trigger)
      end
    end
    # Return False
    return false
  end
end


#==============================================================================
#  ¦ Path Finding
#==============================================================================
# Near Fantastica
# Version 1
# 29.11.05
#==============================================================================

  class Game_Character
    #--------------------------------------------------------------------------
    alias nf_pf_game_character_initialize initialize
    alias nf_pf_game_character_update update
    #--------------------------------------------------------------------------
    attr_accessor :ignore_movement
    attr_accessor :map
    attr_accessor :runpath
    attr_accessor :ovrdest
    #--------------------------------------------------------------------------
    def initialize
      nf_pf_game_character_initialize
      @map = nil
      @runpath = false
      @ovrdest = false
    end
    #--------------------------------------------------------------------------
    def update
      run_path if @runpath == true
      nf_pf_game_character_update
    end
    #--------------------------------------------------------------------------
    def run_path
      return if moving?
      step = @map[@x,@y]
      if step == 1
        @map = nil
        @runpath = false
        return
      end
      
      dir = rand(2)
      case dir
      when 0
        move_right if @map[@x+1,@y] == step - 1 and step != 0
        move_down if @map[@x,@y+1] == step - 1 and step != 0
        move_left if @map[@x-1,@y] == step -1 and step != 0
        move_up if @map[@x,@y-1] == step - 1 and step != 0
      when 1
        move_up if @map[@x,@y-1] == step - 1 and step != 0
        move_left if @map[@x-1,@y] == step -1 and step != 0
        move_down if @map[@x,@y+1] == step - 1 and step != 0
        move_right if @map[@x+1,@y] == step - 1 and step != 0
      end
    end
    #--------------------------------------------------------------------------
    def find_path(x,y, force = true)
      sx, sy = @x, @y
      result = setup_map(sx,sy,x,y)      
      @runpath = result[0]
      @map = result[1]
      @map[sx,sy] = result[2] if result[2] != nil
      $game_player.ignore_movement = @runpath ? force : false
    end
    #--------------------------------------------------------------------------
    def clear_path
      @map = nil
      @runpath = false
      @ovrdest = false
      $game_player.ignore_movement = false
    end
    #--------------------------------------------------------------------------
    def setup_map(sx,sy,ex,ey)
      map = Table.new($game_map.width, $game_map.height)

      # Shaz - adding this comment to the second line of the event commands
      #     Mouse[0,1]
      # will cause the player to go to the tile BELOW the event, turn up,
      # and interact with the event ([0,1] is x+0, y+1)
      tx = ex
      ty = ey
      event = $game_map.event_at(ex, ey)
      if !event.nil? && !event.list.nil? && !event.erased && 
        event.list.size > 1 && event.list[1].code == 108
        text = event.list[1].parameters.to_s
        text.gsub!(/[Mm][Oo][Uu][Ss][Ee]\[([-,0-9]+),([-,0-9]+)\]/) do
          tx = ex + $1.to_i
          ty = ey + $2.to_i
          map[ex, ey] = 999
          @ovrdest = true
        end
      end
      
      update_counter = 0
      map[tx,ty] = 1
      old_positions = []
      new_positions = []
      old_positions.push([tx, ty])
      depth = 2
      $path_allow = false
      depth.upto(100){|step|
        loop do
          break if old_positions[0] == nil
          x,y = old_positions.shift
          return [true, map, step-1] if x == sx and y == sy
          if map[x,y + 1] == 0 and $game_player.passable?(x, y, 2, step, tx, ty) 
            map[x,y + 1] = step
            new_positions.push([x,y + 1])
          end
          if map[x - 1,y] == 0 and $game_player.passable?(x, y, 4, step, tx, ty) 
            map[x - 1,y] = step
            new_positions.push([x - 1,y])
          end
          if map[x + 1,y] == 0 and $game_player.passable?(x, y, 6, step, tx, ty) 
            map[x + 1,y] = step
            new_positions.push([x + 1,y])
          end
          if map[x,y - 1] == 0 and $game_player.passable?(x, y, 8, step, tx, ty) 
            map[x,y - 1] = step
            new_positions.push([x,y - 1])
          end
          
          # If we've checked quite a few tiles, allow graphics and input
          # to update - to avoid the 'script hanging' error
          update_counter += 1
          if update_counter > 100
            Graphics.update
            update_counter = 0
          end
        end
        
        old_positions = new_positions
        new_positions = []
      }
      
      @ovrdest = false
      return [false, nil, nil]        
        
    end
  end
  
  class Game_Map
    #--------------------------------------------------------------------------
    alias pf_game_map_setup setup
    #--------------------------------------------------------------------------
    def setup(map_id)
      pf_game_map_setup(map_id)
      $game_player.clear_path
    end
  end
  
  class Game_Player
    #--------------------------------------------------------------------------
    alias pf_game_player_update update
    #--------------------------------------------------------------------------
    def update
      $game_player.clear_path if Input.dir4 != 0
      pf_game_player_update
    end
  end
  
  class Interpreter
    #--------------------------------------------------------------------------
    def event
      return $game_map.events[@event_id]
    end
  end
=end