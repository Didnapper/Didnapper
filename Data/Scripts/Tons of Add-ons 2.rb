#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Tons of Add-ons by Blizzard
# Version: 7.39b
# Type: Add-on Collection Control Script
# Date v7.39b:   6.10.2009
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
#                                    PART 2
# 
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
#   
#  This work is protected by the following license:
# #----------------------------------------------------------------------------
# #  
# #  Creative Commons - Attribution-NonCommercial-ShareAlike 3.0 Unported
# #  ( http://creativecommons.org/licenses/by-nc-sa/3.0/ )
# #  
# #  You are free:
# #  
# #  to Share - to copy, distribute and transmit the work
# #  to Remix - to adapt the work
# #  
# #  Under the following conditions:
# #  
# #  Attribution. You must attribute the work in the manner specified by the
# #  author or licensor (but not in any way that suggests that they endorse you
# #  or your use of the work).
# #  
# #  Noncommercial. You may not use this work for commercial purposes.
# #  
# #  Share alike. If you alter, transform, or build upon this work, you may
# #  distribute the resulting work only under the same or similar license to
# #  this one.
# #  
# #  - For any reuse or distribution, you must make clear to others the license
# #    terms of this work. The best way to do this is with a link to this web
# #    page.
# #  
# #  - Any of the above conditions can be waived if you get permission from the
# #    copyright holder.
# #  
# #  - Nothing in this license impairs or restricts the author's moral rights.
# #  
# #----------------------------------------------------------------------------
# 
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# VERY IMPORTANT NOTE:
# 
#   Tons of Add-ons now has to be used as 3-parts script because of a weird
#   behaviour of RMXP during bug detection. Insert the 3 parts in the correct
#   order and the system should work without problems. Do NOT remove any of the
#   parts, the script NEEDS all 3 parts to work with other systems.
# 
# 
# If you find any bugs, please report them here:
# http://forum.chaos-project.com
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::#
#                                                                             #
#   ###   ###  #   # #####  #   #### #   # ####   ###  #####  #   ###  #   #  #
#  #   # #   # ##  # #      #  #     #   # #   # #   #   #    #  #   # ##  #  #
#  #     #   # # # # ####   #  #  ## #   # ####  #   #   #    #  #   # # # #  #
#  #   # #   # #  ## #      #  #   # #   # #   # #####   #    #  #   # #  ##  #
#   ###   ###  #   # #      #   ####  ###  #   # #   #   #    #   ###  #   #  #
#                                                                             #
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::#

module TONS_OF_ADDONS
  
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration 2-1, UTILITY add-ons
# 
#   You can enable/disable any add-on here if you wish. Set the value to false
#   to disable it. These features CANNOT be turned on/off during the game.
# 
#     NAME_OF_THE_ADDON = true
#     NAME_OF_THE_ADDON = false
# 
#   where NAME_OF_THE_ADDON is the same variable as the one used below.
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  CUSTOM_CONTROLS        = false
  FULLSCREEN             = false
  MULTI_DROP             = false
  ULTIMATE_FONT_OVERRIDE = true
  EQUAP_SKILLS           = true
  DIFFICULTY             = false
  ITEMCALL               = false
  SAVEPOINT              = false
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration 2-1
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  
end

#==============================================================================
# Game_System
#==============================================================================

class Game_System
  
  alias init_tons_of_addons2_later initialize
  def initialize
    init_tons_of_addons2_later
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration 2-2, UTILITY add-ons
# 
#   You can enable/disable any add-on here if you wish. Set the value to false
#   to disable it initially. To turn it on/off ingame, just use the Call script
#   command with one of these syntaxes:
# 
#     $game_system.NAME_OF_THE_ADDON = true
#     $game_system.NAME_OF_THE_ADDON = false
# 
#   where NAME_OF_THE_ADDON is the same variable as the one used below.
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    @FPS_MODULATOR          = false
    @SPEED_MODULATOR        = false
    @DEATH_TOLL             = false
    @WINDOW_BATTLERESULT    = false
    @UNIQUE_SKILL_COMMANDS  = false
    @HEAL_AT_LVLUP          = false
    @HPSPPLUS               = false
    @TARGET_EM_ALL          = false
    @QUICK_PASSABILITY_TEST = false
    @MINIMAP                = true
    @ENEMY_STATUS           = true
    @PASSIVE_SKILLS         = false
    @SKILL_SEPARATION       = false
    @MULTI_HIT              = false
    @EQUIPMENT_REQUIREMENT  = false
    @ITEM_REQUIREMENT       = true
    @HP_SP_CRUSH            = false
    @ROULETTE               = false
    @CHAIN_STATUS           = false
    @ACTOR_ITEMS            = false
    @HP_PERCENT_STATES      = true
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration 2-2
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  end
  
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# I suggest you don't edit anything below this line except for the
# configurations for the add-ons.
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

  attr_accessor :FPS_MODULATOR
  attr_accessor :SPEED_MODULATOR
  attr_accessor :DEATH_TOLL
  attr_accessor :WINDOW_BATTLERESULT
  attr_accessor :UNIQUE_SKILL_COMMANDS
  attr_accessor :HEAL_AT_LVLUP
  attr_accessor :HPSPPLUS
  attr_accessor :TARGET_EM_ALL
  attr_accessor :QUICK_PASSABILITY_TEST
  attr_accessor :MINIMAP
  attr_accessor :ENEMY_STATUS
  attr_accessor :PASSIVE_SKILLS
  attr_accessor :SKILL_SEPARATION
  attr_accessor :MULTI_HIT
  attr_accessor :EQUIPMENT_REQUIREMENT
  attr_accessor :ITEM_REQUIREMENT
  attr_accessor :HP_SP_CRUSH
  attr_accessor :ROULETTE
  attr_accessor :CHAIN_STATUS
  attr_accessor :ACTOR_ITEMS
  attr_accessor :HP_PERCENT_STATES
  
end

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::#
#                                                                             #
#                   #   # #####  #  #      #  ##### #   #                     #
#                   #   #   #    #  #      #    #    # #                      #
#                   #   #   #    #  #      #    #     #                       #
#                   #   #   #    #  #      #    #     #                       #
#                    ###    #    #  #####  #    #     #                       #
#                                                                             #
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::#

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Custom Game Controls by Blizzard
# Version: 3.0
# Date: 19.4.2007
# Date v1.2: 20.10.2007
# Date v2.0b: 3.4.2008
# Date v2.1b: 25.10.2008
# Date v2.2b: 11.6.2009
# Date v3.0: 20.7.2009
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# VERY IMPORTANT NOTE:
# 
#   DO NOT USE THIS ADD-ON IF YOU ARE USING BLIZZ-ABS!!!
# 
# 
# Compatiblity:
# 
#   99% compatible with SDK 1.x, 90% compatible with SDK 2.x.
# 
# 
# Note:
# 
#   Why is this input module better than others? I has far less code and it
#   can handle keyboard language layout.
# 
# 
# Explanation & Configuration:
# 
#   This Add-on will allow you to specify your own game controls. Just below
#   is a list of possible keys, below that is the configuration. The default
#   configuration is RMXP's real game control configuration. You can add any
#   key specification into a key array and separate them with commas. Example:
#   
#   RIGHT = [Key['Arrow Right'], Key[','], Key['F'], Key['Ctrl'], Key['3'],
#            Key['NumberPad 6'], Key['F3'], Key['\''], Key['\\']]
#   
#   This example would assign for the RIGHT button the following keys:
#   - directional right (right arrow key)
#   - comma
#   - letter key F
#   - Control key (CTRL)
#   - Number Key 3 (on top over the letter keys)
#   - Numberpad Key 6 (number 6 on the numberpad on the right)
#   - Functional Key 3 (F3)
#   - apostrophe (')
#   - backslash (\)
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

if TONS_OF_ADDONS::CUSTOM_CONTROLS

#==============================================================================
# module Input
#==============================================================================

module Input
  
  #----------------------------------------------------------------------------
  # Simple ASCII table
  #----------------------------------------------------------------------------
  Key = {'A' => 65, 'B' => 66, 'C' => 67, 'D' => 68, 'E' => 69, 'F' => 70, 
         'G' => 71, 'H' => 72, 'I' => 73, 'J' => 74, 'K' => 75, 'L' => 76, 
         'M' => 77, 'N' => 78, 'O' => 79, 'P' => 80, 'Q' => 81, 'R' => 82, 
         'S' => 83, 'T' => 84, 'U' => 85, 'V' => 86, 'W' => 87, 'X' => 88, 
         'Y' => 89, 'Z' => 90,
         '0' => 48, '1' => 49, '2' => 50, '3' => 51, '4' => 52, '5' => 53,
         '6' => 54, '7' => 55, '8' => 56, '9' => 57,
         'NumberPad 0' => 45, 'NumberPad 1' => 35, 'NumberPad 2' => 40,
         'NumberPad 3' => 34, 'NumberPad 4' => 37, 'NumberPad 5' => 12,
         'NumberPad 6' => 39, 'NumberPad 7' => 36, 'NumberPad 8' => 38,
         'NumberPad 9' => 33,
         'F1' => 112, 'F2' => 113, 'F3' => 114, 'F4' => 115, 'F5' => 116,
         'F6' => 117, 'F7' => 118, 'F8' => 119, 'F9' => 120, 'F10' => 121,
         'F11' => 122, 'F12' => 123,
         ';' => 186, '=' => 187, ',' => 188, '-' => 189, '.' => 190, '/' => 220,
         '\\' => 191, '\'' => 222, '[' => 219, ']' => 221, '`' => 192,
         'Backspace' => 8, 'Tab' => 9, 'Enter' => 13, 'Shift' => 16,
         'Left Shift' => 160, 'Right Shift' => 161, 'Left Ctrl' => 162,
         'Right Ctrl' => 163, 'Left Alt' => 164, 'Right Alt' => 165, 
         'Ctrl' => 17, 'Alt' => 18, 'Esc' => 27, 'Space' => 32, 'Page Up' => 33,
         'Page Down' => 34, 'End' => 35, 'Home' => 36, 'Insert' => 45,
         'Delete' => 46, 'Arrow Left' => 37, 'Arrow Up' => 38,
         'Arrow Right' => 39, 'Arrow Down' => 40,
         'Mouse Left' => 1, 'Mouse Right' => 2, 'Mouse Middle' => 4,
         'Mouse 4' => 5, 'Mouse 5' => 6}
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  UP = [Key['Arrow Up']]
  LEFT = [Key['Arrow Left']]
  DOWN = [Key['Arrow Down']]
  RIGHT = [Key['Arrow Right']]
  A = [Key['Shift']]
  B = [Key['Esc'], Key['NumberPad 0'], Key['X']]
  C = [Key['Space'], Key['Enter'], Key['C']]
  X = [Key['A']]
  Y = [Key['S']]
  Z = [Key['D']]
  L = [Key['Q'], Key['Page Down']]
  R = [Key['W'], Key['Page Up']]
  F5 = [Key['F5']]
  F6 = [Key['F6']]
  F7 = [Key['F7']]
  F8 = [Key['F8']]
  F9 = [Key['F9']]
  SHIFT = [Key['Shift']]
  CTRL = [Key['Ctrl']]
  ALT = [Key['Alt']]
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  # All keys
  ALL_KEYS = (0...256).to_a
  # Win32 API calls
  GetKeyboardState = Win32API.new('user32','GetKeyboardState', 'P', 'I')
  GetKeyboardLayout = Win32API.new('user32', 'GetKeyboardLayout','L', 'L')
  MapVirtualKeyEx = Win32API.new('user32', 'MapVirtualKeyEx', 'IIL', 'I')
  ToUnicodeEx = Win32API.new('user32', 'ToUnicodeEx', 'LLPPILL', 'L')
  # some other constants
  DOWN_STATE_MASK = 0x80
  DEAD_KEY_MASK = 0x80000000
  # data
  @state = "\0" * 256
  @triggered = Array.new(256, false)
  @pressed = Array.new(256, false)
  @released = Array.new(256, false)
  @repeated = Array.new(256, 0)
  #----------------------------------------------------------------------------
  # update
  #  Updates input.
  #----------------------------------------------------------------------------
  def self.update
    # prevents usage with Blizz-ABS
    if $BlizzABS
      # error message
      raise 'Blizz-ABS was detected! Please turn off Custom Controls in Tons of Add-ons!'
    end
    # get current language layout
    @language_layout = GetKeyboardLayout.call(0)
    # get new keyboard state
    GetKeyboardState.call(@state)
    # for each key
    ALL_KEYS.each {|key|
        # if pressed state
        if @state[key] & DOWN_STATE_MASK == DOWN_STATE_MASK
          # not released anymore
          @released[key] = false
          # if not pressed yet
          if !@pressed[key]
            # pressed and triggered
            @pressed[key] = true
            @triggered[key] = true
          else
            # not triggered anymore
            @triggered[key] = false
          end
          # update of repeat counter
          @repeated[key] < 17 ? @repeated[key] += 1 : @repeated[key] = 15
        # not released yet
        elsif !@released[key]
          # if still pressed
          if @pressed[key]
            # not triggered, pressed or repeated, but released
            @triggered[key] = false
            @pressed[key] = false
            @repeated[key] = 0
            @released[key] = true
          end
        else
          # not released anymore
          @released[key] = false
        end}
  end
  #----------------------------------------------------------------------------
  # dir4
  #  4 direction check.
  #----------------------------------------------------------------------------
  def Input.dir4
    return 2 if Input.press?(DOWN)
    return 4 if Input.press?(LEFT)
    return 6 if Input.press?(RIGHT)
    return 8 if Input.press?(UP)
    return 0
  end
  #----------------------------------------------------------------------------
  # dir8
  #  8 direction check.
  #----------------------------------------------------------------------------
  def Input.dir8
    down = Input.press?(DOWN)
    left = Input.press?(LEFT)
    return 1 if down && left
    right = Input.press?(RIGHT)
    return 3 if down && right
    up = Input.press?(UP)
    return 7 if up && left
    return 9 if up && right
    return 2 if down
    return 4 if left
    return 6 if right
    return 8 if up
    return 0
  end
  #----------------------------------------------------------------------------
  # trigger?
  #  Test if key was triggered once.
  #----------------------------------------------------------------------------
  def Input.trigger?(keys)
    keys = [keys] unless keys.is_a?(Array)
    return keys.any? {|key| @triggered[key]}
  end
  #----------------------------------------------------------------------------
  # press?
  #  Test if key is being pressed.
  #----------------------------------------------------------------------------
  def Input.press?(keys)
    keys = [keys] unless keys.is_a?(Array)
    return keys.any? {|key| @pressed[key]}
  end
  #----------------------------------------------------------------------------
  # repeat?
  #  Test if key is being pressed for repeating.
  #----------------------------------------------------------------------------
  def Input.repeat?(keys)
    keys = [keys] unless keys.is_a?(Array)
    return keys.any? {|key| @repeated[key] == 1 || @repeated[key] == 16}
  end
  #----------------------------------------------------------------------------
  # release?
  #  Test if key was released.
  #----------------------------------------------------------------------------
  def Input.release?(keys)
    keys = [keys] unless keys.is_a?(Array)
    return keys.any? {|key| @released[key]}
  end
  #----------------------------------------------------------------------------
  # get_character
  #  vk - virtual key
  #  Gets the character from keyboard input using the input locale identifier
  #  (formerly called keyboard layout handles).
  #----------------------------------------------------------------------------
  def self.get_character(vk)
    # get corresponding character from virtual key
    c = MapVirtualKeyEx.call(vk, 2, @language_layout)
    # stop if character is non-printable and not a dead key
    return '' if c < 32 && (c & DEAD_KEY_MASK != DEAD_KEY_MASK)
    # get scan code
    vsc = MapVirtualKeyEx.call(vk, 0, @language_layout)
    # result string is never longer than 2 bytes (Unicode)
    result = "\0" * 2
    # get input string from Win32 API
    length = ToUnicodeEx.call(vk, vsc, @state, result, 2, 0, @language_layout)
    return (length == 0 ? '' : result)
  end
  #----------------------------------------------------------------------------
  # get_input_string
  #  Gets the string that was entered using the keyboard over the input locale
  #  identifier (formerly called keyboard layout handles).
  #----------------------------------------------------------------------------
  def self.get_input_string
    result = ''
    # check every key
    ALL_KEYS.each {|key|
        # if repeated
        if self.repeat?(key)
          # get character from keyboard state
          c = self.get_character(key)
          # add character if there is a character
          result += c if c != ''
        end}
    # empty if result is empty
    return '' if result == ''
    # convert string from Unicode to UTF-8
    return self.unicode_to_utf8(result)
  end
  #----------------------------------------------------------------------------
  # get_input_string
  #  string - string in Unicode format
  #  Converts a string from Unicode format to UTF-8 format as RGSS does not
  #  support Unicode.
  #----------------------------------------------------------------------------
  def self.unicode_to_utf8(string)
    result = ''
    string.unpack('S*').each {|c|
        # characters under 0x80 are 1 byte characters
        if c < 0x0080
          result += c.chr
        # other characters under 0x800 are 2 byte characters
        elsif c < 0x0800
          result += (0xC0 | (c >> 6)).chr
          result += (0x80 | (c & 0x3F)).chr
        # the rest are 3 byte characters
        else
          result += (0xE0 | (c >> 12)).chr
          result += (0x80 | ((c >> 12) & 0x3F)).chr
          result += (0x80 | (c & 0x3F)).chr
        end}
    return result
  end

end

end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# FPS Modulator by Blizzard
# Version: 1.0b
# Type: Debug Utility
# Date: 12.2.2006
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
#   Holding SHIFT and pressing Q/W will allow you to speed up the game like in
#   an emulator up to 3 times (sorry, RMXP doesn't allow more). Remove the
#   triple commented lines (###) to allow this feature even in the normal game,
#   not only the Debug mode.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#==============================================================================
# Scene_Map
#==============================================================================

class Scene_Map
  
  alias update_fps_later update
  def update
    if $game_system.FPS_MODULATOR
      if $DEBUG ### 
        if Input.press?(Input::A) && Input.press?(Input::R)
          Graphics.frame_rate += 40
        elsif Input.press?(Input::A) && Input.trigger?(Input::L)
          Graphics.frame_rate -= 40 unless Graphics.frame_rate == 40
        end
      end ###
    end
    update_fps_later
  end

end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Speed Modulator by Blizzard
# Version: 1.01b
# Type: Debug Utility
# Date: 12.2.2006
# Date v1.01: 12.1.2007
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
#   Pressing Q/W will allow you to speed up the main character. Pressing SHIFT
#   will reset his speed immediately. Remove the triple commented lines (###)
#   to allow this feature even in the normal game, not only the Debug mode.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#==============================================================================
# Game_Player
#==============================================================================

class Game_Player
  
  alias upd_speed_later update
  def update
    if $game_system.SPEED_MODULATOR
      if $DEBUG ###
        if Input.trigger?(Input::A)
          @move_speed = 4
        elsif !Input.press?(Input::A) && !Input.press?(Input::X) &&
            Input.trigger?(Input::R)
          @move_speed += 1 unless @move_speed == 6
        elsif !Input.press?(Input::A) && !Input.press?(Input::X) &&
            Input.trigger?(Input::L)
          @move_speed -= 1 unless @move_speed == 1
        end
      end ###
    end
    upd_speed_later
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# FullScreen? by Blizzard
# Version: 1.22b
# Type: Game Experience Improvement
# Date: 14.11.2006
# Date v1.22b: 8.7.2006
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# new in v1.21b:
#   - better code, easier to use
# 
# new in v1.22b:
#   - fixes a conflict with SDK v2.2
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#==============================================================================
# Window_Command
#==============================================================================

