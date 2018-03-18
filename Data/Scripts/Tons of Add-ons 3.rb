#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Tons of Add-ons by Blizzard
# Version: 7.39b
# Type: Add-on Collection Control Script
# Date v7.39b:   6.10.2009
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
#                                    PART 3
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

#==============================================================================
# Game_System
#==============================================================================

class Game_System
  
  alias init_tons_of_addons3_later initialize
  def initialize
    init_tons_of_addons3_later
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration 3-2, STATUS EFFECT and SKILL add-ons
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
    # the STATUS EFFECT add-ons
    @ZOMBIE_STATUS       = false
    @REGEN_STATUS        = false
    @AUTO_REVIVE         = false
    @FURY_STATUS         = false
    @INVINCIBLE_STATUS   = false
    @SP_COST_MOD         = false
    @FROZEN              = false
    @BLUE_MAGIC_STATUS   = false
    @DOOM_STATUS         = false
    # the SKILL add-ons
    @ABSORB_HP_SP        = true
    @STATE_BREAKER       = false
    @BLUE_MAGIC_SKILL    = false
    @DEMI_SKILL          = false
    @REVENGE_SKILL       = false
    @DESTRUCTOR_SKILL    = false
    @SP_DAMAGE_SKILL     = true
    @CHARGE_SKILL        = false
    @ENERGY_SKILL        = false
    @MASTER_THIEF        = false
    @HP_SKILL            = false
    # the ITEM add-ons
    @SKILL_TEACHING_ITEM = false
    @LEVEL_UPDOWN_ITEM   = false
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration 3-2
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  end
  
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# I suggest you don't edit anything below this line except for the
# configurations for the add-ons.
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

  attr_accessor :ZOMBIE_STATUS
  attr_accessor :REGEN_STATUS
  attr_accessor :AUTO_REVIVE
  attr_accessor :FURY_STATUS
  attr_accessor :INVINCIBLE_STATUS
  attr_accessor :SP_COST_MOD
  attr_accessor :FROZEN
  attr_accessor :BLUE_MAGIC_STATUS
  attr_accessor :DOOM_STATUS
  
  attr_accessor :ABSORB_HP_SP
  attr_accessor :STATE_BREAKER
  attr_accessor :BLUE_MAGIC_SKILL
  attr_accessor :DEMI_SKILL
  attr_accessor :REVENGE_SKILL
  attr_accessor :DESTRUCTOR_SKILL
  attr_accessor :SP_DAMAGE_SKILL
  attr_accessor :CHARGE_SKILL
  attr_accessor :ENERGY_SKILL
  attr_accessor :MASTER_THIEF
  attr_accessor :HP_SKILL
  
  attr_accessor :SKILL_TEACHING_ITEM
  attr_accessor :LEVEL_UPDOWN_ITEM
  
end

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::#
#                                                                             #
#  ##### #####  ###  ##### #   # #####    ##### ##### ##### #####  ###  ##### #
#  #       #   #   #   #   #   # #        #     #     #     #     #   #   #   #
#  #####   #   #   #   #   #   # #####    ####  ####  ####  ####  #       #   #
#      #   #   #####   #   #   #     #    #     #     #     #     #   #   #   #
#  #####   #   #   #   #    ###  #####    ##### #     #     #####  ###    #   #
#                                                                             #
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::#

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Zombie Status Effect by Blizzard
# Version: 1.3b
# Type: Game Experience Improvement
# Date: 26.9.2006
# Date v1.1b: 18.3.2007
# Date v1.2b: 13.11.2007
# Date v1.3b: 19.10.2008
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# new in v1.1b:
#   - working itself without you needing to do anything except the
#     configuration
#   - actual code
#   - works with attacks and items now as well
# 
# new in v1.2b:
#   - improved coding
#   - now possible to have more than one zombie status
# 
# new in v1.3b:
#   - improved coding
#   - fixed possible problems
# 
# 
# Configuration:
# 
#   ZOMBIE_IDS       - the IDs of the Zombie status effects
#   LIGHT_ELEMENT_ID - the ID of the light element
#   ZOMBIE_POWER     - how much stronger should light attacks be
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

ZOMBIE_IDS = [19]
LIGHT_ELEMENT_ID = 7
ZOMBIE_POWER = 1.5

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#==============================================================================
# Game_Battler
#==============================================================================

class Game_Battler
  
  alias attack_effect_zombie_later attack_effect
  def attack_effect(attacker)
    last_hp = self.hp
    last_sr = (($crls && self.is_a?(Game_Actor)) ? self.sr : nil)
    result = attack_effect_zombie_later(attacker)
    zombie_effect(last_hp, last_sr, attacker) if self.damage.is_a?(Numeric)
    return result
  end
  
  alias skill_effect_zombie_later skill_effect
  def skill_effect(user, skill)
    last_hp = self.hp
    last_sr = (($crls && self.is_a?(Game_Actor)) ? self.sr : nil)
    result = skill_effect_zombie_later(user, skill)
    zombie_effect(last_hp, last_sr, skill) if self.damage.is_a?(Numeric)
    return result
  end
  
  alias item_effect_zombie_later item_effect
  def item_effect(item, battler = nil)
    if $game_system.ACTOR_ITEMS && self.is_a?(Game_Actor)
      return false if !FTSConfigs.item_can_consume?(self.id, item.id)
    end
    last_hp = self.hp
    last_sr = (($crls && self.is_a?(Game_Actor)) ? self.sr : nil)
    if battler == nil
      result = item_effect_zombie_later(item)
    else
      result = item_effect_zombie_later(item, battler)
    end
    zombie_effect(last_hp, last_sr, item) if self.damage.is_a?(Numeric)
    return result
  end
  
  def zombie_effect(last_hp, last_sr, object)
    if $game_system.ZOMBIE_STATUS && ZOMBIE_IDS.any? {|i| @states.include?(i)}
      self.hp = last_hp
      self.hp = self.hp
      self.sr = last_sr if last_sr != nil
      if self.damage.is_a?(Numeric) && self.damage < 0
        self.damage = -self.damage 
      end
      if object.element_set.include?(LIGHT_ELEMENT_ID)
        self.damage = (self.damage * ZOMBIE_POWER).to_i
      end
      self.hp -= self.damage
    end
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Regen Status Effect by Blizzard
# Version: 2.0b
# Type: Game Experience Improvement
# Date: 4.5.2006
# Date v1.1b: 12.1.2007
# Date v2.0: 22.10.2007
# Date v2.0b: 13.11.2007
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# new in v1.1b:
#   - fixed glitches, improved code and made it possible to have Regen and
#     Poison at the same time (they nullificate each other on the map, but not
#     in battle)
# 
# new in v2.0:
#   - overworked system
#   - added SP Regen effect
#   - added SP Poison effect
#   
# new in v2.0b:
#   - fixed eventual bugs
#   - now possible to have more than one Regen status effect
#   - now beta
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

HP_REGEN_IDS = [18] # add any status effect IDs that will be HP Regen
SP_REGEN_IDS = [19] # add any status effect IDs that will be SP Regen
SP_POISON_IDS = [20] # add any status effect IDs that will be SP Poison

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#==============================================================================
# Game_Party
#==============================================================================

class Game_Party
  
  alias check_map_slip_damage_regen_later check_map_slip_damage
  def check_map_slip_damage
    check_map_slip_damage_regen_later
    if $game_system.REGEN_STATUS
      @actors.each {|actor|
          if actor.hp > 0
            if HP_REGEN_IDS.any? {|i| actor.states.include?(i)}
              actor.hp += [actor.maxhp / 100, 1].max
            end
            if SP_REGEN_IDS.any? {|i| actor.states.include?(i)}
              actor.sp += [actor.maxsp / 100, 1].max
            end
            if SP_POISON_IDS.any? {|i| actor.states.include?(i)}
              actor.sp -= [actor.maxsp / 100, 0].max
            end
          end}
    end
  end
  
end

#==============================================================================
# Game_Battler
#==============================================================================

