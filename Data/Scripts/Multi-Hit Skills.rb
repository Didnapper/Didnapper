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
  WEAPON_RANDOM = [0, 999]
  SKILL_RANDOM = [179, 180] #Assault, Double chest punch
  ITEM_RANDOM = []
  ENEMY_RANDOM = [175] #Twins
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Basic Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

  def self.weapon_hits(id)
    case id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration 1
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 998 then return 1
    when 999 then return 1
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
    when 179 then return 2
    when 180 then return 2
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
    when 12 then return 3
    when 13 then return 2
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
    return unless @active_battler != nil
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
    if @phase4_step != 1
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
    @help_window.visible = false if (@repeat[1] - @repeat[0]) > 1 #Disable skill name window on repeat - Kendrian
    if (@repeat[1] - @repeat[0]) > 1
      @animation1_id = 0
      @active_battler.white_flash = false
    end
    animation1_id = 0 if (@repeat[1] - @repeat[0]) > 1

    if @repeat[2] > 3
      sp_cost = @skill.sp_cost
      #----- you can remove these 3 lines if you want----
      if $game_system.SP_COST_MOD
        sp_cost = BlizzCFG.get_cost_mod(@active_battler.states, sp_cost)
      end
      #--------------------------------------------------
      @active_battler.sp += sp_cost
      @status_window.refresh
    end
  end
  
end