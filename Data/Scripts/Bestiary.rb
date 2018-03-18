# To enable enemy ID display, see line 421 and make it say 
# self.contents.draw_text(0, 0, 544, 32, "#{enemy.id}.  #{enemy.name}", 1)
# To enable gold display, change line 439 to 
# self.contents.draw_text(x, 224, 128, 32, $data_system.words.gold)
# and 444 to
# self.contents.draw_text(ox, 256, 256, 32, enemy.gold.to_s)
# To enable drop display, change line 440 to
# self.contents.draw_text(x, 288, 128, 32, 'Drops')
# and line 445
# self.contents.draw_text(ox, 320, 256, 32, (drop != nil ? t : 'nothing'))
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Bestiary by Blizzard
# Version: 2.3b
# Type: Enemy Catalogue Display
# Date: 5.7.2006
# Date v1.1: 18.9.2006
# Date v1.2b: 23.2.2007
# Date v1.3b: 7.7.2007
# Date v2.0b: 12.7.2007
# Date v2.1b: 6.8.2007
# Date v2.2b: 24.9.2007
# Date v2.21b: 8.4.2008
# Date v2.3b: 28.7.2009
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
#   98% compatible with SDK v1.x. 70% compatible with SDK v2.x. May cause
#   incompatibility issues with exotic CBS-es. WILL corrupt your old savegames.
# 
# 
# Features:
# 
#   - display of full data of enemies
#   - option to disable different information
#   - integrated support for my "Advanced Analyze System"
#   - press SHIFT/ENTER to change the appearance of the Bestiary window
#   - use LEFT/RIGHT/UP/DOWN to navigate through the information database
# 
# new in v1.1b:
#   - bugs fixed
# 
# new in v1.2b:
#   - improved coding (uses less RAM now and processes faster)
# 
# new in v1.3b:
#   - increased compatibility
# 
# new in v2.0b:
#   - completely overworked and fixed compatibility issues
# 
# new in v2.1b:
#   - added custom info possibility
# 
# new in v2.2b:
#   - rewritten conditions using classic syntax to avoid RGSS conditioning bug
#   - added SORT_BEASTS option
#   - improved coding
# 
# new in v2.21b:
#   - improved coding
# 
# new in v2.3b:
#   - improved coding
# 
# 
# Instructions:
# 
# - Explanation:
# 
#   This script will allow your characters to retrieve information about
#   enemies during battle and show them in a window. It also has built-in
#   compatibility for my "Advanced Analyze System" script and allows adding
#   enemies to it only if enemies were analyzed at least once. This script can
#   easily be used for Pokémon typed games.
# 
# - Configuration:
# 
#   Configure the part below and make one or more skills, that can analyze
#   enemies. Add the IDs into the array called ANALYZE_IDS and separate them
#   with commas. If you have one or more scripts using dummy elements (e.g. my
#   EQUAP Skills, SephirothSpawn's Limit Break, etc.) be sure to include every
#   dummy element ID in the array called ELM_DUMMIES, also separated by commas.
#   Below is everything explained, how to set the bestiary up. It has
#   additional options for rendering single or all enemies "Unknown" and adding
#   them into the bestiary as such. Later you can use a syntax described below
#   to enable their information display (e.g. like in Pokémon games, you get
#   the real info about a pokémon not when you meet it, but when you catch it).
#   You can use $game_system.bestiary_missing? to check how many enemies were
#   not added into the Bestiary. If you wish to see how many were added, use
#   $game_system.beasts.size
# 
# 
# Important notes:
# 
#   You MUST configure the part below if you have scripts that use dummy
#   elements! Do NOT give your enemies MORE than 11 elements/status effects of
#   one resistance type (e.g. 12 or more elements, that are absorbed), because
#   they won't be displayed.
# 
# 
# If you find any bugs, please report them here:
# http://www.chaosproject.co.nr
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

ELM_DUMMIES = [] # include EVERY dummy element ID, that is used by other scripts
STA_DUMMIES = [] # include EVERY dummy status effect ID, that you use
EVASION = 'Eva' # word used to display Evasion
MAP_BACKGROUND = true # true will show the map background, false won't
BESTIARY_SIZE = 999 # change this if to as many
NEVER_ADD = [0, 999] # include IDs of enemies which will never be added
SORT_BEASTS = true # set to false if you don't want all enemies to be sorted by ID

# enemy IDs from enemies, that are unknown (e.g. bosses), to make an enemy
# known use $game_system.enable(ENEMY_ID) through the event command
# "Call Script" to enable the display of information