class Window_FullScreen < Window_Selectable

  def initialize(width, commands)
    super(0, 0, width, commands.size * 32 + 64)
    @item_max = commands.size
    @commands = commands
    self.contents = Bitmap.new(width - 32, @item_max * 32 + 32)
    if $fontface != nil
      self.contents.font.name = $fontface
      self.contents.font.size = $fontsize
    elsif $defaultfonttype != nil
      self.contents.font.name = $defaultfonttype
      self.contents.font.size = $defaultfontsize
    end
    refresh
    self.index = 0
  end

  def refresh
    self.contents.clear
    qu = 'Switch to fullscreen?'
    self.contents.draw_text(0, 0, width - 32, 32, qu, 1)
    (0...@item_max).each {|i| draw_item(i, normal_color)}
  end

  def draw_item(index, color)
    rect = Rect.new(4, 32+32 * index, self.contents.width - 8, 32)
    rect2 = Rect.new(4+1, 32+32 * index+1, self.contents.width - 8, 32)
    self.contents.fill_rect(rect, Color.new(0, 0, 0, 0))
    self.contents.font.color = color
    self.contents.draw_text(rect, @commands[index], 1)
  end
  
  def update_cursor_rect
    if @index < 0
      self.cursor_rect.empty
      return
    end
    row = @index / @column_max
    self.top_row = row if row < self.top_row
    if row > self.top_row + (self.page_row_max - 1)
      self.top_row = row - (self.page_row_max - 1)
    end
    cursor_width = 64
    x = (self.contents.width - cursor_width) / 2
    y = @index / @column_max * 32 - self.oy
    self.cursor_rect.set(x, y + 32, cursor_width, 32)
  end

end
  
#==============================================================================
# Scene_Title
#==============================================================================

class Scene_Title
  
  alias main_fullscreen? main
  def main
    if TONS_OF_ADDONS::FULLSCREEN && !$DEBUG
      unless $game_started 
        Graphics.freeze
        $data_system = load_data('Data/System.rxdata')
        $game_system = Game_System.new
        @window = Window_FullScreen.new(320, ['Yes' ,'No'])
        @window.x = 320 - @window.width / 2
        @window.y = 240 - @window.height / 2
        @window.opacity = 0
        Graphics.transition
        loop do
          Graphics.update
          Input.update
          @window.update
          update_window
          break if $game_started
        end
        Graphics.freeze
        @window.dispose
        @window = nil
        Graphics.transition
        Graphics.freeze
      end
    else
      $game_started = true
    end
    main_fullscreen?
  end
  
  def update_window
    if Input.trigger?(Input::C)
      if @window.index == 0
        $game_system.se_play($data_system.decision_se)
        keybd = Win32API.new 'user32.dll', 'keybd_event', ['i', 'i', 'l', 'l'], 'v'
        keybd.call(0xA4, 0, 0, 0)
        keybd.call(13, 0, 0, 0)
        keybd.call(13, 0, 2, 0)
        keybd.call(0xA4, 0, 2, 0)
      else
        $game_system.se_play($data_system.cancel_se)
      end
      $game_started = true
    elsif Input.trigger?(Input::B)
      $game_system.se_play($data_system.cancel_se)
      $game_started = true
    end
  end

end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Death Toll by Blizzard
# Version: 1.3b
# Type: Playing Statistics Addition
# Date: 10.10.2006
# Date v1.2b: 6.12.2006
# Date v1.3b: 31.7.2007
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# Instructions:
# 
#   Set ID to the variable ID you want to use to store the number of killed
#   enemies. To show the number just use in a message \v[X] where X is the same
#   number as you set ID.
# 
# new in v1.2b:
#   Counts now actor deaths, too. The numbers are stored in the variables with
#   the ID "DT_ID + actor's ID", so i.e. for DT_ID = 26, variable number 26
#   will contain killed enemies, number 27 will contain the deaths of actor
#   with ID 1, number 28 will contain the deaths of actor with ID 2, etc.
# 
# new in v1.3b:
#   Fixed a possible conflict with Chaos Rage Limit System.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

DT_ID = 26 # variable ID

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#==============================================================================
# Scene_Battle
#==============================================================================

class Scene_Battle

  alias main_dt_later main
  def main
    @td_flag = 0
    main_dt_later
  end
  
  alias upd_dt_later update
  def update
    @td_flag = $game_troop.enemies.size if @td_flag == 0
    upd_dt_later
  end
  
  alias battle_end_td_later battle_end
  def battle_end(result)
    battle_end_td_later(result)
    if $game_system.DEATH_TOLL
      count = 0
      $game_troop.enemies.each {|enemy|
          count += 1 unless enemy.exist? || enemy.hidden}
      $game_variables[DT_ID] += @td_flag - count
    end
  end

end

#==============================================================================
# Game_Battler
#==============================================================================

class Game_Battler
  
  alias hp_is_equal_to_td_later hp=
  def hp=(val)
    hp_is_equal_to_td_later(val)
    if $game_system.DEATH_TOLL && self.is_a?(Game_Actor) && val <= 0
      $game_variables[DT_ID + self.id] += 1
    end
  end
  
end
    
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Multi-Drop by Blizzard
# Version: 1.1b
# Type: Game Alteration
# Date: 13.11.2007
# Date v1.0b: 3.4.2008
# Date v1.1b: 5.6.2008
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# Compatbility:
#   
#   Compatible with RTAB and Blizz-ABS 1.70 and higher. Will most probably
#   cause problems with CBS-es that have the start_phase5 method modified.
# 
# 
# Explanation:
#   
#   This add-on allows you to make enemies that drop more than one item. The
#   drops are independent, so if an enemy drops one item, he can drop another
#   one as well. An enemy can even have a couple of drop of the same item.
#   
#   
# Instructions:
#   
#   Configure the drop database below and set up the compatibility
#   configuration. The compatibility ocnfiguration is only needed if you are
#   using RTAB. Blizz-ABS 1.70 and higher will be recognized automatically.
#   
#   
# Side note:
#   
#   This add-on could have been written in less than 100 lines of code, but
#   full RTAB compatbility takes its piece of code.
#   
#   
# If you find any bugs, please report them here:
# http://forum.chaos-project.com
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

if TONS_OF_ADDONS::MULTI_DROP

#==============================================================================
# module BlizzCFG
#==============================================================================

module BlizzCFG
  
  # set this to true if you are using RTAB
  RTAB_USE = false
  # set this to true if you are using Animated Battlers in RTAB
  RTAB_ANIMA = false
  # set this to true if you are using Battle Report v1.6 by Illustrationism
  RTAB_REPORT = false
  # limit of maximum items dropped, 0xFFFF is infinite
  ITEM_LIMIT = 0xFFFF
  
  def self.drop_configuration(id)
    case id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Drop Database
# 
#   Use the following template for configuration:
# 
#     when ID then return [[TYPE1, I_ID1, CH1], [TYPE2, I_ID2, CH2], ...]
#   
#   ID   - enemy ID in the database
#   TYPE - the drop type; 1 for items; 2 for weapons; 3 for armors
#   I_ID - the drop item ID in the database
#   CH   - drop chance
# 
#   You can add as many drops as you want, separate them with commas. Keep in
#   mind that if you set TYPE to 0, the drop is disabled and that you MUST NOT
#   set I_ID to 0. If an enemy is not configured here, the default
#   configuration from your database will be used, otherwise the default
#   configuration from your database will be COMPLETELY OVERRIDEN.
#   
#   Example 1:
#     
#     when 1 then return [[1, 2, 50], [3, 15, 10], [2, 4, 5]]
#   
#   Monster with ID 1 can drop:
#     1 Item ID 2, chance 50%
#     1 Armor ID 15, chance 10%
#     1 Weapon ID 4, chance 5%
#     
#   Example 2:
#     
#     when 2 then return [[1, 1, 50], [1, 1, 40]]
#   
#   Monster with ID 2 can drop:
#     1 Item ID 1, chance 50%
#     1 Item ID 1, chance 40%
#   Full chances of drops because of repeating items:
#     nothing, chance 30%
#     1 Item ID 1, chance 50%
#     2 Items ID 1, chance 20%
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 1 then return [[1, 2, 50], [3, 15, 10], [2, 4, 5]]
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Drop Database
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    end
    # return normal item drop if exists
    if $data_enemies[id].item_id > 0
      return [[1, $data_enemies[id].item_id, $data_enemies[id].treasure_prob]]
    elsif $data_enemies[id].weapon_id > 0
      return [[2, $data_enemies[id].weapon_id, $data_enemies[id].treasure_prob]]
    elsif $data_enemies[id].armor_id > 0
      return [[3, $data_enemies[id].armor_id, $data_enemies[id].treasure_prob]]
    end
    # no drop
    return [[0, 0, 0]]
  end
  #----------------------------------------------------------------------------
  # dropped_items
  #  enemy - a killed enemy
  #  This method returns an array of all dropped items.
  #----------------------------------------------------------------------------
  def self.dropped_items(enemy)
    # initialize array
    items = []
    # get drops and start iteration through all drops
    self.drop_configuration(enemy.id).each {|i|
        # if got item
        if rand(100) < i[2]
          # add item, weapon or armor
          case i[0]
          when 1 then items.push($data_items[i[1]])
          when 2 then items.push($data_weapons[i[1]])
          when 3 then items.push($data_armors[i[1]])
          end
        end}
    # result
    return items
  end

end

#==============================================================================
# Scene_Battle
#==============================================================================

class Scene_Battle
  
  #----------------------------------------------------------------------------
  # start_phase5
  #  This method was completely modified to support multi-drop.
  #----------------------------------------------------------------------------
  def start_phase5
    # if RTAB and Animated Battlers in use
    if BlizzCFG::RTAB_USE && BlizzCFG::RTAB_ANIMA
      # don't end battle as long as an actor is moving around
      $game_party.actors.each {|actor| return if @spriteset.battler(actor).moving}
      # see if an actor remains alive
      $victory = true if $game_party.actors.any? {|actor| !actor.dead?}
      # see if an enemy remains alive
      $defeat = true if $game_troop.enemies.reverse.any? {|enemy| !enemy.dead?}
    end
    @phase = 5
    # set audio
    $game_system.me_play($game_system.battle_end_me)
    $game_system.bgm_play($game_temp.map_bgm)
    # initialize variables
    exp, gold, treasures = 0, 0, []
    # if using RTAB
    if BlizzCFG::RTAB_USE && !BlizzCFG::RTAB_REPORT
      # dispose and setup special things from RTAB
      @active_actor.blink = false if @active_actor != nil
      $game_temp.battle_main_phase = true
      @party_command_window.active = @party_command_window.visible =
      @actor_command_window.active = @actor_command_window.visible = false
      [@skill_window, @item_window].each {|win| win.dispose if win != nil}
      @skill_window = @item_window = nil
      @help_window.visible = false if @help_wait == 0
    end
    # iterate through all enemies
    $game_troop.enemies.each {|enemy|
        # if enemy isn't hidden
        unless enemy.hidden
          # get exp and gold
          exp += enemy.exp
          gold += enemy.gold
          # get all dropped items
          treasures += BlizzCFG.dropped_items(enemy)
        end}
    # limits treasures to a specific number
    treasures = treasures[0..BlizzCFG::ITEM_LIMIT]
    # if used battle RTAB battle report
    if BlizzCFG::RTAB_REPORT
      # used by battle report
      @exp, @gold, @treasures = exp, gold, treasures
    else
      # iterate through all actor indices
      $game_party.actors.each_index {|i|
          actor = $game_party.actors[i]
          # if actor can get EXP
          unless actor.cant_get_exp?
            # store last level
            last_level = actor.level
            actor.exp += exp
            # if level increased after adding EXP
            if actor.level > last_level
              @status_window.level_up(i)
              # if using RTAB
              if BlizzCFG::RTAB_USE
                # execute special RTAB commands
                actor.damage[[actor, -1]] = 'Level up!'
                actor.up_level = actor.level-last_level
              end
            end
          end}
      # add to party's gold
      $game_party.gain_gold(gold)
      # create result window
      @result_window = Window_BattleResult.new(exp, gold, treasures)
    end
    # iterate through all treasures
    treasures.each {|item|
        # add gained treaures to party's inventory
        case item
        when RPG::Item then $game_party.gain_item(item.id, 1)
        when RPG::Weapon then $game_party.gain_weapon(item.id, 1)
        when RPG::Armor then $game_party.gain_armor(item.id, 1)
        end}
    @phase5_wait_count = 100
  end
  
end

end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Window_BattleResult Add-on by Blizzard
# Version: 1.2b
# Type: Game Playability Improvement
# Date: 27.8.2006
# Date v1.1b: 11.3.2007
# Date v1.2b: 13.11.2007
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# new in v1.1b:
#   - now fully compatible with Easy LvlUp Notifier 1.3b and higher
# 
# new in v1.2b:
#   - fixed glitch where only 2 different items could be shown at the same time
# 
# 
# Compatibility:
# 
#   99% compatible with SDK v1.x. 60% compatible with SDK v2.x. 99% chance of
#   full compatibility with everything else.
# 
# 
# Features:
# 
#   - instead of displaying each item seperatedly, it displays now item and
#     quantity
# 
# 
# IMPORTANT NOTE:
# 
#   Keep in mind that RMXP limits the maximum number of gained items to 6. This
#   add-on was designed to work with any number of items. If you want to
#   increase or even remove this limit, press CTRL+SHIFT+F and type
#   "treasures = treasures[0..5]" into the window (without the double quotes).
#   It will take you directly to the point where this limit is defined. Remove
#   this line to remove the limit or change the 5 (which means the limit is 6).
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#==============================================================================
# Window_BattleResult
#==============================================================================

class Window_BattleResult

  alias init_result_addon_later initialize
  def initialize(exp, gold, treasures)
    if $game_system.WINDOW_BATTLERESULT
      @exp, @gold, @treasures = exp, gold, get_treasures(treasures)
      super(160, 0, 320, @treasures[0].size * 32 + 64)
      self.contents = Bitmap.new(width - 32, height - 32)
      if $fontface != nil
        self.contents.font.name = $fontface
      elsif $defaultfonttype != nil
        self.contents.font.name = $defaultfonttype
      end
      self.y, self.back_opacity, self.visible = 160-height/2, 160, false
      refresh
    else
      init_result_addon_later(exp, gold, treasures)
    end
  end
  
  alias refresh_result_addon_later refresh
  def refresh
    if $game_system.WINDOW_BATTLERESULT
      self.contents.clear
      x = 4
      if $easy_lvlup_notifier && !OLD_EXP_DISPLAY
        self.contents.font.color = system_color
        cx = contents.text_size('Gained').width
        self.contents.draw_text(x, 0, cx, 32, 'Gained')
        x += cx + 4
      else
        self.contents.font.color = normal_color
        cx = contents.text_size(@exp.to_s).width
        self.contents.draw_text(x, 0, cx, 32, @exp.to_s)
        x += cx + 4
        self.contents.font.color = system_color
        cx = contents.text_size('EXP').width
        self.contents.draw_text(x, 0, 64, 32, 'EXP')
        x += cx + 16
      end
      self.contents.font.color = normal_color
      cx = contents.text_size(@gold.to_s).width
      self.contents.draw_text(x, 0, cx, 32, @gold.to_s)
      x += cx + 4
      self.contents.font.color = system_color
      self.contents.draw_text(x, 0, 128, 32, $data_system.words.gold)
      @treasures[0].each_index {|i|
          draw_item(@treasures[0][i], 4, (i+1)*32, @treasures[1][i])}
    else
      refresh_result_addon_later
    end
  end
  
  def get_treasures(treasures)
    items, weapons, armors, stuff, qua = [], [], [], [], []
    treasures.each {|i|
        case i
        when RPG::Item then items.push(i)
        when RPG::Weapon then weapons.push(i)
        when RPG::Armor then armors.push(i)
        end}
    items.each {|i|
        if stuff.include?(i)
          qua[stuff.index(i)] += 1
        else
          stuff.push(i)
          qua.push(1)
        end}
    weapons.each {|i|
        if stuff.include?(i)
          qua[stuff.index(i)] += 1
        else
          stuff.push(i)
          qua.push(1)
        end}
    armors.each {|i|
        if stuff.include?(i)
          qua[stuff.index(i)] += 1
        else
          stuff.push(i)
          qua.push(1)
        end}
    return [stuff, qua]
  end
    
  def draw_item(item, x, y, qua = 1)
    if item != nil
      w1 = self.contents.text_size('0').width
      w2 = self.contents.text_size('x ').width
      x += w1 + w2 + 4
      bitmap = RPG::Cache.icon(item.icon_name)
      self.contents.font.color = system_color
      self.contents.draw_text(w1 + 8, y, w2, 32, 'x')
      self.contents.blt(x, y + 4, bitmap, Rect.new(0, 0, 24, 24))
      self.contents.font.color = normal_color
      self.contents.draw_text(4, y, w1, 32, qua.to_s, 2)
      self.contents.draw_text(x+28, y, 212, 32, item.name)
    end
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Unique Skill Commands by Blizzard
# Version: 1.3b
# Type: Actor Individuality Improvement
# Date: 14.11.2006
# Date v1.2b: 19.2.2007
# Date v1.3b: 20.10.2007
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# new in v1.2b:
#   - now corresponding to the Actor ID instead of the class ID and only
#     refreshes the window if neccessary
# 
# new in v1.3b:
#   - fixed a possible issue with CBS-es.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#==============================================================================
# Window_Command
#==============================================================================

class Window_Command
  
  attr_accessor :actor
  
  def setup_command_name
    if @actor != nil
      old_command = @commands[1]
      @commands[1] = case @actor.id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Database
#
# Just like usual in all of my scripts and add-on the template is:
# when X then 'COMMAND'
# X - class ID on the database
# COMMAND - the unique skill command for the appropriate class
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
      when 1 then 'Technic'
      when 2 then 'Lancetech'
      when 3 then 'Powers'
      when 4 then 'Skills'
      when 5 then 'Arrowmagic'
      when 6 then 'Ammo'
      when 7 then 'White Magic'
      when 8 then 'Magic'
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Database
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
      else
        @commands[1]
      end
      refresh if old_command != @commands[1]
    end
  end
  
end

#==============================================================================
# Scene_Battle
#==============================================================================

class Scene_Battle
  
  alias phase3_setup_command_window_unique_command_later phase3_setup_command_window
  def phase3_setup_command_window
    phase3_setup_command_window_unique_command_later
    if $game_system.UNIQUE_SKILL_COMMANDS
      @actor_command_window.actor = @active_battler
      @actor_command_window.setup_command_name
    end
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Ultimate Font Override by Blizzard
# Version: 1.02b
# Type: Project-Script Compatibility Improvement
# Date: 19.10.2006
# Date v1.01b: 30.7.2007
# Date v1.02b: 15.11.2008
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
#   You can change the font/fontsize with the "Call script" event command or
#   directly through a script by using these methods:
# 
#     $game_system.fontname = "FONTNAME"
#     $game_system.fontsize = FONTSIZE
# 
#   It will override the font from any RMXP version. It is also possible to
#   change the font during the game. It will be saved, too.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

Font.default_name = 'Trebuchet MS' # default font name
Font.default_size = 24      # default font size

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#==============================================================================
# Game_System
#==============================================================================

class Game_System
  
  attr_reader :fontname
  attr_reader :fontsize
  
  alias init_ultimate_font_override_later initialize
  def initialize
    init_ultimate_font_override_later
    self.fontname = Font.default_name
    self.fontsize = Font.default_size
  end
  
  def fontname=(name)
    Font.default_name = $defaultfonttype = $fontface = @fontname = name
  end
    
  def fontsize=(size)
    Font.default_size = $defaultfontsize = $fontsize = @fontsize = size
  end
  
end

#==============================================================================
# Bitmap
#==============================================================================

class Bitmap

  alias init_font_override_later initialize
  def initialize(w, h = nil)
    if w.is_a?(Numeric) && h.is_a?(Numeric)
      init_font_override_later(w, h)
    else
      init_font_override_later(w)
    end
    if TONS_OF_ADDONS::ULTIMATE_FONT_OVERRIDE
      if $game_system != nil && $game_system.fontname != nil &&
          !$scene.is_a?(Scene_Title)
        self.font.name = $game_system.fontname
        self.font.size = $game_system.fontsize
      else
        self.font.name = Font.default_name
        self.font.size = Font.default_size
      end
    end
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Heal at LvlUp by Blizzard
# Version: 1.0b
# Type: Game Alteration
# Date: 4.12.2006
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# Compatibility:
# 
#   90% compatible with SDK v1.x. 40% compatible with SDK v2.x. Might not work
#   with exotic CBS-es or exotic Status displays during battle.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#==============================================================================
# Window_BattleStatus
#==============================================================================