class Game_Battler

  alias slip_damage_regen_later? slip_damage?
  def slip_damage?
    if $game_system.REGEN_STATUS && !$scene.is_a?(Scene_Map) &&
        (HP_REGEN_IDS + SP_REGEN_IDS + SP_POISON_IDS).any? {|i| @states.include?(i)}
      return true
    end
    return slip_damage_regen_later?
  end
  
  alias slip_damage_effect_regen_later slip_damage_effect
  def slip_damage_effect
    if $game_system.REGEN_STATUS
      if !(HP_REGEN_IDS.any? {|i| @states.include?(i)}) &&
          slip_damage_regen_later?
        slip_damage_effect_regen_later
      elsif (HP_REGEN_IDS.any? {|i| @states.include?(i)}) &&
          !slip_damage_regen_later?
        dam = -self.maxhp / 10
        if dam.abs > 0
          amp = [dam.abs * 15 / 100, 1].max
          dam -= rand(amp+1) + rand(amp+1) - amp
        end
        self.hp -= dam
        self.damage = 0 if self.damage == nil
        self.damage += dam
      end
      if (SP_REGEN_IDS.any? {|i| @states.include?(i)}) !=
          (SP_POISON_IDS.any? {|i| @states.include?(i)})
        dam = self.maxsp / 10
        if dam > 0
          amp = [dam * 15 / 100, 1].max
          dam += rand(amp+1) + rand(amp+1) + amp
        end
        dam = -dam if SP_REGEN_IDS.any? {|i| @states.include?(i)}
        self.sp -= dam
        self.damage = 0 if self.damage == nil
        self.damage += dam
      end
    else
      slip_damage_effect_regen_later
    end
  end

end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Auto-Revive Status Effect by Blizzard
# Version: 1.25b
# Type: Game Experience Improvement
# Date: 5.6.2006
# Date v1.2b: 14.11.2006
# Date v1.21b: 12.1.2007
# Date v1.22b: 13.11.2007
# Date v1.23b: 19.11.2007
# Date v1.24b: 10.12.2007
# Date v1.25b: 19.10.2008
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# new in v1.2b:
#   - less and better code, much more compatible, easier to use
# 
# new in v1.21b:
#   - removed an obsolete constant
# 
# new in v1.22b:
#   - now possible to have more than one Auto-Revive status effect
# 
# new in v1.23b:
#   - fixed bug where game over would be automatically initiated when in battle
# 
# new in v1.24b:
#   - fixed bug due to typing mistake
# 
# new in v1.25b:
#   - fixed bug with RTAB
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

AUTO_REVIVE_IDS = [19] # IDs of status effects
REVIVE_ANIMATION_ID = 25 # ID of the Revive animation
REVIVE_TEXT = 'Auto-Revive!' # text displayed
DEAD_ID = 1 # ID of the "dead" status effect

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#==============================================================================
# Game_Party
#==============================================================================

class Game_Party

  alias all_dead_autorevive_later? all_dead?
  def all_dead?
    if $game_system.AUTO_REVIVE && (@actors.any? {|a| AUTO_REVIVE_IDS.any? {|i|
        a.states.include?(i)}})
      return false
    end
    return all_dead_autorevive_later? 
  end

end

#==============================================================================
# Sprite
#==============================================================================

class RPG::Sprite
  
  alias damage_regen_later damage
  def damage(damage, critical, type = nil)
    if damage == REVIVE_TEXT
      dispose_damage
      bitmap = Bitmap.new(160, 48)
      bitmap.font.name, bitmap.font.size = 'Arial Black', 32
      bitmap.font.color.set(0, 0, 0)
      bitmap.draw_text_shaded_later(-1, 12-1, 160, 36, REVIVE_TEXT, 1)
      bitmap.draw_text_shaded_later(-1, 12+1, 160, 36, REVIVE_TEXT, 1)
      bitmap.draw_text_shaded_later(1, 12-1, 160, 36, REVIVE_TEXT, 1)
      bitmap.draw_text_shaded_later(1, 12+1, 160, 36, REVIVE_TEXT, 1)
      bitmap.font.color.set(0, 192, 255)
      bitmap.font.size = 32
      bitmap.draw_text_shaded_later(0, 12, 160, 36, REVIVE_TEXT, 1)
      @_damage_sprite = ::Sprite.new(self.viewport)
      @_damage_sprite.bitmap = bitmap
      @_damage_sprite.ox, @_damage_sprite.oy = 80, 20
      @_damage_sprite.x, @_damage_sprite.y = self.x, self.y-self.oy/2
      @_damage_sprite.z, @_damage_duration = 3000, 40
    elsif type != nil
      damage_regen_later(damage, critical, type)
    else
      damage_regen_later(damage, critical)
    end
  end 

end

#==============================================================================
# Scene_Battle
#==============================================================================

class Scene_Battle

  alias judge_autorevive_later judge
  def judge
    if $game_system.AUTO_REVIVE
      flag = false
      $game_party.actors.each {|actor|
          if actor.hp == 0 && AUTO_REVIVE_IDS.any? {|i| actor.states.include?(i)}
            actor.hp += actor.maxhp / 5
            (AUTO_REVIVE_IDS + [DEAD_ID]).each {|i| actor.remove_state(i)}
            actor.animation_id, actor.damage = REVIVE_ANIMATION_ID, REVIVE_TEXT
            actor.damage_pop = flag = true
          end}
      @status_window.refresh if flag
    end
    return judge_autorevive_later
  end

end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Fury Status Effect by Blizzard
# Version: 1.1b
# Type: Game Experience Improvement
# Date: 10.10.2006
# Date 1.1b: 4.7.2008
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# Compatibility:
# 
#   99% compatible with SDK v1.x. 70% compatible with SDK v2.x. Could cause
#   problems with exotic CBS-es.
# 
# 
# new in v1.1b:
#   - compatible with Blizz-ABS 1.99 and higher
# 
# 
# Instructions:
# 
# - Explanation:
# 
#   This add-on will make specific characters get inflicted with the status
#   effect called "Fury" if another specific character gets killed during battle.
#   Also make the status effect end after the battle is over.
# 
# - Configuration:
# 
#   Configure your database further below like this template:
# 
#     when X then return Y
# 
#   X - ID of the dead character
#   Y - ID of the character who will inflicted with Fury.
#   
#   Set FURY_ID to the status effect ID.
# 
# 
# If you find any bugs, please report them here:
# http://forum.chaos-project.com/
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

FURY_ID = 23

#==============================================================================
# module BlizzCFG
#==============================================================================

module BlizzCFG
  
  def self.fury_database(id)
    case id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Fury Database
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 1 then return 2
    when 2 then return 7
    when 7 then return 8
    when 8 then return 1
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Fury Database
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    else
      return 0
    end
  end
  
  def self.fury_execution
    ids = []
    $game_party.actors.each {|a| ids.push(self.fury_database(a.id)) if a.dead?}
    $game_party.actors.each {|a| a.remove_state(FURY_ID)}
    ids.each {|id|
        if $game_actors[id] != nil && $game_party.actors.include?($game_actors[id])
          $game_actors[id].add_state(FURY_ID) unless $game_actors[id].dead?
        end}
  end
  
end
  
#==============================================================================
# Scene_Battle
#==============================================================================

class Scene_Battle
  
  alias upd_fury_later update
  def update
    BlizzCFG.fury_execution if $game_system.FURY_STATUS
    upd_fury_later
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Invincible Status Effect by Blizzard
# Version: 2.0b
# Type: Game Experience Improvement
# Date: 4.12.2006
# Date v2.0b: 13.11.2007
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# new in v2.0b:
#   - overworked for more convenience
#   - added possibility to have more than one Invincible status effect
#   - improved compatbility
# 
# 
# Compatibility:
# 
#   99% compatible with SDK v1.x. 70% compatible with SDK v2.x. Could cause
#   problems with exotic CBS-es.
# 
# 
# Instructions:
# 
# - Explanation:
# 
#   This add-on will allow having a status effect that makes a character
#   invincible. Add any status effect IDs into INVINCIBLE_IDS.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

INVINCIBLE_IDS = [17]

#==============================================================================
# Game_Battler
#==============================================================================

class Game_Battler

  alias hp_actor_invincible_later hp=
  def hp=(val)
    if $game_system.INVINCIBLE_STATUS && val < @hp
      return if INVINCIBLE_IDS.any? {|i| @states.include?(i)}
    end
    hp_actor_invincible_later(val)
  end
  
  alias damage_is_invincible_later damage=
  def damage=(val)
    if $game_system.INVINCIBLE_STATUS && val.is_a?(Numeric) && val > 0 &&
        INVINCIBLE_IDS.any? {|i| @states.include?(i)}
      damage_is_invincible_later(0)
    else
      damage_is_invincible_later(val)
    end
  end

