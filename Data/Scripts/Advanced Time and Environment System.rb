#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Advanced Time and Environment System (ATES) by Blizzard
# Version: 0.4
# Type: Autonomous Timeflow and Environment Controller
# Date v0.3: 11.3.2008
# Date v0.31: 8.4.2009
# Date v0.32: 13.4.2009
# Date v0.33: 4.5.2009
# Date v0.34: 5.5.2009
# Date v0.4: 28.12.2009
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
# Compatibility:
# 
#   99% compatible with SDK v1.x. 90% compatible with SDK 2.x. WILL corrupt old
#   savegames. Can cause incompatibilty issues with DNS-es.
# 
# 
# Features:
# 
#   - complete control over and easy manipulating of time
#   - nice day and night tinting
#   - HUD clock optional
#   - easier to control and more powerful than DDNS
# 
# 
# IMPORTANT NOTES:
# 
# - This system has a working preconfiguration, be aware that a custom setup
#   will need you to understand what each option does, so please read the
#   configuration instructions.
# - Why does this system use switches to determine whether it's day or night?
#   Simple: You can use conditions in enemy attacks to determine whether an
#   attack should be used only at night or only at day.
# 
# 
# Instructions:
# 
# - Explanation:
# 
#   This Time System will make your game have daytime and nighttime periods.
#   The screen will be tinted accordingly. You can set up the length of the
#   day. Other features are explained below. Please be sure to configure this
#   system appropriately.
# 
# 
# - Basic manipulation of ATES:
# 
#   This system is based upon your eventing. It will work basically if you
#   want, but with a little bit of using the "Call Script" event command you
#   are able to control this system fully. You can call following commands:
# 
#     ATES.on
#   Turns ATES on.
# 
#     ATES.off
#   Turns ATES off.
# 
#     ATES.tint_on
#   Turns ATES's screen tinting on.
# 
#     ATES.tint_off
#   Turns ATES's screen tinting off.
# 
#     ATES.clock_on
#   Turns ATES's clock display on.
# 
#     ATES.clock_off
#   Turns ATES's clock display off.
# 
#     ATES.active?
#   Returns true if ATES is turned on, otherwise false.
# 
#     ATES.tinting?
#   Returns true if ATES tinting is turned on, otherwise false.
# 
#     ATES.day?
#   Returns true if it's day, otherwise false. Alternatively you can check the
#   assigned switch instead.
# 
#     ATES.night?
#   Returns true if it's night, otherwise false. Alternatively you can check
#   the assigned switch instead.
#   
#     ATES.advance(M, H)
#   This will make the time advanced by M minutes and H hours. Any negative
#   value used will cancel the execution of this command.
#   
#     ATES.make_it_day
#   This is a feature from DDNS which allows you to quickly jump to the
#   daytime.
#   
#     ATES.make_it_night
#   This is a feature from DDNS which allows you to quickly jump to the
#   nighttime.
#   
# 
# - Enhancement hints:
# 
#   If you wish to implement the DDNS further into your game and e.g. allow
#   different behavious of monsters during day and night, you only need to
#   check the the state of the appropriate switch. e.g. If NSWITCH is turned
#   on inflict "Sleep" on one enemy.
# 
# 
# Additional info:
# 
#   The daytime and nighttime tintings were tested appropriately and optimal
#   tinting is being used.
#   Keep in mind that ATES is initially turned off, you need to turn it on by
#   using the ATES.on and ATES.tint_on commands together.
# 
# 
# If you find any bugs, please report them here:
# http://forum.chaos-project.com
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

