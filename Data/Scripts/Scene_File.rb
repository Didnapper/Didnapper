#==============================================================================
# ** Scene_File
#------------------------------------------------------------------------------
#  This is a superclass for the save screen and load screen.
#==============================================================================

class Scene_File
  SAVEFILE_MAX = 99
# -------------------
def initialize(help_text)
  @help_text = help_text
end
# -------------------
def main
  @help_window = Window_Help.new
  @help_window.set_text(@help_text)
  @savefile_windows = []
  @cursor_displace = 0
  for i in 0..3
    @savefile_windows.push(Window_SaveFile.new(i, make_filename(i), i))
  end
  @file_index = 0
  @savefile_windows[@file_index].selected = true
  Graphics.transition
  loop do
    Graphics.update
    Input.update
    update
    if $scene != self
      break
    end
  end
  Graphics.freeze
  @help_window.dispose
  for i in @savefile_windows
    i.dispose
  end
end
# -------------------
def update
  @help_window.update
  for i in @savefile_windows
    i.update
  end
  if Input.trigger?(Input::C)
    on_decision(make_filename(@file_index))
    $game_temp.last_file_index = @file_index
    return
  end
  if Input.trigger?(Input::B)
    on_cancel
    return
  end
  if Input.repeat?(Input::DOWN)
    if Input.trigger?(Input::DOWN) or @file_index < SAVEFILE_MAX - 1
      if @file_index == SAVEFILE_MAX - 1
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      @cursor_displace += 1
      if @cursor_displace == 4
        @cursor_displace = 3
        for i in @savefile_windows
          i.dispose
        end
        @savefile_windows = []
        for i in 0..3
          f = i - 2 + @file_index
          name = make_filename(f)
          @savefile_windows.push(Window_SaveFile.new(f, name, i))
          @savefile_windows[i].selected = false
        end
      end
      $game_system.se_play($data_system.cursor_se)
      @file_index = (@file_index + 1)
      if @file_index == SAVEFILE_MAX
        @file_index = SAVEFILE_MAX - 1
      end
      for i in 0..3
        @savefile_windows[i].selected = false
      end
      @savefile_windows[@cursor_displace].selected = true
      return
    end
  end
  if Input.repeat?(Input::UP)
    if Input.trigger?(Input::UP) or @file_index > 0
      if @file_index == 0
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      @cursor_displace -= 1
      if @cursor_displace == -1
        @cursor_displace = 0
        for i in @savefile_windows
          i.dispose
        end
        @savefile_windows = []
        for i in 0..3
          f = i - 1 + @file_index
          name = make_filename(f)
          @savefile_windows.push(Window_SaveFile.new(f, name, i))
          @savefile_windows[i].selected = false
        end
      end
      $game_system.se_play($data_system.cursor_se)
      @file_index = (@file_index - 1)
      if @file_index == -1
        @file_index = 0
      end
      for i in 0..3
        @savefile_windows[i].selected = false
      end
      @savefile_windows[@cursor_displace].selected = true
      return
    end
  end
end
# -------------------
def make_filename(file_index)
  return "Save#{file_index + 1}.rxdata"
end
# -------------------
end