end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# SP Cost Mod Status Effect by Blizzard
# Version: 3.0b
# Type: Game Experience Improvement
# Date v2.0: 13.11.2007
# Date v2.0b: 20.3.2008
# Date v3.0b: 23.7.2008
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Half SP Date: 8.4.2006
# Half SP Date v1.3b: 13.12.2006
# Half SP Date v1.31b: 12.3.2007
# Half SP Date v1.4b: 24.3.2007
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 1 SP Date: 12.3.2007
# 1 SP Date v1.1b: 24.3.2007
# 1 SP Date v1.11b: 26.8.2007
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# new in v2.0:
#   - completely overworked, now features any SP cost modifier
# 
# new in v2.0b:
#   - improved coding
#   - now beta
# 
# new in v3.0b:
#   - improved instructions
#   - improved compatibility
#   - improved coding
# 
# 
# Compatibility:
# 
#   99% compatible with SDK v1.x. 70% compatible with SDK v2.x. Should be 100%
#   compatible with everything else. Can cause incompatibility issues with
#   exotic CBS-es and exotic CMS-es, but only if different Skills Windows are
#   used. There is a high chance that this problem can be solved. Please see the
#   note at the bottom for more information.
# 
# 
# Configuration:
# 
#   Configure your database further below like this template:
# 
#     when X then return [Y, Z]
# 
#   X - ID of the status effect
#   Y - true for percentual decrease, false for fixed cost
#   Z - percentage of SP cost or fixed SP cost
#   
#   Example:
#   
#     when 50 then return [true, 25]
#     when 51 then return [false, 5]
# 
#   With this configuration somebody with inflicted status effect 50 would have
#   each skill SP cost decreased to 25% of the original cost, somebody with
#   inflicted status effect 51 would have each skill at an SP cost of 5. If two
#   or more status effects are inflicted, the one that is higher on the list
#   will have the higher priority.
#   
#   
# Compatibility Help:
#   
#   In most skill windows the skill cost is drawn by simply accessing the SP
#   cost of the skill from the database. If this system is to work with custom
#   skill windows, there needs to be done a little edit in those windows.
#   There should be a line in the method "draw_item" similar to this one:
#   
#     self.contents.draw_text(X, Y, W, H, sp_cost.to_s, A)
#   
#   In that case it is sufficient to add this line ABOVE the line mentioned
#   before.
#   
#     sp_cost = BlizzCFG.get_cost_mod(@actor.states, sp_cost)
#   
#   Another possibility is a line like this one:
#   
#     self.contents.draw_text(X, Y, W, H, skill.sp_cost.to_s, A)
#   
#   In that case the line should be changed into thos two here:
#   
#     sp_cost = BlizzCFG.get_cost_mod(@actor.states, skill.sp_cost)
#     self.contents.draw_text(X, Y, W, H, sp_cost.to_s, A)
#   
#   X, Y, W, H and A can be any numeric parameters and are irrelevelant. A is
#   an optional parameter and could have been omitted in some cases.
#   
#   
# If you find any bugs, please report them here:
# http://forum.chaos-project.com/
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#==============================================================================
# module BlizzCFG
#==============================================================================

module BlizzCFG
  
  def self.sp_cost_mod(id)
    case id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START SP Cost Mod Database
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 25 then return [true, 50]
    when 20 then return [false, 1]
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END SP Cost Mod Database
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    end
    return nil
  end
  
  def self.get_cost_mod(states, cost)
    data = nil
    states.each {|i|
        data = BlizzCFG.sp_cost_mod(i)
        break if data != nil}
    return cost if data == nil
    return data[1] unless data[0]
    return cost * (100 - data[1]) / 100
  end
  
end

#==============================================================================
# Game_Battler
#==============================================================================

class Game_Battler
  
  alias sp_actor_halfsp_later sp=
  def sp=(val)
    if val < self.sp && val >= 0 && $game_system.SP_COST_MOD
      val = self.sp - BlizzCFG.get_cost_mod(@states, self.sp-val)
    end
    sp_actor_halfsp_later(val)
  end
  
  alias skill_can_use_halfsp_later? skill_can_use?
  def skill_can_use?(skill_id)
    if $game_system.SP_COST_MOD
      cost = BlizzCFG.get_cost_mod(@states, $data_skills[skill_id].sp_cost)
      return false if self.sp < cost
    end
    return skill_can_use_halfsp_later?(skill_id)
  end
  
end

#==============================================================================
# Window_Skill
#==============================================================================

class Window_Skill ###
  
  alias draw_item_halfsp_later draw_item
  def draw_item(index)
    draw_item_halfsp_later(index)
    return if $game_system.SKILL_SEPARATION
    if $game_system.SP_COST_MOD
      skill = @data[index]
      if @actor.skill_can_use?(skill.id)
        self.contents.font.color = normal_color
      else
        self.contents.font.color = disabled_color
      end
      x, y = 4+index%2*320, index/2*32
      rect = Rect.new(x + 232, y, 48, 32)
      self.contents.fill_rect(rect, Color.new(0, 0, 0, 0))
      sp_cost = BlizzCFG.get_cost_mod(@actor.states, skill.sp_cost)
      self.contents.draw_text(x + 232, y, 48, 32, sp_cost.to_s, 2)
    end
  end

end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Frozen Status Effect by Blizzard
# Version: 1.0b
# Type: Game Experience Improvement
# Date: 20.10.2007
# Date v1.0b: 13.11.2007
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# new in v1.0b:
#   - possible to have more than one Frozen Status effect
#   - now beta
# 
# 
# Compatibility:
# 
#   99% compatible with SDK v1.x. 90% compatible with SDK v2.x. Could cause
#   problems with exotic CBS-es.
# 
# 
# Instructions:
# 
# - Explanation:
# 
#   This add-on will allow having a status effect that makes a character die as
#   soon as he get damaged. Set FROZEN_ID to the status effect ID. Keep in mind
#   that the battler who has this status inflicted cannot act, so set it up
#   correctly in your database.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

FROZEN_IDS = [29]

#==============================================================================
# Game_Battler
#==============================================================================

class Game_Battler
  
  alias hp_actor_frozen_later hp=
  def hp=(val)
    if $game_system.FROZEN && val < @hp && FROZEN_IDS.any? {|i| @states.include?(i)}
      hp_actor_frozen_later(0)
    else
      hp_actor_invincible_later(val)
    end
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Blue Magic via Status Effect by Blizzard
# Version: 1.0
# Type: Skill Learning Status Effect
# Date: 17.2.2008
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
#   This actor will learn the enemy's skill he was attacked with while this
#   status effect is inflicted. If an actor is inflicted with more than one
#   "learning" status effect at the same time, every one of them contributes
#   to the chance of learning the skill.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#==============================================================================
# module BlizzCFG
#==============================================================================

module BlizzCFG
  
  def self.blue_states(id)
    case id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Blue Status Database
#   
#   Set up the database below using following template:
#   
#     when STATE_ID then return [CHANCE, GROUP_1, GROUP_2, ...]
#     
#   STATE_ID - the state ID in the database
#   CHANCE   - the probability in % that the skill will be learned
#   GROUP    - "class" from which skills can be learned
#   
#   Every status effect that is not defined here has a chance of 0% to make the
#   attacked actor learn the skill of the attacker. Depending on the state,
#   only enemies', actors' or both groups' skills can be learned. Add one or
#   more of the following classes after the probability factor:
#     
#     Game_Enemy - represents enemies
#     Game_Actor - represents actors
#   
#   Keep in mind that you need at least one group from which skills can be
#   learned.
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 27 then return [50, Game_Enemy] # 50% chance to learn from enemies
    when 28 then return [10, Game_Actor, Game_Enemy] # 10% chance to learn from enemies or actors
    when 29 then return [20, Game_Actor] # 20% chance to learn from actors
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Blue Status Database
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    end
    return [0]
  end
  
end

#==============================================================================
# Game_Battler
#==============================================================================

