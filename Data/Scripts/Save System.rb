#==============================================================================
# ** Chaos Project Save Layout
#------------------------------------------------------------------------------
# by Fantasist
# Version 1.4.2
# 24-Feb-2011
#------------------------------------------------------------------------------
# Version History:
#
#   1.0 - First version
#   1.1 - Optimized code a bit
#   1.2 - Closer to CP layout and features
#   1.3 - Load-on-demand feature added for faster loading of scene
#   1.4 - Location name and Chapter systems added
#   1.4.1 - Can now customize default option in confirm overwrite window
#   1.4.2 - Added feature (coloured text in filelist based on file existence)
#------------------------------------------------------------------------------
# Description:
#     This replaces the default Save/Load scenes with the layout from the game
#   Chaos Project.
#
#   Features taken from Chaos Project:
#    - The layout
#    - Confirm overwrite window (optional)
#    - Detects and uses the windowskin from the savefile (useful with other
#      scripts which enable in-game changing of windowskins)
#    - Detects and uses the font from the savefile (made to work with
#      Ultimate Font Override from Tons of Addons)
#    - Prevents crashing and displays 'Corrupted save data' (customizable) if a
#      savefile is corrupted
#    - Compatible with DREAM for Savefiles
#    - Location names (optional)
#
#   Additional features:
#    - Chapter System (optional)
#    - Customizable number of save slots, savefile name, savefile extension,
#      savefile location
#    - Customizable text in the Save/Load scene (help window text,
#      overwrite prompt text, etc)
#    - Indicates if file exists by colouring text in the list window (optional)
#------------------------------------------------------------------------------
# Compatibility:
#
#   Might not be compatible with other save/load systems. Should be compatible
#   with everything else.
#   Compatible with 'Ultimate Font Override' from Tons of Addons,
#   'Storm Tronics CMS' and 'DREAM for Savefiles' by Blizzard
#------------------------------------------------------------------------------
# Installation: Place this script anywhere above main and below Scene_Load.
#               Place above Tons of Addons if you're using it.
#
# Configuration:

module CPSL
  
#============================================================
# Main Config Start
#============================================================
  
  Save_number = 50    # Number of save slots
  Save_path = ''      # Path where savefiles are placed (Example: 'Saves/')
  Save_name = 'Save'  # Name of savefiles
  Save_ext = 'rxdata' # Extension of savefiles. Change to 'dreamX' if you're
                      # using DREAM. X is the DREAM version (like 'dream4')
  
  Confirm_Overwrite = true  # Enable/disable the Confirm Overwrite prompt window
  Confirm_Overwrite_Words = 'Overwrite file?'  # The prompt to be displayed
  Confirm_Overwrite_default = 0 # Default choice for confirm overwrite window
                                # 0: Yes, 1: No
  
  Chapter = true  # Enable chapter system
  Location = true  # Enable location names
  
  File_name = 'No. '  # Text shown for the save slots (No. 1, No. 2, etc)
  No_file_text = 'No saved game'  # Text shown if the slot has no game saved
  Corrupted_file_text = 'Corrupted data, sorry ^^;'  # Text shown if the savefile is corrupted
  Load_Help_Text = 'Which file do you wish to load?' # Text in help window during Load scene
  Save_Help_Text = 'Where do you wish to save?'   # Text in help window during Save scene
  
  Show_File_Exists = true # Enable/disable showing if file exists in the file list
  File_Exist_Color = Color.new(255, 255, 255) # Colour to show if savefile exists
  File_Empty_Color = Color.new(128, 128, 128) # Colour to show if savefile doesn't exist
  File_Corrupt_Color = Color.new(255, 0, 0) # Colour to show if file is corrupt
  
  module_function
  
  def chapter(gs)
    ch = case gs.chapter
    #=============Chapter System Config Start=======================
    # You can change the chapter by using the following code in Call Script
    # event command
    #                 $game_system.chapter = <number>
    #
    when nil then 'Prologue'
    when 0 then 'Prologue'               #During prologue
    when 1 then 'Huston Village'         #Huston mission in progress or finished
    when 2 then 'Velis Manor'            #Velis Manor mission in progress or finished
    when 3 then 'Aurealis Academy'       #Academy mission in progress or finished
    when 4 then 'Madinah Village'        #Haab mission started
    when 5 then 'Ghiaccio Village'       #Ghiaccio mission started
    when 6 then 'Pirate Bay'             #Pirate Bay started
    when 7 then 'Jormunga Jungle'        #Jungle mission started
    when 8 then 'Florian Town'           #Florian started
    when 9 then 'Belbasa'                #Belbasa started
    when 10 then 'Dark Hills'            #Dark Hills started
    # to add another chapter, copy the above line
    # and change the number and chapter name
    #=====================================================
    else '---'
    end
    return [gs.chapter, ch]
  end
  