if $override_bestiary
  UNKNOWN = [0] # overrides the commands further below
else
  UNKNOWN = [] # DO NOT TOUCH THIS
end

# every enemy is initially unknown (e.g. for Pokémon games), so you don't have
# to fill the array above with all the IDs of your enemy database

ALL_UNKNOWN = false

# If a display below is disabled, the appropriate part above will be overriden.
# The values below can also be changed during gameplay by just calling the
# "Call script" event command and changing the values like below
# DO NOT SET EVERYTHING TO true! THIS WILL BUG YOUR BESTIARY!

# set to true to disable display of basic info
DISABLE_BEAST_BASIC = false
# set to true to disable display of basic stats
DISABLE_BEAST_STATS = false
# set to true to disable display of extended stats
DISABLE_BEAST_EXTSTATS = true
# set to true to disable display of extreme element weakness
DISABLE_BEAST_XTRWEAK = true
# set to true to disable display of element weakness
DISABLE_BEAST_WEAK = true
# set to true to disable display of element resistance
DISABLE_BEAST_RESIST = true
# set to true to disable display of element nullification
DISABLE_BEAST_NULLIFY = true
# set to true to disable display of element absorbtion
DISABLE_BEAST_ABSORB = true
# set to true to disable display of extreme status effect weakness
DISABLE_BEAST_XTRWEAK_S = true
# set to true to disable display of status effect weakness
DISABLE_BEAST_WEAK_S = true
# set to true to disable display of status effect resistance
DISABLE_BEAST_RESIST_S = true
# set to true to disable display of status effect nullification
DISABLE_BEAST_NULLIFY_S = true
# set to true to disable display of status effect absorbtion
DISABLE_BEAST_ABSORB_S = true
# set to false to enable custom display
DISABLE_BEAST_CUSTOM = false

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

if $DUMMY_ELEMENTS == nil
  $DUMMY_ELEMENTS = ELM_DUMMIES.clone
else
  $DUMMY_ELEMENTS |= ELM_DUMMIES
end
ELM_DUMMIES = nil
if $DUMMY_STATES == nil
  $DUMMY_STATES = STA_DUMMIES.clone
else
  $DUMMY_STATES |= STA_DUMMIES
end
STA_DUMMIES = nil

$bestiary_enabled = 2.3

#==============================================================================
# Game_System
#==============================================================================

class Game_System
  
  attr_accessor :window_mode
  attr_accessor :known
  
  def get_bestiary_info(id)
    return get_analyze_info(id) if $override_bestiary_info
    case id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Custom Beast Info Database
# 
# Use following template to add custom information about monsters:
# 
#    when ID then return "STRING"
# 
# ID is the enemy ID and STRING is a string with the information that should be
# displayed. Type all the information into one string, the script will slice
# the text by itself. Note that special characters like a " (double quote)
# need the use of the escape character \ (backslash). If you get and error
# with your string or the character doesn't appear right on the screen, try to
# use the escape character (i.e. for a " it would be \" instead of just ").
# The backslash itself needs an escape character (i.e. \\).
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 1 then return "Esther... I kind of like how passionate she is about her job."
    when 2 then return "A high class maid. She must be paid a lot more than the other maids."
    when 3 then return "A mage from Aurealis Academy. She uses Light spells." 
    when 4 then return "A mage from Aurealis Academy. She uses Earth spells."
    when 5 then return ""
    when 6 then return "Hyranda's personal assistant. She's much more powerful than the other first-years."
    when 7 then return "She's in charge of Aurealis Academy. I'm glad she's no longer possessed."
    when 8 then return "An archer I met in the Lost Forest."
    when 9 then return "A tough combatant. Both her kicks and punches leave marks."
    when 10 then return "A rare fox girl."
    when 11 then return "An archeologist from the desert."
    when 12 then return "An archeologist from the desert."
    when 13 then return "An archeologist from the desert."
    when 14 then return "The thief you first met at Castle Velis. She invited you to a practise fight, which you won."
    when 15 then return "She betrayed you to the pirates. Darn backstabber..."
    when 16 then return "A common pirate."
    when 17 then return "The captain of the pirates. Her gun is rather powerful!"
    when 18 then return "A rare creature found in a cave. Worth a fortune."
    when 19 then return "The bride you ambushed to take her place."
    when 20 then return "A soldier from Cherisa's Army."
    when 21 then return "The captain of the Ghiaccio Village camp."
    when 22 then return "A common foot soldier."
    when 23 then return "Her sword was great, but not great enough."
    when 24 then return "She really does make your wishes come true..."
    when 25 then return "Good personality, but not clever enough..."
    when 26 then return "She never knew what hit her..."
    when 27 then return "A crossbow-wielding woman from Ghiaccio Village."
    when 28 then return "A newbie pirate."
    when 29 then return "A deadly assassin. Not so tough when tied up though."
    when 30 then return "A holy creature. It was hard tying the wings right!"
    when 31 then return "Rather cute. Wondering what she was doing alone on the beach..."
    when 32 then return "Rescued her from the Ghiaccio Manor's basement."
    when 33 then return "A rare cat girl."
    when 34 then return "The shopkeeper from Huston Village."  
    when 35 then return ""
    when 41 then return ""
    when 73 then return ""
    when 100 then return "\"Gorgons\"."
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Custom Beast Info Database
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    end
    return 'No info'
  end

  alias init_beast_later initialize
  def initialize
    init_beast_later
    @window_mode, @beasts, @known = 0, [], []
  end
  
  def beasts
    return ($bestiary_override ? @analyzed : @beasts) - NEVER_ADD
  end
  
  def add_beast(beast)
    unless @beasts.include?(beast)
      @beasts.push(beast)
      @beasts.sort! if SORT_BEASTS
    end
  end
  
  def bestiary_missing?
    return (BESTIARY_SIZE - @beasts.size)
  end
  
  def enable(id)
    $game_system.known.push(id) unless $game_system.known.include?(id)
    return
  end
  