class Game_Battler
  
  alias skill_effect_bluestatus_later skill_effect
  def skill_effect(user, skill)
    if $game_system.BLUE_MAGIC_STATUS && self.is_a?(Game_Actor)
      @states.each {|id|
          data = BlizzCFG.blue_states(id)
          if data.size > 1 && rand(100) < data[0] &&
              data[1, data.size-1].include?(user.class)
            learn_skill(skill.id)
            break
          end}
    end
    return skill_effect_bluestatus_later(user, skill)
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Doom Status Effect by Blizzard
# Version: 1.0b
# Type: Enhanced Status Effect
# Date: 20.10.2007
# Date v1.0b: 28.10.2007
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# Explanation:
# 
#   With this add-on you are able to create "Doom" skills. Doom skills inflict
#   a status effect that kills the inflicted character after a defined number
#   of turns. Usually a timer is displayed.
# 
# new in v1.0b:
#   - timer appears now when damage is supposed to appear
#   - actors get killed as soon as the counter reaches zero and not as soon
#     they try to act while the counter is zero
#   - actor who killed the last enemy doesn't die
#   - now beta
# 
# 
# Compatibility:
# 
#   99% compatible with SDK v1.x. 90% compatible with SDK v2.x. Could cause
#   problems with exotic CBS-es.
# 
# 
# Instructions:
# 
# - Configuration  
#   
#   DOOM_IDS            - include any IDs of Doom status effects and separate
#                         them with commas (i.e. [24, 25, 26])
#   DOOM_TIMER_VISIBLE  - set it to either true or false whether you want to
#                         display the timer or not
#   DOOM_TIMER_POSITION - set this value to 0 to display it "above" the sprite,
#                         set it to 1 to display it on top of the sprite or set
#                         it to 2 to display it at the center of the sprite
#   
#   You need to create status effects and set up the "Release Conditions".
#   Set the condition "Release at the end of battle" and set the X in "After X
#   turns 100% chance" to the number of turns available for this specific
#   status effect (it is important that the probability is 100%). This way you
#   are able to create more than one Doom Effect, each Doom Effect can have a
#   different countdown starting number. All that is left to do is to create
#   skills that inflict those status effects.
#   
# 
# Important note:
#   
#   It is recommended that you make the status effects "Non-resistance" and
#   that you make them cancel each other. Also should the "Death" status effect
#   cancel Doom, otherwise the timer will not disappear. Also, make the status
#   effect wear off after battle for convenience.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

DOOM_IDS = [22, 27, 28]
DOOM_TIMER_VISIBLE = true
DOOM_TIMER_POSITION = 1
DOOM_FONT = 'Arial Black'
DOOM_SIZE = 32

#==============================================================================
# Game_Battler
#==============================================================================

class Game_Battler
  
  attr_reader :states_turn
  
end

#==============================================================================
# Sprite_Battler
#==============================================================================

class Sprite_Battler
  
  alias upd_doomskill_later update
  def update
    upd_doomskill_later
    return unless @battler && $game_system.DOOM_STATUS && DOOM_TIMER_VISIBLE
    dooms = @battler.states.find_all {|i| DOOM_IDS.include?(i)}
    if dooms != []
      if $scene.is_a?(Scene_Battle) && $scene.phase4_step == 6
        if @doom == nil
          @doom = Sprite.new
          @doom.bitmap = Bitmap.new(48, 48)
          @doom.bitmap.font.name, @doom.bitmap.font.size = DOOM_FONT, DOOM_SIZE
          @doom.x, @doom.z, @doom.ox, @doom.oy = self.x, self.z + 100, 24, 48
          @doom.y = case DOOM_TIMER_POSITION
          when 0 then self.y - self.oy
          when 1 then self.y - self.oy+24
          when 2 then self.y - self.oy/2
          end
        end
        if @turns_left != @battler.states_turn[dooms[0]]
          @turns_left = @battler.states_turn[dooms[0]]
          @doom.bitmap.clear
          if @turns_left == 0 && $game_troop.enemies.any? {|enemy| enemy.exist?}
            @battler.hp = 0
          end
          if $Blizz_Art
            @doom.bitmap.draw_text_full(0, 0, 48, 32, @turns_left.to_s, 1)
          else
            @doom.bitmap.draw_text(0, 0, 48, 32, @turns_left.to_s, 1)
          end
        end
      end
    elsif @doom != nil && $scene.is_a?(Scene_Battle) && $scene.phase4_step == 2
      @doom.dispose
      @doom = nil
    end
  end
  
  alias disp_doomskill_later dispose
  def dispose
    unless @doom == nil || @doom.disposed?
      @doom.dispose
      @doom = nil
    end
    disp_doomskill_later
  end
  
end

#==============================================================================
# Scene_Battle
#==============================================================================

class Scene_Battle
  
  attr_reader :phase4_step
  
end
  
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::#
#                                                                             #
#                         ##### #   #  #  #     #                             #
#                         #     #  #   #  #     #                             #
#                         ##### ###    #  #     #                             #
#                             # #  #   #  #     #                             #
#                         ##### #   #  #  ##### #####                         #
#                                                                             #
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::#

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Absorb HP/SP Skill by Blizzard
# Version: 2.0b
# Type: Enhanced Skill
# Date: 8.5.2006
# Date v1.7b: 14.11.2006
# Date v1.72b: 20.10.2007
# Date v1.8b: 20.3.2008
# Date v2.0b: 13.7.2008
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# new in v1.7b:
#   - overworked code, fixed bugs and glitches, added "undead SP"
# 
# new in v1.72b:
#   - slightly improved code and slight system change
# 
# new in v1.8b:
#   - fixed a bug with SP absorbing that would kill an enemy instead of taking
#     all remaining SP
# 
# new in v2.0b:
#   - enhanced compatibility with Full Reflection System and Blizz-ABS
# 
#   Just include all the skill IDs that are supposed to steal HP/SP. You can
#   also define undead enemies who will (due to common belief...) revert the HP
#   absorb effect. Also you may add any IDs of enemies who use the same undead
#   effect, but on SP. Just add the IDs into UNDEAD_SP. Note that you can make
#   enemies who only are "undead" for HP stealing, SP stealing or even both.
# 
# Note:
#   If you let a skill steal both HP and SP, only HP will be stolen.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

SKILL_IDS_HP = [999] # add any Skill IDs and separate them with commas
SKILL_IDS_SP = [150] # add any Skill IDs and separate them with commas
UNDEAD_IDS = [999] # add IDS and separate them with commas
UNDEAD_SP = [999] # add IDS and separate them with commas

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#==============================================================================
# Game_Battler
#==============================================================================

class Game_Battler
  
  alias skill_effect_hpsp_absorb_later skill_effect
  def skill_effect(user, skill)
    last_hp = self.hp
    last_sr = self.sr if $crls && self.is_a?(Game_Actor)
    result = skill_effect_hpsp_absorb_later(user, skill)
    if $game_system.ABSORB_HP_SP && self.damage.is_a?(Numeric)
      if SKILL_IDS_SP.include?(skill.id)
        self.hp = last_hp
        self.hp = self.hp
        self.sr = last_sr if $crls && self.is_a?(Game_Actor)
        if user != self
          if self.is_a?(Game_Enemy) && UNDEAD_SP.include?(self.id)
            self.damage = -self.damage
          end
          if self.sp >= self.damage
            self.sp -= self.damage
          else
            self.damage, self.sp = self.sp, 0
          end
        else
          self.damage = 0
        end
      elsif SKILL_IDS_HP.include?(skill.id)
        self.hp = last_hp
        self.hp = self.hp
        self.sr = last_sr if $crls && self.is_a?(Game_Actor)
        if user != self
          if self.is_a?(Game_Enemy) && UNDEAD_IDS.include?(self.id)
            self.damage = -self.damage
          end
          if self.hp >= self.damage
            self.hp -= self.damage
          else
            self.damage, self.hp = self.hp, 0
          end
        else
          self.damage = 0
        end
      end
    end
    return result
  end
  
end

#==============================================================================
# Scene_Battle
#==============================================================================

class Scene_Battle

  alias update_phase4_step5_hpsp_absorb_later update_phase4_step5
  def update_phase4_step5(battler = nil)
    if $game_system.ABSORB_HP_SP
      @status_window.refresh
      @help_window.visible, damages = false, 0
      @target_battlers.each {|target|
          if target.damage != nil
            target.damage_pop = true
            damages += target.damage if target.damage.is_a?(Numeric)
          end}
      if check_absorb(@active_battler, @active_battler.current_action.skill_id,
          damages)
        @status_window.refresh 
      end
      @skill, @phase4_step = nil, 6
    elsif battler == nil
      update_phase4_step5_hpsp_absorb_later
    else
      update_phase4_step5_hpsp_absorb_later(battler)
    end
  end
  
  def check_absorb(user, id, damage)
    if (SKILL_IDS_HP | SKILL_IDS_SP).include?(id)
      if SKILL_IDS_HP.include?(id)
        user.hp += damage
      elsif SKILL_IDS_SP.include?(id)
        user.sp += damage
      end
      user.damage, user.damage_pop = -damage, true
      return true
    end
    return false
  end
    
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# State Breaker Skill by Blizzard
# Version: 1.0
# Type: Enhanced Skill
# Date: 19.10.2008
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
#   This skill will inflict all status effects that a skill can inflict on the
#   target. To make somebody immune to this skill's effect, just set the
#   immunity to the different status effects to F. It is recommended that the
#   skill does not have any additional effects.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