#============================================================
# Main Config End (Look below for optional config)
#============================================================
  
  def set_fontsize(font)
    size = case font
    #=============Font size correction config=======================
    # This is for the size of the font to be displayed in the file info window.
    # This was made because the font size I decided for the layout (21)
    # might not be suitable for fonts other than Arial. If you're using a
    # different font and it doesn't look right, add that font to this list.
    when 'Impact' then 24
    when 'Comic Sans MS' then 24
    when 'Brush Script' then 24
    when 'Trebuchet MS' then 24
    # to add another font, copy the above line
    # and change the font name and size
    #=====================================================
    else 21
    end
    return size
  end

#============================================================
# Config End
#============================================================

  
  def make_savename(file_index)
    return Save_path + Save_name + "#{file_index + 1}." + Save_ext
  end
  
end
#------------------------------------------------------------------------------
# Issues:
#
#   This is not an issue, and is meant to work like that. So before you ask: 
#
#     There is a feature which colours the text in the file list window
#   depending on whether that savefile exists or not. It also shows if the file
#   is corrupt, but only if it has been viewed at least once. That is, it'll
#   show that the file exists, but not that it is corrupt unless it is selected
#   at least once.
#------------------------------------------------------------------------------
# Credits: Fantasist for making this
# Thanks: Blizzard (and his game Chaos Project) for the layout and inspiration,
#         Sase for pointing out the issue with the confirm overwrite window, and
#         IserLuick for suggesting a feature.
#------------------------------------------------------------------------------
# Notes:
# If you have any questions, problems or suggestions, you can find me at:
#
#  - www.chaos-project.com
#
# Enjoy ^_^
#==============================================================================

#==============================================================================
# ** Bitmap
#==============================================================================

class Bitmap
  
  def draw_load_bar(num)
    o = 160
    w, h = self.width - 32, 12
    bh = 2
    c = num == 100 ? Color.new(0, 255, 0, o) : Color.new(255, 0, 0, o)
    fill_rect(16 + 0, self.height - bh*h, w, h, Color.new(255, 255, 255, o))
    fill_rect(16 + 1, self.height - bh*h + 1, w-2, h-2, Color.new(0, 0, 0, o))
    fill_rect(16 + 2, self.height - bh*h + 2, (w-4)*num/100, h-4, c)
  end
  
end

#==============================================================================
# ** Loading_Bar
#==============================================================================

class Loading_Bar < Sprite
  
  def initialize
    w, h = 200, 80
    super
    self.ox, self.oy = w/2, h/2
    self.bitmap = Bitmap.new(w, h)
    self.bitmap.fill_rect(self.bitmap.rect, Color.new(0, 0, 0, 160))
    self.z = 999
    self.bitmap.draw_text(0, 0, w, 32, 'Loading...', 1)
    self.bitmap.draw_load_bar(0)
  end
  
  def refresh(num=0)
    self.bitmap.fill_rect(0, 0, self.bitmap.width, 32, Color.new(0, 0, 0, 160))
    txt = num == 100 ? 'Complete!' : 'Loading...'
    self.bitmap.draw_text(0, 0, self.bitmap.width, 32, txt, 1)
    self.bitmap.draw_load_bar(num)
  end
  
end

#==============================================================================
# ** Window_Prompt
#==============================================================================