end

#==============================================================================
# RPG::Enemy
#==============================================================================

class RPG::Enemy
  
  def known
    return ($game_system.known.include?(self.id)) if ALL_UNKNOWN
    return (!UNKNOWN.include?(self.id))
  end
  
end

#==============================================================================
# Window_Base
#==============================================================================

class Window_Base
  
  def draw_bestiary_battler(enemy, w, h)
    bitmap = RPG::Cache.battler(enemy.battler_name, enemy.battler_hue)
    bitmap_w = bitmap.width / 2
    bitmap_h = bitmap.height / 2
    src_rect = Rect.new(0, 0, bitmap.width, bitmap.height)
    self.contents.blt(w/2 - bitmap_w, h/2 - bitmap_h, bitmap, src_rect, 192)
  end
  
end

#==============================================================================
# Bitmap
#==============================================================================

class Bitmap
  
  def slice_text(text, width)
    words = text.split(' ')
    return words if words.size == 1
    result, current_text = [], words.shift
    words.each_index {|i|
        if self.text_size("#{current_text} #{words[i]}").width > width
          result.push(current_text)
          current_text = words[i]
        else
          current_text = "#{current_text} #{words[i]}"
        end
        result.push(current_text) if i >= words.size - 1}
    return result
  end
  
end

#==============================================================================
# Window_Beast
#==============================================================================