STATE_BREAKER_IDS = [66, 57] # add any Skill IDs and separate them with commas
IMMUNE_TEXT = 'Immune' # text for enemies that are immune to all states
MISS_TEXT = 'Miss' # "Miss" text in your game

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#==============================================================================
# Game_Battler
#==============================================================================

class Game_Battler
  
  alias skill_effect_state_breaker_later skill_effect
  def skill_effect(user, skill)
    #print "Test point 1A";
    result = skill_effect_state_breaker_later(user, skill)
    if $game_system.STATE_BREAKER && STATE_BREAKER_IDS.include?(skill.id)
      if skill.plus_state_set.all? {|id|
          state_ranks[id] == 6 || state_ranks[id] == 0}
        self.damage = IMMUNE_TEXT if self.damage == MISS_TEXT
      else
        skill.plus_state_set.each {|id| add_state(id)}
        self.damage = nil if self.damage == MISS_TEXT
      end
    end
    #check_hp_percent_states #new line
    return result
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Blue Magic via Skill by Blizzard
# Version: 1.5
# Type: Skill Learning Skill
# Date: 14.11.2006
# Date v1.5: 17.2.2008
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
#   This actor will learn one of the target's skills. Making this skill target
#   all allies/enemies, ONLY ONE SKILL WILL BE LEARNED FROM A RANDOM TARGET!
#   Make the skill do no damage to the target and use the hit rate to determine
#   the success chance of the skill.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

BLUE_MAGIC_IDS = [92] # add any Skill IDs and separate them with commas

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#==============================================================================
# Scene_Battle
#==============================================================================

class Scene_Battle
  
  alias make_skill_action_result_blue_later make_skill_action_result
  def make_skill_action_result(battler = nil, plus_id = nil)
    if battler == nil
      make_skill_action_result_blue_later
      battler, targets = @active_battler, @target_battlers
    elsif plus_id == nil
      make_skill_action_result_blue_later(battler)
      targets = battler.target
    else
      make_skill_action_result_blue_later(battler, plus_id)
      targets = battler.target
    end
    if $game_system.BLUE_MAGIC_SKILL &&
        BLUE_MAGIC_IDS.include?(battler.current_action.skill_id)
      targets.each {|target| target.damage = nil}
      target = targets[rand(targets.size)]
      if rand(100) < $data_skills[battler.current_action.skill_id].hit
        if target.is_a?(Game_Enemy)
          ids = []
          target.actions.each {|act| ids.push(act.skill_id) if act.kind == 1}
        elsif target.is_a?(Game_Actor)
          ids = target.skills.clone
        end
        if ids.size > 0
          skill = $data_skills[ids[rand(ids.size)]]
          if battler.skills.include?(skill.id)
            target.damage = "#{skill.name} known"
          else
            battler.learn_skill(skill.id)
            target.damage = "#{skill.name} learned"
          end
        else
          target.damage = 'None available'
        end
      else
        target.damage = 'Miss'
      end
    end
  end
    
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Demi Skill by Blizzard
# Version: 1.02b
# Type: Enhanced Skill
# Date: 5.9.2008
# Date v1.02b: 19.10.2008
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# Explanation:
# 
#   This skill deals damage equal to a percentage of the remaining HP.
# 
# 
# Configuration:
# 
#   Scroll down to START Demi Database and create Demi skills. This system work
#   on both sides, both enemies and actors can use it.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#==============================================================================
# module BlizzCFG
#==============================================================================

module BlizzCFG
  
  def self.demi_database(id)
    case id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Demi Database
# 
#   Use following template to create Demi skills:
# 
#     when ID then return RATE
# 
#   ID   - ID of the skill in the database
#   RATE - percentage of how much of the remaining HP should be taken away
# 
#   Example:
# 
#     when 88 then return 25
#   
#   Skill with ID 88 will do damage equal to 25% of the enemies' remaining HP.
# 
#   Note that using values equal to or greater than 100 will kill instantly.
#   Negative values will heal instead.
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 88 then return 25
    when 89 then return 50
    when 58 then return 50
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Demi Database
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    end
    return 0
  end
  
end

#==============================================================================
# Game_Battler
#==============================================================================

class Game_Battler
  
  alias skill_effect_demi_skill_later skill_effect
  def skill_effect(user, skill)
    last_hp = self.hp
    last_sr = self.sr if $crls && self.is_a?(Game_Actor)
    result = skill_effect_demi_skill_later(user, skill)
    if $game_system.DEMI_SKILL
      rate = BlizzCFG.demi_database(skill.id)
      if rate != 0
        self.hp = last_hp
        self.hp = self.hp
        self.sr = last_sr if $crls && self.is_a?(Game_Actor)
        if result || self.damage.is_a?(Numeric)
          self.damage = last_hp * rate / 100
          self.hp -= self.damage
        end
      end
    end
    return result
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Revenge Skill by Blizzard
# Version: 1.1b
# Type: Enhanced Skill
# Date: 22.10.2007
# Date v1.0b: 7.12.2007
# Date v1.1b: 1.10.2009
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# new in v1.0b:
#   - now does damage equal to the skill user's max HP - current HP (like it is
#     supposed to be)
#   - now beta
# 
# new in v1.1b:
#   - fixed a bug
# 
# Compatibility:
# 
#   99% compatible with SDK v1.x. 90% compatible with SDK v2.x. Could cause
#   problems with exotic CBS-es.
# 
# 
# Instructions:
# 
# - Explanation:
# 
#   This add-on allows you to create skills that deal damage equal to the
#   difference between the max HP and the current HP of the user.
#   
# - Configuration  
#   
#   REVENGE_IDS - include any IDs of Revenge Skills and separate them with
#                 commas (i.e. [52, 53, 54])
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

REVENGE_IDS = [52, 53, 54]

#==============================================================================
# Game_Battler
#==============================================================================

class Game_Battler
  
  alias skill_effect_revenge_skill_later skill_effect
  def skill_effect(user, skill)
    last_hp = self.hp
    last_sr = self.sr if $crls && self.is_a?(Game_Actor)
    result = skill_effect_revenge_skill_later(user, skill)
    if $game_system.REVENGE_SKILL && REVENGE_IDS.include?(skill.id)
      self.hp = last_hp
      self.hp = self.hp
      self.sr = last_sr if $crls && self.is_a?(Game_Actor)
      if result || self.damage.is_a?(Numeric)
        self.damage = user.maxhp - user.hp
        self.hp -= self.damage
      end
    end
    return result
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Destructor Skill by Blizzard
# Version: 1.2b
# Type: Enhanced Skill
# Date: 22.10.2007
# Date v1.0b: 28.10.2007
# Date v1.1b: 7.12.2007
# Date v1.2b: 20.3.2008
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# Explanation:
# 
#   This add-on allows you to create skills that kill the user upon use.
# 
# new in v1.0b:
#   - fixed bugs and tested
#   - now beta
# 
# new in v1.1b:
#   - fixed glitch where user would die before casting animation
#   - improved coding
#   - now easier to set up
# 
# new in v1.2b:
#   - fixed problem when using on full-HP allies
# 
# 
# Compatibility:
# 
#   99% compatible with SDK v1.x. 90% compatible with SDK v2.x. Could cause
#   problems with exotic CBS-es.
# 
# 
# Instructions:
# 
# - Configuration
#   
#   DESTRUCT_IDS   - include any IDs of basic Destructor Skills and separate
#                    them with commas (i.e. [55, 56, 57])
#   NORMALIZE_IDS  - include any IDs of Destructor Skills that deal damage/heal
#                    HP equal to the number of HP the user has left and
#                    separate them with commas
#   ULTRA_DESTRUCT - include any IDs of Destructor Skills that heal all HP and
#                    SP of the target
#   REGEN_TEXT     - damage text displayed if somebody was hit by an
#                    Ultra Destructor Skill
#   
#   Keep in mind that a Normalized Skill will react like a normal skill (heal
#   HP or deal damage), only the number will be set to the user's HP.
#   The three skill type HAVE TO be separated. A skill can't be of more than
#   one type.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