class Window_Prompt < Window_Base
  
  attr_reader :index
  
  def initialize(txt, mode=0, index=0)
    @txt, @mode = txt, mode
    width = [text_width(txt) + 32, 220].max
    height = 64 + mode * 64
    super(320 - width/2, 240 - height/2, width, height)
    self.contents = Bitmap.new(self.width - 32, self.height - 32)
    bmp = Bitmap.new(192, 128)
    bmp.fill_rect(0, 0, 128, 128, Color.new(0, 0, 0, 200))
    bmp.fill_rect(128, 64, 32, 32, Color.new(255, 0, 0, 200))
    self.windowskin = bmp
    refresh
    @index = @mode > 0 ? index : -1
  end
  
  def text_width(text)
    dummy = Bitmap.new(640, 64)
    w = dummy.text_size(text).width
    dummy.dispose
    return w
  end
  
  def reset(txt, mode=0, index=0)
    @txt = txt unless txt == nil
    @mode = mode
    @index = @mode > 0 ? index : -1
    self.contents.dispose
    width = [text_width(txt) + 32, 300].max
    self.width, self.height = width, 64 + mode * 64
    self.x, self.y = 320 - self.width/2, 240 - self.height/2
    self.contents = Bitmap.new(self.width - 32, self.height - 32)
    refresh
    update_cursor_rect
  end
  
  def refresh
    self.contents.clear
    self.contents.draw_text(0, 0, self.width - 32, 32, @txt, 1)
    if @mode > 0
      self.contents.draw_text(self.width/2 - 16 - 34, 32, 68, 32, 'Yes', 1)
      self.contents.draw_text(self.width/2 - 16 - 34, 64, 68, 32, 'No', 1)
    end
  end
  
  def index=(index)
    @index = index
    update_cursor_rect
  end
  
  def update_cursor_rect
    if @index < 0
      self.cursor_rect.empty
      return
    end
    cursor_width = self.contents.text_size('  Yes  ').width
    x = (self.width - cursor_width)/2 - 16
    y = 32 + @index * 32
    self.cursor_rect.set(x, y, cursor_width, 32)
  end
  
  def update
    super
    if @mode > 0
      if self.active && @index >= 0
        if Input.repeat?(Input::DOWN)
          $game_system.se_play($data_system.cursor_se)
          @index = (@index + 1) % 2
        elsif Input.repeat?(Input::UP)
          $game_system.se_play($data_system.cursor_se)
          @index = (@index - 1) % 2
        end
      end
      update_cursor_rect
    end
  end
  
end

#==============================================================================
# ** Window_FileList
#==============================================================================

class Window_FileList < Window_Selectable
  
  def initialize
    super(0, 64, 98, 416)
    list = []
    (1..CPSL::Save_number).each {|i| list.push("#{CPSL::File_name}#{i}")}
    @commands = list
    @item_max = list.size
    @ch = list.size < 12 ? (self.height - 32) / list.size : 32
    self.contents.dispose if self.contents
    self.contents = Bitmap.new(self.width - 32, list.size < 12 ? 416-32 : list.size * 32)
    refresh
  end
  
  def refresh
    self.contents.clear
    (0...@item_max).each {|i|
    if CPSL::Show_File_Exists
      color = FileTest.exist?(CPSL.make_savename(i)) ? CPSL::File_Exist_Color : CPSL::File_Empty_Color
    else
      color = normal_color
    end
    draw_item(i, color)}
  end
  
  def draw_item(index, color)
    self.contents.font.color = color
    rect = Rect.new(4, @ch * index, self.contents.width - 8, @ch)
    self.contents.fill_rect(rect, Color.new(0, 0, 0, 0))
    self.contents.draw_text(rect, @commands[index], @commands.size > 9 ? 0 : 1)
  end
  
  alias fant_cpsl_list_upd_cursor_rect update_cursor_rect
  def update_cursor_rect
    fant_cpsl_list_upd_cursor_rect
    cursor_width = self.width / @column_max - 32
    x = @index % @column_max * (cursor_width + 32)
    y = @index / @column_max * @ch - self.oy + (@ch-32)/2
    self.cursor_rect.set(x, y, cursor_width, 32)
  end
  
end

#==============================================================================
# ** Window_FileInfo
#==============================================================================

class Window_FileInfo < Window_Base
  
  attr_reader :index
  
  def initialize(file_index=0)
    super(98, 64, 542, 416)
    self.contents = Bitmap.new(width - 32, height - 32)
    self.contents.font.size = 21
    @index = -2
    @bar = Loading_Bar.new
    @bar.x = self.x + self.width / 2
    @bar.y = self.y + self.height / 2 - 32
    @bar.visible = false
    @save_data = []
    reload(file_index)
  end
  
  def reload(index)
    return if @index == index
    @index = index
    self.visible = false
    if @save_data[index] == nil
      filename = CPSL.make_savename(index)
      file_exist = FileTest.exist?(filename)
      if file_exist
        begin
          file = File.open(filename, 'r')
          ts = file.mtime
          if (defined? DREAM) && Required_DREAM_Version >= 4.1
            @bar.refresh(0)
            @bar.visible = true
            Graphics.transition(10)
            gs, gs, gs, gp, gp, gp, gm = DREAM.data(file)
            @bar.refresh(100)
            Graphics.update
            Graphics.freeze
            @bar.visible = false
            Graphics.transition(10)
          else
            @bar.refresh(0)
            @bar.visible = false #Kendrian ori: @bar.visible = true
            Graphics.transition(1) #ori: Graphics.transition(10) 