class Window_BattleStatus
  
  alias refesh_heal_at_lvlup_later refresh
  def refresh(number = nil)
    if $game_system.HEAL_AT_LVLUP
      $game_party.actors.each_index {|i|
          if @level_up_flags[i]
            $game_party.actors[i].hp = $game_party.actors[i].maxhp
            $game_party.actors[i].sp = $game_party.actors[i].maxsp
          end}
    end
    if number == nil
      refesh_heal_at_lvlup_later
    else
      refesh_heal_at_lvlup_later(number)
    end
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Weapon/Armor HP/SP Plus by Blizzard
# Version: 2.1b
# Type: Weapon/Armor Attribute Alteration
# Date: 18.8.2006
# Date v1.01b: 12.3.2007
# Date v2.0: 15.5.2007
# Date v2.0b: 30.7.2007
# Date v2.1b: 11.6.2009
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# Compatibility:
# 
#   95% compatible with SDK v1.x. 50% compatible with SDK v2.x. May cause
#   slight incompatibility issues with CBS-es, but can be made compatible
#   easily. Can cause imcompatibility issues with other weapon/armor changing
#   scripts and custom equipments scripts.
# 
# 
# Features:
# 
#   - uses static (i.e. 500 HP more) or dynamic (i.e. 30% HP more) increasements
#   - easy to set up
#   - does NOT change any rxdata files
#   - this script comes UNDER SDK SCRIPTS if you use any
# 
# new in v2.0:
#   - completely overworked and changed code for better compatibility
# 
# new in v2.0b:
#   - fixed a bug that appeared because of a typing mistake
# 
# new in v2.1b:
#   - improve coding
# 
# 
# Instructions:
# 
# - Explanation:
# 
#   This script will add the option for Weapons/Armors to have HP/SP pluses
#   while equipped just like the usual STR, DEX, INT etc. pluses.
# 
# - Configuration
# 
#   Find the phrase saying "START" (CTRL+F) to find the database parts. Use the
#   following template to configure your database:
# 
#     when ID then return [EXPR, VAL]
# 
#   ID   - Weapon/Armor ID in the normal database
#   EXPR - set to false if you want "static" increasement or true if you want
#          "dynamic" increasement
#   VAL  - if you use static increasement, set this value to any integer you
#          want (i.e. 100, -500, 831 etc.) to increase the HP/SP, otherwise set
#          it to any decimal value of the final HP/SP (i.e. 1.2 = 20% more,
#          2.3 = 130% more, 0.7 = 30% less)
# 
#   VAL can be a signed integer (static increasement) OR a decimal number
#   greater than 0 (dynamic increasement). Change MAX_HP and MAX_SP to
#   different values if you use another max HP and/or max SP limit than 9999.
# 
# 
# Side Note:
# 
#   It took more to write the instructions than to write and test script
#   itself.
# 
# 
# If you find any bugs, please report them here:
# http://forum.chaos-project.com
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

MAX_HP = 9999 # change if needed, 9999 is standard
MAX_SP = 9999 # change if needed, 9999 is standard

#==============================================================================
# module BlizzCFG
#==============================================================================

module BlizzCFG
  
  def self.weapon_hp_plus(id)
    case id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Weapon HP plus Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 1 then return [false, 350]
    when 5 then return [true, 1.2]
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Weapon HP plus Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    else
      return [false, 0]
    end
  end
  
  def self.weapon_sp_plus(id)
    case id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Weapon SP plus Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 25 then return [false, 500]
    when 29 then return [true, 1.5]
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Weapon SP plus Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    else
      return [false, 0]
    end
  end
  
  def self.armor_hp_plus(id)
    case id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Armor HP plus Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 1 then return [true, 1.1]
    when 5 then return [true, 0.5]
    when 13 then return [false, 90]
    when 17 then return [false, -450]
    when 9 then return [true, 1.3]
    when 21 then return [true, 1.3]
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Armor HP plus Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    else
      return [false, 0]
    end
  end
  
  def self.armor_sp_plus(id)
    case id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Armor SP plus Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 9 then return [true, 1.3]
    when 21 then return [true, 1.3]
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Armor SP plus Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    else
      return [false, 0]
    end
  end
  
end

#==============================================================================
# Game_Battler
#==============================================================================

class Game_Battler
  
  alias maxsp_hpsp_add_on_later maxsp
  def maxsp
    val = [MAX_SP, maxsp_hpsp_add_on_later].min
    @sp = val if @sp > val
    return val
  end
  
end

#==============================================================================
# Game_Actor
#==============================================================================

class Game_Actor
  
  alias maxhp_hpsp_add_on_later maxhp
  def maxhp
    return maxhp_hpsp_add_on_later unless $game_system.HPSPPLUS
    val = [MAX_HP, maxhp_hpsp_add_on_later].min
    @hp = val if @hp > val
    return val
  end
  
  alias base_maxhp_hpsp_add_on_later base_maxhp
  def base_maxhp
    return base_maxhp_hpsp_add_on_later unless $game_system.HPSPPLUS
    plus, multi = 0, 1.0
    if @weapon_id != 0
      result = BlizzCFG.weapon_hp_plus(@weapon_id)
      result[0] ? (multi *= result[1]) : (plus += result[1])
    end
    [@armor1_id, @armor2_id, @armor3_id, @armor4_id].each {|id|
        if id != 0
          result = BlizzCFG.armor_hp_plus(id)
          result[0] ? (multi *= result[1]) : (plus += result[1])
        end}
    return (multi * (plus + base_maxhp_hpsp_add_on_later)).to_i
  end
  
  alias base_maxsp_hpsp_add_on_later base_maxsp
  def base_maxsp
    return base_maxsp_hpsp_add_on_later unless $game_system.HPSPPLUS
    plus, multi = 0, 1.0
    if @weapon_id != 0
      result = BlizzCFG.weapon_sp_plus(@weapon_id)
      result[0] ? (multi *= result[1]) : (plus += result[1])
    end
    [@armor1_id, @armor2_id, @armor3_id, @armor4_id].each {|id|
        if id != 0
          result = BlizzCFG.armor_sp_plus(id)
          result[0] ? (multi *= result[1]) : (plus += result[1])
        end}
    return (multi * (plus + base_maxsp_hpsp_add_on_later)).to_i
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# EQUAP Skills by Blizzard
# Version: 4.3b
# Type: Skill System
# Date: 28.05.2006
# Date v2.0: 13.6.2006
# Date v2.02b: 16.1.2007
# Date v3.0b: 19.2.2007
# Date v3.02b: 7.3.2007
# Date v4.0b: 13.7.2008
# Date v4.1b: 19.10.2008
# Date v4.2b: 22.10.2009
# Date v4.3b: 4.6.2009
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# Explanation:
# 
#   This add-on will allow you to bind skills to equipment. Equip it and you
#   learn the skill, unequip it and you will forget it. The AP system allows to
#   gain AP for skills and learn the permanently if the max AP for the skill
#   are gathered. (This system is a very similar one to FF9's AP Skill System.)
# 
# 
# v2.0:
#   - fixed bug, that appeared, when more equipment parts had the same skill
#   - new multi-skill support
# 
# v2.02b:
#   - improved coding a little bit
# 
# v3.0b:
#   - completely overworked and added optional AP system (similar to FF9)
#     (I want to mention here I made this especially for blazinhandle =) )
# 
# v3.02b:
#   - fixed bugs
# 
# v4.0b:
#   - fixed a critical bug
#   - no more EQUAP element
#   - skills that have less than 0 max AP cannot be learned
#   - compatible with Guilamme777's Multi-Slot Equipment System
#   - works more convenient
#   - better coding
# 
# v4.1b:
#   - fixed problems with gaining AP
# 
# v4.2b:
#   - added functionality to prevent some characters from learning certain
#     skills
# 
# v4.3b:
#   - fixed a problem with the configuration
#   - now AP values are defined by enemy and not be troop anymore
# 
# 
# Compatibility:
# 
#   99% compatible with SDK v1.x. 60% compatible with SDK v2.x. WILL cause
#   incompatibility with custom equipment scripts but there are instructions
#   how to configure the script. Compatible with Guilamme777's Multi-Slot
#   Equipment System. Please note, that this script depends on the layout of
#   your Equip Screen and needs to be put UNDER a CMS script if you are using
#   one. WILL corrupt your old savegames. Might not work with some CMS-es.
# 
# 
# Instructions:
# 
# - Configuration:
# 
#   Press CRTL+SHIFT+F and type into the window one of the following:
# 
#     Start EQ Database
#     Start MAXAP Database
#     Start GAINAP Database
# 
#   You can jump now to the database directly. There are more instructions.
# 
# - Merge with a Custom Equipment System:
#   
#   To make this system work with any custom equipment script, you need to
#   edit the method "prepare_equap" which fetches all current weapon IDs and
#   armor IDs.
# 
# 
# NOTE:
# 
#   DO NOT USE EQUAP SKILLS AS NORMAL SKILLS! THE SYSTEM WORKS WITH TEMPORARY
#   LEARNING AND FORGETTING THE EQUAP SKILL. IF YOU LET YOUR CHARACTER LEARN AN
#   EQUAP SKILL BY NORMAL MEANS, HE WILL FORGET IT AFTER HE UNEQUIPS THE
#   APPROPRIATE EQUIPMENT!
# 
# 
# If you find any bugs, please report them here:
# http://forum.chaos-project.com/
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

if TONS_OF_ADDONS::EQUAP_SKILLS

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Start EQUAP General Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

DISPLAY_AP_GAIN = false # uses a modified Battle Result to display gained AP
DISPLAY_AP_REQ = false # shows CURRENT_AP/NEEDED_AP in the skill's name
DISPLAY_AP_ZERO = false # shows 0/0 if the skill can't be learned
GAIN_DEAD = false # dead actor also gain AP, no matter what

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# End EQUAP General Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#==============================================================================
# module BlizzCFG
#==============================================================================

module BlizzCFG
  
  def self.maxap(id)
    case id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Start of MAXAP Database
#
#   Here you can define the APs needed to learn a skill. If you add no skills
#   here the AP system is automatically disabled. Configure it like this
#   template:
# 
#     when SKILL_ID then return MAXAP
# 
#   SKILL_ID - the ID of the skill that will be learned with AP
#   MAXAP    - how many AP are required to learn the skill
# 
#   If you give a skill negative max AP, the skill will be completely bound to
#   the equipment part and will be forgotten when it is unequipped.
# 
# Note:
# 
#   Don't forget to assign your AP skills to equipment in the EQ Database
#   below. Every skill with 0 AP (default) is a normal skill.
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 17 then return -1
    when 18 then return -1
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# End of MAXAP Database
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    end
    return 0
  end
  
  def self.gainap(id)
    case id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Start of GAINAP Database
#
#   Here you can define how many AP you will get from enemy troops. Configure
#   it like this template:
# 
#     when ENEMY_ID then return GAINAP
# 
#   ENEMY_ID - the ID of the enemy
#   GAINAP   - how many AP will the player get from this enemy.
# 
# Note:
# 
#   This will automatically be disabled if there are no AP skills.
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 1 then return 2
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# End of MAXAP Database
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    end
    return 0
  end
  
  def self.eq_database(id, weapon = true)
    skill_ids = []
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Start of EQ Database
#
#   This is your equipment database. To add one or more new EQUAP skills to a
#   weapon is very simple. Add another "when"-branch in the script snipplet
#   below (they have comments next to it). Configure it like this template:
# 
#     when WEAPON_ID
#       @skill_ids.push(EQUAP_SKILL_ID1)
#       @skill_ids.push(EQUAP_SKILL_ID2)
# 
#   The same works for armors:
# 
#     when ARMOR_ID
#       @skill_ids.push(EQUAP_SKILL_ID1)
#       @skill_ids.push(EQUAP_SKILL_ID2)
# 
#   The lines are commented below so you should have no problems with the script.
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    if weapon
      case id
      when 33 # weapon ID (Staff of Mikveh)
        skill_ids.push(17) # EQUAP skill ID (Greater Water)
        skill_ids.push(18) # EQUAP skill ID (Mass Water)
      when 2 # Iron Sword
        skill_ids.push(8) # Greater Fire 
        skill_ids.push(12) # Mass Ice
      when 3 # Steel Sword
        skill_ids.push(1) # Heal
        skill_ids.push(3) # Mass Heal
      end
    else
      case id
      when 103 # armor ID (Smoke granade pouch)
        skill_ids.push(138) # EQUAP skill ID
      when 3 # Steel Shield
        skill_ids.push(7) # Fire
        skill_ids.push(4) # Remedy
      when 8 # Mythril Helm
        skill_ids.push(32) # Radiate
        skill_ids.push(29) # Greater Darkness
      when 999 # Nothing
        skill_ids.push(10) # Ice
      end
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# End of EQ Database
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    end
    return skill_ids
  end
  
  def self.equap_nonlearnable_skills(id)
    case id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Start of NONLEARNABLE SKILLS Database
#
#   Here you can define skills that can't be learned by certain actors at all.
#   Configure it like this template:
# 
#     when ACTOR_ID then return [SKILL_ID1, SKILL_ID2, ...]
# 
#   ACTOR_ID - the ID of the enemy troop
#   SKILL_ID - the ID of the skill this actor can't learn through EQUAP
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 1 then return [59, 60] # When Suki  [Hurricane, Spiral Blade]
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# End of NONLEARNABLE SKILLS Database
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    end
    return []
  end
  
end
  
#==============================================================================
# Game_Actor
#==============================================================================

class Game_Actor
  
  alias setup_equap_later setup
  def setup(id)
    @ap = {}
    setup_equap_later(id)
    test_equap
  end
  
  alias equip_equap_later equip
  def equip(equip_type, id)
    equip_equap_later(equip_type, id)
    test_equap
  end
  
  def add_ap(val)
    @skills.each {|id| @ap[id] = 0 if @ap[id] == nil}
    @ap.each_key {|id|
        @ap[id] = self.ap(id) + val
        @ap[id] = 0 if self.ap(id) < 0
        maxap = BlizzCFG.maxap(id)
        @ap[id] = maxap if self.ap(id) > maxap}
  end
  
  def ap(id)
    return (@ap[id] == nil ? 0 : @ap[id])
  end
  
  def prepare_equap ### edit this method for custom equipment support
    # Guilamme777 compatibility switch
    return self.weapon_ids, self.armor_ids if defined?(G7_MS_MOD)
    weapons = [@weapon_id]
    armors = [@armor1_id, @armor2_id, @armor3_id, @armor4_id]
    return weapons, armors
  end
  
  def test_equap
    non_learnable = BlizzCFG.equap_nonlearnable_skills(self.id)
    (@skills - non_learnable).each {|id|
        maxap = BlizzCFG.maxap(id)
        forget_skill(id) if maxap < 0 || self.ap(id) < maxap}
    weapons, armors = prepare_equap
    skill_ids = []
    weapons.each {|id| skill_ids += BlizzCFG.eq_database(id, true)}
    armors.each {|id| skill_ids += BlizzCFG.eq_database(id, false)}
    (skill_ids - non_learnable).each {|id| learn_skill(id)}
  end
  
end


#==============================================================================
# Game_Troop
#==============================================================================

class Game_Troop
  
  attr_reader :id
  
  alias setup_equap_later setup
  def setup(troop_id)
    setup_equap_later(troop_id)
    @id = troop_id
  end
  
end

#==============================================================================
# Window_BattleResult
#==============================================================================

class Window_BattleResult
  
  def refresh_extra(aps)
    self.contents.fill_rect(0, 0, self.width, 32, Color.new(0, 0, 0, 0))
    x = 4
    self.contents.font.color = normal_color
    cx = contents.text_size(@exp.to_s).width
    self.contents.draw_text(x, 0, cx, 32, @exp.to_s)
    x += cx + 4
    self.contents.font.color = system_color
    cx = contents.text_size('EXP').width
    self.contents.draw_text(x, 0, 64, 32, 'EXP')
    x += cx + 16
    self.contents.font.color = normal_color
    cx = contents.text_size(@gold.to_s).width
    self.contents.draw_text(x, 0, cx, 32, @gold.to_s)
    x += cx + 4
    self.contents.font.color = system_color
    cx = contents.text_size($data_system.words.gold).width
    self.contents.draw_text(x, 0, 128, 32, $data_system.words.gold)
    x += cx + 16
    self.contents.font.color = normal_color
    cx = contents.text_size(aps.to_s).width
    self.contents.draw_text(x, 0, cx, 32, aps.to_s)
    x += cx + 4
    self.contents.font.color = system_color
    self.contents.draw_text(x, 0, 128, 32, 'AP')
  end

end

#==============================================================================
# Window_Skill
#==============================================================================

class Window_Skill
  
  alias draw_item_equap_later draw_item
  def draw_item(index)
    skill = @data[index]
    aps = BlizzCFG.maxap(skill.id)
    if DISPLAY_AP_REQ && !$scene.is_a?(Scene_Battle) &&
        (aps > 0 || aps != 0 && DISPLAY_AP_ZERO)
      if @actor.skill_can_use?(skill.id)
        self.contents.font.color = normal_color
      else
        self.contents.font.color = disabled_color
      end
      x, y = 4+index%2*320, index/2*32
      rect = Rect.new(x, y, self.width / @column_max - 32, 32)
      self.contents.fill_rect(rect, Color.new(0, 0, 0, 0))
      bitmap = RPG::Cache.icon(skill.icon_name)
      opacity = self.contents.font.color == normal_color ? 255 : 128
      self.contents.blt(x, y + 4, bitmap, Rect.new(0, 0, 24, 24), opacity)
      text = skill.name
      if aps > 0
        text += " (#{@actor.ap(skill.id)}/#{aps})"
      elsif DISPLAY_AP_ZERO
        text += ' (0/0)'
      end
      self.contents.draw_text(x + 28, y, 204, 32, text, 0)
      self.contents.draw_text(x + 232, y, 48, 32, skill.sp_cost.to_s, 2)
    else    
      draw_item_equap_later(index)
    end
  end
  
end

#==============================================================================
# Scene_Battle
#==============================================================================

class Scene_Battle
  
  alias start_phase5_equap_later start_phase5
  def start_phase5
    start_phase5_equap_later
    aps = 0
    $game_troop.enemies.each {|enemy| aps += BlizzCFG.gainap(enemy.id)}
    @result_window.refresh_extra(aps) if DISPLAY_AP_GAIN
  end
  
end

end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Picture Movie Scene by Blizzard
# Version: 2.3b
# Type: Scene Creation Utility
# Date: 3.11.2006
# Date v2.1b: 17.2.2008
# Date v2.2b: 13.7.2008
# Date v2.3b: 15.11.2008
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# Compatibility:
# 
#   100% compatible with SDK v1.x. 99% compatible with SDK v2.x.
# 
# 
# Explanation:
# 
#   This script will allow you to create picture scenes for different purposes.
#   You can create Credits, Intros or just picture (comic) movies.
# 
# 
# Instructions:
# 
#   Use following syntax to call this script:
# 
#     $scene = Scene_Pictures.new('NAME', DELAY, BDELAY, FDELAY, EXIT, 'BGM', 'BGS', RET)
# 
#   NAME   - name of the pictures to be loaded
#   DELAY  - time of displaying pictures
#   BDELAY - time delay of displaying between the pictures
#   FDELAY - time delay of fading between the pictures and blank background
#   EXIT   - allow exiting (true by default) the scene by pressing ESC/ENTER
#   BGM    - the name of the background music file to be played (none by default)
#   BGS    - the name of the background sound file to be played (none by default)
#   RET    - to which scene to return when done (Scene_Map is default)
# 
#   All your pictures must be named like STRING and put into a new folder
#   called Scene inside the Pictures folder with the order number attached.
# 
# Examples:
# 
# 1)
#   $scene = Scene_Pictures.new('animat', 5, 1, 10, false)
# 
#   A scene will be created where the first picture is located in:
#     Graphics/Pictures/Scene/animat1.png
#   The next will be
#     Graphics/Pictures/Scene/animat2.png
#   It will display pictures as long as there are some.
#   The scene can't be interrupted.
#   Afterwards the Scene_Map will be started.
# 
# 2)
#   $scene = Scene_Pictures.new('i_n_t_r_o_', 5, 1, 10, true, nil, nil, Scene_Title)
# 
#   Graphics/Pictures/Scene/i_n_t_r_o_1.png will be the first.
#   Graphics/Pictures/Scene/i_n_t_r_o_2.png will be the next after that.
#   It can be interrupted and will start the title scene after finishing.
#   Afterwards the Scene_Title will be started.
# 
# 3)
#   $scene = Scene_Pictures.new('credits', 5, 1, 12)
# 
#   Graphics/Pictures/Scene/credits1.png will be the first.
#   Graphics/Pictures/Scene/credits2.png will be the next after that.
#   Afterwards the Scene_Map will be started.
# 
# 
# Hints:
# 
# - if you want to use this scene an intro before the Title
#   
#   Apply the syntax mentioned above in the "Main" script. Just change the
#   "$scene = Scene_Title.new" (without the double quotes) to the desired scene
#   call and don't forget to set its returning scene to Scene_Title.
#   
# - if you want a scene to start right after the player chooses "New Game"
#   
#   Apply the syntax mentioned above in the "Scene_Title" script, in the
#   "def command_newgame" method. Just change the "$scene = Scene_Map.new"
#   (without the double quotes) to the desired scene call.
#   
#   
# Note:
#   
#   All your BGMs should be in the Audio/BGM folder.
# 
# 
# If you find any bugs, please report them here:
# http://forum.chaos-project.com
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#==============================================================================
# Scene_Pictures
#==============================================================================