DESTRUCT_IDS = [55]
NORMALIZE_IDS = [56]
ULTRA_DESTRUCT = [57]
REGEN_TEXT = 'Full!'

#==============================================================================
# Game_Battler
#==============================================================================

class Game_Battler
  
  attr_writer :set_to_die
  
  def set_to_die
    result, @set_to_die = @set_to_die, nil
    return result
  end
  
  alias skill_effect_destruct_skill_later skill_effect
  def skill_effect(user, skill)
    last_hp = self.hp
    last_sr = self.sr if $crls && self.is_a?(Game_Actor)
    result = skill_effect_destruct_skill_later(user, skill)
    if $game_system.DESTRUCTOR_SKILL &&
        (DESTRUCT_IDS + NORMALIZE_IDS + ULTRA_DESTRUCT).include?(skill.id)
      if NORMALIZE_IDS.include?(skill.id)
        self.hp = last_hp
        self.hp = self.hp
        self.sr = last_sr if $crls && self.is_a?(Game_Actor)
        self.damage = (self.class == user.class ? -user.hp : user.hp)
        self.hp -= self.damage
      elsif ULTRA_DESTRUCT.include?(skill.id)
        self.hp = last_hp
        self.hp = self.hp
        self.sr = last_sr if $crls && self.is_a?(Game_Actor)
        self.damage = REGEN_TEXT
        self.hp, self.sp = self.maxhp, self.maxsp
      end
      user.set_to_die = true
    end
    return result
  end
  
end

#==============================================================================
# Scene_Battle
#==============================================================================

class Scene_Battle
  
  alias update_phase4_step5_destruct_skill_later update_phase4_step5
  def update_phase4_step5(battler = nil)
    ($game_party.actors + $game_troop.enemies).each {|b|
        b.hp = 0 if b.set_to_die}
    if battler == nil
      update_phase4_step5_destruct_skill_later
    else
      update_phase4_step5_multi_hit_later(battler)
    end
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# SP Damage Skill by Blizzard
# Version: 1.0b
# Type: Enhanced Skill
# Date: 5.9.2008
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# Compatibility:
# 
#   99% compatible with SDK v1.x. 90% compatible with SDK v2.x. Could cause
#   problems with exotic CBS-es.
# 
# 
# Instructions:
# 
# - Explanation:
# 
#   Instead of dealing damage / healing HP, this add-on allows your skill toä
#   do damage to / heal SP.
#   
# - Configuration
#   
#   SPKILL_IDS - include any IDs of SP Damage Skills and separate them with
#                commas (i.e. [58, 59, 60])
#   SP_TEXT    - set this to true if you want the SP word to be displayed in
#                the damage
#   
#   Keep in mind that if you use the SP_TEXT option, the damage text will
#   always be white and a + or - will be added for convenience.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

SPKILL_IDS = [16, 17, 18]
SP_TEXT = true

#==============================================================================
# Game_Battler
#==============================================================================

class Game_Battler
  
  alias skill_effect_spkill_skill_later skill_effect
  def skill_effect(user, skill)
    last_hp = self.hp
    last_sr = self.sr if $crls && self.is_a?(Game_Actor)
    result = skill_effect_spkill_skill_later(user, skill)
    if $game_system.SP_DAMAGE_SKILL && SPKILL_IDS.include?(skill.id)
      self.hp = last_hp
      self.hp = self.hp
      self.sr = last_sr if $crls && self.is_a?(Game_Actor)
      if self.damage.is_a?(Numeric)
        self.sp -= self.damage
        if SP_TEXT
          self.damage = sprintf('%+d %s', -self.damage, $data_system.words.sp)
        end
      end
    end
    return result
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Charging Skill by Blizzard
# Version: 1.0b
# Type: Enhanced Skill
# Date: 7.12.2007
# Date v1.0b: 10.12.2007
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# new in v1.0b:
#   - fixed bugs
#   - now possible to create a charging skill that executes a different one
#   - now beta
# 
# 
# Compatibility:
# 
#   99% compatible with SDK v1.x. 80% compatible with SDK v2.x. Can cause
#   problems with exotic CBS-es. Compatible with Soul Rage System and Soul
#   Limit System. Not compatible with Chaos Drive System (cannot charge a Chaos
#   Drive transforming skill).
# 
# 
# Explanation:
#   
#   This add-on allows you to create skills that need to charge first upon use.
#   The battler will count backwards until he can use the skill.
#   
#   
# Configuration:
#   
#   CHARGE_ID - Set this value to the ID of the status effect to be inflicted
#               when charging up a skill. In this case let the status effect
#               disappear after the battle is over. Set it to 0 to disable it.
#               This feature is optional.
#   
#   
# Important Notes:
#   
#   Keep in mind that the skill requirement needs to be met all the time. If
#   the battler loses SP for some reason, gets killed or something similar, the
#   countdown will stopped and the battler returned to a normal action state.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#==============================================================================
# module BlizzCFG
#==============================================================================

module BlizzCFG
  
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  CHARGE_ID = 0
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

  def self.charge_skill(id)
    case id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Charging Skill Database
#   
#   Set up the database below using following template:
#   
#   1)  when TRIGGER_ID then return [TURNS]
#   2)  when TRIGGER_ID then return [TURNS, EXECUTE_ID]
#     
#   TRIGGER_ID - the triggering skill ID in the database
#   EXECUTE_ID - the execution skill ID in the database
#   TURNS      - the number of turns the skill needs to charge up
#   
#   If you define only the number of turns for a skill, it will trigger itself
#   instead of the other skill. Use the first syntax in this case.
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 57 then return [1, 9]
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Charging Skill Database
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    end
    return [0]
  end
  
end

#==============================================================================
# Game_Battler
#==============================================================================

class Game_Battler
  
  attr_accessor :charging
  attr_accessor :current_action
  
  alias restriction_charge_skill_later restriction
  def restriction
    return (@charging != nil ? 4 : restriction_charge_skill_later)
  end
  
end

#==============================================================================
# Scene_Battle
#==============================================================================

class Scene_Battle
  
  alias main_charge_skill_later main
  def main
    main_charge_skill_later
    $game_party.actors.each {|actor| actor.charging = nil}
  end
  
  alias update_phase4_step2_charge_skill_later update_phase4_step2
  def update_phase4_step2(battler = nil)
    if $game_system.CHARGE_SKILL
      b = (battler == nil ? @active_battler : battler)
      if b.restriction > 1
        if b.charging != nil && b.charging[0] > 0
          b.charging[0] -= 1
          make_charge_action_result(b)
          if b.charging == nil && b.is_a?(Game_Actor) &&
              !b.skills.include?(b.current_action.skill_id)
            b.learn_skill(b.current_action.skill_id)
            skill_id = b.current_action.skill_id
          end
        end
      elsif ($crls ? [1, 3, 9] : [1]).include?(b.current_action.kind)
        turns = BlizzCFG.charge_skill(b.current_action.skill_id)
        if turns[0] > 0
          b.charging = [turns[0], b.current_action.clone]
          b.add_state(BlizzCFG::CHARGE_ID) if BlizzCFG::CHARGE_ID > 0
          make_charge_action_result(b, turns[1])
        end
      end
    end
    if battler == nil
      update_phase4_step2_charge_skill_later
    else
      update_phase4_step2_charge_skill_later(battler)
    end
    b.forget_skill(skill_id) if skill_id != nil
  end
  
  def make_charge_action_result(battler, trigger = nil)
    if battler.charging != nil && battler.charging[0] == 0
      battler.current_action, battler.charging = battler.charging[1], nil
      battler.remove_state(BlizzCFG::CHARGE_ID) if BlizzCFG::CHARGE_ID > 0
      return
    end
    @wait_count, battler.white_flash = 30, true
    @status_window.refresh
    if trigger
      @help_window.set_text($data_skills[battler.charging[1].skill_id].name, 1)
      battler.charging[1].skill_id = trigger
    else
      @help_window.set_text(battler.charging[0].to_s, 1)
    end
    @phase4_step = 3 if @phase4_step == 2
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Energy Skill by Blizzard
# Version: 1.0
# Type: Enhanced Skill
# Date: 3.4.2008
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# Compatibility:
# 
#   99% compatible with SDK v1.x. 90% compatible with SDK v2.x. Could cause
#   problems with exotic CBS-es.
# 
# 
# Instructions:
# 
# - Explanation:
# 
#   This add-on allows you to create skills that deal damage equal to the
#   current HP of the user.
#   
# - Configuration  
#   
#   ENERGY_SKILL_IDS - include any IDs of Energy Skills and separate them with
#                      commas (i.e. [55, 56])
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