#           3.times {|i| gs = Marshal.load(file); @bar.refresh(i*100/11); Graphics.update}
#           6.times {|i| gp = Marshal.load(file); @bar.refresh((i+3)*100/11); Graphics.update}
#           2.times {|i| gm = Marshal.load(file); @bar.refresh((i+9)*100/11); Graphics.update}
            3.times {|i| gs = Marshal.load(file)}
            6.times {|i| gp = Marshal.load(file)}
            2.times {|i| gm = Marshal.load(file)}
            @bar.refresh(1) #ori: @bar.refresh(100) 
            Graphics.update
            Graphics.freeze
            @bar.visible =false
            Graphics.transition(1) #ori: Graphics.transition(10) 
          end
          file.close
          Graphics.freeze
        rescue
          file.close
          @bar.visible = false
          ts = gs = gp = gm = 'bad_file'
          $scene.list_win.draw_item(index, CPSL::File_Corrupt_Color)
        end          
      else
        ts = gs = gp = gm = nil
      end
      @save_data[index] = [ts, gs, gp, gm]
    end
    @time_stamp, @game_system, @game_party, @game_map = @save_data[index][0],
      @save_data[index][1], @save_data[index][2], @save_data[index][3]
    self.visible = true
    refresh
    Graphics.transition(5)
  end
  
  def refresh
    self.contents.clear
    self.contents.font.name = @game_system.fontname rescue 'Trebuchet MS' #Kendrian SharpFFF
    self.contents.font.size = CPSL.set_fontsize(self.contents.font.name)
    self.windowskin = RPG::Cache.windowskin(@game_system.windowskin_name) rescue nil
    if @game_party == nil
      self.contents.font.color = normal_color
      draw_text_center(CPSL::No_file_text)
    elsif @time_stamp == 'bad_file'
      self.contents.font.color = Color.new(255, 0, 0)
      draw_text_center(CPSL::Corrupted_file_text)
    else
      mtime = @time_stamp
      date = mtime.strftime("%d-%b-%Y")
      time = mtime.strftime("%I:%M:%S %p")
      self.contents.font.color = system_color
      y = !(CPSL::Chapter || CPSL::Location) ? self.contents.height-54 : 0
      self.contents.draw_text(0, y + 0, self.contents.width - 8, 32, time, 2)
      self.contents.draw_text(0, y + 32, self.contents.width - 8, 22, date, 2)
      self.contents.font.color = normal_color
      if CPSL::Chapter
        y = CPSL::Location ? 0 : 14
        chapter = CPSL.chapter(@game_system)
        chapter_text = "Chapter #{chapter[0]}: #{chapter[1]}"
        self.contents.draw_text(0, y, 502, 32, chapter_text)
      end
      if CPSL::Location
        y = CPSL::Chapter ? 28 : 14
        self.contents.draw_text(0, y, 502, 32, 'Location: ' + $map_names[@game_map.map_id])
      end
      @game_party.actors.each_index {|i|
        x = 64
        y = (!(CPSL::Chapter || CPSL::Location) ? 8 : 48) + i * 82
        actor = @game_party.actors[i]
        
        draw_actor_graphic(actor, x - 24, y + 86)
        draw_actor_name(actor, 0, y + 12, 82, 1)
        
        draw_actor_level(actor, x + 28, y + 12)
        draw_actor_state(actor, x + 28 + 64, y + 12)
        draw_actor_exp(actor, x + 28, y + 64 - 18)
        
        draw_actor_hp(actor, x + 224, y + 12)
        draw_actor_sp(actor, x + 224, y + 64 - 18)
      }
    end
  end
  
  def draw_text_center(txt)
    self.contents.draw_text(0, (self.height-32)/2 - 16, self.width - 32, 32, txt, 1)
  end
  
  def draw_text_outline(x, y, w, h, t, a=0)
    original_color = self.contents.font.color.clone
    self.contents.font.color = Color.new(0, 0, 0)
    self.contents.draw_text(x-1, y-1, w, h, t, a)
    self.contents.draw_text(x-1, y+1, w, h, t, a)
    self.contents.draw_text(x+1, y-1, w, h, t, a)
    self.contents.draw_text(x+1, y+1, w, h, t, a)
    self.contents.font.color = original_color
    self.contents.draw_text(x, y, w, h, t, a)
  end
  
  def draw_actor_name(actor, x, y, width=120, align=0)
    self.contents.font.color = normal_color
    self.contents.draw_text(x, y, width, 32, actor.name, align)
  end
  
  def dispose
    super
    @save_data = nil
    @bar.bitmap.dispose
    @bar.dispose
  end
  
