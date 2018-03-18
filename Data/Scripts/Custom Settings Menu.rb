#==============================================================================
# Scene_Settings, by Kendrian
#==============================================================================
class Scene_Settings
  #--------------------------------------------------------------------------
  # * Main Processing
  #--------------------------------------------------------------------------
  def main
    s1 = "Surrender skill"
    s2 = "Difficulty"
    s3 = "Text speed"
    s4 = "Back to menu"
    # Make windows
    @command_window = Window_Command.new(192, [s1, s2, s3, s4])
    @settings_window = Window_Settings.new
#    @help_window = Window_Help.new
    # Set window opacity
    @command_window.back_opacity = 160
    @settings_window.back_opacity = 200
    # Set window position
    @command_window.x = 320 - (@command_window.width + @settings_window.width) / 2
    @command_window.y = 240 - @command_window.height / 2
    @settings_window.x = 320 + (@command_window.width - @settings_window.width) / 2
    @settings_window.y = @command_window.y
    # Execute transition
    Graphics.transition
    # Main loop
    loop do
      # Update game screen
      Graphics.update
      # Update input information
      Input.update
      # Frame update
      update
      # Abort loop if screen is changed
      if $scene != self
        break
      end
    end
    # Prepare for transition
    Graphics.freeze
    # Dispose of windows
    @command_window.dispose
    @settings_window.dispose
#    @help_window.dispose
  end  
 
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    # Update windows
    @command_window.update
    @settings_window.update
#    @help_window.update
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Branch by command window cursor position
      case @command_window.index
      when 0  # Surrender text
        command_surrender
      when 1  # Game Difficulty
        command_difficulty
      when 2  # Text speed
        command_text_speed
      when 3  # Exit Settings menu
        command_exit
      end
    end
    if Input.trigger?(Input::B)
      # Exit
      command_exit
    end
  end
  
  #--------------------------------------------------------------------------
  # * Command: surrender graphics
  #--------------------------------------------------------------------------
  def command_surrender
    # Play decision SE
    $game_system.se_play($data_system.decision_se)
    # Switch ON/OFF value
    $game_switches[558] = (not $game_switches[558])
    #@command_window.dispose
  end  
  
  #--------------------------------------------------------------------------
  # * Command: Difficulty
  #--------------------------------------------------------------------------
  def command_difficulty
    # Play decision SE
    $game_system.se_play($data_system.decision_se)
#    if $game_variables[160] <= 1
#      $game_variables[160] + 1
#    else
#      $game_variables[160] = 0
#    end
    if $game_variables[160] == 0
      $game_variables[160] = 1
    elsif $game_variables[160] == 1
      $game_variables[160] = 2
    else
      $game_variables[160] = 0
    end
    $game_temp.common_event_id = 54
  end
  
  #--------------------------------------------------------------------------
  # * Command: Text speed (REQUIRES UMS)
  #--------------------------------------------------------------------------
  def command_text_speed
    # Play decision SE
    $game_system.se_play($data_system.decision_se)
    if $game_system.write_speed == 0
      $game_system.write_speed = 4
      else $game_system.write_speed -= 1
    end
  end
  
  #--------------------------------------------------------------------------
  # * Command: Exit Settings Menu
  #--------------------------------------------------------------------------
  def command_exit
    # Play decision SE
    $game_system.se_play($data_system.cancel_se)
    # Exit to menu
    $scene = Scene_Menu.new(5)
  end  
end