ENERGY_SKILL_IDS = [55, 56]

#==============================================================================
# Game_Battler
#==============================================================================

class Game_Battler
  
  alias skill_effect_energy_skill_later skill_effect
  def skill_effect(user, skill)
    last_hp = self.hp
    last_sr = self.sr if $crls && self.is_a?(Game_Actor)
    result = skill_effect_energy_skill_later(user, skill)
    if $game_system.ENERGY_SKILL && ENERGY_SKILL_IDS.include?(skill.id)
      self.hp = last_hp
      self.hp = self.hp
      self.sr = last_sr if $crls && self.is_a?(Game_Actor)
      if result
        self.damage = user.hp * skill.power / skill.power.abs
        self.hp -= self.damage
      end
    end
    return result
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Master Thief Skill by Blizzard
# Version: 1.0b
# Type: Enhanced Skill
# Date: 19.10.2008
# Date v1.0b: 6.10.2009
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
#   This skill allows stealing items or gold from enemies or vice versa. The
#   skill success probability is multiplied with the enemy success probability
#   which makes it possible to make different skills and enemy combinations.
#   Success rates of skills higher than 100% will make it easier to steal from
#   enemies.
#   
#   Gold and item loot are slightly different. While only one item can be
#   stolen at the time, gold can be stolen all at once. The loot with a higher
#   success rate has priority over loot with lower success priority.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#==============================================================================
# module BlizzCFG
#==============================================================================

module BlizzCFG
  
  def self.steal_skill_database(id)
    case id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Steal Database
# 
#   Use following template to create Stealing Skills:
# 
#     when ID then return RATE
# 
#   ID   - ID of the skill in the database
#   RATE - success multiplier rate in percents
# 
#   Example:
# 
#     when 23 then return 200
#     when 24 then return 100
#   
#   Skill with ID 23 will be twice as successful when stealing things than
#   skill with ID 24.
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 23 then return 200
    when 24 then return 100
    when 25 then return 50
    when 57 then return 100
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Demi Database
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    end
    return 0
  end
  
  def self.weapon_loot_database(id)
    case id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Weapon Loot Database
# 
#   Use following template to create weapon loot for enemies:
# 
#     when ID then return [[WEAPON_ID1, AMOUNT1, RATE1], ...]
# 
#   WEAPON_ID - ID of the item in the database
#   AMOUNT   - how many can be stolen
#   RATE     - success rate in percents
# 
#   Example:
# 
#     when 1 then return [[1, 2, 50], [4, 1, 10]]
#   
#   Enemy with ID 1 possesses 2 weapons of ID 1 and the success rate to steal
#   one is 50% and 1 weapon of ID 4 with a success rate of 10%.
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 1 then return [[1, 2, 50], [2, 1, 10]]
    when 2 then return [[2, 1, 80]]
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Item Loot Database
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    end
    return []
  end
  
  def self.armor_loot_database(id)
    case id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Armor Loot Database
# 
#   Use following template to create armor loot for enemies:
# 
#     when ID then return [[ARMOR_ID1, AMOUNT1, RATE1], ...]
# 
#   ARMOR_ID - ID of the item in the database
#   AMOUNT   - how many can be stolen
#   RATE     - success rate in percents
# 
#   Example:
# 
#     when 1 then return [[1, 2, 50], [4, 1, 10]]
#   
#   Enemy with ID 1 possesses 2 armors of ID 1 and the success rate to steal
#   one is 50% and 1 armor of ID 4 with a success rate of 10%.
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 3 then return [[1, 1, 20], [2, 1, 30]]
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Item Loot Database
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    end
    return []
  end
  
  def self.item_loot_database(id)
    case id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Item Loot Database
# 
#   Use following template to create item loot for enemies:
# 
#     when ID then return [[ITEM_ID1, AMOUNT1, RATE1], ...]
# 
#   ITEM_ID - ID of the item in the database
#   AMOUNT  - how many can be stolen
#   RATE    - success rate in percents
# 
#   Example:
# 
#     when 1 then return [[1, 2, 50], [4, 1, 10]]
#   
#   Enemy with ID 1 possesses 2 items of ID 1 and the success rate to steal one
#   is 50% and 1 item of ID 4 with a success rate of 10%.
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 4 then return [[4, 1, 100]]
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Item Loot Database
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    end
    return []
  end
  
  def self.gold_loot_database(id)
    case id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Gold Loot Database
# 
#   Use following template to create gold loot for enemies:
# 
#     when ID then return [AMOUNT, BASE, RATE]
# 
#   AMOUNT - how many can be stolen
#   BASE   - probability calculation base
#   RATE   - success rate in percents
# 
#   Example:
# 
#     when 3 then return [300, 100, 90]
#   
#   Enemy with ID 1 possesses 300 gold and the success rate to steal each 100
#   pieces of gold is 90%. Since the enemy has 300 gold, the success chance to
#   steal all 300 at once is 90% * 90% * 90% = 72.9%. If at first 100 gold was
#   stolen, the enemy is still in possession of 200 more gold hence the
#   success rate to steal the remaining 200 gold is 90% * 90% = 81%.
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 1 then return [500, 50, 90]
    when 3 then return [1000, 200, 70]
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Gold Loot Database
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    end
    return nil
  end
  
end

#==============================================================================
# Game_Temp
#==============================================================================

class Game_Temp
  
  attr_accessor :loot_data
  
end
  
#==============================================================================
# Game_Battler
#==============================================================================

class Game_Battler
  
  alias skill_effect_master_thief_later skill_effect
  def skill_effect(user, skill)
    result = skill_effect_master_thief_later(user, skill)
    if $game_system.MASTER_THIEF && self.is_a?(Game_Enemy)
      rate = BlizzCFG.steal_skill_database(skill.id)
      self.set_loot(rate) if rate != 0
    end
    return result
  end
  
end

#==============================================================================
# Game_Enemy
#==============================================================================

class Game_Enemy
  
  alias init_master_thief_later initialize
  def initialize(troop_id, member_index)
    init_master_thief_later(troop_id, member_index)
    @loot = []
    BlizzCFG.weapon_loot_database(self.id).each {|w| @loot.push([0] + w)}
    BlizzCFG.armor_loot_database(self.id).each {|a| @loot.push([1] + a)}
    BlizzCFG.item_loot_database(self.id).each {|i| @loot.push([2] + i)}
    gold = BlizzCFG.gold_loot_database(self.id)
    @loot.push([3] + gold) if gold != nil
  end
  
  def set_loot(rate)
    possible_loot = self.get_possible_loot(rate)
    if possible_loot == nil
      $game_temp.loot_data = [false]
    elsif possible_loot.size == 0
      $game_temp.loot_data = [true]
    else
      $game_temp.loot_data = possible_loot.max {|a, b| a[2] <=> b[2]}
      if $game_temp.loot_data[0] == 3
        @loot.each_index {|i|
            if @loot[i][0] == 3
              @loot[i][1] -= $game_temp.loot_data[1]
              @loot[i] = nil if @loot[i][1] <= 0
            end}
        @loot.compact!
      else
        $game_temp.loot_data[2] -= 1
        @loot.delete($game_temp.loot_data) if $game_temp.loot_data[2] == 0
      end
    end
  end
  
  def get_possible_loot(rate)
    return nil if @loot.size == 0
    possible_loot = []
    @loot.each {|loot|
        if loot[0] == 3
          gold, rates = 0, 1.0
          (loot[1].to_f / loot[2]).ceil.times {
              if rand(100) < loot[3] * rate / 100
                rates *= loot[3].to_f / 100
                gold += loot[2]
              end}
          possible_loot.push([3, gold, 0, (rates * 100).to_i]) if gold != 0
        else
          possible_loot.push(loot) if rand(100) < loot[3] * rate / 100
        end}
    return possible_loot
  end
  
end

#==============================================================================
# Scene_Battle
#==============================================================================