module ATES
  
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  # switch ID of the "day" switch
  DSWITCH = 310
  # switch ID of the "night" switch
  NSWITCH = 311
  # length of a day in seconds in-game, can't be less than 36, is being
  # quantized into intervals of 36 seconds
  LENGTH = 180
  # how much time is it when the "day" starts
  DAY_START = 8
  # how much time is it when the "night" starts
  NIGHT_START = 20
  # makes the screen brighter during "summer" days
  OVERLIGHTING = true
  # makes the screen darker during the night, not recommended
  OVERDARKENING = false
  # display HUD clock
  SHOW_CLOCK = true
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  
  $ates = 0.4
  
  #============================================================================
  # ATES::Time
  #============================================================================
  
  class Time
    
    attr_accessor :hour
    attr_accessor :min
    
    def initialize(m = 0, h = 0)
      @hour, @min = h, m
    end
    
  end
  
  def self.on
    $game_system.ates.active = true
    return true
  end
  
  def self.off
    $game_system.ates.active = false
    return true
  end
  
  def self.tint_on
    $game_system.ates.tinting = true
    return true
  end
  
  def self.tint_off
    $game_system.ates.tinting = false
    return true
  end
  
  def self.clock_on
    $game_system.show_clock = true
    return true
  end
  
  def self.clock_off
    $game_system.show_clock = false
    return true
  end
  
  def self.active?
    return $game_system.ates.active
  end
  
  def self.tinting?
    return $game_system.ates.tinting
  end
  
  def self.day?
    $game_system.ates.day?
  end
  
  def self.night?
    $game_system.ates.night?
  end
  
  def self.make_it_day
    $game_system.ates.time.hour = DAY_START
    $game_system.ates.time.min = 0
    return true
  end
  
  def self.make_it_night
    $game_system.ates.time.hour = NIGHT_START
    $game_system.ates.time.min = 0
    return true
  end
  
  def self.day_start
    return DAY_START
  end
  
  def self.night_start
    return NIGHT_START
  end
  
  def self.advance(m = 1, h = 0)
    return false if m < 0 || h < 0
    h += ($game_system.ates.time.min + m) / 60
    $game_system.ates.time.hour = ($game_system.ates.time.hour + h) % 24
    $game_system.ates.time.min = ($game_system.ates.time.min + m) % 60
    return true
  end
  
end

if ATES::DAY_START > ATES::NIGHT_START
  raise 'ATEScfgError: A night can\'t start earlier than a day.'
elsif ATES::LENGTH < 36
  raise 'ATEScfgError: A day\'s length must be equal to or greater than 36 seconds!'
end

#==============================================================================
# Game_System
#==============================================================================

class Game_System
  
  attr_accessor :ates
  attr_accessor :show_clock
  
  alias init_ates_later initialize
  def initialize
    init_ates_later
    @ates = Game_ATES.new
    @show_clock = ATES::SHOW_CLOCK
  end

end

#==============================================================================
# Game_ATES
#==============================================================================

class Game_ATES
  
  attr_accessor :time
  attr_accessor :frame_count
  attr_accessor :active
  attr_accessor :tinting
  
  def initialize
    @time = ATES::Time.new(0, 0)
    @frame_count = 0
    @active = false
    @tinting = false
  end
  
  def update
    if @active
      update_progress
      update_ates_progress
    end
    update_switches
    update_screen
  end
  
  def update_progress
    @frame_count += 1
  end
  
  def update_ates_progress
    ATES.advance if @frame_count % (ATES::LENGTH / 36) == 0
  end
  
  def update_switches
    if ATES.day?
      $game_map.need_refresh = true if $game_switches[ATES::NSWITCH]
      $game_switches[ATES::DSWITCH] = true
      $game_switches[ATES::NSWITCH] = false
    else
      $game_map.need_refresh = true if $game_switches[ATES::DSWITCH]
      $game_switches[ATES::DSWITCH] = false
      $game_switches[ATES::NSWITCH] = true
    end
  end
  
  def update_screen
    $game_screen.start_tone_change(self.get_tint, 0) if @tinting
  end
  
  def day?
    return (@time.hour.between?(ATES::DAY_START, ATES::NIGHT_START - 1))
  end
  
  def night?
    return (!self.day)
  end
  
  def get_tint
    return (self.day? ? self.get_day_tint : self.get_night_tint)
  end
  
  def get_day_tint
    day, night = ATES.day_start, ATES.night_start
    ratio = ((@time.hour - day) * 60 + @time.min) * 255 / (60 * (night - day))
    tone = Tone.new(0, 0, 0, 0)
    if ratio >= 224
      tone.red = (232 - ratio) * 4
      tone.green = (208 - ratio) * 2
    elsif ratio >= 192
      tone.red = ratio - 192
      tone.green = 192 - ratio
    elsif ATES::OVERLIGHTING
      if ratio >= 160
        tone.red = tone.green = tone.blue = 192 - ratio
      elsif ratio >= 96
        tone.red = tone.green = tone.blue = 32
      elsif ratio >= 64
        tone.red = tone.green = tone.blue = ratio - 64
      end
    end
    return tone
  end
  
  def get_night_tint
    day, night = ATES.day_start, ATES.night_start
    hour = (@time.hour >= night ? @time.hour : @time.hour + 24)
    ratio = ((hour - night) * 60 + @time.min) * 255 / (60 * (day + 24 - night))
    tone = Tone.new(-96, -96, 0, 0)
    if ratio >= 224
      tone.red = (ratio - 256) * 2
      tone.green = (ratio - 256) * 2
      tone.blue = 255 - ratio
    elsif ratio >= 192
      tone.red = ratio - 288
      tone.green = ratio - 288
      tone.blue = ratio - 192
    elsif ATES::OVERDARKENING
      if ratio >= 160
        tone.red = ratio - 288
        tone.green = ratio - 288
        tone.blue = ratio - 192
      elsif ratio >= 96
        tone.red = -128
        tone.green = -128
        tone.blue = -32
      elsif ratio >= 64
        tone.red = -32 - ratio
        tone.green = -32 - ratio
        tone.blue = 64 - ratio
      end
    end
    return tone
  end
  