class Scene_Pictures

  def initialize(p, d, h, f, i = true, bgm = nil, bgs = nil, s = Scene_Map)
    $game_system = Game_System.new if $game_system == nil
    @names, @delay, @hold, @fade = p, d, h, f
    @int, @bgm, @bgs, @next_scene = i, bgm, bgs, s
  end

  def main
    Graphics.transition
    Graphics.freeze
    delaying(true)
    Audio.bgm_play("Audio/BGM/#{@bgm}", 100, 100) if @bgm != nil
    Audio.bgs_play("Audio/BGS/#{@bgs}", 100, 100) if @bgs != nil
    @pic = RPG::Sprite.new
    i = 1
    loop do
      begin
        @pic.bitmap = RPG::Cache.picture("Scene/#{@names}#{i}")
      rescue
        break
      end
      @pic.x, @pic.y = 320 - @pic.bitmap.width/2, 240 - @pic.bitmap.height/2
      Graphics.transition(@fade)
      break if delaying
      if @fade > 0
        Graphics.freeze
        @pic.bitmap = nil
        Graphics.transition(@fade)
      end
      break if delaying(true)
      Graphics.freeze
      i += 1
    end
    unless @pic == nil || @pic.disposed?
      @pic.dispose 
      Graphics.transition(@fade)
    else
      Graphics.transition(4)
    end
    delaying(true)
    Audio.bgm_fade(800) if @bgm != nil
    Audio.bgs_fade(800) if @bgs != nil
    Graphics.freeze
    $scene = @next_scene.new
  end

  def delaying(just_hold = false)
    (0...(just_hold ? @hold : @delay)*40).each {|i|
        Graphics.update
        if @int
          Input.update
          return true if Input.press?(Input::C) || Input.press?(Input::B)
        end}
    return false
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Target 'em all! by Blizzard
# Version: 1.1b
# Type: Skill Enhancement
# Date: 27.9.2006
# Date v1.1b: 10.12.2007
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
#   This add-on will allow you to create skills that can target all enemies
#   and all party members. Include all such skill IDs in the FULL_TARGET_IDS
#   array and separate them with commas. Note that you should make the skill
#   target all enemies/all party members/etc. to avoid the cursor being
#   displayed.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

FULL_TARGET_IDS = []

#==============================================================================
# Scene_Battle
#==============================================================================

class Scene_Battle
  
  alias make_skill_action_result_target_all_later make_skill_action_result
  def make_skill_action_result(battler = nil, plus_id = nil)
    if battler == nil
      if $game_system.TARGET_EM_ALL &&
          FULL_TARGET_IDS.include?(@active_battler.current_action.skill_id)
        @target_battlers =
            ($game_troop.enemies + $game_party.actors).find_all {|b| b.exist?}
      end
      make_skill_action_result_target_all_later
    else
      if $game_system.TARGET_EM_ALL &&
          FULL_TARGET_IDS.include?(battler.current_action.skill_id)
        battler.target =
            ($game_troop.enemies + $game_party.actors).find_all {|b| b.exist?}
      end
      if plus_id == nil
        make_skill_action_result_target_all_later(battler)
      else
        make_skill_action_result_target_all_later(battler, plus_id)
      end
    end
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Quick Passability Test by Blizzard
# Version: 2.1b
# Type: Debug Utility
# Date: 7.2.2007
# Date v2.0: 16.4.2009
# Date v2.1b: 19.4.2009
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# Important:
# 
#   This add-on ONLY works in Debug mode/Testplay mode and is mainly
#   considered for debugging maps faster.
# 
# 
# Instructions:
# 
#   This will put a mask on your map that shows the passability. Trigger on/off
#   the mask by pressing F6. You can define the color the passable part should
#   have by changing the TILE_COLOR constant. Use this template:
# 
#   TILE_COLOR = Color.new(R, G, B, A)
# 
#   R - red
#   G - green
#   B - blue
#   A - alpha (opacity)
# 
#   PRECACHED_MAPS will create a file with passability data to improve loading
#   time of the map during the game. This subsystem will activate each time you
#   run the game in debug mode and it will update all maps that have been
#   changed. This can take some time if the maps are relatively big. If you
#   decide not to use this feature anymore, you should delete the file
#   Map_Data.abs from the Data folder to save space.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

TILE_COLOR = Color.new(255, 64, 0, 96)
PRECACHED_MAPS = false

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

$quick_pass = 2.1

#==============================================================================
# TONS_OF_ADDONS::Cache
#==============================================================================

class TONS_OF_ADDONS::Cache
  
  def initialize
    @tons_cache = {}
    @tons_cache['passable'] = _passable
    Graphics.update
  end
  
  def get_image(image)
    return @tons_cache[image]
  end
  
  def _passable
    b = Bitmap.new(96, 128)
    b.fill_rect(67, 0, 26, 32, TILE_COLOR)
    b.fill_rect(66, 1, 1, 30, TILE_COLOR)
    b.fill_rect(93, 1, 1, 30, TILE_COLOR)
    b.fill_rect(65, 2, 1, 28, TILE_COLOR)
    b.fill_rect(94, 2, 1, 28, TILE_COLOR)
    b.fill_rect(3, 3, 26, 26, TILE_COLOR)
    b.fill_rect(64, 3, 1, 26, TILE_COLOR)
    b.fill_rect(95, 3, 1, 26, TILE_COLOR)
    b.fill_rect(3, 35, 90, 90, TILE_COLOR)
    return b
  end
    
  def setup_passability(map)
    return if $BlizzABS
    @map, result = map, Table.new(map.width, map.height)
    (0...@map.height).each {|y|
        Graphics.update if @map.height * @map.width >= 19200 && y % 10 == 0
        (0...@map.width).each {|x|
            val = 0x00
            val |= 0x01 if passable?(x, y, 2) && passable?(x, y+1, 8)
            val |= 0x02 if passable?(x, y, 4) && passable?(x-1, y, 6)
            val |= 0x04 if passable?(x, y, 6) && passable?(x+1, y, 4)
            val |= 0x08 if passable?(x, y, 8) && passable?(x, y-1, 2)
            result[x, y] = val if val != 0x00}}
    @map = nil
    return result
  end
  
  def passable?(x, y, d)
    return true if x < 0 || x >= @map.width || y < 0 || y >= @map.height
    bit = (1 << (d / 2 - 1)) & 0x0f
    [2, 1, 0].each {|i|
        tile_id = @map.data[x, y, i]
        if tile_id == nil
          return false
        elsif $data_tilesets[@map.tileset_id].passages[tile_id] & bit != 0
          return false
        elsif $data_tilesets[@map.tileset_id].passages[tile_id] & 0x0F == 0x0F
          return false
        elsif $data_tilesets[@map.tileset_id].priorities[tile_id] == 0
          return true
        end}
    return true
  end
  
  def check_map_data
    return if $BlizzABS || !PRECACHED_MAPS
    $data_tilesets = load_data('Data/Tilesets.rxdata')
    new_data = load_data('Data/MapInfos.rxdata')
    if !File.exist?('Data/Map_Data.abs')
      data, dates = {}, {}
      ids = new_data.keys.sort
    else
      data, dates = load_data('Data/Map_Data.abs')
      keys = new_data.keys.sort
      keys.each_index {|i|
          if File.exist?(sprintf('Data/Map%03d.rxdata', keys[i]))
            file = File.open(sprintf('Data/Map%03d.rxdata', keys[i]), 'r')
            if dates[keys[i]] != file.mtime
              data.delete(keys[i])
              dates.delete(keys[i])
            end
            file.close
          end
          Graphics.update if i % 20 == 0}
      (data.keys - keys).each {|id|
            data.delete(keys[id])
            dates.delete(keys[id])}
      ids = keys - data.keys
    end
    ids.each {|id|
        map = load_data(sprintf('Data/Map%03d.rxdata', id))
        data[id] = setup_passability(map)
        if File.exist?(sprintf('Data/Map%03d.rxdata', id))
          f = File.open(sprintf('Data/Map%03d.rxdata', id), 'r')
          dates[id] = f.mtime
          f.close
        end
        Graphics.update}
    file = File.open('Data/Map_Data.abs', 'wb')
    Marshal.dump([data, dates], file)
    file.close
    $data_tilesets = nil
  end
  
end

$tons_cache = TONS_OF_ADDONS::Cache.new
$tons_cache.check_map_data

#==============================================================================
# Game_Map
#==============================================================================

class Game_Map
  
  alias setup_minimap_later setup
  def setup(map_id)
    setup_minimap_later(map_id)
    unless $DEBUG && $game_system.QUICK_PASSABILITY_TEST || $game_system.MINIMAP
      return
    end
    setup_virtual_passability
  end
  
  def setup_virtual_passability
    if PRECACHED_MAPS
      @virtual_passability = load_data('Data/Map_Data.abs')[0][map_id]
    else
      @virtual_passability = $tons_cache.setup_passability(@map)
    end
  end
  
  def virtual_passability
    setup_virtual_passability if @virtual_passability == nil
    return @virtual_passability
  end
  
end

#==============================================================================
# Scene_Map
#==============================================================================

class Scene_Map
  
  alias main_quick_passability_later main
  def main
    main_quick_passability_later
    @passable.dispose if @passable != nil
  end
  
  alias upd_quick_passability_later update
  def update
    upd_quick_passability_later
    if $DEBUG && $game_system.QUICK_PASSABILITY_TEST
      if @passable != nil
        if Input.trigger?(Input::F6)
          @passable.dispose
          @passable = nil
        else
          @passable.x = -$game_map.display_x/4
          @passable.y = -$game_map.display_y/4
        end
      elsif Input.trigger?(Input::F6)
        @passable = create_passable_help
        unless @passable == nil
          @passable.x = -$game_map.display_x/4
          @passable.y = -$game_map.display_y/4
        end
      end
    end
  end
  
  def create_passable_help
    v_map = $game_map.virtual_passability
    if $game_map.width * $game_map.height <= 19200
      sprite = Sprite.new
      sprite.bitmap = Bitmap.new($game_map.width*32, $game_map.height*32)
      autotile = $tons_cache.get_image('passable')
      v_map = $game_map.virtual_passability
      (0...v_map.xsize).each {|x| (0...v_map.ysize).each {|y|
          case v_map[x, y]
          when 0x01 #    D
            sprite.bitmap.blt(x*32, y*32+16, autotile, Rect.new(0, 0, 32, 16))
          when 0x02 #   L
            sprite.bitmap.blt(x*32, y*32, autotile, Rect.new(16, 0, 16, 32))
          when 0x03 #   LD
            sprite.bitmap.blt(x*32, y*32, autotile, Rect.new(64, 32, 32, 32))
          when 0x04 #  R
            sprite.bitmap.blt(x*32+16, y*32, autotile, Rect.new(0, 0, 16, 32))
          when 0x05 #  R D
            sprite.bitmap.blt(x*32, y*32, autotile, Rect.new(0, 32, 32, 32))
          when 0x06 #  RL
            sprite.bitmap.blt(x*32, y*32, autotile, Rect.new(32, 32, 32, 16))
            sprite.bitmap.blt(x*32, y*32+16, autotile, Rect.new(32, 112, 32, 16))
          when 0x07 #  RLD
            sprite.bitmap.blt(x*32, y*32, autotile, Rect.new(32, 32, 32, 32))
          when 0x08 # U
            sprite.bitmap.blt(x*32, y*32, autotile, Rect.new(0, 16, 32, 16))
          when 0x09 # U  D
            sprite.bitmap.blt(x*32, y*32, autotile, Rect.new(0, 64, 16, 32))
            sprite.bitmap.blt(x*32+16, y*32, autotile, Rect.new(80, 64, 16, 32))
          when 0x0A # U L
            sprite.bitmap.blt(x*32, y*32, autotile, Rect.new(64, 96, 32, 32))
          when 0x0B # U LD
            sprite.bitmap.blt(x*32, y*32, autotile, Rect.new(64, 64, 32, 32))
          when 0x0C # UR
            sprite.bitmap.blt(x*32, y*32, autotile, Rect.new(0, 96, 32, 32))
          when 0x0D # UR D
            sprite.bitmap.blt(x*32, y*32, autotile, Rect.new(0, 64, 32, 32))
          when 0x0E # URL
            sprite.bitmap.blt(x*32, y*32, autotile, Rect.new(32, 96, 32, 32))
          when 0x0F # URLD
            sprite.bitmap.blt(x*32, y*32, autotile, Rect.new(32, 64, 32, 32))
          end}}
      sprite.z = 1000
      return sprite
    end
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Blizz-ABS Minimap by Blizzard
# Version: 2.0
# Type: Game Playability Improvement
# Date: 7.2.2007
# Date v2.0: 16.4.2009
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# Compatibility:
# 
#   95% compatible with SDK v1.x. 60% compatible with SDK v2.x. This add-on
#   NEEDS "Quick Passability Test" by Blizzard. WILL corrupt your old
#   savegames. Might not work with special map add-ons. Does NOT work with
#   pixel-movement without changing the code.
# 
# 
# Why this minimap script better is than any other (aka features):
# 
#   - simple display to avoid lag
#   - custom size, position and opacity, changeable even during the game
#   - no bitmaps, no pictures to import, only plain script
#   - automatically makes use of Blizz-ABSEAL if installed to decrease lag even
#     further
# 
# 
# Explanation:
# 
#   This add-on will draw a real-time minimap on the specified X and Y
#   coordinate on your screen. It will show the player, events that do NOT have
#   a comment in their code that says "\nomap", that are not parallel
#   process and that are not auto-start and that are not erased yet. Events
#   with a teleport/transfer player command will be shown in a different color.
#   Any event with and comment with "\spc" in their code will be also
#   displayed differently. Blizz-ABS disables this add-on automatically and
#   uses the built-in version of the Blizz-ABS Minimap.
# 
# 
# Instructions:
# 
#   You can trigger the minimap visible/invisible with F5 during the game.
#   Set up the starting configuration below. The colors follow a template of:
# 
#     WHAT_COLOR = Color.new(R, G, B)
# 
#   R - red
#   G - green
#   B - blue
# 
#   Change the colors of the dots on the map as you prefer it.
# 
#   PLAYER_COLOR    - the player on the minimap
#   EVENT_COLOR     - any event on the minimap that is not erased, is not
#                     auto-start, is not parallel process and does not have a
#                     comment in its code with the word "no_minimap"
#   TELEPORT_COLOR  - any event like the one above, but that has a teleport/
#                     transfer_player command
#   SPECIAL_COLOR   - any event with a comment with the word "special"
#   MINIMAP_X       - default X of the minimap on the screen
#   MINIMAP_Y       - default Y of the minimap on the screen
#   MINIMAP_WIDTH   - default maximal allowed width of the minimap
#   MINIMAP_HEIGHT  - default maximal allowed height of the minimap
#   MINIMAP_OPACITY - default opacity of the minimap on the screen
# 
#   You have the possibility to change the minimap's size, coordinates and
#   opacity during the game process. The command you need to type in into a
#   "Call Script" command window are:
# 
#     $game_system.set_minimap_coordinates(X, Y)
#     $game_system.set_minimap_size(W, H)
#     $game_system.set_minimap_opacity(A)
# 
#   X - new X
#   Y - new Y
#   W - new width
#   H - new height
#   A - new opacity
# 
#   Any changes will be applied instantly. Note that you don't need to use ALL
#   commands.
#   The minimap mode can be changed using this code:
# 
#     $game_system.minimap_mode = MODE
# 
#   MODE - new mode (0 = off; 1 = on; 2 = full map)
# 
# 
# Note:
# 
#   Changing X, Y and opacity during the game will result in just moving the
#   sprite. The minimap will not work if the maximal allowed size is smaller
#   than the map size. (i.e. if your minimap is 160x120, maps like 170x130,
#   180x15 or 20x140 will not work.)
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Start Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

PLAYER_COLOR = Color.new(0, 255, 0)
EVENT_COLOR = Color.new(0, 128, 255)
TELEPORT_COLOR = Color.new(255, 255, 0)
SPECIAL_COLOR = Color.new(255, 0, 0)
MINIMAP_X = 0
MINIMAP_Y = 0
MINIMAP_WIDTH = 160
MINIMAP_HEIGHT = 160
MINIMAP_OPACITY = 160
MAP_MOVE_BUTTON = Input::Z

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# End Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

if !$quick_pass
  raise 'Attention! Minimap is missing a vital add-on! Application will now close!'
end

#==============================================================================
# TONS_OF_ADDONS::Cache
#==============================================================================