class Scene_Battle
  
  alias update_phase4_step5_master_thief_later update_phase4_step5
  def update_phase4_step5(battler = nil)
    if battler != nil
      update_phase4_step5_master_thief_later(battler)
    else
      update_phase4_step5_master_thief_later
    end
    if $game_temp.loot_data != nil
      loot = nil
      case $game_temp.loot_data[0]
      when 0
        $game_party.gain_weapon($game_temp.loot_data[1], 1)
        loot = "#{$data_weapons[$game_temp.loot_data[1]].name} stolen"
      when 1
        $game_party.gain_armor($game_temp.loot_data[1], 1)
        loot = "#{$data_armors[$game_temp.loot_data[1]].name} stolen"
      when 2
        $game_party.gain_item($game_temp.loot_data[1], 1)
        loot = "#{$data_items[$game_temp.loot_data[1]].name} stolen"
      when 3
        $game_party.gain_gold($game_temp.loot_data[1])
        loot = "#{$game_temp.loot_data[1]} #{$data_system.words.gold} stolen"
      when true
        loot = 'Stealing failed'
      when false
        loot = 'Nothing left'
      end
      @help_window.set_text(loot, 1) if loot != nil
    end
  end
  
  alias update_phase4_step6_master_thief_later update_phase4_step6
  def update_phase4_step6(battler = nil)
    if $game_temp.loot_data != nil
      @help_window.visible, $game_temp.loot_data = false, nil
    end
    if battler != nil
      update_phase4_step6_master_thief_later(battler)
    else
      update_phase4_step6_master_thief_later
    end
  end
  
end

#==============================================================================
# HP Consuming Skill
# Author: game_guy
# Type: Custom Skill
# Version: 1.1
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# - code reviewed, optimized, integrated into Tons of Add-ons, freed from
#   potential bugs and beta tested by Blizzard
# - this add-on is part of Tons of Add-ons with full permission of the original
#   author(s)
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
#==============================================================================
=begin
Intro:
Skills that consume HP instead of SP. Or even both HP and SP.

Instructions:
If you want skills that only consume HP simply set the skill's SP cost to 0.

Then go to CONFIG HP COST and follow the instructions there.
=end

#==============================================================================
# RPG::Skill
#==============================================================================

class RPG::Skill
  
  def hp_cost
    return 0 if !$game_system.HP_SKILL
    case @id
    #===================================
    # CONFIG HP COST
    # when SKILL_ID then return HP_COST
    #===================================
    when 57 then return 50
    #===================================
    end
    return 0
  end
  
end

#==============================================================================
# Game_Battler
#==============================================================================

class Game_Battler
  
  alias skill_can_use_hp_consuming_skills_later? skill_can_use?
  def skill_can_use?(id)
    if $data_skills[id].hp_cost > 0 && self.hp <= $data_skills[id].hp_cost
      return false
    end
    return skill_can_use_hp_consuming_skills_later?(id)
  end
  
end

#==============================================================================
# Scene_Battle
#==============================================================================

class Scene_Battle
  
  alias make_skill_action_result_hp_consuming_skills_later make_skill_action_result
  def make_skill_action_result(battler = nil)
    if battler != nil
      make_skill_action_result_hp_consuming_skills_later(battler)
    else
      make_skill_action_result_hp_consuming_skills_later
      battler = @active_battler
    end
    battler.hp -= @skill.hp_cost if @phase != 1 && @skill.hp_cost > 0
  end
  
end

#==============================================================================
# Scene_Skill
#==============================================================================

class Scene_Skill
  
  alias update_skill_hp_consuming_skills_later update_skill
  def update_skill
    update_skill_hp_consuming_skills_later
    if Input.trigger?(Input::C)
      return if @skill == nil || !@actor.skill_can_use?(@skill.id)
      if @skill.scope < 3 && @skill.common_event_id > 0
        @actor.hp -= @skill.hp_cost if @skill.hp_cost > 0
      end
    end
  end
  
  def update_target
    if Input.trigger?(Input::B)
      $game_system.se_play($data_system.cancel_se)
      @skill_window.active = true
      @target_window.visible = false
      @target_window.active = false
    elsif Input.trigger?(Input::C)
      unless @actor.skill_can_use?(@skill.id)
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      used = false
      if @target_window.index == -1
        $game_party.actors.each {|actor|
            used |= actor.skill_effect(@actor, @skill)}
      elsif @target_window.index <= -2
        target = $game_party.actors[@target_window.index + 10]
        used = target.skill_effect(@actor, @skill)
      elsif @target_window.index >= 0
        target = $game_party.actors[@target_window.index]
        used = target.skill_effect(@actor, @skill)
      end
      if used
        $game_system.se_play(@skill.menu_se)
        @actor.sp -= @skill.sp_cost
        ### START EDIT
        @actor.hp -= @skill.hp_cost if @skill.hp_cost > 0
        ### END EDIT
        @status_window.refresh
        @skill_window.refresh
        @target_window.refresh
        if $game_party.all_dead?
          $scene = Scene_Gameover.new
        elsif @skill.common_event_id > 0
          $game_temp.common_event_id = @skill.common_event_id
          $scene = Scene_Map.new
        end
      else
        $game_system.se_play($data_system.buzzer_se)
      end
    end
  end
  
end

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::#
#                                                                             #
#                            # ##### ##### #     #                            #
#                            #   #   #     ##   ##                            #
#                            #   #   ####  # # # #                            #
#                            #   #   #     #  #  #                            #
#                            #   #   ##### #     #                            #
#                                                                             #
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::#

#==============================================================================
# Script : Skill Teaching Item
# Auther : game_guy
# Type : Custom Item
# Version : 1.0
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# - code reviewed, optimized, integrated into Tons of Add-ons, freed from
#   potential bugs and beta tested by Blizzard
# - this add-on is part of Tons of Add-ons with full permission of the original
#   author(s)
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
#==============================================================================
=begin
Intro:
Makes items teach players skills.

Instructions:
First go in the database, go to the System Tab and make a new element id and name
it Skill Item. Come back in here and change the 17 below in the module to the id
of the element you just made. 

Now go further below and you'll see
# CONFIG use
follow those instructions to set skills to item id's. Then you're set.

Features:
Makes items teach actors skills. Does not work with enemies.
=end

class RPG::Item
  
  def skills
    return [] if !$game_system.SKILL_TEACHING_ITEM
    case id
    # CONFIG use
    # when x return [y, z]
    # x = item id, y = skill id, z = skill id
    # when 2 then return [13, 12]
    # The above will make item id 2 make an actor learn the skill id of 13 and
    # skill id of 12
    # You can add as many IDs as you want, separate them with commas
    when 2 then return [13, 12]
    when 1 then return [1]
    end
    return []
  end
  
end

#==============================================================================
# Game_Battler
#==============================================================================

class Game_Battler
  
  alias item_effect_skillteachingitems item_effect
  def item_effect(item)
    result = item_effect_skillteachingitems(item)
    item.skills.each {|id|
        if !@skills.include?(id)
          learn_skill(id)
          result = true
        end}
    return result
  end
  
end

#==============================================================================
# Script : Level Up/Down Item
# Auther : game_guy
# Type : Custom Item
# Version : 1.0
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# - code reviewed, optimized, integrated into Tons of Add-ons, freed from
#   potential bugs and beta tested by Blizzard
# - this add-on is part of Tons of Add-ons with full permission of the original
#   author(s)
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
#==============================================================================
=begin
Intro:
Remember in pokemon how rare candies leveled up your pokemon? This does the same.

Instructions:
Configuration is down there in module GameGuy.

Features:
Makes items level up and/or level down actors. Does not work with enemies.
=end

#==============================================================================
# module GameGuy
#==============================================================================

module GameGuy
  # Place level up items in there. Seperate with commas.
  LevelUpItems = [1, 3]
  # Place level down items in there. Seperate with commas.
  LevelDownItems = [2, 4]
end

#==============================================================================
# Game_Battler
#==============================================================================

class Game_Battler
  
  alias item_effect_level_up_items item_effect
  def item_effect(item)
    result = item_effect_level_up_items(item)
    return result if !$game_system.LEVEL_UPDOWN_ITEM
    level_up = GameGuy::LevelUpItems.include?(item.id)
    level_down = GameGuy::LevelDownItems.include?(item.id)
    if level_up && level_down
      self.level = self.level
      result = true
    elsif level_up
      old_level = self.level
      self.level += 1
      result |= (old_level != self.level)
    elsif level_down
      old_level = self.level
      self.level -= 1
      result |= (old_level != self.level)
    end
    return result
  end
  
end
