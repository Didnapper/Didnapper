
class Window_Settings < Window_Base
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
#    super(0, 0, 160, 96)
    super(0, 0, 160, 128)
    self.contents = Bitmap.new(width - 32, height - 32)
    refresh
  end
  
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    self.contents.clear
    self.contents.font.color = normal_color
    if $game_switches[558] == true
      text = "On"
    else
      text = "Off"
    end
    self.contents.draw_text(4, 0, 192, 32, text)
#    @total_sec = Graphics.frame_count / Graphics.frame_rate
#    hour = @total_sec / 60 / 60
#    min = @total_sec / 60 % 60
#    sec = @total_sec % 60
#    text = sprintf("%02d:%02d:%02d", hour, min, sec)
    if $game_variables[160] == 0
      text = "Easy"
    elsif $game_variables[160] == 1
      text = "Normal"
    else
      text = "Hard"
    end
    self.contents.font.color = normal_color
    self.contents.draw_text(4, 32, 192, 32, text, 3)
    
    if $game_system.write_speed == 0
      text = "Super fast"
    elsif $game_system.write_speed == 1
      text = "Fast"
    elsif $game_system.write_speed == 2
      text = "Default"
    elsif $game_system.write_speed == 3
      text = "Slow"
    elsif $game_system.write_speed == 4
      text = "Very slow"
    else
      text = "Slug"
    end
    self.contents.font.color = normal_color
    self.contents.draw_text(4, 64, 192, 32, text)
    
    text = ""
    self.contents.font.color = normal_color
    self.contents.draw_text(4, 96, 192, 32, text, 3)
  end
  
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    if Graphics.frame_count / Graphics.frame_rate != @total_sec
      refresh
    end
  end
end
  