class TONS_OF_ADDONS::Cache
  
  alias init_blizzabsminimap_later initialize
  def initialize
    init_blizzabsminimap_later
    @tons_cache['minimap_autotile'] = _minimap_autotile
    Graphics.update
    @tons_cache['white_arrow'] = _white_arrow
    Graphics.update
    @tons_cache['green_arrow'] = _green_arrow
    Graphics.update
    @tons_cache['blue_arrow'] = @tons_cache['green_arrow'].clone
    @tons_cache['blue_arrow'].hue_change(120)
    @tons_cache['red_arrow'] = @tons_cache['green_arrow'].clone
    @tons_cache['red_arrow'].hue_change(-120)
    @tons_cache['yellow_arrow'] = @tons_cache['green_arrow'].clone
    @tons_cache['yellow_arrow'].hue_change(-60)
    @tons_cache['violet_arrow'] = @tons_cache['green_arrow'].clone
    @tons_cache['violet_arrow'].hue_change(150)
    Graphics.update
  end
  
  def get_image(image)
    return @tons_cache[image]
  end
  
  def _white_arrow
    b = Bitmap.new(56, 14)
    c1 = Color.new(0, 0, 0)
    c2 = Color.new(255, 255, 255)
    b.set_pixel(23, 0, c1)
    b.set_pixel(32, 0, c1)
    b.set_pixel(22, 1, c1)
    b.fill_rect(23, 1, 1, 12, c2)
    b.fill_rect(24, 1, 1, 12, c1)
    b.fill_rect(31, 1, 1, 12, c1)
    b.fill_rect(32, 1, 1, 12, c2)
    b.set_pixel(33, 1, c1)
    b.set_pixel(21, 2, c1)
    b.fill_rect(22, 2, 1, 10, c2)
    b.fill_rect(33, 2, 1, 10, c2)
    b.set_pixel(34, 2, c1)
    b.fill_rect(1, 3, 12, 1, c1)
    b.set_pixel(20, 3, c1)
    b.fill_rect(21, 3, 1, 8, c2)
    b.fill_rect(34, 3, 1, 8, c2)
    b.set_pixel(35, 3, c1)
    b.fill_rect(48, 3, 2, 1, c1)
    b.set_pixel(0, 4, c1)
    b.fill_rect(1, 4, 12, 1, c2)
    b.set_pixel(13, 4, c1)
    b.set_pixel(19, 4, c1)
    b.fill_rect(20, 4, 1, 6, c2)
    b.fill_rect(35, 4, 1, 6, c2)
    b.set_pixel(36, 4, c1)
    b.set_pixel(47, 4, c1)
    b.fill_rect(48, 4, 2, 6, c2)
    b.set_pixel(50, 4, c1)
    b.set_pixel(1, 5, c1)
    b.fill_rect(2, 5, 10, 1, c2)
    b.set_pixel(12, 5, c1)
    b.set_pixel(18, 5, c1)
    b.fill_rect(19, 5, 1, 4, c2)
    b.fill_rect(36, 5, 1, 4, c2)
    b.set_pixel(37, 5, c1)
    b.set_pixel(46, 5, c1)
    b.fill_rect(47, 5, 1, 5, c2)
    b.fill_rect(50, 5, 1, 5, c2)
    b.set_pixel(51, 5, c1)
    b.set_pixel(2, 6, c1)
    b.fill_rect(3, 6, 8, 1, c2)
    b.set_pixel(11, 6, c1)
    b.fill_rect(17, 6, 1, 2, c1)
    b.fill_rect(18, 6, 1, 2, c2)
    b.fill_rect(37, 6, 1, 2, c2)
    b.fill_rect(38, 6, 1, 2, c1)
    b.set_pixel(45, 6, c1)
    b.fill_rect(46, 6, 1, 4, c2)
    b.fill_rect(51, 6, 1, 4, c2)
    b.set_pixel(52, 6, c1)
    b.set_pixel(3, 7, c1)
    b.fill_rect(4, 7, 6, 1, c2)
    b.set_pixel(10, 7, c1)
    b.set_pixel(44, 7, c1)
    b.fill_rect(45, 7, 1, 3, c2)
    b.fill_rect(52, 7, 1, 3, c2)
    b.set_pixel(53, 7, c1)
    b.set_pixel(4, 8, c1)
    b.fill_rect(5, 8, 4, 1, c2)
    b.set_pixel(9, 8, c1)
    b.set_pixel(18, 8, c1)
    b.set_pixel(37, 8, c1)
    b.set_pixel(43, 8, c1)
    b.fill_rect(44, 8, 1, 2, c2)
    b.fill_rect(53, 8, 1, 2, c2)
    b.set_pixel(54, 8, c1)
    b.set_pixel(5, 9, c1)
    b.fill_rect(6, 9, 2, 1, c2)
    b.set_pixel(8, 9, c1)
    b.set_pixel(19, 9, c1)
    b.set_pixel(36, 9, c1)
    b.set_pixel(42, 9, c1)
    b.set_pixel(43, 9, c2)
    b.set_pixel(54, 9, c2)
    b.set_pixel(55, 9, c1)
    b.fill_rect(6, 10, 2, 1, c1)
    b.set_pixel(20, 10, c1)
    b.set_pixel(35, 10, c1)
    b.fill_rect(43, 10, 12, 1, c1)
    b.set_pixel(21, 11, c1)
    b.set_pixel(34, 11, c1)
    b.set_pixel(22, 12, c1)
    b.set_pixel(33, 12, c1)
    b.set_pixel(23, 13, c1)
    b.set_pixel(32, 13, c1)
    return b
  end
  
  def _green_arrow
    b = Bitmap.new(56, 14)
    c1 = Color.new(0, 0, 0)
    c2 = Color.new(255, 255, 255)
    c3 = Color.new(0, 255, 0)
    b.set_pixel(23, 0, c1)
    b.set_pixel(32, 0, c1)
    b.set_pixel(22, 1, c1)
    b.fill_rect(23, 1, 1, 12, c3)
    b.fill_rect(24, 1, 1, 12, c1)
    b.fill_rect(31, 1, 1, 12, c1)
    b.fill_rect(32, 1, 1, 12, c3)
    b.set_pixel(33, 1, c1)
    b.set_pixel(21, 2, c1)
    b.fill_rect(22, 2, 1, 10, c3)
    b.fill_rect(33, 2, 1, 10, c3)
    b.set_pixel(34, 2, c1)
    b.fill_rect(1, 3, 12, 1, c1)
    b.set_pixel(20, 3, c1)
    b.fill_rect(21, 3, 1, 8, c3)
    b.fill_rect(34, 3, 1, 8, c3)
    b.set_pixel(35, 3, c1)
    b.fill_rect(48, 3, 2, 1, c1)
    b.set_pixel(0, 4, c1)
    b.fill_rect(1, 4, 12, 1, c3)
    b.set_pixel(13, 4, c1)
    b.set_pixel(19, 4, c1)
    b.fill_rect(20, 4, 1, 6, c3)
    b.fill_rect(35, 4, 1, 6, c3)
    b.set_pixel(36, 4, c1)
    b.set_pixel(47, 4, c1)
    b.fill_rect(48, 4, 2, 6, c3)
    b.set_pixel(50, 4, c1)
    b.set_pixel(1, 5, c1)
    b.fill_rect(2, 5, 10, 1, c3)
    b.set_pixel(12, 5, c1)
    b.set_pixel(18, 5, c1)
    b.fill_rect(19, 5, 1, 4, c3)
    b.fill_rect(36, 5, 1, 4, c3)
    b.set_pixel(37, 5, c1)
    b.set_pixel(46, 5, c1)
    b.fill_rect(47, 5, 1, 5, c3)
    b.fill_rect(50, 5, 1, 5, c3)
    b.set_pixel(51, 5, c1)
    b.set_pixel(2, 6, c1)
    b.fill_rect(3, 6, 8, 1, c3)
    b.set_pixel(11, 6, c1)
    b.fill_rect(17, 6, 1, 2, c1)
    b.fill_rect(18, 6, 1, 2, c3)
    b.fill_rect(37, 6, 1, 2, c3)
    b.fill_rect(38, 6, 1, 2, c1)
    b.set_pixel(45, 6, c1)
    b.fill_rect(46, 6, 1, 4, c3)
    b.fill_rect(51, 6, 1, 4, c3)
    b.set_pixel(52, 6, c1)
    b.set_pixel(3, 7, c1)
    b.fill_rect(4, 7, 6, 1, c3)
    b.set_pixel(10, 7, c1)
    b.set_pixel(44, 7, c1)
    b.fill_rect(45, 7, 1, 3, c3)
    b.fill_rect(52, 7, 1, 3, c3)
    b.set_pixel(53, 7, c1)
    b.set_pixel(4, 8, c1)
    b.fill_rect(5, 8, 4, 1, c3)
    b.set_pixel(9, 8, c1)
    b.set_pixel(18, 8, c1)
    b.set_pixel(37, 8, c1)
    b.set_pixel(43, 8, c1)
    b.fill_rect(44, 8, 1, 2, c3)
    b.fill_rect(53, 8, 1, 2, c3)
    b.set_pixel(54, 8, c1)
    b.set_pixel(5, 9, c1)
    b.fill_rect(6, 9, 2, 1, c3)
    b.set_pixel(8, 9, c1)
    b.set_pixel(19, 9, c1)
    b.set_pixel(36, 9, c1)
    b.set_pixel(42, 9, c1)
    b.set_pixel(43, 9, c3)
    b.set_pixel(54, 9, c3)
    b.set_pixel(55, 9, c1)
    b.fill_rect(6, 10, 2, 1, c1)
    b.set_pixel(20, 10, c1)
    b.set_pixel(35, 10, c1)
    b.fill_rect(43, 10, 12, 1, c1)
    b.set_pixel(21, 11, c1)
    b.set_pixel(34, 11, c1)
    b.set_pixel(22, 12, c1)
    b.set_pixel(33, 12, c1)
    b.set_pixel(23, 13, c1)
    b.set_pixel(32, 13, c1)
    return b
  end
    
  def _minimap_autotile
    b = Bitmap.new(24, 32)
    c1 = Color.new(191, 191, 191)
    c2 = Color.new(255, 255, 255)
    b.fill_rect(2, 0, 4, 1, c2)
    b.set_pixel(1, 1, c2)
    b.fill_rect(2, 1, 4, 6, c1)
    b.set_pixel(6, 1, c2)
    b.fill_rect(0, 2, 1, 4, c2)
    b.fill_rect(1, 2, 1, 4, c1)
    b.fill_rect(6, 2, 1, 4, c1)
    b.fill_rect(7, 2, 1, 4, c2)
    b.set_pixel(1, 6, c2)
    b.set_pixel(6, 6, c2)
    b.fill_rect(2, 7, 4, 1, c2)
    b.fill_rect(7, 8, 10, 1, c2)
    b.set_pixel(6, 9, c2)
    b.fill_rect(7, 9, 10, 22, c1)
    b.set_pixel(17, 9, c2)
    b.set_pixel(5, 10, c2)
    b.fill_rect(6, 10, 1, 20, c1)
    b.fill_rect(17, 10, 1, 20, c1)
    b.set_pixel(18, 10, c2)
    b.set_pixel(4, 11, c2)
    b.fill_rect(5, 11, 1, 18, c1)
    b.fill_rect(18, 11, 1, 18, c1)
    b.set_pixel(19, 11, c2)
    b.set_pixel(3, 12, c2)
    b.fill_rect(4, 12, 1, 16, c1)
    b.fill_rect(19, 12, 1, 16, c1)
    b.set_pixel(20, 12, c2)
    b.set_pixel(2, 13, c2)
    b.fill_rect(3, 13, 1, 14, c1)
    b.fill_rect(20, 13, 1, 14, c1)
    b.set_pixel(21, 13, c2)
    b.set_pixel(1, 14, c2)
    b.fill_rect(2, 14, 1, 12, c1)
    b.fill_rect(21, 14, 1, 12, c1)
    b.set_pixel(22, 14, c2)
    b.fill_rect(0, 15, 1, 10, c2)
    b.fill_rect(1, 15, 1, 10, c1)
    b.fill_rect(22, 15, 1, 10, c1)
    b.fill_rect(23, 15, 1, 10, c2)
    b.set_pixel(1, 25, c2)
    b.set_pixel(22, 25, c2)
    b.set_pixel(2, 26, c2)
    b.set_pixel(21, 26, c2)
    b.set_pixel(3, 27, c2)
    b.set_pixel(20, 27, c2)
    b.set_pixel(4, 28, c2)
    b.set_pixel(19, 28, c2)
    b.set_pixel(5, 29, c2)
    b.set_pixel(18, 29, c2)
    b.set_pixel(6, 30, c2)
    b.set_pixel(17, 30, c2)
    b.fill_rect(7, 31, 10, 1, c2)
    return b
  end
  
  def load_minimap_bitmap
    autotile = self.get_image('minimap_autotile')
    w, h = $game_map.width, $game_map.height
    bitmap = Bitmap.new(8*w, 8*h)
    bitmap.fill_rect(0, 0, 8*w, 8*h, Color.new(0, 0, 0, 128))
    v_map = $game_map.virtual_passability
    (0...v_map.xsize).each {|x| (0...v_map.ysize).each {|y|
        case v_map[x, y]
        when 0x01 #    D
          bitmap.blt(x*8, y*8+4, autotile, Rect.new(0, 0, 8, 4), 128)
        when 0x02 #   L
          bitmap.blt(x*8, y*8, autotile, Rect.new(4, 0, 4, 8), 128)
        when 0x03 #   LD
          bitmap.blt(x*8, y*8, autotile, Rect.new(16, 8, 8, 8), 128)
        when 0x04 #  R
          bitmap.blt(x*8+4, y*8, autotile, Rect.new(0, 0, 4, 8), 128)
        when 0x05 #  R D
          bitmap.blt(x*8, y*8, autotile, Rect.new(0, 8, 8, 8), 128)
        when 0x06 #  RL
          bitmap.blt(x*8, y*8, autotile, Rect.new(8, 8, 8, 4), 128)
          bitmap.blt(x*8, y*8+4, autotile, Rect.new(8, 28, 8, 4), 128)
        when 0x07 #  RLD
          bitmap.blt(x*8, y*8, autotile, Rect.new(8, 8, 8, 8), 128)
        when 0x08 # U
          bitmap.blt(x*8, y*8, autotile, Rect.new(0, 4, 8, 4), 128)
        when 0x09 # U  D
          bitmap.blt(x*8, y*8, autotile, Rect.new(0, 16, 4, 8), 128)
          bitmap.blt(x*8+4, y*8, autotile, Rect.new(20, 16, 4, 8), 128)
        when 0x0A # U L
          bitmap.blt(x*8, y*8, autotile, Rect.new(16, 24, 8, 8), 128)
        when 0x0B # U LD
          bitmap.blt(x*8, y*8, autotile, Rect.new(16, 16, 8, 8), 128)
        when 0x0C # UR
          bitmap.blt(x*8, y*8, autotile, Rect.new(0, 24, 8, 8), 128)
        when 0x0D # UR D
          bitmap.blt(x*8, y*8, autotile, Rect.new(0, 16, 8, 8), 128)
        when 0x0E # URL
          bitmap.blt(x*8, y*8, autotile, Rect.new(8, 24, 8, 8), 128)
        when 0x0F # URLD
          bitmap.blt(x*8, y*8, autotile, Rect.new(8, 16, 8, 8), 128)
        end}}
    @tons_cache['minimap_bitmap'] = bitmap
  end
  
end

$tons_cache = TONS_OF_ADDONS::Cache.new
$tons_cache.check_map_data

#==============================================================================
# Game_System
#==============================================================================

class Game_System
  
  attr_reader   :minimap_x
  attr_reader   :minimap_y
  attr_reader   :minimap_w
  attr_reader   :minimap_h
  attr_reader   :minimap_a
  attr_accessor :minimap_mode
  
  alias init_minimap_later initialize
  def initialize
    init_minimap_later
    @minimap_mode = 0
    @minimap_x = [[MINIMAP_X, 0].max, 640].min
    @minimap_y = [[MINIMAP_Y, 0].max, 480].min
    @minimap_w = [[MINIMAP_WIDTH, 0].max, 640].min
    @minimap_h = [[MINIMAP_HEIGHT, 0].max, 480].min
    @minimap_a = [[MINIMAP_OPACITY, 0].max, 255].min
  end
  
  def set_minimap_coordinates(x, y)
    @minimap_x, @minimap_y = [[x, 0].max, 640].min, [[y, 0].max, 480].min
  end
  
  def set_minimap_size(w, h)
    @minimap_w, @minimap_h = [[w, 0].max, 640].min, [[h, 0].max, 480].min
  end
  
  def set_minimap_opacity(a)
    @minimap_a = [[a, 0].max, 255].min
  end
  
end

#==============================================================================
# Game_Map
#==============================================================================

class Game_Map
  
  alias setup_blizzabsminimap_later setup
  def setup(map_id)
    setup_blizzabsminimap_later(map_id)
    return if $BlizzABS
    $tons_cache.load_minimap_bitmap
  end
  
end

#==============================================================================
# Game_Character
#==============================================================================

class Game_Character
  
  def update? # Blizz-ABSEAL compatibility
    return true
  end
  
end

#==============================================================================
# Game_Player
#==============================================================================

class Game_Player
  
  alias passable_blizzabsminimap_later? passable?
  def passable?(x, y, d)
    return false if Input.press?(MAP_MOVE_BUTTON)
    return passable_blizzabsminimap_later?(x, y, d)
  end
  
end

#==============================================================================
# Game_Event
#==============================================================================

class Game_Event
  
  attr_reader :erased
  attr_reader :teleport
  
  def conditions
    @event.pages.reverse.each {|page|
        c = page.condition
        next if c.switch1_valid && !$game_switches[c.switch1_id]
        next if c.switch2_valid && !$game_switches[c.switch2_id]
        if c.variable_valid
          next if $game_variables[c.variable_id] < c.variable_value
        end
        if c.self_switch_valid
          key = [@map_id, @event.id, c.self_switch_ch]
          next if $game_self_switches[key] != true
        end
        return true}
    return false
  end
  
  alias refresh_blizzabsminimap_later refresh
  def refresh
    refresh_blizzabsminimap_later
    @teleport = (@list != nil && @list.any? {|i| i.code == 201})
  end
  
  def name
    return @event.name.clone
  end
  
end
  
#==============================================================================
# Minimap
#==============================================================================

class Minimap < Sprite
  
  attr_reader :map_id
  
  def initialize
    super(Viewport.new(476, 356, 160, 120))
    @autotile = $tons_cache.get_image('minimap_autotile')
    create_passable_floor
    self.x = self.y = 0
    viewport.z = 5000
    @events, @names = check_events
    create_sevents
    self.visible = true
    update
  end
  
  def create_passable_floor
    self.bitmap = $tons_cache.get_image('minimap_bitmap')
    @map_id = $game_map.map_id
  end
  
  def update(override = false)
    create_passable_floor if @map_id != $game_map.map_id
    ev = check_events
    if [@events, @names] != ev
      @events, @names = ev
      destroy_sevents
      create_sevents
    end
    if $game_system.minimap_mode < 2
      self.ox, self.oy = $game_map.display_x / 16, $game_map.display_y / 16
    elsif !(Input.press?(MAP_MOVE_BUTTON)) || override
      if self.bitmap.width > 640
        border = $game_player.real_x/16 - 320
        border_x = self.bitmap.width - 640
        if border < 0
          self.ox = 0
        elsif border > border_x
          self.ox = border_x
        else
          self.ox = border
        end
      else
        self.ox = self.bitmap.width/2 - 320
      end
      if self.bitmap.height > 480
        border = $game_player.real_y/16 - 240
        border_y = self.bitmap.height - 480
        if border < 0
          self.oy = 0
        elsif border > border_y
          self.oy = border_y
        else
          self.oy = border
        end
      else
        self.oy = self.bitmap.height/2 - 240
      end
    end
    @sevents.each_index {|i|
        if $game_system.minimap_mode == 2 || @events[i].update?
          @sevents[i].x = self.x + @events[i].real_x / 16
          @sevents[i].y = self.y + @events[i].real_y / 16
          @sevents[i].ox, @sevents[i].oy = self.ox, self.oy
          if @names[i] != '' && (@events[i].is_a?(Game_Player) ||
              @events[i].is_a?(Game_Member) ||
              !@events[i].name.clone.gsub!('\box') {''})
            @sevents[i].src_rect.set((@events[i].direction - 2) * 7, 0, 14, 14)
            @sevents[i].ox += 3
            @sevents[i].oy += 3
          end
        end}
  end
  
  def check_events
    events, names = [$game_player], []
    if $game_system.CATERPILLAR
      $game_player.members.each {|event|
          events.push(event) if event.character_name != ''}
    end
    $game_map.events.each_value {|event|
        next if event.name.clone.gsub!('\nomap') {''}
        if event.is_a?(Game_Event) && !event.erased && (event.teleport ||
            event.name.clone.gsub!('\spc') {''})
          events.push(event)
          names.push(event.character_name)
        end}
    return events, names
  end
  
  def create_sevents
    @sevents = []
    @events.each_index {|i|
        sprite = Sprite.new(viewport)
        rect = Rect.new(0, 0, 56, 14)
        if @events[i] == $game_player
          if @names[i] != ''
            sprite.bitmap = Bitmap.new(56, 14)
            sprite.bitmap.blt(0, 0, $tons_cache.get_image('green_arrow'), rect, 128)
          end
          sprite.z = 100
        elsif @events[i].is_a?(Game_Member)
          if @names[i] != ''
            sprite.bitmap = Bitmap.new(56, 14)
            sprite.bitmap.blt(0, 0, $tons_cache.get_image('blue_arrow'), rect, 128)
          end
          sprite.z = 80
        elsif @events[i].is_a?(Game_Event)
          if @events[i].name.clone.gsub!('\spc') {''}
            color, arrow, sprite.z = Color.new(255, 255, 0, 128), 'yellow_arrow', 60
          elsif @events[i].teleport
            color, arrow, sprite.z = Color.new(128, 0, 255, 128), 'violet_arrow', 40
          end
          if @names[i] == '' || @events[i].name.clone.gsub!('\box') {''}
            sprite.bitmap = Bitmap.new(8, 8)
            sprite.bitmap.fill_rect(0, 0, 8, 8, Color.new(0, 0, 0, 128))
            sprite.bitmap.fill_rect(1, 1, 6, 6, color)
          else
            sprite.bitmap = Bitmap.new(56, 14)
            sprite.bitmap.blt(0, 0, $tons_cache.get_image(arrow), rect, 128)
          end
        elsif @names[i] == '' || @events[i].name.clone.gsub!('\box') {''}
          sprite.bitmap = Bitmap.new(8, 8)
          sprite.bitmap.fill_rect(0, 0, 8, 8, Color.new(0, 0, 0, 128))
          sprite.bitmap.fill_rect(1, 1, 6, 6, Color.new(255, 255, 255, 128))
        else
          sprite.bitmap = Bitmap.new(56, 14)
          sprite.bitmap.blt(0, 0, $tons_cache.get_image('white_arrow'), Rect.new(0, 0, 56, 14), 128)
        end
        sprite.bitmap = Bitmap.new(1, 1) if sprite.bitmap == nil
        sprite.ox = sprite.oy = 64
        if sprite.bitmap.width != 8
          sprite.src_rect.set((@events[i].direction-2)*7, 0, 14, 14)
        end
        @sevents.push(sprite)}
  end
  
  def destroy_sevents
    if @sevents != nil
      @sevents.each {|i| i.dispose}
      @sevents = nil
    end
  end
  
  def visible=(expr)
    super
    @sevents.each {|sprite| sprite.visible = expr}
  end
  
  def dispose
    destroy_sevents
    super
  end
  