class Window_Beast < Window_Base

  attr_accessor :mode
  
  def initialize
    super(0, 0, 576, 416)
    @index_enemy = 0
    @index_page = 0
    @d = [DISABLE_BEAST_BASIC, DISABLE_BEAST_STATS, DISABLE_BEAST_EXTSTATS,
          DISABLE_BEAST_XTRWEAK, DISABLE_BEAST_WEAK, DISABLE_BEAST_RESIST,
          DISABLE_BEAST_NULLIFY, DISABLE_BEAST_ABSORB, DISABLE_BEAST_XTRWEAK_S,
          DISABLE_BEAST_WEAK_S, DISABLE_BEAST_RESIST_S, DISABLE_BEAST_NULLIFY_S,
          DISABLE_BEAST_ABSORB_S, DISABLE_BEAST_CUSTOM]
    @pages = 14 - ((0..13).find_all {|i| @d[i]}).size
    @mode = $game_system.window_mode
    @enemies = []
    for id in ($override_bestiary ? $game_system.analyzed : $game_system.beasts)
      @enemies.push($data_enemies[id]) if id != nil
    end
    self.contents = Bitmap.new(width - 32, height - 32)
    if $fontface != nil
      self.contents.font.name = $fontface
      self.contents.font.size = $fontsize
    elsif $defaultfonttype != nil
      self.contents.font.name = $defaultfonttype
      self.contents.font.size = $defaultfontsize
    end
    self.x = 320 - self.width / 2
    self.y = 240 - self.height / 2
    refresh
  end
  
  def update
    return if @enemies.size == 0
    if Input.trigger?(Input::RIGHT)
      $game_system.se_play($data_system.cursor_se)
      @index_enemy = (@index_enemy + 1) % @enemies.size
      refresh
    elsif Input.trigger?(Input::LEFT)
      $game_system.se_play($data_system.cursor_se)
      @index_enemy = (@index_enemy + @enemies.size - 1) % @enemies.size
      refresh
    elsif Input.trigger?(Input::DOWN)
      $game_system.se_play($data_system.cursor_se)
      @index_page = (@index_page + 1) % @pages
      refresh
    elsif Input.trigger?(Input::UP)
      $game_system.se_play($data_system.cursor_se)
      @index_page = (@index_page + @pages - 1) % @pages
      refresh
    end
  end
  
  def refresh
    self.contents.clear
    x = y = 0
    ox = x + 64
    enemy = @enemies[@index_enemy]
    if enemy == nil
      self.contents.draw_text(0, 64, 544, 32, 'Captive picture book is empty', 1)
      return
    end
    self.contents.draw_text(0, 0, 544, 32, "#{enemy.name}", 1)
    draw_bestiary_battler(enemy, self.width, self.height)
    if enemy.known
      case @index_page
      when (0 - ((0..0).find_all {|i| @d[i]}).size)
        if enemy.item_id > 0
          drop = $data_items[enemy.item_id]
          t = "#{drop.name} (#{enemy.treasure_prob}% chance)"
        elsif enemy.weapon_id > 0
          drop = $data_weapons[enemy.weapon_id]
          t = "#{drop.name} (#{enemy.treasure_prob}% chance)"
        elsif enemy.armor_id > 0
          drop = $data_armors[enemy.armor_id]
          t = "#{drop.name} (#{enemy.treasure_prob}% chance)"
        end
        self.contents.draw_text(x, 32, 128, 32, $data_system.words.hp)
        self.contents.draw_text(x, 96, 128, 32, $data_system.words.sp)
        self.contents.draw_text(x, 160, 128, 32, 'Base EXP')
        self.contents.draw_text(x, 224, 128, 32, '')
        self.contents.draw_text(x, 288, 128, 32, '')
        self.contents.draw_text(ox, 64, 256, 32, enemy.maxhp.to_s)
        self.contents.draw_text(ox, 128, 256, 32, enemy.maxsp.to_s)
        self.contents.draw_text(ox, 192, 256, 32, enemy.exp.to_s)
        self.contents.draw_text(ox, 256, 256, 32, '')
        self.contents.draw_text(ox, 320, 256, 32, (''))
      when (1 - ((0..1).find_all {|i| @d[i]}).size)
        self.contents.draw_text(x, 32, 128, 32, $data_system.words.str)
        self.contents.draw_text(x, 96, 128, 32, $data_system.words.dex)
        self.contents.draw_text(x, 160, 128, 32, $data_system.words.agi)
        self.contents.draw_text(x, 224, 128, 32, $data_system.words.int)
        self.contents.draw_text(ox, 64, 256, 32, enemy.str.to_s)
        self.contents.draw_text(ox, 128, 256, 32, enemy.dex.to_s)
        self.contents.draw_text(ox, 256, 256, 32, enemy.agi.to_s)
        self.contents.draw_text(ox, 192, 256, 32, enemy.int.to_s)
      when (2 - ((0..2).find_all {|i| @d[i]}).size)
        self.contents.draw_text(x, 32, 128, 32, $data_system.words.atk)
        self.contents.draw_text(x, 96, 128, 32, $data_system.words.pdef)
        self.contents.draw_text(x, 160, 128, 32, $data_system.words.mdef)
        self.contents.draw_text(x, 224, 128, 32, EVASION)
        self.contents.draw_text(ox, 64, 256, 32, enemy.atk.to_s)
        self.contents.draw_text(ox, 128, 256, 32, enemy.pdef.to_s)
        self.contents.draw_text(ox, 192, 256, 32, enemy.mdef.to_s)
        self.contents.draw_text(ox, 256, 256, 32, enemy.eva.to_s)
      when (3 - ((0..3).find_all {|i| @d[i]}).size)
        self.contents.draw_text(x, 32, 544, 32, 'Extremely efficient elements:')
        draw_elements(enemy, x, 1)
      when (4 - ((0..4).find_all {|i| @d[i]}).size)
        self.contents.draw_text(x, 32, 544, 32, 'Efficient elements:')
        draw_elements(enemy, x, 2)
      when (5 - ((0..5).find_all {|i| @d[i]}).size)
        self.contents.draw_text(x, 32, 544, 32, 'Elemental resistances:')
        draw_elements(enemy, x, 4)
      when (6 - ((0..6).find_all {|i| @d[i]}).size)
        self.contents.draw_text(x, 32, 544, 32, 'Elemental nullifications:')
        draw_elements(enemy, x, 5)
      when (7 - ((0..7).find_all {|i| @d[i]}).size)
        self.contents.draw_text(x, 32, 544, 32, 'Elemental absorbtions:')
        draw_elements(enemy, x, 6)
      when (8 - ((0..8).find_all {|i| @d[i]}).size)
        self.contents.draw_text(x, 32, 544, 32, 'Extremely efficient status effects:')
        draw_states(enemy, x, 1)
      when (9 - ((0..9).find_all {|i| @d[i]}).size)
        self.contents.draw_text(x, 32, 544, 32, 'Efficient status effects:')
        draw_states(enemy, x, 2)
      when (10 - ((0..10).find_all {|i| @d[i]}).size)
        self.contents.draw_text(x, 32, 544, 32, 'Status effect resistances:')
        draw_states(enemy, x, 4)
      when (11 - ((0..11).find_all {|i| @d[i]}).size)
        self.contents.draw_text(x, 32, 544, 32, 'Strong status effect resistances:')
        draw_states(enemy, x, 5)
      when (12 - ((0..12).find_all {|i| @d[i]}).size)
        self.contents.draw_text(x, 32, 544, 32, 'Status effect immunities:')
        draw_states(enemy, x, 6)
      when (13 - ((0..13).find_all {|i| @d[i]}).size)
        self.contents.draw_text(x, 32, 544, 32, 'Suki\'s Notes:')
        draw_info(enemy, x)
      end
    else
      self.contents.draw_text(0, 64, 544, 32, 'Unknown', 1)
    end
  end
  
  def draw_elements(enemy, x, index)
    elements = []
    (1...$data_system.elements.size).each {|id|
        if !$DUMMY_ELEMENTS.include?(id) &&
            index == $data_enemies[@enemies[@index_enemy].id].element_ranks[id]
          elements.push($data_system.elements[id])
        end}
    elements = ['Nothing'] if elements.size == 0
    elements.each_index {|i|
        self.contents.draw_text(x, 64 + i * 32, 544, 32, elements[i])}
  end
    
  def draw_states(enemy, x, index)
    states = []
    (1...$data_states.size).each {|id|
        if !$DUMMY_STATES.include?(id) &&
            index == $data_enemies[@enemies[@index_enemy].id].state_ranks[id]
          states.push($data_states[id].name)
        end}
    states = ['Nothing'] if states.size == 0
    states.each_index {|i|
        self.contents.draw_text(x, 64 + i * 32, 544, 32, states[i])}
  end
  
  def draw_info(enemy, x)
    text = self.contents.slice_text($game_system.get_bestiary_info(enemy.id), 528)
    text.each_index {|i|
        self.contents.draw_text(x, 64 + i*32, 544, 32, text[i])}
  end
    
