=begin
#==============================================================================
# ** MouseCursor
#==============================================================================

module MouseCursor
    Default_Cursor = 'Arrow'
    Event_Cursor   = 'Arrow3'
    Actor_Cursor   = 'Arrow'
    Enemy_Cursor   = 'Arrow4'
    Item_Cursor    = true
    Skill_Cursor   = true
    Dummy = Bitmap.new(32, 32)
end

#==============================================================================
# ** Sprite_Mouse
#==============================================================================

class Sprite_Mouse < Sprite
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    super
    self.z = 10100
    self.ox = 4
    update
  end
  #--------------------------------------------------------------------------
  # ** Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    
    # Update Visibility
    self.visible = $scene != nil
    
    # If Visible
    if self.visible
      
      # If Non-nil Mouse Position
      if Mouse.position != nil
        
        # Gets Mouse Position
        mx, my = *Mouse.position
        
        # Update POsition
        self.x = mx unless mx.nil?
        self.y = my unless my.nil?      
        
      end
      
      # If Scene changes or Mouse is Triggered
      if @scene != $scene.class || Mouse.trigger?
        
        # Update Scene Instance
        @scene = $scene.class
        
        # Update Bitmap
        set_bitmap(MouseCursor::Default_Cursor)
      end
      
    end
    
  end
  #--------------------------------------------------------------------------
  # ** Set Bitmap
  #--------------------------------------------------------------------------
  def set_bitmap(cursor, xNPCname = nil)
    
    # show fancy cursor only if custom mouse on
    if $game_mouse
             
      # If Cursor Info matches
      if (@_cursor == cursor) && (@_NPCname == xNPCname)
        return
      end
      
      # Reset Cursor Info
      @_cursor      = cursor
      @_NPCname     = xNPCname
      
      # Gets Dummy
      dummy = MouseCursor::Dummy
      
      # Gets Item Cursor Bitmap
      item_cursor = cursor.nil? ? MouseCursor::Default_Cursor : cursor
      
      # Start Cursor Bitmap
      bitmap = RPG::Cache.icon(item_cursor) if item_cursor != ''

      # Show NPC name
      if @_NPCname != nil
        # Get name width
        w = dummy.text_size(@_NPCname).width
        h = dummy.font.size
        b = RPG::Cache.icon(item_cursor)
        # Create New Bitmap
        bitmap = Bitmap.new((bitmap.nil? ? w : 40 + w), [b.height, h + 2].max)
        bitmap.font.size = dummy.font.size
        bitmap.blt(0, 0, b, b.rect)
        # Draw NPC Name
        x = item_cursor == '' ? 0 : 32
        bitmap.font.color = Color.new(0, 0, 0, 255) # black
        bitmap.draw_text(b.width + 9, 0, w, h, @_NPCname) # 0
        bitmap.draw_text(b.width + 11, 0, w, h, @_NPCname) # 0 
        bitmap.draw_text(b.width + 10, -1, w, h, @_NPCname) # -1
        bitmap.draw_text(b.width + 10, 1, w, h, @_NPCname) # 1
        bitmap.font.color = Color.new(255, 255, 255, 255) # white
        bitmap.draw_text(b.width + 10, 0, w, h, @_NPCname)
      end    

      # Set Bitmap
      self.bitmap = bitmap
      
    elsif self.bitmap
      @_cursor = nil
      self.bitmap = nil
      
    end
    
  end
  #--------------------------------------------------------------------------
  # ** Frame Update : Update Event Cursors
  #--------------------------------------------------------------------------
  def update_event_cursors
    
    # If Nil Grid Position
    if Mouse.grid.nil?
      # Set Default Cursor
      set_bitmap(MouseCursor::Default_Cursor)
      return
    end
    
    # Gets Mouse Position
    x, y = *Mouse.grid
    
    # Gets Mouse Position
    mx, my = *Mouse.position    
    
    # Gets Mouse Event
    event = $game_map.event_at(x, y)
    
    # If Non-Nil Event or not over map HUD
    unless event.nil? 
      # If Not Erased or Nil List
      if event.list != nil && event.erased == false && event.list[0].code == 108
        # Get the cursor to show
        icon = event.list[0].parameters 
        icon = icon.to_s
        if !((icon == "Arrow2") || 
           (icon == "Arrow3") || 
           (icon == "Arrow4") || 
           (icon == "Arrow5") || 
           (icon == "Arrow6") ||
           (icon == "Arrow7"))
           icon = MouseCursor::Default_Cursor
        end        
        xNPCname = nil 
        if event.list.size > 1 && event.list[1].code == 108
          text = event.list[1].parameters.to_s
          text.gsub!(/[Nn][Aa][Mm][Ee] (.*)/) do
            xNPCname = $1.to_s
          end
        end
        set_bitmap(icon, xNPCname)    
        return
      end
      return
    end
    
    # Set Default Cursor
    set_bitmap(MouseCursor::Default_Cursor)
    
  end
end

#==============================================================================
# ** Input
#==============================================================================

class << Input
  #------------------------------------------------------------------------
  # * Alias Listings
  #------------------------------------------------------------------------
  unless self.method_defined?(:sephlamchop_mousesys_input_update)
    alias_method :sephlamchop_mousesys_input_update,   :update
  end
  #------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    $mouse_sprite.update if $mouse_sprite.visible
    # Original Update
    sephlamchop_mousesys_input_update
  end
end
=end