end

#==============================================================================
# Scene_Map
#==============================================================================

class Scene_Map
  
  alias main_minimap_later main
  def main
    if $BlizzABS && BlizzABS::VERSION >= 1.20
      main_minimap_later
      return
    end
    @minimap = Minimap.new if $game_system.minimap_mode > 0
    main_minimap_later
    @minimap.dispose if @minimap != nil
  end
  
  alias upd_minimap_later update
  def update
    upd_minimap_later
    return if $BlizzABS && BlizzABS::VERSION >= 1.20
    if $game_system.MINIMAP
      if Input.trigger?(Input::F5)
        $game_system.minimap_mode = ($game_system.minimap_mode + 1) % 3
        if $game_system.minimap_mode == 0
          if @minimap != nil
            @minimap.dispose
            @minimap = nil
          end
        elsif @minimap == nil
          @minimap = Minimap.new
        end
      elsif @minimap != nil
        if $game_system.minimap_mode < 2
          @minimap.update
          return
        end
        unless @minimap.viewport.rect.width == 640 &&
            @minimap.map_id == $game_map.map_id
          @minimap.viewport.rect.set(0, 0, 640, 480)
          @minimap.update(true)
        end
        if Input.press?(MAP_MOVE_BUTTON) && !$game_temp.message_window_showing &&
            !$game_system.map_interpreter.running? && !@move_route_forcing
          if @minimap.bitmap.width > 640
            if Input.repeat?(Input::RIGHT)
              if @minimap.ox + 640 < @minimap.bitmap.width
                $game_system.se_play($data_system.cursor_se)
                @minimap.ox += 32
              else
                $game_system.se_play($data_system.buzzer_se)
              end
            elsif Input.repeat?(Input::LEFT)
              if @minimap.ox > 0
                $game_system.se_play($data_system.cursor_se)
                @minimap.ox -= 32
              else
                $game_system.se_play($data_system.buzzer_se)
              end
            end
          end
          if @minimap.bitmap.height > 480
            if Input.repeat?(Input::DOWN)
              if @minimap.oy + 480 < @minimap.bitmap.height
                $game_system.se_play($data_system.cursor_se)
                @minimap.oy += 32
              else
                $game_system.se_play($data_system.buzzer_se)
              end
            elsif Input.repeat?(Input::UP)
              if @minimap.oy > 0
                $game_system.se_play($data_system.cursor_se)
                @minimap.oy -= 32
              else
                $game_system.se_play($data_system.buzzer_se)
              end
            end
          end
        end
      end
    end
  end
  
  alias transfer_player_minimap_later transfer_player
  def transfer_player
    if @minimap != nil
      @minimap.dispose
      @minimap = nil
    end
    transfer_player_minimap_later
    @minimap = Minimap.new if $game_system.minimap_mode > 0
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Enemy Status in Battle by Blizzard
# Version: 1.0b
# Type: Information Display Alteration
# Date: 17.2.2007
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# Compatibility:
# 
#   99% compatible with SDK v1.x. 90% compatible with SDK v2.x. Might cause
#   incompatibility issues with exotic CBS-es, CMS-es and custom enemy status
#   displays.
# 
# 
# Explanation:
# 
#   This add-on will not only show enemies' names, but even HP, SP and status
#   in the help window during battle.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#==============================================================================
# Window_Help
#==============================================================================

class Window_Help
  
  alias set_enemy_status_later set_enemy
  def set_enemy(enemy)
    $game_system.ENEMY_STATUS ? set_actor(enemy) : set_enemy_status_later(enemy)
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Passive Skills by Blizzard
# Version: 1.2b
# Type: Game Alteration
# Date: 13.7.2008
# Date v1.0b: 21.7.2008
# Date v1.1b: 19.10.2008
# Date v1.2b: 18.4.2009
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
#   This add-on allows that skills passively change attributes and gold/exp
#   rates. It is recommended that you make those skills be never usable.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

module BlizzCFG
  
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  # will cause skills to only be effective during battle
  BATTLE_ONLY = false
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

  def self.passkl_database(id)
    case id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Passive Skills Database
#   
#   Use following template to configure your database below:
#     
#     when ID then return [HP, SP, STR, DEX, AGI, INT, ATK, PD, MD, EVA, G, EXP]
#   
#   ID  - ID of the skill
#   HP  - change of max HP (added)
#   SP  - change of max SP (added)
#   STR - change of STR (added)
#   DEX - change of DEX (added)
#   AGI - change of AGI (added)
#   INT - change of INT (added)
#   ATK - change of ATK (added)
#   PD  - change of PDEF (added)
#   MD  - change of MDEF (added)
#   EVA - change of EVA (added)
#   G   - change of gold (multiplied)
#   EXP - change of EXP (multiplied)
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 1 then return [100, 100, 10, 10, 10, 10, 0, 0, 0, 0, 1.0, 1.0]
    when 2 then return [0, 0, 0, 0, 0, 0, 10, -10, -10, 10, 1.0, 1.0]
    when 3 then return [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.5, 1.0]
    when 4 then return [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.0, 1.2]
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Passive Skills
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    end
    return [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.0, 1.0]
  end
  
end

#==============================================================================
# Game_Actor
#==============================================================================

class Game_Actor
  
  alias base_maxhp_passkl_later base_maxhp
  def base_maxhp
    result = base_maxhp_passkl_later
    if $game_system.PASSIVE_SKILLS &&
        (!BlizzCFG::BATTLE_ONLY || $game_temp.in_battle)
      @skills.each {|id| result += BlizzCFG.passkl_database(id)[0]}
    end
    return result
  end
  
  alias base_maxsp_passkl_later base_maxsp
  def base_maxsp
    result = base_maxsp_passkl_later
    if $game_system.PASSIVE_SKILLS &&
        (!BlizzCFG::BATTLE_ONLY || $game_temp.in_battle)
      @skills.each {|id| result += BlizzCFG.passkl_database(id)[1]}
    end
    return result
  end
  
  alias base_str_passkl_later base_str
  def base_str
    result = base_str_passkl_later
    if $game_system.PASSIVE_SKILLS &&
        (!BlizzCFG::BATTLE_ONLY || $game_temp.in_battle)
      @skills.each {|id| result += BlizzCFG.passkl_database(id)[2]}
    end
    return result
  end
  
  alias base_dex_passkl_later base_dex
  def base_dex
    result = base_dex_passkl_later
    if $game_system.PASSIVE_SKILLS &&
        (!BlizzCFG::BATTLE_ONLY || $game_temp.in_battle)
      @skills.each {|id| result += BlizzCFG.passkl_database(id)[3]}
    end
    return result
  end
  
  alias base_agi_passkl_later base_agi
  def base_agi
    result = base_agi_passkl_later
    if $game_system.PASSIVE_SKILLS &&
        (!BlizzCFG::BATTLE_ONLY || $game_temp.in_battle)
      @skills.each {|id| result += BlizzCFG.passkl_database(id)[4]}
    end
    return result
  end
  
  alias base_int_passkl_later base_int
  def base_int
    result = base_int_passkl_later
    if $game_system.PASSIVE_SKILLS &&
        (!BlizzCFG::BATTLE_ONLY || $game_temp.in_battle)
      @skills.each {|id| result += BlizzCFG.passkl_database(id)[5]}
    end
    return result
  end
  
  alias base_atk_passkl_later base_atk
  def base_atk
    result = base_atk_passkl_later
    if $game_system.PASSIVE_SKILLS &&
        (!BlizzCFG::BATTLE_ONLY || $game_temp.in_battle)
      @skills.each {|id| result += BlizzCFG.passkl_database(id)[6]}
    end
    return result
  end
  
  alias base_pdef_passkl_later base_pdef
  def base_pdef
    result = base_pdef_passkl_later
    if $game_system.PASSIVE_SKILLS &&
        (!BlizzCFG::BATTLE_ONLY || $game_temp.in_battle)
      @skills.each {|id| result += BlizzCFG.passkl_database(id)[7]}
    end
    return result
  end
  
  alias base_mdef_passkl_later base_mdef
  def base_mdef
    result = base_mdef_passkl_later
    if $game_system.PASSIVE_SKILLS &&
        (!BlizzCFG::BATTLE_ONLY || $game_temp.in_battle)
      @skills.each {|id| result += BlizzCFG.passkl_database(id)[8]}
    end
    return result
  end
  
  alias base_eva_passkl_later base_eva
  def base_eva
    result = base_eva_passkl_later
    if $game_system.PASSIVE_SKILLS &&
        (!BlizzCFG::BATTLE_ONLY || $game_temp.in_battle)
      @skills.each {|id| result += BlizzCFG.passkl_database(id)[9]}
    end
    return result
  end
  
  def gold_rate
    return 1 if BlizzCFG::BATTLE_ONLY && !$game_temp.in_battle
    result = 1.0
    @skills.each {|id| result *= BlizzCFG.passkl_database(id)[10]}
    return result
  end
  
  def exp_rate
    return 1 if BlizzCFG::BATTLE_ONLY && !$game_temp.in_battle
    result = 1.0
    @skills.each {|id| result *= BlizzCFG.passkl_database(id)[11]}
    return result
  end
  
end

#==============================================================================
# Window_BattleResult
#==============================================================================

class Window_BattleResult
  
  attr_accessor :gold
  attr_accessor :exp
  
end

#==============================================================================
# Window_BattleStatus
#==============================================================================

class Window_BattleStatus
  
  attr_accessor :level_up_flags
  
end

#==============================================================================
# Scene_Battle
#==============================================================================

class Scene_Battle
  
  alias start_phase5_passkl_later start_phase5
  def start_phase5
    unless $game_system.PASSIVE_SKILLS
      start_phase5_passkl_later
      return
    end
    old_gold, old_exp, old_levels = $game_party.gold, [], []
    $game_party.actors.each {|actor|
        old_exp.push(actor.exp)
        old_level.push(actor.level)}
    start_phase5_passkl_later
    new_gold = $game_party.gold - old_gold
    $game_party.lose_gold(new_gold)
    gold_rate = 100
    $game_party.actors.each {|actor| gold_rate *= actor.gold_rate}
    @result_window.gold = (new_gold * gold_rate / 100).to_i
    $game_party.gain_gold(@result_window.gold)
    new_exp = 0
    $game_party.actors.each_index {|i|
        if $game_party.actors[i].exp - old_exp[i] > 0
          new_exp = $game_party.actors[i].exp - old_exp[i]
        end
        $game_party.actors[i].exp = old_exp[i]}
    exp_rate = 100
    $game_party.actors.each {|actor| exp_rate *= actor.exp_rate}
    @result_window.exp = (new_exp * exp_rate / 100).to_i
    @result_window.refresh
    $game_party.actors.each_index {|i|
        @status_window.level_up_flags[i] = false
        unless $game_party.actors[i].cant_get_exp?
          $game_party.actors[i].exp += @result_window.exp
          @status_window.level_up(i) if $game_party.actors[i].level > old_level[i]
        end}
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Different Difficulties by Blizzard
# Version: 1.3b
# Date: 24.3.2007
# Date v1.1b: 27.3.2008
# Date v1.2b: 18.4.2008
# Date v1.3b: 22.4.2008
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# Instructions:
# 
#   You can always check the current difficulty of the game by using
#   
#     $game_system.difficulty_name == 'NAME'
#   
#   in your conditional branch. The NAMEs are the same as you specify in the
#   configuration below.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

if TONS_OF_ADDONS::DIFFICULTY

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Congfiguration
# 
# Use the following template to create difficulties in your game
# ['NAME', EXP_RATE, GOLD_RATE, ACTOR_DAMAGE_RATE, ENEMY_DAMAGE_RATE]
# Note that all the "rates" are in %. Values over 100 will increase, values
# under 100 will decrease the given attribute. Of course you can add/remove
# any difficulties you want, be sure to separate them with commas.
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

DIFFICULTIES = [['Easy', 150, 150, 150, 75],
                ['Normal', 100, 100, 100, 100],
                ['Hard', 75, 75, 75, 125],
                ['Impossible', 50, 50, 50, 200]]

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Congfiguration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#==============================================================================
# Game_System
#==============================================================================

class Game_System
  
  attr_reader :difficulty_name
  attr_reader :exp_rate
  attr_reader :gold_rate
  attr_reader :actor_rate
  attr_reader :enemy_rate
  
  def init_difficulty(index)
    @difficulty_name, @exp_rate, @gold_rate, @actor_rate, @enemy_rate =
        DIFFICULTIES[index]
  end
  
end

#==============================================================================
# Window_BattleResult
#==============================================================================

class Window_BattleResult
  
  attr_accessor :gold
  attr_accessor :exp
  
end

#==============================================================================
# Window_BattleStatus
#==============================================================================

class Window_BattleStatus
  
  attr_accessor :level_up_flags
  
end

#==============================================================================
# Game_Battler
#==============================================================================

class Game_Battler
  
  alias attack_effect_difficulty_later attack_effect
  def attack_effect(attacker)
    last_sr = self.sr if $crls && self.is_a?(Game_Actor)
    last_hp = self.hp
    result = attack_effect_difficulty_later(attacker)
    if result && self.damage.is_a?(Numeric)
      self.hp = last_hp
      self.hp = self.hp
      if attacker.is_a?(Game_Actor)
        self.sr = last_sr if $crls && self.is_a?(Game_Actor)
        self.damage = self.damage * $game_system.actor_rate / 100
      elsif attacker.is_a?(Game_Enemy)
        self.damage = self.damage * $game_system.enemy_rate / 100
      end
      self.hp -= self.damage
    end
    return result
  end
  
  alias skill_effect_difficulty_later skill_effect
  def skill_effect(user, skill)
    last_sr = self.sr if $crls && self.is_a?(Game_Actor)
    last_hp = self.hp
    result = skill_effect_difficulty_later(user, skill)
    if result && self.damage.is_a?(Numeric)
      self.hp = last_hp
      self.hp = self.hp
      if user.is_a?(Game_Actor)
        self.damage = self.damage * $game_system.actor_rate / 100
        self.sr = last_sr if $crls
      elsif user.is_a?(Game_Enemy)
        self.damage = self.damage * $game_system.enemy_rate / 100
      end
      self.hp -= self.damage
    end
    return result
  end
  
end
  
#==============================================================================
# Scene_Title
#==============================================================================

class Scene_Title
  
  alias main_difficulties_later main
  def main
    main_difficulties_later
    @difficulty_window.dispose if @difficulty_window != nil
  end
  
  alias command_new_game_difficulties_later command_new_game
  def command_new_game
    $game_system.se_play($data_system.decision_se)
    d = []
    DIFFICULTIES.each {|diff| d.push(diff[0])}
    @difficulty_window = Window_Command.new(@command_window.width, d)
    @difficulty_window.x = @command_window.x
    @difficulty_window.y = @command_window.y -
        (@difficulty_window.height - @command_window.height) / 2
    @difficulty_window.back_opacity = @command_window.back_opacity
    @command_window.active = @command_window.visible = false
  end
  
  alias upd_difficulties_later update
  def update
    if @difficulty_window == nil
      upd_difficulties_later
      return
    end
    @difficulty_window.update unless defined?(SDK)
    if Input.trigger?(Input::B)
      $game_system.se_play($data_system.cancel_se)
      @command_window.active = @command_window.visible = true
      @difficulty_window.dispose
      @difficulty_window = nil
    elsif Input.trigger?(Input::C)
      command_new_game_difficulties_later
      $game_system.init_difficulty(@difficulty_window.index)
    end
  end
  
end

#==============================================================================
# Scene_Battle
#==============================================================================

class Scene_Battle
  
  alias start_phase5_difficulty_later start_phase5
  def start_phase5
    old_gold, old_exp, old_level = $game_party.gold, [], []
    $game_party.actors.each {|actor|
        old_exp.push(actor.exp)
        old_level.push(actor.level)}
    start_phase5_difficulty_later
    new_gold = $game_party.gold - old_gold
    $game_party.lose_gold(new_gold)
    @result_window.gold = new_gold * $game_system.gold_rate / 100
    $game_party.gain_gold(@result_window.gold)
    new_exp = 0
    $game_party.actors.each_index {|i|
        if $game_party.actors[i].exp - old_exp[i] > 0
          new_exp = $game_party.actors[i].exp - old_exp[i]
        end
        $game_party.actors[i].exp = old_exp[i]}
    @result_window.exp = new_exp * $game_system.exp_rate / 100
    @result_window.refresh
    $game_party.actors.each_index {|i|
        @status_window.level_up_flags[i] = false
        unless $game_party.actors[i].cant_get_exp?
          $game_party.actors[i].exp += @result_window.exp
          @status_window.level_up(i) if $game_party.actors[i].level > old_level[i]
        end}
  end
  
end

end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Skill Separation System (SSS) by Blizzard
# Version: 1.33b
# Type: Game Playability Improvement
# Date: 22.3.2007
# Date v1.2b: 20.3.2008
# Data v1.3b: 23.7.2008
# Data v1.31b: 28.7.2009
# Data v1.32b: 3.10.2009
# Data v1.33b: 5.10.2009
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# new in v1.0b:
#   - beta release, it should work without bugs now
# 
# new in v1.1b:
#   - now displays only categories that the actor has learned skills in
# 
# new in v1.2b:
#   - now displays AP requirement as well if using EQUAP Skills
# 
# new in v1.3b:
#   - improved compatibility
#   - improved coding
# 
# new in v1.31b:
#   - fixed leftover bug from EQUAP
# 
# new in v1.32b:
#   - fixed bug with dummy elements when not using this add-on
# 
# new in v1.33b:
#   - fixed another small bug
# 
# 
# Explanation:
# 
#   Every of your skills will be categorized. You can put the same skill in
#   more categories. You can define category names and element dummies below.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# your skill set dummy elements
SKILL_SETS = [9, 10, 11, 12, 13, 14, 15, 16]
# names of skill sets
SKILL_SET_NAMES = ['White Magic', 'Black Magic', 'Blue Magic', 'Technic',
                    'Special Attack', 'Psy', 'Magitech', 'Overlution']
# the X offset of the drawing (try changing it to see what it does and adjust
# it how you want it to be, of course you can use negative numbers)
$x_off = 50

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

if $DUMMY_ELEMENTS != nil
  $DUMMY_ELEMENTS |= SKILL_SETS
else
  $DUMMY_ELEMENTS = SKILL_SETS.clone
end

#==============================================================================
# Game_Battler
#==============================================================================

class Game_Battler
  
  alias elements_correct_sss_later elements_correct
  def elements_correct(elements)
    return elements_correct_sss_later(elements) if !$game_system.SKILL_SEPARATION
    multiplier = size = 0
    elements.each {|i|
        unless $DUMMY_ELEMENTS.include?(i)
          multiplier += self.element_rate(i)
          size += 1
        end}
    return (size == 0 ? 100 : multiplier / size)
  end
  
end

#==============================================================================
# Window_Skill
#==============================================================================