end

#==============================================================================
# Bitmap
#==============================================================================

class Bitmap

  if $tons_version == nil || $tons_version < 1.6
    alias draw_text_shaded_later draw_text
  end
  def draw_text_full(x2, y2, w2 = 0, h2 = 0, text2 = '', a2 = 0)
    if x2.is_a?(Rect)
      x, y, w, h, text, a = x2.x, x2.y, x2.width, x2.height, y2, w2
    else
      x, y, w, h, text, a = x2, y2, w2, h2, text2, a2
    end
    save_color = self.font.color.clone
    self.font.color = Color.new(0, 0, 0)
    draw_text_shaded_later(x - 1, y - 1, w, h, text, a)
    draw_text_shaded_later(x + 1, y - 1, w, h, text, a)
    draw_text_shaded_later(x - 1, y + 1, w, h, text, a)
    draw_text_shaded_later(x + 1, y + 1, w, h, text, a)
    self.font.color = save_color
    draw_text_shaded_later(x, y, w, h, text, a)
  end
  
end

#==============================================================================
# Clock_Sprite
#==============================================================================

class Clock_Sprite < Sprite
  
  def initialize
    super
    self.x, self.y, self.z = 480, 8, 5000
    self.bitmap = Bitmap.new(128, 32)
    if $fontface != nil
      self.bitmap.font.name = $fontface
    elsif $defaultfonttype != nil
      self.bitmap.font.name = $defaultfonttype
    end
    self.bitmap.font.size = 26
    @colon = true
    draw
  end
  
  def draw
    self.bitmap.clear
    hours, minutes = $game_system.ates.time.hour, $game_system.ates.time.min
    if @colon
      self.bitmap.draw_text_full(0, 0, 128, 32,
          sprintf('%02d %02d', hours, minutes), 2)
    else
      self.bitmap.draw_text_full(0, 0, 128, 32,
          sprintf('%02d:%02d', hours, minutes), 2)
    end
    @colon = !@colon
  end
    
end

#==============================================================================
# Scene_Map
#==============================================================================

class Scene_Map
  
  alias main_ates_later main
  def main
    @clock = Clock_Sprite.new if $game_system.show_clock
    $game_system.ates.update_screen
    main_ates_later
    @clock.dispose if @clock != nil
  end
  
  alias update_ates_later update
  def update
    $game_system.ates.update
    update_ates_later
    if $game_system.show_clock
      @clock = Clock_Sprite.new if @clock == nil
      @clock.draw if ATES.active? && $game_system.ates.frame_count % 40 == 0
    elsif @clock != nil
      @clock.dispose
      @clock = nil
    end
  end
  
  alias transfer_player_ates_later transfer_player
  def transfer_player
    $game_system.ates.update_screen
    transfer_player_ates_later
  end
  
end