end

#==============================================================================
# Scene_Bestiary
#==============================================================================

class Scene_Bestiary
  
  def main
    @spriteset = Spriteset_Map.new if MAP_BACKGROUND
    @beast_window = Window_Beast.new
    Graphics.transition
    loop do
      Graphics.update
      Input.update
      update
      break if $scene != self
    end
    Graphics.freeze
    @spriteset.dispose if MAP_BACKGROUND
    @beast_window.dispose
  end
  
  def update
    @beast_window.update
    if MAP_BACKGROUND && (Input.trigger?(Input::A) || Input.trigger?(Input::C))
      Graphics.freeze
      $game_system.se_play($data_system.cursor_se)
      case @beast_window.mode
      when 0 then @beast_window.back_opacity = 150
      when 1 then @beast_window.opacity = 0
      when 2 then @beast_window.opacity = @beast_window.back_opacity = 255
      end
      $game_system.window_mode = ($game_system.window_mode+1) % 3
      @beast_window.mode = $game_system.window_mode
      Graphics.transition(5)
    end
    if Input.trigger?(Input::B)
      $game_system.se_play($data_system.cancel_se)
      $scene = Scene_Map.new
    end
  end


end
  
#==============================================================================
# Scene_Battle
#==============================================================================

class Scene_Battle
  
  alias update_beast_later update
  def update
    if @log == nil && !$override_bestiary
      @log = true
      $game_troop.enemies.each {|enemy| $game_system.add_beast(enemy.id)}
    end
    update_beast_later
  end
  
end