class Window_Skill
  
  alias init_sss_later initialize
  def initialize(actor)
    if $game_system.SKILL_SEPARATION
      super(0, 128, 640, 384)
      @column_max, @index, @actor, @alt_index, @skill_ids = 1, 0, actor, [], []
      refresh
      if $game_temp.in_battle
        self.y, self.height, self.back_opacity = 64, 256, 160
      end
    else
      init_sss_later(actor)
    end
  end
  
  alias refresh_sss_later refresh
  def refresh
    unless $game_system.SKILL_SEPARATION
      refresh_sss_later
      return
    end
    if self.contents != nil
      self.contents.dispose
      self.contents = nil
    end
    if @actor != nil
      @sets = []
      SKILL_SETS.each_index {|i|
          skills = @actor.skills.find_all {|id|
              $data_skills[id].element_set.include?(SKILL_SETS[i])}
          if skills != []
            @skill_ids.push(skills)
            @alt_index.push(0)
            @sets.push(i)
          end}
      @item_max = @sets.size
      if @item_max > 0
        self.contents = Bitmap.new(width - 32, row_max * 32)
        if $fontface != nil
          self.contents.font.name = $fontface
        elsif $defaultfonttype != nil
          self.contents.font.name = $defaultfonttype
        end
        self.contents.font.size = 24
        @sets.each_index {|i| draw_item(i)}
      else
        @skill_ids.push([0])
        @alt_index.push(0)
      end
    end
  end
  
  alias draw_item_sss_later draw_item
  def draw_item(index)
    unless $game_system.SKILL_SEPARATION
      draw_item_sss_later(index)
      return
    end
    y = index * 32
    rect = Rect.new(0, y, self.width / @column_max - 32, 32)
    self.contents.fill_rect(rect, Color.new(0, 0, 0, 0))
    id = @skill_ids[index][@alt_index[index]]
    skill = $data_skills[id] if id != 0
    if skill != nil
      if @actor.skill_can_use?(skill.id)
        self.contents.font.color = normal_color
      else
        self.contents.font.color = disabled_color
      end
      bitmap = RPG::Cache.icon(skill.icon_name)
      opacity = self.contents.font.color == normal_color ? 255 : 128
      self.contents.blt(200+$x_off, y+4, bitmap, Rect.new(0, 0, 24, 24), opacity)
      text = skill.name
      if TONS_OF_ADDONS::EQUAP_SKILLS && DISPLAY_AP_REQ
        aps = BlizzCFG.maxap(skill.id)
        if aps > 0
          text += " (#{@actor.ap(skill.id)}/#{aps})"
        elsif DISPLAY_AP_ZERO
          text += ' (0/0)'
        end
      else
      end
      self.contents.draw_text(228+$x_off, y, 204, 32, text, 0)
      sp_cost = skill.sp_cost
      if $game_system.SP_COST_MOD
        sp_cost = BlizzCFG.get_cost_mod(@actor.states, sp_cost)
      end
      self.contents.draw_text(516, y, 64, 32, sp_cost.to_s, 2)
      if @skill_ids[index].size > 1
        self.contents.draw_text(184+$x_off, y, 32, 32, '«')
        self.contents.draw_text(564, y, 32, 32, '»', 2)
      end
    else
      self.contents.font.color = disabled_color
      self.contents.draw_text(228+$x_off, y, 204, 32, 'not available')
    end
    if id == 0
      color = disabled_color
    elsif @actor.skill_can_use?(id)
      color = normal_color
    else
      color = disabled_color
    end
    if SKILL_SET_NAMES[@sets[index]] == nil
      self.contents.draw_text(4, y, 288, 32, "Undefined name #{index}")
    else
      self.contents.draw_text(4, y, 288, 32, SKILL_SET_NAMES[@sets[index]])
    end
  end
  
  alias upd_sss_later update
  def update
    upd_sss_later
    return unless $game_system.SKILL_SEPARATION
    size, old_index = @skill_ids[@index].size, @alt_index[@index]
    if Input.repeat?(Input::RIGHT)
      @alt_index[@index] = (@alt_index[@index] + 1) % size
      if old_index != @alt_index[@index]
        $game_system.se_play($data_system.cursor_se)
        draw_item(@index)
      else
        $game_system.se_play($data_system.buzzer_se)
      end
    elsif Input.repeat?(Input::LEFT)
      @alt_index[@index] = (@alt_index[@index] + size - 1) % size
      if old_index != @alt_index[@index]
        $game_system.se_play($data_system.cursor_se)
        draw_item(@index)
      else
        $game_system.se_play($data_system.buzzer_se)
      end
    end
  end
  
  alias skill_sss_later skill
  def skill
    return skill_sss_later unless $game_system.SKILL_SEPARATION
    return nil if @item_max == 0
    id = @skill_ids[@index][@alt_index[@index]]
    return $data_skills[id] if id != 0
  end
  
end
=begin
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Multi-Hit by Blizzard
# Version: 1.51b
# Type: Weapon/Skill/Enemy Enhancement
# Date: 12.8.2007
# Date 1.3b: 23.2.2008
# Date 1.4b: 23.7.2008
# Date 1.5b: 19.10.2008
# Date 1.51b: 6.10.2009
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# Compatibility:
# 
#   95% compatible with SDK 1.x. 70% compatible with SDK 2.x. Might be
#   incompatible with exotic skills and/or CBS-es. Compatible with CRLS 5.1b or
#   higher.
# 
# 
# Explanation:
# 
#   This add-on will allow that skills, weapons and enemies attack more than
#   once.
# 
# new in v1.3b:
#   - now you can define weapons/skills/enemies which's other attacks will
#     target a random target instead of the originally chosen target
#   - now beta
# 
# new in v1.4b:
#   - better compatibility with SP Cost Mod
#   - improved coding
#   
# new in v1.5b:
#   - added Multi-Hit items
#   
#   
# Configuration:
#   
#   Set up the following constants to configure the script:
#   
#   WEAPON_RANDOM - add any weapon IDs here and separate them with commas to
#                   make those specific weapons attack another random target
#                   for each other hit than the first
#   SKILL_RANDOM  - add any skill IDs here and separate them with commas to
#                   make those specific skills attack another random target
#                   for each other hit than the first
#   ITEM_RANDOM   - add any item IDs here and separate them with commas to
#                   make those specific items attack another random target
#                   for each other hit than the first
#   ENEMY_RANDOM  - add any enemy IDs here and separate them with commas to
#                   make those specific enemies attack another random target
#                   for each other hit than the first
#   
#   Further there are 4 configurations. Configuration 1 is for weapons,
#   Configuration 2 is for skills, Configuration 3 is for items and
#   Configuration 3 is for normal enemy attacks. Use following template to set
#   up how many hits should be done:
# 
#     when ID then return HITS
# 
#   ID   - ID of weapon, skill, item or enemy, depending on the configuration
#          number
#   HITS - number of hits
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#==============================================================================
# module BlizzCFG
#==============================================================================

module BlizzCFG
  
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Basic Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  WEAPON_RANDOM = [0, 998]
  SKILL_RANDOM = [0] # 179 = Assault
  ITEM_RANDOM = [999]
  ENEMY_RANDOM = [0] # 175 = twins
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Basic Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

  def self.weapon_hits(id)
    case id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration 1
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 0 then return 3
    when 998 then return 4
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration 1
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    end
    return 1
  end
  
  def self.skill_hits(id)
    case id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration 2
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 179 then return 4
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration 2
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    end
    return 1
  end
  
  def self.item_hits(id)
    case id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration 3
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 999 then return 3
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration 3
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    end
    return 1
  end
  
  def self.enemy_hits(id)
    case id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration 4
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 175 then return 2
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration 4
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    end
    return 1
  end
  
end

#==============================================================================
# Scene_Battle
#==============================================================================

class Scene_Battle
  
  alias update_phase4_step1_multi_hit_later update_phase4_step1
  def update_phase4_step1(battler = nil)
    if battler != nil
      update_phase4_step1_multi_hit_later(battler)
      return
    end
    update_phase4_step1_multi_hit_later
    @repeat = [1, 1, 0]
    return unless @active_battler != nil && $game_system.MULTI_HIT
    if @active_battler.current_action.kind == 0
      if @active_battler.current_action.basic == 0
        if @active_battler.is_a?(Game_Actor)
          hits = BlizzCFG.weapon_hits(@active_battler.weapon_id)
        elsif @active_battler.is_a?(Game_Enemy)
          hits = BlizzCFG.enemy_hits(@active_battler.id)
        end
        @repeat = [hits, hits, 2]
      end
    elsif @active_battler.current_action.kind == 1
      @repeat[2] = 3
    elsif @active_battler.current_action.kind == 2
      @repeat[2] = 4
    end
  end
  
  alias update_phase4_step2_multi_hit_later update_phase4_step2
  def update_phase4_step2(battler = nil)
    if battler != nil
      update_phase4_step2_multi_hit_later(battler)
      return
    end
    update_phase4_step2_multi_hit_later
    if $game_system.MULTI_HIT && @phase4_step != 1
      if @repeat[2] == 3
        hits = BlizzCFG.skill_hits(@skill.id)
        @repeat = [hits, hits+1, 4]
      elsif @repeat[2] == 4
        hits = BlizzCFG.item_hits(@item.id)
        @repeat = [hits, hits+1, 4]
      end
    end
  end
  
  alias update_phase4_step5_multi_hit_later update_phase4_step5
  def update_phase4_step5(battler = nil)
    if battler != nil
      update_phase4_step5_multi_hit_later(battler)
      return
    end
    update_phase4_step5_multi_hit_later
    if $game_system.MULTI_HIT
      if @active_battler.current_action.kind == 1
        if BlizzCFG::SKILL_RANDOM.include?(@skill.id)
          if @active_battler.is_a?(Game_Actor)
            @active_battler.current_action.decide_random_target_for_actor
          elsif @active_battler.is_a?(Game_Enemy)
            @active_battler.current_action.decide_random_target_for_enemy
          end
        end
      elsif @active_battler.current_action.kind == 2
        if BlizzCFG::ITEM_RANDOM.include?(@item.id)
          if @active_battler.is_a?(Game_Actor)
            @active_battler.current_action.decide_random_target_for_actor
          elsif @active_battler.is_a?(Game_Enemy)
            @active_battler.current_action.decide_random_target_for_enemy
          end
        end
      elsif @active_battler.is_a?(Game_Actor)
        if BlizzCFG::WEAPON_RANDOM.include?(@active_battler.weapon_id)
          @active_battler.current_action.decide_random_target_for_actor
        end
      elsif @active_battler.is_a?(Game_Enemy)
        if BlizzCFG::ENEMY_RANDOM.include?(@active_battler.id)
          @active_battler.current_action.decide_random_target_for_enemy
        end
      end
      @phase4_step = 2 if @repeat[0] > 1 && @repeat[2] > 0
      @repeat[0] -= 1
    end
  end
  
  alias make_skill_action_result_multi_hit_later make_skill_action_result
  def make_skill_action_result(battler = nil, plus_id = nil)
    if battler != nil
      if plus_id != nil
        make_skill_action_result_multi_hit_later(battler, plus_id)
      else
        make_skill_action_result_multi_hit_later(battler)
      end
      return
    end
    make_skill_action_result_multi_hit_later
    if @repeat[2] > 3
      sp_cost = @skill.sp_cost
      if $game_system.SP_COST_MOD
        sp_cost = BlizzCFG.get_cost_mod(@active_battler.states, sp_cost)
      end
      @active_battler.sp += sp_cost
      @status_window.refresh
    end
  end
  
end
=end
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Scene_Item calling Items by Blizzard
# Version: 1.0
# Date: 27.9.2007
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# Compatibility:
# 
#   98% compatible with SDK v1.x. 80% compatible with SDK v2.x. Can cause
#   incompatiblity issues with CMS-es.
# 
# 
# Explanation:
# 
#   This script will allow you to use an item to call another Scene_Item. i.e.
#   you open a juke box and a list of all "songs" will be displayed which are
#   actually items. Upon return, the Scene_Menu will be called. 
#   
#   
# Instructions:
# 
#   Simply configure the database below. The database starts at the comment
#   START Itemcall Database. The items MUST be in your possesion, otherwise
#   you won't be able to use those items. The items are also never displayed
#   in the normal Scene_Item. Note that using such an item will consume it if
#   the item is "consumable".
# 
# 
# If you find any bugs, please report them here:
# http://forum.chaos-project.com/
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

if TONS_OF_ADDONS::ITEMCALL

#==============================================================================
# Game_System
#==============================================================================

class Game_System
  
  def item_calls(id)
    case id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Itemcall Database
#
#   Here you can define which item calls you want to use. Configure it like
#   this template:
# 
#     when ITEM_ID then return ID_ARRAY
# 
#   ITEM_ID  - the ID of the item that calls the item scene
#   ID_ARRAY - array of item IDs that are displayed in the menu that was called
#              by the item ITEM_ID
# 
# Example:
# 
#   Let's say that ITEM_ID is 26 and ID_ARRAY is [1, 4, 7]. If you use the Item
#   with ID 26 in the normal menu, a Scene_Item will be called that has only
#   the items with IDs 1, 4 and 7. Note that such items can also call a scene.
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 26 then return [1, 4, 7]
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Itemcall Database
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    end
    return []
  end
  
end

#==============================================================================
# Game_Temp
#==============================================================================

class Game_Temp
  
  attr_accessor :item_call
  
end

#==============================================================================
# Window_Item
#==============================================================================

class Window_Item
  
  def refresh
    if self.contents != nil
      self.contents.dispose
      self.contents = nil
    end
    if $game_temp.item_call != nil
      @data = []
      (1...$data_items.size).each {|i|
          if $game_party.item_number(i) > 0 && $game_temp.item_call.include?(i)
            @data.push($data_items[i])
          end}
    else
      @data, ids = [], (1...$data_items.size).to_a
      ids.clone.each {|id| ids -= $game_system.item_calls(id)}
      ids.each {|i| @data.push($data_items[i]) if $game_party.item_number(i) > 0}
      unless $game_temp.in_battle
        (1...$data_weapons.size).each {|i|
            @data.push($data_weapons[i]) if $game_party.weapon_number(i) > 0}
        (1...$data_armors.size).each {|i|
            @data.push($data_armors[i]) if $game_party.armor_number(i) > 0}
      end
    end
    @item_max = @data.size
    if @item_max > 0
      self.contents = Bitmap.new(width - 32, row_max * 32)
      @data.each_index {|i| draw_item(i)}
    end
  end
  
end

#==============================================================================
# Scene_Item
#==============================================================================

class Scene_Item
  
  alias main_itemcall_later main
  def main
    main_itemcall_later
    $game_temp.item_call = nil unless $scene.is_a?(Scene_Item)
  end
  
  alias update_item_itemcall_later update_item
  def update_item
    @item = @item_window.item
    ids = $game_system.item_calls(@item.id)
    if ids != [] && [0, 2].include?(@item.occasion) && Input.trigger?(Input::C)
      $game_system.se_play($data_system.decision_se)
      $game_party.lose_item(@item.id, 1) if @item.consumable
      $game_temp.item_call, $scene = ids, Scene_Item.new
    else
      update_item_itemcall_later
    end
  end

end

end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Plug-in Save Point by Blizzard
# Version: 2.1b
# Type: Development Tool for Non-Scripters
# Date: 26.5.2006
# Date v2.0: 20.10.2007
# Date v2.0b: 20.2.2008
# Date v2.1b: 3.4.2008
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# Compatibility:
# 
#   99% compatible with SDK v1.x. 90% compatible with SDK v2.x. Could cause
#   problems with CMS-es, but very unlikely. Could cause problems with callable
#   scenes.
# 
# 
# Explanation:
# 
#   This add-on allows you to create a save point like menu where the player
#   can change to any scene you specify. You are not limited to savepoints.
# 
# 
# Features:
# 
#   - create a menu that calls scenes within minutes
#   - use any script you have; this add-on allows you to call any scene
#   - returns to the calling scene after finishing processing the other scene
# 
# 
# new in v2.0:
#   - first REAL public release
#   - completely overworked
#   - now supports any scene
# 
# new in v2.0b:
#   - fixed a bug caused by a typing mistake
#   - now beta
# 
# new in v2.1b:
#   - fixed a bug in the configuration setup
# 
# 
# Instructions:
#   
# - Configuration:
# 
#   SCENE_CALLS - add any scene class declarations from other scripts like
#                 Scene_PartySwitcher, Scene_Bestiary, etc., you can also add
#                 any default scene like Scene_Save, Scene_Load, Scene_End etc.
#   SCENE_NAMES - add here the corresponding names for the scenes (in other
#                 words: you can call your scenes however you like)
#   WIN_WIDTH   - if your text gets squeezed together, increase this value
#   EXIT_SAVE   - word displayed to exit the Scene_SavePoint
#   MAP_BACK    - set to false if you don't want a map background or set to
#                 filename of picture file located in your "Pictures" folder
#                 that should be displayed as background
#   HOW_TO_BACK - if you are using a picture as background, set this value to 1
#                 if you want a centered background, to 2 if you want a
#                 stretched background and to 0 if you want it simply to stay
#                 in the upper left corner
# 
# - Additional Funtions:
#   
#   You can call the Save Point by using the "Call Script" Event Command. Type
#   in the window following syntax:
#   
#     $scene = Scene_SavePoint.new
#   
#   When calling the scene, you can also specify disabled items by using an
#   array of indices.
#   
#     $scene = Scene_SavePoint.new([0, 2, 3])
#   
#   This example would disable the 1st, the 3rd and the 4th option.
# 
# 
# If you find any bugs, please report them here:
# http://forum.chaos-project.com/
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

if TONS_OF_ADDONS::SAVEPOINT

#==============================================================================
# module BlizzCFG
#==============================================================================

module BlizzCFG
  
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  SCENE_CALLS = ['Scene_Save', 'Scene_Load', 'Scene_End']
  SCENE_NAMES = ['Save Game', 'Load Game', 'End Game']
  WIN_WIDTH = 192
  EXIT_SAVE = 'Exit'
  MAP_BACK = true
  HOW_TO_BACK = 2
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

end

#==============================================================================
# Scene_SavePoint
#==============================================================================

class Scene_SavePoint
  
  def initialize(disabled = [])
    @disabled, @scene = disabled, $scene.class
  end
    
  def main
    if BlizzCFG::MAP_BACK == true
      @spriteset = Spriteset_Map.new
    elsif BlizzCFG::MAP_BACK != false
      @spriteset = Sprite.new
      @spriteset.bitmap = RPG::Cache.picture(BlizzCFG::MAP_BACK)
      case BlizzCFG::HOW_TO_BACK
      when 1
        @spriteset.x = 320 - @spriteset.bitmap.width/2
        @spriteset.y = 240 - @spriteset.bitmap.height/2
      when 2
        @spriteset.zoom_x = 640.0 / @spriteset.bitmap.width
        @spriteset.zoom_y = 480.0 / @spriteset.bitmap.height
      end
    end
    @command_window = Window_Command.new(BlizzCFG::WIN_WIDTH,
        BlizzCFG::SCENE_NAMES + [BlizzCFG::EXIT_SAVE])
    @disabled.each {|i| @command_window.disable_item(i)}
    @command_window.x, @command_window.y, @command_window.opacity = 16, 16, 160
    Graphics.transition
    loop do
      Graphics.update
      Input.update
      update
      break if $scene != self
    end
    Graphics.freeze
    @spriteset.dispose if BlizzCFG::MAP_BACK != false
    @command_window.dispose
    if @scene != nil
      $scene.main
      $scene = self
    end
  end
  
  def update
    @command_window.update
    if Input.trigger?(Input::B)
      $game_system.se_play($data_system.cancel_se)
      $scene, @scene = @scene.new, nil
    elsif Input.trigger?(Input::C)
      if @command_window.index == BlizzCFG::SCENE_NAMES.size
        $game_system.se_play($data_system.decision_se)
        $scene, @scene = @scene.new, nil
      elsif @disabled.include?(@command_window.index)
        $game_system.se_play($data_system.buzzer_se)
      else
        $game_system.se_play($data_system.decision_se)
        eval("$scene = #{BlizzCFG::SCENE_CALLS[@command_window.index]}.new")
      end
    end
  end
    
end

end

#==============================================================================
#   Equipment Requirement System v2.10
#------------------------------------------------------------------------------
#   Created By: NAMKCOR
#   Created for the Websites: Chaos Project, RPG Maker Resource Kit
#                                        (www.chaosproject.co.nr; www.rmrk.net)
#   If this script is hosted on any other website, then it is stolen,
#   please contact me at the address given below
#   Requested by: SirMagus (RMRK)
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# - code reviewed, optimized and integrated into Tons of Add-ons by Blizzard
# - this add-on is part of Tons of Add-ons with full permission of the original
#   author(s)
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
#   If you find any Bugs/Incompatability issues with this script, please
#   contact me at the following e-mail address: Rockman922@aol.com, and 
#   please be descriptive with your e-mail subject, as I delete spam on sight.
#------------------------------------------------------------------------------
#   Function:
#    sets prerequisites for armor and weapons, based on level and statistics
#    i.e. they are unequippable until the requirements are met
#    like in Diablo II
#   
#   Compatability:
#    most likely compatible with SDK (untested)
#    no known issues at the moment
#   
#   Instructions to modify:
#    Comments and instructions for the individual customizations will be given
#    right where they are located.  Only real skills needed are reading, typing,
#    and copy&paste
#   
#   Instructions for use:
#    simply fill in the case sets instructed and the script will do the rest
#   
#------------------------------------------------------------------------------
#   Version History:
#   1.0 - completed system
#   2.0 - Major overhaul of the code, easier to configure, more efficient
#   2.1 - more efficient code (thanks for the help Blizz)
#==============================================================================