end

#==============================================================================
# ** Scene_File
#==============================================================================

class Scene_File
  
  attr_reader :list_win
  
  def initialize(help_text)
    @help_text = help_text
  end
  
  def main
    if $scene.is_a?(Scene_Load)
      text = CPSL::Load_Help_Text
    elsif $scene.is_a?(Scene_Save)
      text = CPSL::Save_Help_Text
    else
      text = @help_text
    end
    @help_text = text
    $game_temp.last_file_index = 0
    latest_time = Time.at(0)
    (0...CPSL::Save_number).each {|i|
      filename = make_filename(i)
      if FileTest.exist?(filename)
        file = File.open(filename, "r")
        if file.mtime > latest_time
          latest_time = file.mtime
          $game_temp.last_file_index = i
        end
        file.close
      end
    }
    @help_window = Window_Help.new
    @help_window.set_text(@help_text)
    @list_win = Window_FileList.new
    @list_win.index = $game_temp.last_file_index
    @info_win = Window_FileInfo.new(@list_win.index)
    @confirm_win = Window_Prompt.new(CPSL::Confirm_Overwrite_Words, 1)
    @confirm_win.visible = @confirm_win.active = false
    @confirm_win.z = @info_win.z + 10
    Graphics.transition
    loop {
      Graphics.update
      Input.update
      update
      if $scene != self
        break
      end
    }
    Graphics.freeze
    @help_window.dispose
    @list_win.dispose
    @info_win.dispose
    @confirm_win.dispose
  end
  
  def update
    @help_window.update
    if @list_win.active
      update_list
    elsif @confirm_win.active
      update_confirm
    end
  end
  
  def update_list
    @list_win.update
    if Input.trigger?(Input::C)
      if $scene.is_a?(Scene_Save) && CPSL::Confirm_Overwrite &&
        FileTest.exist?(make_filename(@list_win.index))
        @list_win.active = false
        @confirm_win.index = CPSL::Confirm_Overwrite_default
        @confirm_win.visible = @confirm_win.active = true
        $game_system.se_play($data_system.decision_se)
        return
      end
      on_decision(make_filename(@list_win.index))
      $game_temp.last_file_index = @list_win.index
    elsif Input.trigger?(Input::B)
      on_cancel
    elsif Input.repeat?(Input::UP)
      @info_win.reload(@list_win.index)
    elsif Input.repeat?(Input::DOWN)
      @info_win.reload(@list_win.index)
    end
  end
  
  def update_confirm
    @confirm_win.update
    if Input.trigger?(Input::C)
      if @confirm_win.index == 0
        on_decision(make_filename(@list_win.index))
        $game_temp.last_file_index = @list_win.index
      end
      $game_system.se_play($data_system.cancel_se) if @confirm_win.index == 1
      @confirm_win.visible = @confirm_win.active = false
      @list_win.active = true
    elsif Input.trigger?(Input::B)
      $game_system.se_play($data_system.cancel_se)
      @confirm_win.visible = @confirm_win.active = false
      @list_win.active = true
    end
  end
  
  def make_filename(index)
    CPSL.make_savename(index)
  end
  
end

#==============================================================================
# ** Scene_Title
#==============================================================================

class Scene_Title
  
  alias fant_cpsl_title_main main
  def main
    unless $map_names
      $map_names = load_data('Data/MapInfos.rxdata')
      $map_names.each_key {|key| $map_names[key] = $map_names[key].name}
    end
    fant_cpsl_title_main
  end
  
end

#==============================================================================
# ** Game_System
#==============================================================================

class Game_System
  attr_accessor :chapter
end

class Scene_Title
  @continue_enabled = true
end