module NAMKCOR

  #============================================================================
  # to configure weapons' requirements you simply need to add a "when"
  # to the case of either weapons or armors, and then fill in the array
  # of requirements in the proper order
  #----------------------------------------------------------------------------
  # template:
  #   when (id) return [(level), (str), (dex), (agi), (int)]
  #============================================================================
  def self.ers_config(item)
    # weapon configuration
    if item.is_a?(RPG::Weapon)
      case item.id
      # START Weapon Configuration
      when 2 then return [2,0,0,0,0]
      when 3 then return [5,90,0,0,0]
      # END Weapon Configuration
      end
    elsif item.is_a?(RPG::Armor)
      case item.id
      # START Armor Configuration
      when 2 then return [2,0,0,0,0]
      when 4 then return [3,0,0,0,0]
      when 5 then return [3,0,0,0,0]
      # END Armor Configuration
      end
    end
    return [1,0,0,0,0]
  end

end
  
#==============================================================================
# DO NOT EDIT BELOW THIS LINE UNLESS YOU KNOW WHAT YOU ARE DOING
#==============================================================================

class Scene_Equip

  alias update_item_ers_later update_item
  def update_item
    if $game_system.EQUIPMENT_REQUIREMENT
      itemstats = NAMKCOR.ers_config(@item_window.item)
      if Input.trigger?(Input::C) && (@actor.level < itemstats[0] ||
          @actor.str < itemstats[1] || @actor.dex < itemstats[2] ||
          @actor.agi < itemstats[3] || @actor.int < itemstats[4])
        $game_system.se_play($data_system.buzzer_se) 
        return 
      end
    end
    update_item_ers_later
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Item Requirement for Skills by Blizzard
# Version: 1.0
# Type: Game Alteration
# Date: 7.12.2007
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
#   This add-on can make skills require items to be used. Those skills cannot
#   be used if the appropriate number of items is not in the inventory. Items
#   will be consumed ONLY IF THEY ARE CONSUMABLE! Enemies do not consume items
#   when they use the same skills.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

module BlizzCFG
  
  def self.item_reqs(id)
    case id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Item Requirement Database
#   
#   Use following template to configure your database below:
#     
#     when SKILL_ID then return [ITEM_ID, QUANTITY]
#   
#   SKILL_ID - ID of the skill
#   ITEM_ID  - ID of the required item
#   QUANTITY - how many items the skill requires
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 81 then return [37, 1] #Chloroform
    #when 82 then return [34, 1] #Subdue
    #when 134 then return [34, 1] #Secure
    when 138 then return [48, 1] #Smokescreen
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Item Requirement Database
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    end
    return [0, 0]
  end
  
end

#==============================================================================
# Game_Battler
#==============================================================================

class Game_Battler
  
  alias skill_effect_item_reqs_later skill_effect
  def skill_effect(user, skill)
    result = skill_effect_item_reqs_later(user, skill)
    if $game_system.ITEM_REQUIREMENT
      data = BlizzCFG.item_reqs(skill.id)
      if user.is_a?(Game_Actor) && data.all? {|i| i > 0}
        $game_party.lose_item(data[0], data[1])
      end
    end
    return result
  end
  
  alias skill_can_use_item_reqs_later? skill_can_use?
  def skill_can_use?(skill_id)
    if $game_system.ITEM_REQUIREMENT
      data = BlizzCFG.item_reqs(skill_id)
      if self.is_a?(Game_Actor) && $game_party.item_number(data[0]) < data[1]
        return false
      end
    end
    return skill_can_use_item_reqs_later?(skill_id)
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# HP/SP Crush by Blizzard
# Version: 1.0
# Type: Game Alteration
# Date: 3.4.2008
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
#   This add-on allows you to make weapons consume HP/SP for each attack. The
#   attack will not be executed if there are not enough HP or SP. The actor can
#   use up all SP and/or all HP (except 1) for an attack to succeed. If you use
#   negative values in the configuration, the stats will be restored instead of
#   consumed.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

module BlizzCFG
  
  def self.hpsp_crush(id)
    case id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START HP/SP Crush Database
#   
#   Use following template to configure your database below:
#     
#     when WEAPON_ID then return [HP_CONSUME, SP_CONSUME]
#   
#   WEAPON_ID  - ID of the weapon
#   HP_CONSUME - how many HP are consumed when attacking
#   SP_CONSUME - how many SP are consumed when attacking
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 1 then return [100, 0]
    when 2 then return [0, 50]
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END HP/SP Crush Database
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    end
    return [0, 0]
  end
  
end

#==============================================================================
# Game_Battler
#==============================================================================

class Game_Battler
  
  def attack_can_use?
    reqs = BlizzCFG.hpsp_crush(@weapon_id)
    return (reqs[0] < self.hp && reqs[1] <= self.sp)
  end
  
end

#==============================================================================
# Scene_Battle
#==============================================================================

class Scene_Battle
  
  alias make_basic_action_result_hpsp_crush_later make_basic_action_result
  def make_basic_action_result(battler = nil)
    if battler != nil
      current_battler = battler
    else
      current_battler = @active_battler
    end
    if $game_system.HP_SP_CRUSH && current_battler.is_a?(Game_Actor)
      return unless current_battler.attack_can_use?
      reqs = BlizzCFG.hpsp_crush(current_battler.weapon_id)
      current_battler.hp -= reqs[0]
      current_battler.sp -= reqs[1]
      @status_window.refresh
    end
    if battler == nil
      make_basic_action_result_hpsp_crush_later
    else
      make_basic_action_result_hpsp_crush_later(battler)
    end
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Roulette by Blizzard
# Version: 1.0b
# Type: Skill Add-on
# Date: 19.10.2008
# Date v1.0b: 6.10.2009
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
#   This add-on allows you to create skills that target a random actor, random
#   enemy or random battler from both groups with a nice animation. The normal
#   target scope in the database should be set to "None".
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#==============================================================================
# module BlizzCFG
#==============================================================================

module BlizzCFG
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  # targets random ally
  TARGET_ALLY = [57]
  # targets random dead ally
  TARGET_DEAD_ALLY = [58]
  # targets random enemy
  TARGET_ENEMY = [59]
  # targets random battler from both groups
  TARGET_RANDOM = [60]
  # show roulette animation
  ROULETTE_ANIMATE = true
  # sound effect when switching the battler during animation
  ROULETTE_SOUND = RPG::AudioFile.new('001-System01', 80, 100)
  # time the arrow stays on one battler during animation (4 is recommended)
  ROULETTE_STOP_FRAME = 4
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  # compatibility constants
  SCOPE_RANDOM_ALLY = 101
  SCOPE_RANDOM_DEAD_ALLY = 102
  SCOPE_RANDOM_ENEMY = 103
  SCOPE_RANDOM = 104
  
  def self.get_next_target(count, max_count, target, battlers)
    next_target = nil
    if count > max_count / 2
      if count % ROULETTE_STOP_FRAME == 0
        $game_system.se_play(ROULETTE_SOUND)
        next_target = battlers.shift
        battlers.push(next_target)
      end
    elsif count > max_count / 4
      if count % (ROULETTE_STOP_FRAME * 2) == 0
        $game_system.se_play(ROULETTE_SOUND)
        next_target = battlers.shift
        battlers.push(next_target)
      end
    elsif count > max_count / 8
      next_target = target if count % (ROULETTE_STOP_FRAME * 4) == 0
    else
      next_target = target
    end
    return next_target
  end
  
end

#==============================================================================
# RPG::Skill
#==============================================================================

class RPG::Skill
  
  alias scope_roulette_later scope
  def scope
    if $game_system.ROULETTE
      if BlizzCFG::TARGET_ALLY.include?(@id)
        return BlizzCFG::SCOPE_RANDOM_ALLY
      elsif BlizzCFG::TARGET_DEAD_ALLY.include?(@id)
        return BlizzCFG::SCOPE_RANDOM_DEAD_ALLY
      elsif BlizzCFG::TARGET_ENEMY.include?(@id)
        return BlizzCFG::SCOPE_RANDOM_ENEMY
      elsif BlizzCFG::TARGET_RANDOM.include?(@id)
        return BlizzCFG::SCOPE_RANDOM
      end
    end
    return scope_roulette_later
  end
  
end

#==============================================================================
# Arrow_Roulette
#==============================================================================

class Arrow_Roulette < Arrow_Base
  
  attr_reader :count
  
  def initialize(target, battlers, viewport = nil)
    @target, @battlers = target, battlers
    @count = @max_count = BlizzCFG::ROULETTE_STOP_FRAME * 40
    super(viewport)
    self.visible = false
  end
  
  def update(override = false)
    return unless override
    self.visible = true
    super()
    next_target =
        BlizzCFG.get_next_target(@count, @max_count, @target, @battlers)
    @count -= 1
    if next_target != nil
      if @current_target != next_target
        $game_system.se_play(BlizzCFG::ROULETTE_SOUND)
      end
      @current_target = next_target
      self.x = @current_target.screen_x
      self.y = @current_target.screen_y
    end
  end
  
end
  
#==============================================================================
# Scene_Battle
#==============================================================================

class Scene_Battle
  
  alias set_target_battlers_roulette_later set_target_battlers
  def set_target_battlers(scope, battler = nil)
    if $game_system.ROULETTE
      b = battler == nil ? @active_battler : battler
      battlers = []
      if scope == BlizzCFG::SCOPE_RANDOM_ALLY && b.is_a?(Game_Actor) ||
          scope == BlizzCFG::SCOPE_RANDOM_ENEMY && b.is_a?(Game_Enemy)
        battlers = $game_party.actors.find_all {|a| a.exist?}
      elsif scope == BlizzCFG::SCOPE_RANDOM_DEAD_ALLY && b.is_a?(Game_Actor)
        battlers = $game_party.actors.find_all {|a| a.dead?}
      elsif scope == BlizzCFG::SCOPE_RANDOM_ALLY && b.is_a?(Game_Enemy) ||
          scope == BlizzCFG::SCOPE_RANDOM_ENEMY && b.is_a?(Game_Actor)
        battlers = $game_troop.enemies.find_all {|a| a.exist?}
      elsif scope == BlizzCFG::SCOPE_RANDOM
        battlers = ($game_party.actors + $game_troop.enemies).find_all {|a|
            a.exist?}
      else
        battlers = nil
      end
      if battlers != nil
        target = battlers[rand(battlers.size)]
        if BlizzCFG::ROULETTE_ANIMATE
          while 25 % battlers.size != battlers.index(target)
            battlers.push(battlers.shift)
          end
          @roulette_arrow = Arrow_Roulette.new(target, battlers)
        end
        (battler == nil ? @target_battlers : battler.target).push(target)
        return
      end
    end
    if battler != nil
      set_target_battlers_roulette_later(scope, battler)
    else
      set_target_battlers_roulette_later(scope)
    end
  end
  
  alias update_phase4_step4_roulette_later update_phase4_step4
  def update_phase4_step4(battler = nil)
    if @roulette_arrow != nil
      if @roulette_arrow.count > 0
        @roulette_arrow.update(true)
      else
        @roulette_arrow.dispose
        @roulette_arrow = nil
      end
    elsif battler != nil
      update_phase4_step4_roulette_later(battler)
    else
      update_phase4_step4_roulette_later
    end
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Chain Status Effects by Blizzard
# Version: 1.0b
# Type: Status Add-on
# Date: 29.10.2008
# Date v1.0b: 5.10.2009
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
#   This add-on allows you to create status effects that need to be part of
#   a status effect chain reaction. i.e. Status B has status A as precondition,
#   then status B cannot be inflicted as long as status A has not been
#   inflicted first. Keep in mind that your skills/weapons/items/etc. have to
#   be able to inflict the next status effect in the chain!
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#==============================================================================
# module BlizzCFG
#==============================================================================

module BlizzCFG
  
  def self.chain_state_database(id)
    case id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Chain Status Effect Database
# 
#   Use following template to create gold loot for enemies:
# 
#     when ID then return [[REMOVE, S_ID1, S_ID2, ...], [REMOVE, S_ID3, ...], ...]
# 
#   ID     - status effect ID
#   S_ID   - status effect ID precondition
#   REMOVE - flag if previous states should be removed
# 
#   Example:
# 
#     when 3 then return [[false, 1, 2, 5], [true, 7, 8], [false, 1, 8]]
#   
#   Status Effect with ID 3 can be triggered with one of the following status
#   effect combinations:
#   
#     a) Status effects 1, 2 and 5
#     b) Status effects 7 and 8
#     c) Status effects 1 and 8
#   
#   If ANY of these combination applies, the new status effect will be applied.
#   In the b) case the old states (7 and 8) will be removed when 3 is
#   inflicted. If both condition a) and c) apply, then a) will be executed as
#   is comes first so it has higher priority.
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 3 then return [[false, 1, 2, 5], [true, 7, 8], [false, 1, 8]]
    when 4 then return [[true, 5]]
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Chain Status Effect Database
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    end
    return []
  end
  
end
  
#==============================================================================
# Game_Battler
#==============================================================================

class Game_Battler
  
  alias states_plus_chain_status_later states_plus
  def states_plus(plus_state_set, battler = nil)
    plus_state_set, battler = battler, plus_state_set if battler != nil
    if $game_system.CHAIN_STATUS
      state_set, chain_states, chain_conditions = plus_state_set.clone, [], []
      plus_state_set.each {|state_id|
          data = BlizzCFG.chain_state_database(state_id)
          if data.size > 0
            data.each {|condition|
                if condition[1, condition.size-1].all? {|id| @states.include?(id)}
                  chain_states.push(state_id)
                  chain_conditions.push(condition)
                  break
                end}
            state_set.delete(state_id) unless chain_states.include?(state_id)
          end}
      current_chain_states = chain_states & @states
      result = states_plus_chain_status_later(state_set)
      chain_states.each_index {|i|
          if !current_chain_states.include?(chain_states[i]) &&
              @states.include?(chain_states[i]) && chain_conditions[i][0]
            chain_conditions[i][1, chain_conditions[i].size-1].each {|id|
                remove_state(id)}
          end}
      return result
    elsif battler != nil
      return states_plus_chain_status_later(battler, plus_state_set)
    else
      return states_plus_chain_status_later(plus_state_set)
    end
  end
  
end

#==============================================================================
# ** Actor-specific Item Usability
#------------------------------------------------------------------------------
# by Fantasist
# Version 1.0
# 21-Nov-2008
#------------------------------------------------------------------------------
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# - code reviewed, optimized, integrated into Tons of Add-ons, freed from
#   potential bugs and beta tested by Blizzard
# - this add-on is part of Tons of Add-ons with full permission of the original
#   author(s)
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
#------------------------------------------------------------------------------
# Version History:
#
#   v1.0 - First release
#------------------------------------------------------------------------------
# Description:
#
#     This scriptlet enables you to define which items can't be consumed by
#   each actor. For example, actor ID 4 (who maybe a robot) cannot use
#   "Potion". Similarly, actor ID 1 (Arshes) cannot consume "Recharge Cell".
#------------------------------------------------------------------------------
# Compatibility:
#
#    - Should be compatible with most scripts.
#------------------------------------------------------------------------------
# Instructions:
#
#   Place this below "Scene_Debug" and above "Main"
#------------------------------------------------------------------------------
# Configuration:
#
#     Scroll down and you'll find the configuration.
#
#   The main syntax is:
#
#     when ACTOR_ID then [IDs of all items which this actor CAN'T use]
#
#   Examples:
#
#     when 1 then [1, 2] # Arshes can't use "Potion" and "High Potion".
#
#     when 7 then [10, 11, 12] # Gloria can't use "Full Tonic", "Antidote" and
#                              # "Dispell Herb".
#
#   NOTE: For all actors without a configuration, items are usable by default.
#         So if Basil can use all items, then you don't need to configure for
#         ID 2.
#------------------------------------------------------------------------------
# Issues:
#
#     None that I know of.
#------------------------------------------------------------------------------
# Credits and Thanks:
#
#   Credits: Fantasist, for making this
#   Thanks: Spoofus, for requesting this
#------------------------------------------------------------------------------
# Notes:
#
#   If you have any problems or suggestions, you can find me at:
#
#    - www.chaos-project.com
#    - www.quantumcore.forumotion.com
#
#   Enjoy ^_^
#============================================================================

#==============================================================================
# * module FTSConfigs
#==============================================================================

module FTSConfigs
  
  def self.item_can_consume?(actor_id, item_id)
    nonusable_item_ids = case actor_id
    #==========================================================================
    # * CONFIG BEGIN
    #==========================================================================
    when 1 then [1]
    when 2 then [2]
    # when ACTOR_ID then [IDs of all items which this actor CAN'T use]
    #==========================================================================
    # * CONFIG END
    #==========================================================================
    else
      []
    end
    return !nonusable_item_ids.include?(item_id)
  end
  
end

#==============================================================================
# * Game_Battler
#==============================================================================

class Game_Battler
  
  alias item_effect_actoritem_override item_effect
  def item_effect(item)
    if $game_system.ACTOR_ITEMS && self.is_a?(Game_Actor)
      return false if !FTSConfigs.item_can_consume?(self.id, item.id)
    end
    return item_effect_actoritem_override(item)
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=#
# Percentage Health States by TerreAqua
# Version: 1.5
# Type: Battle States Add-on
# Key Term: Battle Add-on
# Date: 6/17/09
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# - code reviewed, optimized, integrated into Tons of Add-ons, freed from
#   potential bugs and beta tested by Blizzard
# - this add-on is part of Tons of Add-ons with full permission of the original
#   author(s)
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=#

#===============================================================================
# Information
#-------------------------------------------------------------------------------
#
#   This script makes it so that battlers will gain states when they are below a
#   certain percentage of health.  The states would be automatically lost when 
#   the battler's health is above the configured percentage.
#   Note:  this affects all actors and enemies.
#
#   If you need to contact me about this script, please go to:
#   http://forum.chaos-project.com
#===============================================================================
module Aqua
  module HealthStates
#:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~#
#:~:~:~:~:~:~:~:~:~:~::~:~:~: Instructions :~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~#
#:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~#
#===============================================================================
# Configure the below modules in the following format:
#
# MODULE = [[X, Y]]
#
# MODULE is the below modules.  You don't change these, and they all follow the
#    same format.
# X is the percent of health for the state to activate (can be a decimal).
# Y is the state id.
#
#===============================================================================

# HP States that affect all battlers
HP_STATES_ALL = [[15, 19]] # 15%, Weakened

# HP States that only affect actors
HP_STATES_ACTORS = []

# Actor specific HP States
# Format is:  when ACTOR_ID then return [[X, Y]]
def self.actor(id)
  case id
  when 0 then return [[0, 0], [0, 0]]
  when 0 then return [[0, 0]]
  end
  return []
end

# HP States that only affect enemies
HP_STATES_ENEMIES = []

# Enemy specific HP States
# Format is:  when ENEMY_ID then return [[X, Y]]
def self.enemy(id)
  case id
  when 0 then return [[0, 0]]
  end
  return []
end

#:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~#
#:~:~:~:~:~:~:~:~:~:~:~:~  End Configure Area  :~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~#
#:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~#

end
end

#===============================================================================
# Credits:
# Aqua (aka TerreAqua) for making this.
# Subsonic_Noise for requesting that I release it.
# Starrodkirby86 for letting me rant to him.
#===============================================================================

class Game_Battler
  
  alias hp_is_hp_percent_states hp=
  def hp=(value)
    hp_is_hp_percent_states(value)
    check_hp_percent_states if $game_system.HP_PERCENT_STATES
  end
  
  def check_hp_percent_states
    states = Aqua::HealthStates::HP_STATES_ALL.clone
    if self.is_a?(Game_Actor)
      states |= Aqua::HealthStates.actor(self.id)
      states |= Aqua::HealthStates::HP_STATES_ACTORS
    elsif self.is_a?(Game_Enemy)
      states |= Aqua::HealthStates.enemy(self.id)
      states |= Aqua::HealthStates::HP_STATES_ENEMIES
    end
    states.each {|state| check_hp_percent_state(state[0], state[1])}
  end
  
  def check_hp_percent_state(hp_percent, state_id)
    #edited by kreelos
    if is_a? Game_Enemy
      if $data_enemies[@enemy_id].state_ranks[25] == 1
          add_state(25) # kreelos
      end
    end
    #end edit by kreelos
    if self.hp * 100 / self.maxhp <= hp_percent
      add_state(state_id)
    else
      remove_state(state_id)
    end
  end
  
end
