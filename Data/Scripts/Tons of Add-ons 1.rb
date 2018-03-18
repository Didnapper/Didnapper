#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Tons of Add-ons by Blizzard
# Version: 7.32b
# Type: Add-on Collection Control Script
# Date v1.00b:  14.11.2006
# Date v1.10b:  17.11.2006
# Date v1.60b:   4.12.2006
# Date v1.62b:   6.12.2006
# Date v1.70b:  13.12.2006
# Date v1.87b:  12.01.2007
# Date v2.20b:  16.01.2007
# Date v2.30b:  22.01.2007
# Date v2.31b:  24.01.2007
# Date v2.40b:   1.02.2007
# Date v2.50b:   4.02.2007
# Date v2.70b:   7.02.2007
# Date v2.71b:  12.02.2007
# Date v2.80b:  17.02.2007
# Date v3.70b:  19.02.2007
# Date v3.71b:  23.02.2007
# Date v3.80b:   7.03.2007
# Date v4.00b:   7.03.2007
# Date v4.01b:   9.03.2007
# Date v4.02b:  11.03.2007
# Date v4.30b:  12.03.2007
# Date v4.32b:  18.03.2007
# Date v4.50b:  24.03.2007
# Date v4.70b:  30.04.2007
# Date v4.80b:   4.05.2007
# Date v4.81b:   8.05.2007
# Date v4.85b:   7.07.2007
# Date v4.86b:   8.08.2007
# Date v4.90b:  12.07.2007
# Date v4.91b:  14.07.2007
# Date v4.97b:  31.07.2007
# Date v4.98b:   7.08.2007
# Date v5.40b:  20.10.2007
# Date v5.80b:  22.10.2007
# Date v5.81b:  23.10.2007
# Date v5.83b:  25.10.2007
# Date v5.90b:  28.10.2007
# Date v5.91b:   5.11.2007
# Date v5.98b:  13.11.2007
# Date v5.99b:  19.11.2007
# Date v6.00b:   7.12.2007
# Date v6.02b:  10.12.2007
# Date v6.03b:  28.01.2008
# Date v6.10b:  19.02.2008
# Date v6.11b:  20.02.2008
# Date v6.12b:  22.02.2008
# Date v6.13b:  23.02.2008
# Date v6.20b:  26.03.2008
# Date v6.40b:   3.04.2008
# Date v6.50b:  13.07.2008
# Date v6.51b:  21.07.2008
# Date v6.54b:  23.07.2008
# Date v6.56b:  22.08.2008
# Date v6.58b:   5.09.2008
# Date v6.59b:   5.09.2008
# Date v6.60b:  19.10.2008
# Date v6.61b:  25.10.2008
# Date v6.70b:  29.10.2008
# Date v6.71b:   1.11.2008
# Date v6.73b:  15.11.2008
# Date v6.80b:  24.11.2008
# Date v6.81b:  14.12.2008
# Date v6.83b:  16.04.2009
# Date v6.85b:  18.04.2009
# Date v6.86b:  19.04.2009
# Date v6.88b:  22.04.2009
# Date v6.89b:   4.06.2009
# Date v7.20b:   7.06.2009
# Date v7.22b:  11.06.2009
# Date v7.30b:  18.06.2009
# Date v7.31b:  20.07.2009
# Date v7.32b:  28.07.2009
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
#                                    PART 1
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
# VERY IMPORTANT NOTES:
# 
#   For any new add-on the version will increase by 0.1, for any update of the
#   collection or any update on an add-on the version will increase by 0.01.
#   Also from v3.71b on there is a recognition global variable available which
#   will make the Tons of Add-ons much more compatible with many of my scripts.
#   I noticed serious issues with several of my older scripts.
#   
#   Tons of Add-ons now has to be used as 3-parts script because of a weird
#   behaviour of RMXP during bug detection. Insert the 3 parts in the correct
#   order and the system should work without problems. Do NOT remove any of the
#   parts, the script NEEDS all 3 parts to work with other systems.
# 
# 
# Compatibility:
# 
#   90% compatible with SDK v1.x. 80% compatible with SDK v2.x. Some add-ons
#   will corrupt your old savegames. If you experience the "Stack level too
#   deep" error, you might already use one of these add-ons. All of these
#   add-ons here work with each other with a success rate of 99%. This add-on
#   collection itself WILL corrupt your old savegames. May cause
#   incompatibility issues with following systems:
#   
#   - exotic CBS-ex
#   - exotic CMS-es
#   - skill learning systems
#   - exotic graphic systems on the map
#   - weapon/armor changing systems
#   - enhanced equipment systems
#   
#   This add-on collection is semantically compatible with RTAB v1.16 with all
#   Plugins, though, several add-ons will not work:
#   
#   - Center Battler    - will cause a crash (it's rather useless in Side-View
#                         RTAB anyway)
#   - Multi-Hit         - will not react at all if RTAB is being used due to
#                         the heavy changes in the methods supported by the DBS
#   - Charge Skill      - the countdown will be start at 0 and the skill will
#                         be executed right away
#   
#   It is possible that more add-ons don't work, but it is very unlikely.
# 
# 
# Featured add-ons so far:
# 
#     64 add-ons by Blizzard
#   +  2 add-ons by Fantasist
#   +  1 add-on  by NAMKCOR
#   +  1 add-on  by Zan
#   +  4 add-ons by game_guy
#   +  1 add-on  by TerreAqua
#   = 73 add-ons altogether
# 
# Ideas:
# 
#   - Blizzard
#   - GuardianAngelX72
#   - BanisherOfEden
#   - italianstal1ion
#   - indinera
#   - Yami
#   - blazinhandle
#   - Arrow-1
#   - Caro La Rushe
#   - Zan
#   - shahafyz57
#   - Echo
#   - Cid
#   - Fantasist
#   - Ceaon
#   - NAMKCOR
#   - mumerus
#   - chino69
#   - game_guy
#   - TerreAqua
#   - Subsonic_Noise
# 
# 
# Features:
# 
#   ----> PART 1
#   ----> Graphic (make your game look nice):
# - Better Tilemap update (will update autotiles faster)
# - Animated Title (have an animated title screen without .gifs)
# - Center Battler (they will be centered instead of lined next to each other)
# - HP/SP/EXP gradient/slant bars (including 7 styles, opacity and least lag)
# - Location Names (shows pictures or names of the location the player visits)
# - Black Fade (shows a black screen when changing the map or before battle)
# - Simple Shaded Text (draws a shadow behind your text)
# - Blizz-Art lagless HUD (Heads Up Display using either HP/SP/EXP or simple)
# - Screen Tremble (makes your screen shake vertically, too)
# - Animation Stack (shows animation of all inflicted status effects)
# - Simple Facesets (shows a face instead of the spriteset in the main menu)
# - Caterpillar (party members follow you on the map)
# - Arrow over Player (shows arrow over player's head if he's "behind")
# - Animated Battle Background (animates battle backgrounds)
# - Map as Battleback (map is the battle backgrounds)
# - Facesets for DSS (shows a face instead of the spriteset in the status menu)
# - Status Effects as Icons (displays status effects as icons)
# - Animated Battlers Non-Action BS (animates battlers in battle systems)
# - Enhanced Battle Cursor (plays animations upon cursors in battle)
# - Death Image (displays an image instead of nothing for dead actors)
# - Terrain Battlebacks (different battlebacks for different terrains)
# 
#   ----> PART 2
#   ----> Utility (make your game more unique and better/help you during debug):
# - Custom Game Controls (set up your own game controls)
# - FPS Modulator (increase the fps rate up 3 times like in an emulator)
# - Speed Modulator (change the main character's speed on the map)
# - Fullscreen? (asks the player at game start if he wishes to switch to full)
# - Death Toll (counts killed enemies and actor deaths)
# - Multi-Drop (makes enemies drop more than just one item)
# - Window_BattleResult (displays gained items in a different, but better way)
# - Unique Skill Commands (different name for the Skill command for each class)
# - Ultimate Font Override (will override the font from any RMXP version)
# - Heal at LvlUp (heals characters who level up)
# - Weapon/Armor HP/SP Plus (max HP and max SP can also be increased)
# - EQUAP Skills (equipment skills, equip to learn + AP system like FF9)
# - Picture Movie Scene (easily create picture based cutscenes)
# - Target 'em all! (make skills target all battlers)
# - Quick Passability Test (let's you debug maps faster and more convenient)
# - Blizz-ABS Minimap (never was a minimap so easy to use)
# - Enemy Status in Battle (displays enemies' HP, SP and state)
# - Passive Skills (modify attributes when learned)
# - Different Difficulties (like "Easy", "Normal", "Hard")
# - Skill Separation System (like "White Magic", "Black Magic", "Technic", etc.)
# - Multi-Hit (make weapons/skills/enemies hit more than once)
# - Scene_Item calling Items (make items call special item scenes)
# - Plug-in Save Point (create your own save point system within minutes)
# - Equipment Requirement System (Diablo II style requirements)
# - Item Requirement for Skills (skills require and consume items upon use)
# - HP/SP Crush (weapons consume/heal HP/SP when attacking)
# - Roulette (allows random targets with a nice animation)
# - Chain Status Effects (status effects have other states as precondition)
# - Actor-specific Item Usability (deny item effects on specific actors)
# - Percentage Health States (states added/removed on specific HP percentages)
# 
#   ----> PART 3
#   ----> Status Effect (non-standard status effects):
# - Zombie Status (Healing items will hurt and light attacks are effective)
# - Regen Status (progressive healing aka poison, but the other way)
# - Auto-Revive Status (or Auto-Life, will be automatically revived after dying)
# - Fury Status (if a specific character dies, another one will become Fury)
# - Invincible Status (this status will nullify ANY DAMAGE done by enemies)
# - SP Cost Mod Status (this status will change SP cost)
# - Frozen Status (dies instantly if getting damaged)
# - Blue Magic Status (can learn enemies'/other actors' skills)
# - Doom Status (countdown to death)
# 
#   ----> PART 3
#   ----> Skill (non-standard skills):
# - Absorb HP/SP Skill (with considering undead enemies)
# - State Breaker Skill (changes available status effects forcefully)
# - Blue Magic Skill (can learn enemies'/other actors' skills)
# - Demi Skill (deals damage equal to a percentage of the remaining HP)
# - Revenge Skill (does damage equal to MAX_HP - CURRENT_HP)
# - Destructor Skill (kills self to achieve various effects)
# - SP Damage Skill (skills that damage / heal SP instead of HP)
# - Charge Skill (skills that count down before usage)
# - Energy Skill (does damage equal to the current HP of the user)
# - Master Thief Skill (steals weapon, armors, items and gold from enemies)
# - HP Consuming Skill (consumes HP upon usage)
# 
#   ----> PART 3
#   ----> Item (non-standard items):
# - Skill Teaching Item (items that teach actors skills)
# - Level Up/Down Item (items that level up/down actors)
# 
# 
# Version History:
# 
# v1.10b:
#   -> added Black Fade by Blizzard
# 
# v1.60b:
#   -> added Ultimate Font Override by Blizzard
#   -> added Simple Shaded Text by Blizzard
#   -> added Heal at LvlUp by Blizzard
#   -> added Fury Status by Blizzard
#   -> added Invincible Status by Blizzard
# 
# v1.62b:
#   -> upgraded Death Toll by Blizzard to v1.2b
# 
# v1.70b:
#   -> added Half SP by Blizzard
# 
# v1.87b:
#   -> added Blizz-Art lagless HUD by Blizzard
#   -> upgraded Animated Title by Blizzard to v1.33b
#   -> upgraded Centered Battlers by Blizzard to v2.1b
#   -> upgraded HP/SP/EXP bars by Blizzard to v4.11b
#   -> upgraded Speed Modulator by Blizzard to v1.01b
#   -> upgraded Regen Status Effect by Blizzard to v1.1b
#   -> upgraded Auto-Revive by Blizzard to v1.21b
#   -> updated FPS Modulator by Blizzard
# 
# v2.20b:
#   -> added Weapon/Armor HP/SP Plus by Blizzard
#   -> added Full Reflection System by Blizzard
#   -> added EQ Skills by Blizzard
#   -> added Picture Movie Scene by Blizzard
# 
# v2.30b:
#   -> added Screen Tremble by Blizzard
# 
# v2.31b:
#   -> updated Screen Tremble by Blizzard
#   -> updated Better Tilemap update by Blizzard
# 
# v2.40b:
#   -> added Animation Stack by Blizzard
#   -> upgraded Picture Movie Scene by Blizzard to v2.02b
#   -> upgraded Screen Tremble by Blizzard to v1.1b
# 
# v2.50b:
#   -> added Target 'em all! by Blizzard
#   -> upgraded Unique Skill Commands by Blizzard to v1.11b
# 
# v2.70b:
#   -> added Quick Passability Test by Blizzard
#   -> added Dynamic Passability Minimap by Blizzard
#   -> upgraded Picture Movie Scene by Blizzard to v2.03b
# 
# v2.71b:
#   -> upgraded Dynamic Passability Minimap by Blizzard to v1.01b
# 
# v2.80b:
#   -> added Enemy Status in Battle by Blizzard
# 
# v3.70b:
#   -> added Simple Facesets by Blizzard
#   -> changed EQ Skills by Blizzard to EQUAP Skills and upgraded to v3.0b
#   -> upgraded Unique Skill Commands by Blizzard to v1.2b
#   -> updated Center Battler by Blizzard
#   -> updated Weapon/Armor HP/SP Plus by Blizzard
#   -> added constant for recognition by other scripts to improve compatibility
#   -> Why suddenly v3.7b? 37 add-ons are featured so far!
# 
# v3.71b:
#   -> upgraded Simple Facesets by Blizzard to v1.01b
#   -> fixed a problem with the compatibility recognition
# 
# v3.80b:
#   -> added Caterpillar by Blizzard
# 
# v4.00b:
#   -> added Arrow over Player by Blizzard
#   -> added EMP Skill by Blizzard
#   -> upgraded Caterpillar by Blizzard to v1.01b
#   -> upgraded EQUAP Skills by Blizzard to v3.02b
# 
# v4.01b:
#   -> upgraded Black Fade by Blizzard to v1.1b
# 
# v4.02b:
#   -> upgraded Window_BattleResult by Blizzard to v1.1b
# 
# v4.30b:
#   -> added Animated Battle Background by Blizzard
#   -> added Map as Battleback by Blizzard
#   -> added 1 SP by Blizzard
#   -> upgraded HP/SP/EXP gradient/slant bars by Blizzard to v4.2b
#   -> upgraded Blizz-Art lagless HUD by Blizzard to v1.2b
#   -> upgraded Weapon/Armor HP/SP Plus by Blizzard to v1.01b
#   -> upgraded Full Reflection System by Blizzard to v2.0b
#   -> upgraded EMP Skill by Blizzard to v1.01b
# 
# v4.32b:
#   -> upgraded Zombie Status Effect by Blizzard to v1.1b
#   -> updated Arrow over Player by Blizzard
# 
# v4.50b:
#   -> added Different Difficulties by Blizzard
#   -> added Skill Separation System by Blizzard
#   -> upgraded Half SP by Blizzard to v1.4b
#   -> upgraded 1 SP by Blizzard to v1.1b
#   -> updated Center Battler by Blizzard
#   -> updated Blizz-Art lagless HUD by Blizzard
#   -> updated Death Roulette by Blizzard
#   -> updated EMP Skill by Blizzard
# 
# v4.70b:
#   -> added Facesets for DSS by Zan
#   -> added Status Effects as Icons for DSS by Blizzard
#   -> now compatible with Blizz-ABS 1.01 and higher
# 
# v4.80b:
#   -> added Animated Battlers for DBS by Blizzard
#   -> fixed the HUD lag problem with Blizz-ABS 1.01 and higher
# 
# v4.81b:
#   -> updated Skill Separation System by Blizzard
# 
# v4.85b:
#   -> upgraded Weapon/Armor HP/SP Plus by Blizzard to v2.0
#   -> upgraded Location Names by Blizzard to v2.1b
#   -> upgraded Blizz-Art lagless HUD by Blizzard to v1.3b
#   -> improved overall coding of Tons of Add-ons and fixed incompatibility bugs
# 
# v4.86b:
#   -> upgraded Fullscreen? by Blizzard to v1.22b
# 
# v4.9b:
#   -> added Demi Skill by Blizzard
# 
# v4.91b:
#   -> upgraded HP/SP/EXP gradient/slant bars by Blizzard to v4.4b
# 
# v4.97b:
#   -> due to a bug Ultimate Font Override can't be turned on/off ingame now
#   -> upgraded Location Names by Blizzard to v2.11b
#   -> upgraded Arrow over Player by Blizzard to v1.01b
#   -> upgraded Weapon/Armor HP/SP Plus by Blizzard to v2.0b
#   -> upgraded Death Toll by Blizzard to v1.3b
#   -> updated ABSEAL by Blizzard
# 
# v4.98b:
#   -> upgraded Caterpillar by Blizzard to v2.0
# 
# v5.40b:
#   -> added Multi-Hit by Blizzard
#   -> added Scene_Item calling Items by Blizzard
#   -> added Custom Game Controls by Blizzard
#   -> added Plug-in Save Point by Blizzard
#   -> added Frozen Status Effect by Blizzard
#   -> added Doom Skill by Blizzard
#   -> upgraded Caterpillar by Blizzard to v2.0b
#   -> upgraded Animated Battle Background by Blizzard to v1.1b
#   -> upgraded Map as Battleback by Blizzard to v1.5b
#   -> upgraded Unique Skill Commands by Blizzard to 1.3b
#   -> upgraded 1 SP by Blizzard to v1.11b
#   -> upgraded Absorb HP/SP by Blizzard to v1.72b
#   -> upgraded Animated Battlers for Non-Action BS by Blizzard to v1.3b
#   -> removed Blizz-ASBEAL for convenience, now available separately
#   -> rewritten conditions using classic syntax to avoid RGSS conditioning bug
#   -> now compatible with RTAB v1.16 + Plug-ins
# 
# v5.80b:
#   -> added Revenge Skill by Blizzard
#   -> added Destructor Skill by Blizzard
#   -> added SP Damage Skill by Blizzard
#   -> added Enhanced Battle Cursor by Fantasist
#   -> upgraded Regen Status by Blizzard to v2.0
# 
# v5.81b:
#   -> upgraded HP/SP/EXP gradient/slant bars by Blizzard to v4.41b
# 
# v5.83b:
#   -> upgraded HP/SP/EXP gradient/slant bars by Blizzard to v4.5b
#   -> upgraded Location Names by Blizzard to v2.12b
#   -> commented code down to Blizz-Art lagless HUD
# 
# v5.90b:
#   -> added Equipment Requirement System by NAMKCOR
#   -> upgraded Doom Skill by Blizzard to v1.0b
#   -> upgraded Destructor Skill by Blizzard to v1.0b
#   -> upgraded Enhanced Battle Cursor by Fantasist to v2.1 beta
# 
# v5.91b:
#   -> upgraded Location Names by Blizzard to v2.13b
# 
# v5.98b:
#   -> added SP Cost Mod Status Effect by Blizzard
#   -> added Multi-Drop by Blizzard
#   -> upgraded Window_BattleResult by Blizzard to 1.2b
#   -> upgraded Status Effects as Icons by Blizzard to 1.0b
#   -> upgraded Zombie Status by Blizzard to 1.2b
#   -> upgraded Regen Status by Blizzard to 2.0b
#   -> upgraded Auto-Revive Status by Blizzard to 1.22b
#   -> upgraded Invincible Status by Blizzard to 2.0b
#   -> upgraded Frozen Status by Blizzard to 1.0b
#   -> removed Half SP by Blizzard
#   -> removed 1 SP by Blizzard
#   -> removed Full Reflection System by Blizzard
#   -> updated all skill add-ons to work without Reflect
#   -> THIS VERSION HAS ONLY 58 ADD-ONS!
# 
# v5.99b:
#   -> upgraded Auto-Revive Status by Blizzard to 1.23b
#   -> updated Frozen Status by Blizzard
#   -> THIS VERSION HAS ONLY 58 ADD-ONS!
# 
# v6.00b:
#   -> added Item Requirement for Skills by Blizzard
#   -> added Charge Skill by Blizzard
#   -> upgraded Skill Separation System by Blizzard to 1.1b
#   -> updated SP Cost Mod Status Effect by Blizzard
#   -> updated Revenge Skill by Blizzard
# 
# v6.02b:
#   -> upgraded Target 'em all! by Blizzard to 1.1b
#   -> upgraded Auto-Revive by Blizzard to 1.24b
#   -> updated Charge Skill by Blizzard
# 
# v6.03b:
#   -> upgraded HP/SP/EXP gradient/slant bars by Blizzard to v4.51b
# 
# v6.10b:
#   -> added Blue Magic Status Effect by Blizzard
#   -> upgraded Location Names by Blizzard to v2.2b
#   -> upgraded Blizz-Art lagless HUD by Blizzard to v1.4b
#   -> upgraded Arrow over Player by Blizzard to v1.1b
#   -> upgraded Caterpillar by Blizzard to v2.1b
#   -> upgraded Picture Movie Scene by Blizzard to v2.1b
#   -> upgraded Blue Magic Skill by Blizzard to v1.5b
#   -> updated Window_BattleResult add-on by Blizzard
#   -> Enhanced Battle Cursors now cannot be turned on/off in-game
#   -> Tons of Add-ons now has to be used as 3-parts script, because of a
#      weird behaviour of RMXP during bug detection, insert the 3 parts in the
#      correct order and the system should work without problems, do NOT remove
#      any of the parts, the script NEEDS all 3 parts to work with other
#      systems
# 
# v6.11b:
#   -> upgraded Save Point by Blizzard to v2.0b
# 
# v6.12b:
#   -> upgraded Caterpillar by Blizzard to v2.11b
# 
# v6.13b:
#   -> upgraded Multi-Hit by Blizzard to v1.3b
# 
# v6.20b:
#   -> added Death Image by Blizzard
#   -> upgraded Absorb HP/SP Skill by Blizzard to v1.8b
#   -> upgraded Destructor Skill by Blizzard to v1.2b
#   -> upgraded Fury Status Effect by Blizzard to v2.0b
#   -> upgraded Skill Separation System by Blizzard to v1.2b
#   -> updated SP Cost Mod Status Effect by Blizzard
#   -> Doom Skill by Blizzard is now named Doom Status Effect
# 
# v6.40b:
#   -> added HP/SP Crush by Blizzard
#   -> added Energy Skill by Blizzard
#   -> upgraded Blizz-Art lagless HUD by Blizzard to v1.41b
#   -> upgraded Location Names with Pictures or Text by Blizzard to v2.21b
#   -> upgraded Map as Battleback by Blizzard to v1.51b
#   -> upgraded Custom Game Controls by Blizzard to v2.0b
#   -> upgraded Plug-in Save Point by Blizzard to v2.1b
#   -> upgraded Different Difficulties by Blizzard to v1.1b
#   -> updated Multi-Drop by Blizzard
# 
# v6.50b:
#   -> added Passive Skills by Blizzard
#   -> upgraded Status Effects as Icons by Blizzard to v1.1b
#   -> upgraded Picture Movie Scene by Blizzard to v2.2b
#   -> upgraded Multi-Drop by Blizzard to v1.1b
#   -> upgraded EQUAP Skills by Blizzard to v4.0b
#   -> upgraded Fury Status by Blizzard to v1.1b
#   -> upgraded Absorb HP/SP by Blizzard to v2.0b
# 
# v6.51b:
#   -> updated Passive Skills by Blizzard
# 
# v6.54b:
#   -> upgraded Skill Separation System by Blizzard to 3.0b
#   -> upgraded Multi-Hit by Blizzard to 1.4b
#   -> upgraded SP Cost Mod by Blizzard to 3.0b
# 
# v6.56b:
#   -> upgraded Death Image by Blizzard to 1.2b
#   -> upgraded Blizz-Art lagless HUD by Blizzard to 1.42b
# 
# v6.58b:
#   -> upgraded Demi Skill by Blizzard to 1.01b
#   -> updated SP Damage Skill by Blizzard to 1.0b
# 
# v6.59b:
#   -> updated the entire collection to prevent unexpected behavior
# 
# v6.60b:
#   -> upgraded Status Effects as Icons by Blizzard to 1.2b
#   -> upgraded EQUAP by Blizzard to 4.1b
#   -> upgraded Passive Skills by Blizzard to 1.1b
#   -> upgraded Multi-Hit by Blizzard to 1.5b
#   -> upgraded Zombie Status by Blizzard to 1.3b
#   -> upgraded Auto-Revive by Blizzard to 1.25b
#   -> upgraded Demi Skill by Blizzard to 1.02b
#   -> created State Breaker Skill and Roulette from Death Roulette by Blizzard
#   -> removed EMP Skill by Blizzard (State Breaker State can emulate it)
#   -> added Master Thief Skill by Blizzard
# 
# v6.61b:
#   -> upgraded Custom Game Controls by Blizzard to 2.1b
# 
# v6.70b:
#   -> added Chain Status Effects by Blizzard
# 
# v6.71b:
#   -> upgraded Caterpillar by Blizzard to 2.2b
# 
# v6.73b:
#   -> upgraded Picture Movie Scene by Blizzard to 2.3b
#   -> upgraded Ultimate Font Override by Blizzard to 1.02b
# 
# v6.80b:
#   -> added Actor-specific Item Usability by Fantasist
#   -> upgraded Blizz-Art lagless HUD by Blizzard to 1.43b
# 
# v6.81b:
#   -> upgraded Animated Title by Blizzard to 1.34b
# 
# v6.83b:
#   -> renamed Dynamic Passability Minimap to Blizz-ABS Minimap
#   -> upgraded Blizz-ABS Minimap by Blizzard to 2.0
#   -> upgraded Quick Passability Test by Blizzard to 2.0
# 
# v6.85b:
#   -> upgraded Passive Skills by Blizzard to 1.2b
#   -> upgraded Different Difficulties by Blizzard to 1.2b
# 
# v6.86b:
#   -> upgraded Quick Passability Test by Blizzard to 2.1b
# 
# v6.88b:
#   -> upgraded EQUAP Skills by Blizzard to v4.2b
#   -> upgraded Different Difficulties by Blizzard to 1.3b
# 
# v6.89b:
#   -> upgraded EQUAP Skills by Blizzard to v4.3b
# 
# v7.20b:
#   -> added Terrain Battlebacks by game_guy
#   -> added HP Consuming Skills by game_guy
#   -> added Skill Teaching Item by game_guy
#   -> added Level Up/Down Item by game_guy
# 
# v7.22b:
#   -> upgraded Custom Game Controls by Blizzard to v2.2b
#   -> upgraded Weapon/Armor HP/SP Plus by Blizzard to v2.1b
# 
# v7.30b:
#   -> added Percentage Health States by TerreAqua
# 
# v7.31b:
#   -> upgraded Custom Game Controls by Blizzard to v3.0
# 
# v7.32b:
#   -> upgraded Skill Separation System by Blizzard to v3.0
# 
# 
# Instructions:
# 
# - Explanation:
# 
#   Every Add-on has its own instructions. Please read and follow them.
# 
# - Configuration:
# 
#   Configure the part just below to define which add-ons you want to use and 
#   which not. The configuration is split into two part for reason, don't
#   change this. It will work fine if you leave it as it is.
# 
# - For scripters:
# 
#   If you have any ideas how to improve this collection, just say so. I will
#   add you into the credits of this add-on collection if you have an own
#   add-on. I will not add any add-ons made by somebody else than yourself, you
#   can't ask me for somebody else to add an add-on. The creator has to ask me
#   himself.
# 
# 
# Side note:
# 
#   These add-ons were mostly tested in a different environment or not at all.
# 
# 
# Useless facts:
# 
#   - Tons of Add-ons already exceeds many CMS-es and even most CBS-es in
#     number of lines of code.
#   - The version history of Tons of Add-ons has more lines than several
#     add-ons themselves in Tons of Add-ons and even medium-sized scripts.
#   - Chaos Project uses only about 50% of the Tons of Add-ons.
#   - Russian Reversal on Croatian Blizzards:
#     "In Russia Blizzard makes his scripts SDK compatible with YOU!"
# 
# 
# If you find any bugs, please report them here:
# http://forum.chaos-project.com
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

$tons_version = 7.32

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::#
#                                                                             #
#   ###   ###  #   # #####  #   #### #   # ####   ###  #####  #   ###  #   #  #
#  #   # #   # ##  # #      #  #     #   # #   # #   #   #    #  #   # ##  #  #
#  #     #   # # # # ####   #  #  ## #   # ####  #   #   #    #  #   # # # #  #
#  #   # #   # #  ## #      #  #   # #   # #   # #####   #    #  #   # #  ##  #
#   ###   ###  #   # #      #   ####  ###  #   # #   #   #    #   ###  #   #  #
#                                                                             #
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::#

$DUMMY_ELEMENTS = [] # add any dummy element IDs other scripts might use
$DUMMY_STATES = [] # add any dummy state IDs other scripts might use

module TONS_OF_ADDONS
  
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration 1-1, GRAPHIC add-ons
# 
#   You can enable/disable any add-on here if you wish. Set the value to false
#   to disable it. These features CANNOT be turned on/off during the game.
# 
#     NAME_OF_THE_ADDON = true
#     NAME_OF_THE_ADDON = false
# 
#   where NAME_OF_THE_ADDON is the same variable as the one used below.
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  ANIMATED_TITLE = false
  BATTLE_CURSORS = false
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration 1-1
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  
end

#==============================================================================
# Game_System
#==============================================================================

class Game_System
  
  alias init_tons_of_addons1_later initialize
  def initialize
    init_tons_of_addons1_later
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration 1-2, GRAPHIC add-ons
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
    @BETTER_TILEMAP_UPDATE      = false
    @CENTER_BATTLER             = false
    @BARS                       = false
    @LOCATION_NAMES             = false
    @BLACKFADE                  = false
    @SHADED_TEXT                = false
    @HUD                        = false
    @TREMBLE                    = true
    @ANIMATION_STACK            = true
    @FACESETS                   = false
    @CATERPILLAR                = false
    @ARROW_OVER_PLAYER          = false
    @ANIMATED_BATTLE_BACKGROUND = false
    @MAP_AS_BATTLEBACK          = false
    @FACESETS_DSS               = false
    @STATUS_ICONS               = false
    @ANIBATTLERS_NON_ACTION_BS  = false
    @DEATH_IMAGE                = false
    @TERRAIN_BATTLEBACKS        = false
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration 1-2
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  end
  
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# It is recommended that you don't edit anything below this line except for
# the configurations for the add-ons.
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

  attr_accessor :BETTER_TILEMAP_UPDATE
  attr_accessor :CENTER_BATTLER
  attr_accessor :BARS
  attr_accessor :LOCATION_NAMES
  attr_accessor :BLACKFADE
  attr_accessor :SHADED_TEXT
  attr_accessor :HUD
  attr_accessor :TREMBLE
  attr_accessor :ANIMATION_STACK
  attr_accessor :FACESETS
  attr_accessor :CATERPILLAR
  attr_accessor :ARROW_OVER_PLAYER
  attr_accessor :ANIMATED_BATTLE_BACKGROUND
  attr_accessor :MAP_AS_BATTLEBACK
  attr_accessor :FACESETS_DSS
  attr_accessor :STATUS_ICONS
  attr_accessor :ANIBATTLERS_NON_ACTION_BS
  attr_accessor :DEATH_IMAGE
  attr_accessor :TERRAIN_BATTLEBACKS
  
end

#==============================================================================
# Game_Battler
#==============================================================================

class Game_Battler
  
  def elements_correct(elements)
    multiplier = size = 0
    elements.each {|i|
        unless $DUMMY_ELEMENTS.include?(i)
          multiplier += self.element_rate(i)
          size += 1
        end}
    return (size == 0 ? 100 : multiplier/size)
  end
  
end

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::#
#                                                                             #
#                #### ####   ###  ####  #   #  #  ###  #####                  #
#               #     #   # #   # #   # #   #  # #   # #                      #
#               #  ## ####  #   # ####  #####  # #     #####                  #
#               #   # #   # ##### #     #   #  # #   #     #                  #
#                #### #   # #   # #     #   #  #  ###  #####                  #
#                                                                             #
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::#

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Better Tilemap update by Blizzard
# Type: Map Graphic Improvement
# Version: 1.0b
# Date: 13.8.2006
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# new in v1.0b:
#   - changed method of updating
# 
#   This will add a little faster update of autotile frames to allow a more
#   natural feeling.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#==============================================================================
# Tilemap
#==============================================================================

class Tilemap
  
  #---------------------------------------------------------------------------- 
  # update
  #  Added another update each 8th frame.
  #---------------------------------------------------------------------------- 
  alias upd_fps_later update
  def update
    # if active
    if $game_system.BETTER_TILEMAP_UPDATE
      # update again each 8th frame
      upd_fps_later if Graphics.frame_count % 8 == 0
    end
    upd_fps_later
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Animated Title by Blizzard
# Version: 1.34b
# Type: Game Graphic Design Improvement
# Date: 17.3.2006
# Date v1.3: 26.5.2006
# Date v1.32b: 14.11.2006
# Date v1.33b: 12.1.2007
# Date v1.34b: 14.12.2008
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# v1.3 features:
#   - completely overworked and 99% SDK compatible
# 
# v1.32b features:
#   - slightly improved code
# 
# v1.33b features:
#   - slightly improved code
# 
# v1.34b features:
#   - fixed a possible compatiblity problem
# 
# 
# Instructions:
# 
#   - if you want to change the delay between the frames change "DELAY"
#   - name the frames of your title pictures "title0", "title1" and so on.
#   - to change the number of frames, change the value of "PICS"
#   - be sure to set "title0" as your title screen in the database
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

DELAY = 10 # change the delay
PICS = 20 # number of pictures/frames

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#==============================================================================
# Scene_Title
#==============================================================================

class Scene_Title
  
  #---------------------------------------------------------------------------- 
  # initialize
  #  Added counters.
  #---------------------------------------------------------------------------- 
  alias initialize_animated_title_later initialize
  def initialize
    initialize_animated_title_later
    @frame = @counter = 0
  end
  #---------------------------------------------------------------------------- 
  # update
  #  Added changing of title each nth frame.
  #---------------------------------------------------------------------------- 
  alias update_animated_title_later update
  def update
    # if active and more than 1 pictures
    if TONS_OF_ADDONS::ANIMATED_TITLE && PICS > 1
      @counter += 1
      # if delay counter expired
      if @counter == DELAY
        @counter = 0
        # increase frame circularry
        @frame = (@frame + 1) % PICS
        # cache bitmap
        @sprite.bitmap = RPG::Cache.title("title#{@frame}")
        Graphics.transition
      end
    end
    update_animated_title_later
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Centered Battlers by Blizzard
# Version: 2.1b
# Type: Battle Graphic Improvement
# Date: 14.11.2006
# Date v2.1b: 12.1.2007
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# new in v2.0b:
#   - new code is much more compatible and not merged into the Regen add-on
# 
# new in v2.1b:
#   - compatible with "Easy LvlUp Notifier"
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#==============================================================================
# Sprite_Battler
#==============================================================================

class Sprite_Battler
    
  #---------------------------------------------------------------------------- 
  # update
  #  Added x coordinate change.
  #---------------------------------------------------------------------------- 
  alias upd_center_battler_later update
  def update
    upd_center_battler_later
    # if active and battler exists
    if $game_system.CENTER_BATTLER && @battler != nil
      if @battler.is_a?(Game_Actor)
        # set x coordinate depending on number of party members
        self.x = case $game_party.actors.size
        when 1 then @battler.screen_x + 240
        when 2 then @battler.screen_x + 80 + @battler.index * 160
        when 3 then @battler.screen_x + 80
        when 4 then @battler.screen_x
        end
      elsif @battler.is_a?(Game_Enemy)
        self.x = @battler.screen_x
      end
      self.y, self.z = @battler.screen_y, @battler.screen_z
    end
  end 
  
end

#==============================================================================
# Scene_Battle
#==============================================================================

class Scene_Battle
  
  #---------------------------------------------------------------------------- 
  # update
  #  Added x coordinate change.
  #---------------------------------------------------------------------------- 
  alias upd_center_battler_later update
  def update
    # if active and Easy LvlUp Notifier windows exist
    if $game_system.CENTER_BATTLER && @lvlup_windows != nil
      @lvlup_windows.each_index {|i|
         # set x coordinate depending on number of party members
          @lvlup_windows[i].x = case $game_party.actors.size
          when 1 then 240
          when 2 then 80 + i * 320
          when 3 then 80 + i * 160
          when 4 then i * 160
          end}
    end
    upd_center_battler_later
  end
  #---------------------------------------------------------------------------- 
  # update
  #  Added x coordinate change.
  #---------------------------------------------------------------------------- 
  alias phase3_setup_command_window_center_battler_later phase3_setup_command_window
  def phase3_setup_command_window
    phase3_setup_command_window_center_battler_later
    # if active
    if $game_system.CENTER_BATTLER
      # set x coordinate depending on number of party members
      @actor_command_window.x = case $game_party.actors.size
      when 1 then 240
      when 2 then 80 + @actor_index * 320
      when 3 then 80 + @actor_index * 160
      when 4 then @actor_index * 160
      end
      @actor_command_window.index = 0
    end
  end

end

#==============================================================================
# Arrow_Actor
#==============================================================================

class Arrow_Actor
  
  #---------------------------------------------------------------------------- 
  # update
  #  Added x coordinate change.
  #---------------------------------------------------------------------------- 
  alias upd_center_battler_later update
  def update
    upd_center_battler_later
    # if active and actor exists
    if $game_system.CENTER_BATTLER && self.actor != nil
      # set x coordinate depending on number of party members
      self.x = case $game_party.actors.size
      when 1 then 240 + self.actor.screen_x
      when 2 then 2 * self.actor.screen_x
      when 3 then 80 + self.actor.screen_x
      when 4 then self.actor.screen_x
      end
      self.y = self.actor.screen_y
    end
  end

end

#==============================================================================
# Window_BattleStatus
#==============================================================================

class Window_BattleStatus
  
  #---------------------------------------------------------------------------- 
  # update
  #  number - RTAB compatiblity fix
  #  Added x coordinate change of the drawings.
  #---------------------------------------------------------------------------- 
  alias refresh_center_battler_later refresh
  def refresh(number = nil)
    # if not active
    unless $game_system.CENTER_BATTLER
      # RTAB compatibility fix
      if number == nil
        refresh_center_battler_later
      else
        refresh_center_battler_later(number)
      end
      return
    end
    self.contents.clear
    @item_max = $game_party.actors.size
    # iterate through all indices
    $game_party.actors.each_index {|i|
        actor = $game_party.actors[i]
        # set x coordinate depending on number of party members
        actor_x = case $game_party.actors.size
        when 1 then 4 + 240
        when 2 then 4 + 80 + i * 320
        when 3 then 4 + 80 + i * 160
        when 4 then 4 + i * 160
        end
        # draw everything else
        draw_actor_name(actor, actor_x, 0)
        draw_actor_hp(actor, actor_x, 32, 120)
        draw_actor_sp(actor, actor_x, 64, 120)
        if @level_up_flags[i]
          self.contents.font.color = normal_color
          self.contents.draw_text(actor_x, 96, 120, 32, 'LEVEL UP!')
        else
          draw_actor_state(actor, actor_x, 96)
        end}
  end

end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Blizz-Art Gradient Styler with HP/SP/EXP bars by Blizzard
# Version: 4.51b
# Type: Game Playability Improvement
# Date v4.0: 13.11.2006
# Date v4.11: 12.1.2007
# Date v4.2b: 12.3.2007
# Date v4.4b: 14.7.2007
# Date v4.41b: 23.10.2007
# Date v4.5b: 25.10.2007
# Date v4.51b: 28.1.2008
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# new in v2.x:
#   - 2 styles, better code
# 
# new in v3.x:
#   - 6 styles, far better code
# 
# new in v4.0:
#   - 6 styles, overworked and extremely delagged, enjoy the most lagless
#     gradient/slant bar code ever
# 
# new in v4.11:
#   - added instructions and a recognition constant for plugins
# 
# new in v4.2b:
#   - improved code
# 
# new in v4.4b:
#   - improved code, now 7 styles
# 
# new in v4.41b:
#   - resolved issue
# 
# new in v4.5b:
#   - improved coding
#   - removed drawing glitch that was caused by using a variable name shorter
#     than 4 letters
# 
# new in v4.51b:
#   - fixed glitch with StormTronics CMS
# 
# 
# Instructions:
# 
#   You can change style and opacity by using the "Call script" event command.
#   Use one of of these syntaxes:
# 
#     $game_system.bar_style = X
#     $game_system.bar_opacity = Y
# 
#   X - number from 0 to 6 and is the ID number of the style
#   Y - number from 0 to 255 and indicates the opacity
#   
#   Values out of range will be corrected.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

$Blizz_Art = true

#==============================================================================
# Game_System
#==============================================================================

class Game_System
  
  attr_accessor :bar_style
  attr_reader   :bar_opacity
  #---------------------------------------------------------------------------- 
  # initialize
  #  Added bar style variables.
  #---------------------------------------------------------------------------- 
  alias init_blizzart_later initialize
  def initialize
    init_blizzart_later
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
# 
#   Configure this part manually if you have no "Options" controller for the
#   styles and the opacity. (style: 0~6, opacity: 0~255)
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    @bar_style = 5
    self.bar_opacity = 255
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  end
  #---------------------------------------------------------------------------- 
  # bar_opacity=
  #  alpha - opacity
  #  Encapsulation and range limitation of opacity.
  #---------------------------------------------------------------------------- 
  def bar_opacity=(alpha)
    @bar_opacity = [[alpha, 0].max, 255].min
  end
  
end

#==============================================================================
# Game_Actor 
#==============================================================================

class Game_Actor
  
  #---------------------------------------------------------------------------- 
  # now_exp
  #  Returns the EXP collected in this level.
  #---------------------------------------------------------------------------- 
  def now_exp
    return @exp - @exp_list[@level]
  end 
  #---------------------------------------------------------------------------- 
  # next_exp
  #  Returns the EXP needed to level up as number.
  #---------------------------------------------------------------------------- 
  def next_exp
    return @exp_list[@level+1] > 0 ? @exp_list[@level+1] - @exp_list[@level] : 0
  end 
  
end

#==============================================================================
# Bitmap
#==============================================================================

class Bitmap

  #---------------------------------------------------------------------------- 
  # gradient_bar
  #  x      - x coordinate
  #  y      - y coordinate
  #  w      - width of the bar to be drawn
  #  color1 - primary color
  #  color2 - secondary color
  #  color3 - back color
  #  rate   - fill rate
  #  This special method is able to draw one out of 7 styles.
  #---------------------------------------------------------------------------- 
  def gradient_bar(x, y, w, color1, color2, color3, rate, flag = false)
    # stop if not active or out of range
    return unless $game_system.BARS || flag
    return if $game_system.bar_style < 0 || $game_system.bar_style > 6
    # styles with "vertical" black borders
    styles = [1, 3, 4, 5, 6]
    # setup of coordinates and offsets depending on style
    offs = 5
    x += offs
    y += 26
    if styles.include?($game_system.bar_style)
      offs += 2
      y -= 1
      [5, 6].include?($game_system.bar_style) ? y -= 2 :  x += 1
      # quantizes the width so it looks better (remove it and see what happens)
      w = w / 8 * 8
    end
    # temporary variable
    a = $game_system.bar_opacity
    if $game_system.bar_style < 5
      # draw black slanted back
      (0...(offs+3)).each {|i| fill_rect(x-i, y+i-2, w+3, 1, Color.new(0, 0, 0))}
      # draw white slanted back onto black, but let black borders stay
      (0...(offs+1)).each {|i| fill_rect(x-i, y+i-1, w+1, 1, Color.new(255, 255, 255))}
      if $game_system.bar_style < 2
        # iterate through each vertical bar
        (0...w+offs).each {|i|
            # calculate color
            r = color3.red * i / (w+offs)
            g = color3.green * i / (w+offs)
            b = color3.blue * i / (w+offs)
            # special offset calculation
            oy = i < offs ? offs-i : 0
            off = i < offs ? i : i > w ? w+offs-i : offs
            # draw this part of the bar
            fill_rect(x+i-offs+1, y+oy-1, 1, off, Color.new(r, g, b, a))}
        # if slanted bar is out of critical area
        if (w*rate).to_i >= offs
          # draw the little triangular part on the left
          (0...((w*rate).to_i+offs)).each {|i|
              r = color1.red + (color2.red-color1.red)*i / ((w+offs)*rate)
              g = color1.green + (color2.green-color1.green)*i / ((w+offs)*rate)
              b = color1.blue + (color2.blue-color1.blue)*i / ((w+offs)*rate)
              oy = i < offs ? offs-i : 0
              off = i < offs ? i : i > w*rate ? (w*rate).to_i+offs-i : offs
              fill_rect(x+i-offs+1, y+oy-1, 1, off, Color.new(r, g, b, a))}
        else
          # draw the little triangular part on the left using special method
          (0...(w * rate).to_i).each {|i| (0...offs).each {|j|
              r = color1.red + (color2.red-color1.red)*i / (w*rate)
              g = color1.green + (color2.green-color1.green)*i / (w*rate)
              b = color1.blue + (color2.blue-color1.blue)*i / (w*rate)
              set_pixel(x+i-j+1, y+j-1, Color.new(r, g, b, a))}}
        end
      else
        # iterate through all horizontal lines
        (0...offs).each {|i|
            # calculate colors
            r = color3.red * i / offs
            g = color3.green * i / offs
            b = color3.blue * i / offs
            # draw background line
            fill_rect(x-i+1, y+i-1, w, 1, Color.new(r, g, b, a))}
        if $game_system.bar_style == 4
          # iterate through half of all horizontal lines
          (0...offs/2+1).each {|i|
              # calculate colors
              r = color2.red * (i+1) / (offs/2)
              g = color2.green * (i+1) / (offs/2)
              b = color2.blue * (i+1) / (offs/2)
              # draw bar line
              fill_rect(x-i+1, y+i-1, w*rate, 1, Color.new(r, g, b, a))
              # draw bar line mirrored vertically
              fill_rect(x-offs+i+2, y+offs-i-2, w*rate, 1, Color.new(r, g, b, a))}
        else
          # iterate through all horizontal lines
          (0...offs).each {|i|
              # calculate colors
              r = color1.red + (color2.red-color1.red)*i / offs
              g = color1.green + (color2.green-color1.green)*i / offs
              b = color1.blue + (color2.blue-color1.blue)*i / offs
              # draw bar line
              fill_rect(x-i+1, y+i-1, w*rate, 1, Color.new(r, g, b, a))}
        end
      end
      # if style with black vertical slanted intersections
      if styles.include?($game_system.bar_style)
        # add black bars on 1st and 8th column every 8 pixels
        (0...w).each {|i| (0...offs).each {|j|
            if styles.include?($game_system.bar_style) && i % 8 < 2
              set_pixel(x+i-j+1, y+j-1, Color.new(0, 0, 0, a))
            end}}
      end
    else
      # fill white background
      fill_rect(x+1, y-3, w+2, 12, Color.new(255, 255, 255, a))
      # iterate through each of 6 lines
      (1...6).each {|i|
          # calculate background color
          color = Color.new(color3.red*i/5, color3.green*i/5, color3.blue*i/5, a)
          # draw background
          fill_rect(x+2, y+i-3, w, 12-i*2, color)
          # calculate bar color
          color = Color.new(color2.red*i/5, color2.green*i/5, color2.blue*i/5, a)
          # draw bar
          fill_rect(x+2, y+i-3, w*rate, 12-i*2, color)}
      # if style 5 (with vertical borders)
      if $game_system.bar_style == 5
        # add black bars on 1st and 8th column every 8 pixels
        (0...w/8).each {|i|
            fill_rect(x+2+i*8, y-2, 1, 10, Color.new(0, 0, 0, a))
            fill_rect(x+2+(i+1)*8-1, y-2, 1, 10, Color.new(0, 0, 0, a))}
      end
    end
  end
  
end

#==============================================================================
# Window_Base
#==============================================================================

class Window_Base

  #---------------------------------------------------------------------------- 
  # draw_actor_hp
  #  actor - the actor
  #  x      - x coordinate
  #  y      - y coordinate
  #  w      - reserved max width
  #  Added fill rate calculation and bar drawing.
  #---------------------------------------------------------------------------- 
  alias draw_actor_hp_blizzart_later draw_actor_hp
  def draw_actor_hp(actor, x, y, w = 148)
    if $game_system.BARS
      # RTAB compatibility fix
      if !(defined? Window_DetailsStatus) || !self.is_a?(Window_DetailsStatus)
        w -= 12
      end
      # calculate bar fill rate
      rate = (actor.maxhp > 0 ? actor.hp.to_f / actor.maxhp : 0)
      # create colors depending on rate
      if rate > 0.6
        color1 = Color.new(80 - 150 * (rate-0.6), 80, 50 * (rate-0.6), 192) 
        color2 = Color.new(240 - 450 * (rate-0.6), 240, 150 * (rate-0.6), 192) 
      elsif rate > 0.2 && rate <= 0.6
        color1 = Color.new(80, 200 * (rate-0.2), 0, 192) 
        color2 = Color.new(240, 600 * (rate-0.2), 0, 192) 
      elsif rate <= 0.2
        color1 = Color.new(400 * rate, 0, 0, 192) 
        color2 = Color.new(240, 0, 0, 192) 
      end
      # background color
      color3 = Color.new(0, 80, 0, 192)
      # draw bar with coordinates and colors
      self.contents.gradient_bar(x, y, w, color1, color2, color3, rate)
      if $scene.is_a?(Scene_Battle)
        draw_actor_hp_blizzart_later(actor, x, y, w)
      else
        draw_actor_hp_blizzart_later(actor, x, y)
      end
    else
      draw_actor_hp_blizzart_later(actor, x, y, w)
    end
  end
  #---------------------------------------------------------------------------- 
  # draw_actor_sp
  #  actor - the actor
  #  x      - x coordinate
  #  y      - y coordinate
  #  w      - reserved max width
  #  Added fill rate calculation and bar drawing.
  #---------------------------------------------------------------------------- 
  alias draw_actor_sp_blizzart_later draw_actor_sp
  def draw_actor_sp(actor, x, y, w = 148)
    if $game_system.BARS
      # RTAB compatibility fix
      if !(defined? Window_DetailsStatus) || !self.is_a?(Window_DetailsStatus)
        w -= 12
      end
      # calculate bar fill rate
      rate = (actor.maxsp > 0 ? actor.sp.to_f / actor.maxsp : 0)
      # create colors depending on rate
      if rate > 0.4
        color1 = Color.new(60 - 66 * (rate-0.4), 20, 80, 192) 
        color2 = Color.new(180 - 200 * (rate-0.4), 60, 240, 192) 
      elsif rate <= 0.4
        color1 = Color.new(20 + 100 * rate, 50 * rate, 26 + 166 * rate, 192) 
        color2 = Color.new(60 + 300 * rate, 150 * rate, 80 + 400 * rate, 192) 
      end
      # background color
      color3 = Color.new(0, 0, 80, 192) 
      # draw bar with coordinates and colors
      self.contents.gradient_bar(x, y, w, color1, color2, color3, rate)
      if $scene.is_a?(Scene_Battle)
        draw_actor_sp_blizzart_later(actor, x, y, w)
      else
        draw_actor_sp_blizzart_later(actor, x, y)
      end
    else
      draw_actor_sp_blizzart_later(actor, x, y, w)
    end
  end
  #---------------------------------------------------------------------------- 
  # draw_actor_exp
  #  actor - the actor
  #  x      - x coordinate
  #  y      - y coordinate
  #  w      - reserved max width
  #  Added fill rate calculation and bar drawing.
  #---------------------------------------------------------------------------- 
  alias draw_actor_exp_blizzart_later draw_actor_exp
  def draw_actor_exp(actor, x, y, w = 148)
    if $game_system.BARS
      w += 12
      # calculate bar fill rate
      rate = (actor.next_exp != 0 ? actor.now_exp.to_f / actor.next_exp : 1)
      # create colors depending on rate
      if rate < 0.5
        color1 = Color.new(20 * rate, 60, 80, 192) 
        color2 = Color.new(60 * rate, 180, 240, 192) 
      elsif rate >= 0.5
        color1 = Color.new(20 + 120 * (rate-0.5), 60 + 40 * (rate-0.5), 80, 192)
        color2 = Color.new(60 + 360 * (rate-0.5), 180 + 120 * (rate-0.5), 240, 192)
      end
      # background color
      color3 = Color.new(80, 80, 80, 192) 
      # draw bar with coordinates and colors
      self.contents.gradient_bar(x, y, w, color1, color2, color3, rate)
    end
    draw_actor_exp_blizzart_later(actor, x, y)
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Location Names with Pictures or Text by Blizzard
# Version: 2.21b
# Type: Game Playability Improvement
# Date: 14.11.2006
# Date v2.1b: 7.7.2007
# Date v2.11b: 30.7.2007
# Date v2.12b: 25.10.2007
# Date v2.13b: 5.11.2007
# Date v2.2b: 17.2.2008
# Date v2.21b: 17.2.2008
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# NOTE: This script WILL corrupt old savegames!
# 
# Instructions:
#   
#   Connect map IDs with picture names. All pictures MUST be in the the Names
#   folder in your picture folder. If you don't have a picture, the map name
#   will be written out using the default text engine from RMXP. Please set up
#   the font you wish the text to be displayed in this case.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

LOCATION_FONT = 'Arial'
LOCATION_SIZE = 32
LOCATION_BOLD = true
LOCATION_ITALIC = false
LOCATION_COLOR = Color.new(255, 255, 255, 255) # Color.new(R, G, B, A)
LOCATION_DISPLAY_TIME = 2 # in seconds

#==============================================================================
# module BlizzCFG
#==============================================================================

module BlizzCFG
  
  def self.get_locimage
    case $game_map.map_id
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Location Database
# 
#   Use this template to configure this add-on:
# 
#     when ID then name = 'FILE_NAME'
#   
#   ID        - map ID where the picture should be displayed
#   FILE_NAME - the file name of the picture file in the Pictures/Names folder
# i.e. "when 2 then name = 'MAP002_pic'"
#   If you don't have a picture and want the name displayed anyway, please use:
# 
#     when ID then name = nil
# 
#   Instead of an image normal text will be displayed in the chosen font.
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    when 1 then name = nil
    when 2 then name = nil
    when 4 then name = "Character Select" #Character select
    when 39 then name = nil
    when 42 then name = nil
    when 51 then name = nil
    when 147 then name = "Character Select"
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Location Database
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    else
      return nil
    end
    # if text should be used
    if name == nil
      # create bitmap
      bitmap = Bitmap.new(320, LOCATION_SIZE + 16)
      # set up font style
      bitmap.font.name = LOCATION_FONT
      bitmap.font.size = LOCATION_SIZE
      bitmap.font.bold = LOCATION_BOLD
      bitmap.font.italic = LOCATION_ITALIC
      bitmap.font.color = LOCATION_COLOR
      # draw map name
      bitmap.draw_text(0, 8, bitmap.width-16, LOCATION_SIZE+8,
          $map_names[$game_map.map_id], 2)
    else
      # cache image file
      bitmap = RPG::Cache.picture("Names/#{name}")
    end
    return bitmap
  end
  
end  
  
#==============================================================================
# Game_System
#==============================================================================

class Game_System
  
  # setting all accessible variables
  attr_accessor :map_name_id
  attr_accessor :name_timer
  #---------------------------------------------------------------------------- 
  # initialize
  #  Added helping variables for convenience.
  #---------------------------------------------------------------------------- 
  alias init_names_later initialize
  def initialize
    init_names_later
    @map_name_id = @name_timer = 0
  end
  
end

#==============================================================================
# Name_Sprite
#==============================================================================

class Name_Sprite < Sprite
  
  # setting all accessible variables
  attr_accessor :timer
  #---------------------------------------------------------------------------- 
  # initialize
  #---------------------------------------------------------------------------- 
  def initialize(viewport = nil)
    super
    # set timer depending on if same map as when the last time
    if $game_system.map_name_id == $game_map.map_id
      @timer = $game_system.name_timer
    else
      @timer = 0
    end
    # if appearing
    if @timer < 16
      self.opacity = @timer * 15
    # if disappearing
    elsif @timer > 16 + 40 * LOCATION_DISPLAY_TIME
      self.opacity = 255 - (@timer - 16 - 40 * LOCATION_DISPLAY_TIME)* 15
    end
    # store this map as old map
    $game_system.map_name_id = $game_map.map_id
    self.z = 6000
    # get text image or image
    self.bitmap = BlizzCFG.get_locimage
    # set x coordinate or delete depending on whether bitmap exists
    self.bitmap == nil ? self.dispose : self.x = 640 - self.bitmap.width
  end
  #---------------------------------------------------------------------------- 
  # dispose
  #  Added storing of timer value before removing.
  #---------------------------------------------------------------------------- 
  def dispose
    $game_system.name_timer = @timer
    super
  end
  
end

#==============================================================================
# Spriteset_Map
#==============================================================================

class Spriteset_Map
  
  attr_accessor :name
  #---------------------------------------------------------------------------- 
  # initialize
  #  Added the name sprite.
  #---------------------------------------------------------------------------- 
  alias init_name_later initialize
  def initialize
    init_name_later
    @name = Name_Sprite.new(@viewport1) if $game_system.LOCATION_NAMES
  end
  #---------------------------------------------------------------------------- 
  # update
  #  Added name sprite appearing/disappearing animation control.
  #---------------------------------------------------------------------------- 
  alias upd_name_later update
  def update
    # if sprite exists
    if @name != nil
      # if sprite not disposed
      unless @name.disposed?
        @name.timer += 1
        # if appearing
        if @name.timer < 16
          @name.opacity += 15
        # if disappearing
        elsif @name.timer > 16 + 40 * LOCATION_DISPLAY_TIME
          @name.opacity -= 15
        end
        # if gone
        if @name.opacity == 0
          # remove completely
          @name.dispose
          @name = nil
        end
      else
        # set to nil
        @name = nil
      end
    end
    upd_name_later
  end
  #---------------------------------------------------------------------------- 
  # dispose
  #  Added name sprite removal.
  #---------------------------------------------------------------------------- 
  alias dispose_name_later dispose
  def dispose
    dispose_name_later
    unless @name == nil
      $game_system.name_timer = @name.timer
      @name.dispose
    end
    @name = nil
  end
  
end

#============================================================================== 
# Scene_Title
#============================================================================== 

class Scene_Title

  #---------------------------------------------------------------------------- 
  # main
  #  Added setup of names hash.
  #---------------------------------------------------------------------------- 
  alias main_location_later main
  def main
    $map_names = load_data('Data/MapInfos.rxdata')
    $map_names.each_key {|key| $map_names[key] = $map_names[key].name}
    main_location_later
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Black Fade by Blizzard
# Version: 1.1b
# Type: Graphical Improvement
# Date: 28.4.2006
# Date v1.1b: 9.3.2006
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# new in v1.1b:
#   - optional setting for black fade before battle
# 
# 
# Explanation:
# 
#   Replaces the standard fading between maps with a black screen. Note that
#   this add-on is much less compatible than other add-ons and therefore it
#   might cause problems.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

MAP_FADE = true # execute black fade when changing maps
MAP_TRANSIT = 8 # how long does the transition take
MAP_BLACKTIME = 12 # how long does black screen stay
BATTLE_FADE = true # execute black fade when changing maps
BATTLE_TRANSIT = 20 # how long does the transition take
BATTLE_BLACKTIME = 12 # how long does black screen stay

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#==============================================================================
# Scene_Map
#==============================================================================

class Scene_Map
  
  #---------------------------------------------------------------------------- 
  # main
  #  Added additional commands for black fading.
  #---------------------------------------------------------------------------- 
  alias main_player_black_fade_later main
  def main
    main_player_black_fade_later
    if $game_system.BLACKFADE && BATTLE_FADE && $scene.is_a?(Scene_Battle)
      if $data_system.battle_transition == ''
        Graphics.transition(BATTLE_TRANSIT)
      else
        Graphics.transition(BATTLE_TRANSIT, 'Graphics/Transitions/' +
          $data_system.battle_transition)
      end
      Graphics.freeze
      Graphics.transition(BATTLE_BLACKTIME)
      Graphics.freeze
    end
  end
  #---------------------------------------------------------------------------- 
  # transfer_player
  #  Added additional commands for black fading.
  #---------------------------------------------------------------------------- 
  alias transfer_player_black_fade_later transfer_player
  def transfer_player
    unless $game_system.BLACKFADE && MAP_FADE
      transfer_player_black_fade_later
      return
    end
    # set transferring flag
    $game_temp.player_transferring = false
    # if new map is not the same map
    if $game_map.map_id != $game_temp.player_new_map_id
      $game_map.setup($game_temp.player_new_map_id)
    end
    $game_player.moveto($game_temp.player_new_x, $game_temp.player_new_y)
    case $game_temp.player_new_direction
    when 2 then $game_player.turn_down
    when 4 then $game_player.turn_left
    when 6 then $game_player.turn_right
    when 8 then $game_player.turn_up
    end
    $game_player.straighten
    $game_map.update
    Graphics.freeze if $game_temp.transition_processing # added
    @spriteset.dispose
    # added from here
    if $game_temp.transition_processing
      Graphics.transition(MAP_TRANSIT)
      Graphics.freeze
      Graphics.transition(MAP_BLACKTIME)
      Graphics.freeze
    end
    # to here
    @spriteset = Spriteset_Map.new
    if $game_temp.transition_processing
      $game_temp.transition_processing = false
      Graphics.transition(MAP_TRANSIT) # instead of 20 now MAP_TRANSIT
    end
    # play map BGM and BGS
    $game_map.autoplay
    Graphics.frame_reset
    Input.update
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Simple Shaded Text by Blizzard
# Version: 2.0b
# Type: Text Readability Improvement
# Date: 2.7.2006
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#==============================================================================
# Bitmap
#==============================================================================

class Bitmap
  
  #---------------------------------------------------------------------------- 
  # draw_text
  #  x2    - x coordinate or rectangle
  #  y2    - y coordinate or text
  #  w2    - width or align
  #  h2    - height
  #  text2 - the text to be drawn
  #  a2    - align
  #  Added additional drawing to make the text look like shaded.
  #---------------------------------------------------------------------------- 
  alias draw_text_shaded_later draw_text
  def draw_text(x2, y2, w2 = 0, h2 = 0, text2 = '', a2 = 0)
    # set coordinates whether x2 is rectangle
    if x2.is_a?(Rect)
      x, y, w, h, text, a = x2.x, x2.y, x2.width, x2.height, y2, w2
    else
      x, y, w, h, text, a = x2, y2, w2, h2, text2, a2
    end
    # if active
    if $game_system != nil && $game_system.SHADED_TEXT
      # store font color
      save_color = self.font.color.clone
      # set font color to black
      self.font.color = Color.new(0, 0, 0)
      # draw shade
      draw_text_shaded_later(x+1, y+1, w, h, text, a)
      # restore font color
      self.font.color = save_color
    end
    # draw normal text
    draw_text_shaded_later(x, y, w, h, text, a)
  end
  #---------------------------------------------------------------------------- 
  # draw_text_full
  #  x2    - x coordinate or rectangle
  #  y2    - y coordinate or text
  #  w2    - width or align
  #  h2    - height
  #  text2 - the text to be drawn
  #  a2    - align
  #  Draws outlines text.
  #---------------------------------------------------------------------------- 
  def draw_text_full(x2, y2, w2 = 0, h2 = 0, text2 = '', a2 = 0)
    # set coordinates whether x2 is rectangle
    if x2.is_a?(Rect)
      x, y, w, h, text, a = x2.x, x2.y, x2.width, x2.height, y2, w2
    else
      x, y, w, h, text, a = x2, y2, w2, h2, text2, a2
    end
    # store font color
    save_color = self.font.color.clone
    # set font color to black
    self.font.color = Color.new(0, 0, 0)
    # draw outline
    draw_text_shaded_later(x+1, y+1, w, h, text, a)
    draw_text_shaded_later(x-1, y+1, w, h, text, a)
    draw_text_shaded_later(x-1, y-1, w, h, text, a)
    draw_text_shaded_later(x+1, y-1, w, h, text, a)
    # restore font color
    self.font.color = save_color
    # draw normal text
    draw_text_shaded_later(x, y, w, h, text, a)
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Blizz-Art lagless HUD by Blizzard
# Version: 1.43b
# Type: Game Playability Improvement
# Date: 16.12.2006
# Date v1.1b: 12.1.2007
# Date v1.2b: 11.3.2007
# Date v1.3b: 7.7.2007
# Date v1.4b: 17.2.2008
# Date v1.41b: 3.4.2008
# Date v1.42b: 22.8.2008
# Date v1.43b: 24.11.2008
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# IMPORTANT:
# 
#   The "not simple" method of using this add-on REQUIRES Blizz-Art Gradient
#   styler for HP/SP/EXP bars. Blizz-ABS disables this add-on automatically and
#   uses the Blizz-ABS HUD system.
# 
# 
# Instructions:
# 
#   This add-on will add a HUD into your game. Configure the part below. The
#   meanings of the variables are:
# 
#     SIMPLE       - set this to false to use Blizz-Art Gradient styler instead
#                    of the normal bars
#     FULL_DISPLAY - set to true to show the stats of all party members in the
#                    display (otherwise hold D and press Q/W to cycle through
#                    the actors)
#     TOP          - set this value to false and the HUD will appear on the
#                    bottom
#   
# 
# Side-Note:
# 
#   This add-on comes BELOW the Gradient Styler. This HUD was made for an
#   infinite number of party members, but if using FULL_DISPLAY, only the first
#   4 members will be displayed.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Start HUD Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

SIMPLE = true
FULL_DISPLAY = false
TOP = true

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# End HUD Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#==============================================================================
# Game_System
#==============================================================================

class Game_System
  
  attr_accessor :index
  attr_accessor :bar_style unless FULL_DISPLAY
  attr_reader   :bar_opacity
  #---------------------------------------------------------------------------- 
  # initialize
  #  Added variables for bar styles if Blizz-Art bars are being used.
  #---------------------------------------------------------------------------- 
  alias init_blizzart_hud_later initialize
  def initialize
    init_blizzart_hud_later
    @index = 0 unless FULL_DISPLAY
    unless $Blizz_Art
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
# 
#   Configure this part manually if you have no "Options" controller for the
#   styles and the opacity. (style: 0~5, opacity: 0~255)
#   Note that this WILL be overriden if you use Blizz-Art Gradient Styler.
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
      @bar_style = 5
      self.bar_opacity = 255
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    end
  end
  
  def bar_opacity=(alpha)
    @bar_opacity = [[alpha, 0].max, 255].min
  end
  
end

#==============================================================================
# Bitmap
#==============================================================================

class Bitmap
  
  #---------------------------------------------------------------------------- 
  # gradient_bar_simple
  #  x      - x coordinate
  #  y      - y coordinate
  #  w      - width of the bar to be drawn
  #  color1 - bar color
  #  color2 - back color
  #  rate   - fill rate
  #  Very fast method to draw the 7th style from Blizz-Art.
  #---------------------------------------------------------------------------- 
  def gradient_bar_simple(x, y, w, color1, color2, rate)
    # quantizes the width so it looks better (remove it and see what happens)
    w = w / 8 * 8
    alpha = $game_system.bar_opacity
    # iterate through each of 6 lines
    (1..6).each {|i|
        # calculate background color
        color = Color.new(color2.red*i/6, color2.green*i/6, color2.blue*i/6, alpha)
        # draw background
        fill_rect(x + 2, y + i, w, 14 - i * 2, color)
        # calculate bar color
        color = Color.new(color1.red*i/6, color1.green*i/6, color1.blue*i/6, alpha)
        # draw bar
        fill_rect(x + 2, y + i, w * rate, 14 - i * 2, color)}
  end
  # if not defined already
  unless $Blizz_Art
  #---------------------------------------------------------------------------- 
  # draw_text
  #  x2    - x coordinate or rectangle
  #  y2    - y coordinate or text
  #  w2    - width or align
  #  h2    - height
  #  text2 - the text to be drawn
  #  a2    - align
  #  Added additional drawing to make the text look like shaded.
  #---------------------------------------------------------------------------- 
  alias draw_text_shaded_later draw_text
  def draw_text(x2, y2, w2 = 0, h2 = 0, text2 = '', a2 = 0)
    # set coordinates whether x2 is rectangle
    if x2.is_a?(Rect)
      x, y, w, h, text, a = x2.x, x2.y, x2.width, x2.height, y2, w2
    else
      x, y, w, h, text, a = x2, y2, w2, h2, text2, a2
    end
    # if active
    if $game_system != nil && $game_system.SHADED_TEXT
      # store font color
      save_color = self.font.color.clone
      # set font color to black
      self.font.color = Color.new(0, 0, 0)
      # draw shade
      draw_text_shaded_later(x+1, y+1, w, h, text, a)
      # restore font color
      self.font.color = save_color
    end
    # draw normal text
    draw_text_shaded_later(x, y, w, h, text, a)
  end
  #---------------------------------------------------------------------------- 
  # draw_text_full
  #  x2    - x coordinate or rectangle
  #  y2    - y coordinate or text
  #  w2    - width or align
  #  h2    - height
  #  text2 - the text to be drawn
  #  a2    - align
  #  Draws outlines text.
  #---------------------------------------------------------------------------- 
  def draw_text_full(x2, y2, w2 = 0, h2 = 0, text2 = '', a2 = 0)
    # set coordinates whether x2 is rectangle
    if x2.is_a?(Rect)
      x, y, w, h, text, a = x2.x, x2.y, x2.width, x2.height, y2, w2
    else
      x, y, w, h, text, a = x2, y2, w2, h2, text2, a2
    end
    # store font color
    save_color = self.font.color.clone
    # set font color to black
    self.font.color = Color.new(0, 0, 0)
    # draw outline
    draw_text_shaded_later(x+1, y+1, w, h, text, a)
    draw_text_shaded_later(x-1, y+1, w, h, text, a)
    draw_text_shaded_later(x-1, y-1, w, h, text, a)
    draw_text_shaded_later(x+1, y-1, w, h, text, a)
    # restore font color
    self.font.color = save_color
    # draw normal text
    draw_text_shaded_later(x, y, w, h, text, a)
  end
  end
  
end

#==============================================================================
# Window_Base
#==============================================================================

class Window_Base

  #---------------------------------------------------------------------------- 
  # draw_actor_exp_alt
  #  actor - actor
  #  x     - x coordinate or rectangle
  #  y     - y coordinate or text
  #  Draw the "EXP needed for next level" text.
  #---------------------------------------------------------------------------- 
  def draw_actor_exp_alt(actor, x, y)
    # set color and draw "next"
    self.contents.font.color = system_color
    self.contents.draw_text(x, y, 64, 32, 'next')
    # set color and draw value
    self.contents.font.color = normal_color
    self.contents.draw_text(x + 56, y, 84, 32, actor.next_rest_exp_s, 2)
  end
  #---------------------------------------------------------------------------- 
  # draw_actor_exp_alt
  #  actor - actor
  #  x     - x coordinate or rectangle
  #  y     - y coordinate or text
  #  w     - width of the bar
  #  Added fill rate calculation and bar drawing.
  #---------------------------------------------------------------------------- 
  alias draw_actor_exp_alt_blizzart_hud_later draw_actor_exp_alt
  def draw_actor_exp_alt(actor, x, y, w = 148)
    w -= 12
    # calculate fill rate
    rate = (actor.next_exp != 0 ? actor.now_exp.to_f / actor.next_exp : 1)
    # create color depending on fill rate
    if rate < 0.5
      color1 = Color.new(20 * rate, 60, 80, 192)
      color2 = Color.new(60 * rate, 180, 240, 192)
    elsif rate >= 0.5
      color1 = Color.new(20 + 120 * (rate-0.5), 60 + 40 * (rate-0.5), 80, 192)
      color2 = Color.new(60 + 360 * (rate-0.5), 180 + 120 * (rate-0.5), 240, 192)
    end
    # background color
    color3 = Color.new(80, 80, 80, 192)
    # draw bar
    self.contents.gradient_bar(x, y, w, color1, color2, color3, rate)
    draw_actor_exp_alt_blizzart_hud_later(actor, x, y)
  end
  #---------------------------------------------------------------------------- 
  # draw_actor_hp_hud
  #  actor - actor
  #  x     - x coordinate or rectangle
  #  y     - y coordinate or text
  #  w     - width of the bar
  #  This method calculates the fill rate and draws the bar in the HUD for HP.
  #---------------------------------------------------------------------------- 
  def draw_actor_hp_hud(actor, x, y, w = 148)
    # calculate fill rate
    rate = (actor.maxhp > 0 ? actor.hp.to_f / actor.maxhp : 0)
    # create color depending on fill rate
    if rate > 0.6
      color1 = Color.new(240 - 450 * (rate-0.6), 240, 150 * (rate-0.6), 192) 
    elsif rate > 0.2 && rate <= 0.6
      color1 = Color.new(240, 600 * (rate-0.2), 0, 192) 
    elsif rate <= 0.2
      color1 = Color.new(240, 0, 0, 192)
    end
    # background color
    color2 = Color.new(0, 80, 0, 192)
    # draw bar
    self.contents.gradient_bar_simple(x + 32, y, w - 48, color1, color2, rate)
    # fix y coordinate
    y -= 9
    self.contents.font.color = system_color
    # draw HP word
    self.contents.draw_text_full(x, y, 32, 32, $data_system.words.hp)
    # set offset
    hp_x = x + w - 122
    # set colors and draw values
    self.contents.font.color = actor.hp == 0 ? knockout_color :
      actor.hp <= actor.maxhp / 4 ? crisis_color : normal_color
    self.contents.draw_text_full(hp_x, y, 48, 32, actor.hp.to_s, 2)
    self.contents.font.color = normal_color
    self.contents.draw_text_full(hp_x + 48, y, 12, 32, '/', 1)
    self.contents.draw_text_full(hp_x + 60, y, 48, 32, actor.maxhp.to_s)
    self.contents.font.color.alpha = 255
  end
  #---------------------------------------------------------------------------- 
  # draw_actor_sp_hud
  #  actor - actor
  #  x     - x coordinate or rectangle
  #  y     - y coordinate or text
  #  w     - width of the bar
  #  This method calculates the fill rate and draws the bar in the HUD for SP.
  #---------------------------------------------------------------------------- 
  def draw_actor_sp_hud(actor, x, y, w = 148)
    # calculate fill rate
    rate = (actor.maxsp > 0 ? actor.sp.to_f / actor.maxsp : 0)
    # create color depending on fill rate
    if rate > 0.4
      color1 = Color.new(180 - 200 * (rate-0.4), 60, 240, 192) 
    elsif rate <= 0.4
      color1 = Color.new(60 + 300 * rate, 150 * rate, 80 + 400 * rate, 192) 
    end
    # background color
    color2 = Color.new(0, 0, 80, 192) 
    # draw bar
    self.contents.gradient_bar_simple(x + 32, y, w - 48, color1, color2, rate)
    # fix y coordinate
    y -= 9
    self.contents.font.color = system_color
    # draw SP word
    self.contents.draw_text_full(x, y, 32, 32, $data_system.words.sp)
    # set offset
    sp_x = x + w - 122
    # set colors and draw values
    self.contents.font.color = actor.sp == 0 ? knockout_color :
      actor.sp <= actor.maxhp / 4 ? crisis_color : normal_color
    self.contents.draw_text_full(sp_x, y, 48, 32, actor.sp.to_s, 2)
    self.contents.font.color = normal_color
    self.contents.draw_text_full(sp_x + 48, y, 12, 32, '/', 1)
    self.contents.draw_text_full(sp_x + 60, y, 48, 32, actor.maxsp.to_s)
  end
  #---------------------------------------------------------------------------- 
  # draw_actor_exp_hud
  #  actor - actor
  #  x     - x coordinate or rectangle
  #  y     - y coordinate or text
  #  w     - width of the bar
  #  This method calculates the fill rate and draws the bar in the HUD for EXP.
  #---------------------------------------------------------------------------- 
  def draw_actor_exp_hud(actor, x, y, w = 148)
    # calculate fill rate
    rate = (actor.next_exp != 0 ? actor.now_exp.to_f / actor.next_exp : 1)
    # create color depending on fill rate
    if rate < 0.5
      color1 = Color.new(60 * rate, 180, 240, 192) 
    elsif rate >= 0.5
      color1 = Color.new(60 + 360 * (rate-0.5), 180 + 120 * (rate-0.5), 240, 192) 
    end
    # background color
    color2 = Color.new(80, 80, 80, 192)
    # draw bar
    self.contents.gradient_bar_simple(x + 32, y, w - 48, color1, color2, rate)
    # fix y coordinate
    y -= 9
    self.contents.font.color = system_color
    # draw "next"
    self.contents.draw_text_full(x, y, 80, 32, 'next')
    self.contents.font.color = normal_color
    # draw value
    self.contents.draw_text_full(x + 56, y, 84, 32, actor.next_rest_exp_s, 2)
    self.contents.font.color.alpha = 255
  end
  
end

#============================================================================== 
# Game_Actor 
#============================================================================== 

class Game_Actor
  
  #---------------------------------------------------------------------------- 
  # now_exp
  #  Returns the EXP collected in this level.
  #---------------------------------------------------------------------------- 
  def now_exp
    return @exp - @exp_list[@level]
  end 
  #---------------------------------------------------------------------------- 
  # next_exp
  #  Returns the EXP needed to level up as number.
  #---------------------------------------------------------------------------- 
  def next_exp
    return @exp_list[@level+1] > 0 ? @exp_list[@level+1] - @exp_list[@level] : 0
  end 
  
end

#==============================================================================
# Hud
#==============================================================================

class Hud < Window_Base
  
  #---------------------------------------------------------------------------- 
  # initialize
  #---------------------------------------------------------------------------- 
  def initialize
    super(-12, -16, 192, 112)
    # invisible background
    self.opacity = 0
    # if not on top position
    unless TOP
      # move down
      self.y += 400
      # move up a bit if not SIMPLE mode
      self.y -= 16 unless SIMPLE
    end
    # increase height if not SIMPLE mode
    self.height += 32 unless SIMPLE
    self.z = 5000
    refresh
  end
  #---------------------------------------------------------------------------- 
  # refresh
  #  Draws all the details.
  #---------------------------------------------------------------------------- 
  def refresh
    # remove bitmap if already existing
    if self.contents != nil
      self.contents.dispose
      self.contents = nil
    end
    # change width
    self.width = FULL_DISPLAY ? 32 + 160 * $game_party.actors.size : 192
    # create new bitmap
    self.contents = Bitmap.new(self.width - 32, self.height - 32)
    # set font style
    self.contents.font.name = 'Arial'
    self.contents.font.size = 16
    self.contents.font.bold = true
    # initialize data
    @names, @levels, @hps, @sps, @exps = [], [], [], [], []
    # iterate through all actor indices
    $game_party.actors.each_index {|i|
        # get actor depending on FULL_DISPLAY option
        actor = $game_party.actors[(FULL_DISPLAY ? i : $game_system.index)]
        # set style and draw name
        self.contents.font.italic = true
        self.contents.font.size += 2
        self.contents.font.color = system_color
        self.contents.draw_text(i*160, -8, 152, 32, actor.name, 1)
        # reset style
        self.contents.font.italic = false
        if SIMPLE
          # draw other HP, SP and EXP on HUD
          self.contents.font.size -= 2
          draw_actor_hp_hud(actor, i*160, 16, 160)
          draw_actor_sp_hud(actor, i*160, 32, 160)
          draw_actor_exp_hud(actor, i*160, 48, 160)
        else
          # draw other HP, SP and EXP on HUD using Blizz-Art
          draw_actor_hp(actor, i*160, 8, 160)
          draw_actor_sp(actor, i*160, 32, 160)
          draw_actor_exp_alt(actor, i*160, 56, 160)
          self.contents.font.size -= 2
        end}
    # draw gold text
    self.contents.font.color = Color.new(255, 255, 0)
    self.contents.draw_text(0, (SIMPLE ? 56 : 84), 148, 32, $data_system.words.gold)
    self.contents.draw_text(0, (SIMPLE ? 56 : 84), 148, 32, $game_party.gold.to_s, 2)
    # iterate through all party members and add stats to data arrays
    $game_party.actors.each {|actor|
        @names.push(actor.name)
        @levels.push(actor.level)
        @hps.push(actor.hp)
        @sps.push(actor.sp)
        @exps.push(actor.exp)}
    @gold = $game_party.gold
  end
  #---------------------------------------------------------------------------- 
  # test_changed
  #  Tests if the HUD should be redrawn.
  #---------------------------------------------------------------------------- 
  def test_changes
    # draw if gold had changed
    return true if $game_party.gold != @gold
    # if all actors on HUD
    if FULL_DISPLAY
      # draw if any actor has changes
      $game_party.actors.each_index {|i|
          actor = $game_party.actors[i]
          if actor.name != @names[i] || actor.level != @levels[i] ||
              actor.hp != @hps[i] || actor.sp != @sps[i]
            return true
          end}
    else
      # draw if current actor had changes
      actor = $game_party.actors[$game_system.index]
      if actor.name != @names[$game_system.index] ||
          actor.level != @levels[$game_system.index] ||
          actor.hp != @hps[$game_system.index] ||
          actor.sp != @sps[$game_system.index]
        return true
      end
    end
    return false
  end
  
end

#==============================================================================
# Scene_Map
#==============================================================================

class Scene_Map
  
  #---------------------------------------------------------------------------- 
  # main
  #  Added HUD window creation.
  #---------------------------------------------------------------------------- 
  alias main_blizzart_hud_later main
  def main
    if (!$BlizzABS || BlizzABS::VERSION < 1.01) && $game_system.HUD
      @hud = Hud.new
    end
    main_blizzart_hud_later
    @hud.dispose unless @hud == nil || @hud.disposed?
  end
  #---------------------------------------------------------------------------- 
  # update
  #  Added HUD handling.
  #---------------------------------------------------------------------------- 
  alias upd_blizzart_hud_later update
  def update
    # skip if Blizz-ABS enabled
    if !$BlizzABS || BlizzABS::VERSION < 1.01
      # if HUD active
      if $game_system.HUD
        # create new if not existing
        @hud = Hud.new if @hud == nil
      # if HUD exists
      elsif @hud != nil
        # remove HUD
        @hud.dispose
        @hud = nil
      end
      # if HUD still exists
      if @hud != nil
        # change display depenging on button input
        if Input.press?(Input::Z) && Input.trigger?(Input::L)
          $game_system.index += $game_party.actors.size - 1
          $game_system.index %= $game_party.actors.size
          @hud.refresh
        elsif Input.press?(Input::Z) && Input.trigger?(Input::R)
          $game_system.index += 1
          $game_system.index %= $game_party.actors.size
          @hud.refresh
        elsif @hud.test_changes
          @hud.refresh
        end
      end
    end
    upd_blizzart_hud_later
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Screen Tremble by Blizzard
# Version: 1.1b
# Type: Game Experience Improvement
# Date: 22.1.2007
# Date v1.0b: 24.1.2007
# Date v1.1b: 1.2.2007
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# new in v1.0b:
#   - improved code and better method of shaking the screen apart
#   - now beta
# 
# new in v1.1b:
#   - improved code and better method of shaking the screen apart
# 
# 
# Compatibility:
# 
#   98% compatible with SDK v1.x. 90% compatible with SDK v2.x. WILL corrupt
#   old savegames. Might glitch with exotic CBS-es or exotic Map modifications.
# 
# 
# Explanation:
#
#   This add-on will add an advanced feature of screen shaking:
#   Vertical shaking!
# 
# 
# Configuration:
# 
#   Change TREMBLE_SWITCH to a switch ID number. Turn this switch on to enable
#   vertical screen-shaking. You MUST have screen shaking turned on. This
#   add-on will not work if no screen shaking is activated at all. You can't
#   have only vertical screen shaking.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

TREMBLE_SWITCH = 407

#==============================================================================
# Game_Screen
#==============================================================================

class Game_Screen
  
  attr_reader :tremble
  
  alias init_tremble_later initialize
  def initialize
    init_tremble_later
    @tremble, @tremble_power, @tremble_direction = 0, 0, 1
  end
  
  alias upd_tremble_later update
  def update
    upd_tremble_later
    if $game_system.TREMBLE && $game_switches[TREMBLE_SWITCH] &&
        (@shake_duration >= 1 || @tremble != 0)
      delta = (@tremble_power * (@shake_speed + 1) * @tremble_direction) / 10.0
      if @shake_duration <= 1 && @tremble * (@tremble + delta) < 0
        @tremble = 0
      else
        @tremble += delta
      end
      if @tremble > @tremble_power * 1.5
        @tremble_direction = -1
      elsif @tremble < -@tremble_power * 1.5
        @tremble_direction = 1
      end
      @shake_duration -= 1 if @shake_duration >= 1
    end
  end

  alias start_tremble start_shake
  def start_shake(power, speed, duration)
    start_tremble(power, speed, duration)
    @tremble_power = power * 8 / 7 if $game_switches[TREMBLE_SWITCH]
  end
  
end

#==============================================================================
# Spriteset_Map
#==============================================================================

class Spriteset_Map
  
  alias upd_tremble_later update
  def update
    @viewport1.oy = ($game_switches[TREMBLE_SWITCH] ? $game_screen.tremble : 0)
    upd_tremble_later
  end

end

#==============================================================================
# Spriteset_Battle
#==============================================================================

class Spriteset_Battle
  
  alias upd_tremble_later update
  def update
    @viewport1.oy = ($game_switches[TREMBLE_SWITCH] ? $game_screen.tremble : 0)
    upd_tremble_later
  end

end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Animation Stack by Blizzard
# Version: 1.0
# Type: Battle Graphic Improvement
# Date: 1.2.2007
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# This add-on will make the display of all status effect animations possible.
# 
# LOOPS - set this value to the number of how many time an animation should
#         loop before the next one is being displayed
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

LOOPS = 2

#==============================================================================
# Game_Battler
#==============================================================================

class Game_Battler
  
  alias init_anima_stack_later initialize
  def initialize
    init_anima_stack_later
    @anima_count = 0
    @anima_index = 0
  end
  
  alias state_animation_id_anima_stack_later state_animation_id
  def state_animation_id
    if $game_system.ANIMATION_STACK
      if @states.size == 0
        @anima_count = @anima_index = 0
        return 0
      end
      size = 0
      loop do
        @anima_index %= @states.size
        state = $data_states[@states[@anima_index]]
        break unless $data_animations[state.animation_id] == nil
        @anima_index += 1
        size += 1
        return 0 if size == @states.size
      end
      state = $data_states[@states[@anima_index]]
      if @anima_count > 2*LOOPS*$data_animations[state.animation_id].frame_max
        @anima_count = 0
        @anima_index += 1
      else
        @anima_count += 1
      end
      return state.animation_id
    end
    return state_animation_id_anima_stack_later
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Simple Facesets by Blizzard
# Version: 1.01b
# Type: Menu Graphic Alteration
# Date: 18.2.2007
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# Explanation:
# 
#   This little add-on will change the spritesets in the main menu to facesets
#   or any other pictures you might be using. Name the pictures exactly like
#   the spritesets and add _face to their name. Put them into the "Characters"
#   folder. Size is not fixed, the script will put it into the correct place,
#   it's up to you to find the right size.
# 
# Note:
# 
#   This might not be compatible with exotic CMS-es.
#==============================================================================

FACE_HUE = false # set it to true to apply the same hue as the spriteset

#==============================================================================
# Window_Base
#==============================================================================

class Window_Base
  
  alias draw_actor_graphic_faces_later draw_actor_graphic
  def draw_actor_graphic(actor, x, y)
    if $game_system.FACESETS && self.is_a?(Window_MenuStatus)
      if actor != nil && actor.character_name != ''
        draw_actor_face(actor, x, y)
      end
    else
      draw_actor_graphic_faces_later(actor, x, y)
    end
  end
  
  def draw_actor_face(actor, x, y)
    hue = (FACE_HUE ? actor.character_hue : 0)
    bitmap = RPG::Cache.character("#{actor.character_name}_face", hue)
    src_rect = Rect.new(0, 0, bitmap.width, bitmap.height)
    self.contents.blt(x-bitmap.width/2, y-bitmap.height/2, bitmap, src_rect)
  end

end
=begin
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Caterpillar by Blizzard
# Version: 2.2b
# Type: Game Experience Improvement
# Date: 7.3.2007
# Date v1.01b: 7.3.2007
# Date v2.0: 7.8.2007
# Date v2.0b: 8.8.2007
# Date v2.1b: 17.2.2008
# Date v2.11b: 22.2.2008
# Date v2.2b: 1.11.2008
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# new in v1.01b:
#   - now events can't go through your party members anymore
# 
# new in v2.0:
#   - completely overworked and improved
# 
# new in v2.0b:
#   - improved coding and made it work more convenient
#   - fixed a few glitches
#   - added DEAD_DISPLAY option
#   - removed stop animation override upon the player character
# 
# new in v2.1b:
#   - fixed bug where an empty party would cause a crash
# 
# new in v2.11b:
#   - fixed a minor compatibility glitch with Blizz-ABS
# 
# new in v2.2b:
#   - improved coding and made it work more convenient
#   - fixed the bug where deactivating the caterpillar wouldn't work properly
# 
# 
# Compatibility:
# 
#   93% compatible with SDK v1.x. 60% compatible with SDK v2.x. You might
#   experience problems with pixel movement scripts or map graphic manipulating
#   scripts. Blizz-ABS disables this add-on automatically and uses the
#   Blizz-ABS Caterpillar system.
# 
# 
# Features:
# 
#   - your party members follow you on the map
#   - less code than other caterpillar scripts
#   - use $game_player.update_buffer('reset') if you need all party members to
#     gather around the player
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# max number of party members
MAX_PARTY = 4
# actor IDs where the actor is animated even when not walking
ANIMATED_IDS = []
# 0 - shows all characters; 1 - shows "ghosts"; 2 - removes from caterpillar
DEAD_DISPLAY = 1

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#==============================================================================
# Game_Character
#==============================================================================
    
class Game_Character
  
  alias passable_caterpillar_later? passable?
  def passable?(x, y, d)
    result = passable_caterpillar_later?(x, y, d)
    return result if $BlizzABS && BlizzABS::VERSION >= 1.01
    return result if self.is_a?(Game_Player) || self.is_a?(Game_Member)
    new_x = x + (d == 6 ? 1 : d == 4 ? -1 : 0)
    new_y = y + (d == 2 ? 1 : d == 8 ? -1 : 0)
    unless @through
      $game_player.members.each {|member|
          if member.character_name != '' && member.x == new_x && member.y == new_y
            return false
          end}
    end
    return result 
  end
  
end

#==============================================================================
# Game_Player
#==============================================================================
    
class Game_Player
  
  attr_reader :members
  attr_reader :move_speed
  
  alias init_caterpillar_later initialize
  def initialize
    init_caterpillar_later
    @members = []
    (1...MAX_PARTY).each {|i| @members.push(Game_Member.new(i))} unless $BlizzABS
  end
  
  alias upd_caterpillar_later update
  def update
    upd_caterpillar_later
    refresh if DEAD_DISPLAY > 0
    @members.each {|member| member.update}
    if $game_system.CATERPILLAR && ANIMATED_IDS.include?(actor.id)
      @step_anime = true
    end
  end
  
  alias straighten_caterpillar_later straighten
  def straighten
    straighten_caterpillar_later
    @members.each {|member| member.straighten}
  end
  
  alias refresh_caterpillar refresh
  def refresh
    unless $game_system.CATERPILLAR
      refresh_caterpillar
      return
    end
    act, $game_party.actors[0] = $game_party.actors[0], actor
    $game_party.actors.pop if $game_party.actors[0] == nil
    refresh_caterpillar
    return if actor == nil
    $game_party.actors[0] = act
    if actor.dead? && DEAD_DISPLAY == 1
      @opacity = Graphics.frame_count % 4 / 2 * 255
      @blend_type = 1
    end
  end
  
  def actor
    if DEAD_DISPLAY > 0
      $game_party.actors.each {|actor| return actor unless actor.dead?}
    end
    return $game_party.actors[0]
  end
  
  def update_buffer(next_move)
    if next_move == nil
      @members.each {|member| member.buffer = []}
    else 
      @members.each {|member| member.update_buffer(
          next_move == 'reset' ? nil : next_move)}
    end
  end
  
  alias move_down_caterpillar_later move_down
  def move_down(turn_enabled = true)
    update_buffer(2) if passable?(@x, @y, 2)
    move_down_caterpillar_later
  end
  
  alias move_left_caterpillar_later move_left
  def move_left(turn_enabled = true)
    update_buffer(4) if passable?(@x, @y, 4)
    move_left_caterpillar_later
  end
  
  alias move_right_caterpillar_later move_right
  def move_right(turn_enabled = true)
    update_buffer(6) if passable?(@x, @y, 6)
    move_right_caterpillar_later
  end
  
  alias move_up_caterpillar_later move_up
  def move_up(turn_enabled = true)
    update_buffer(8) if passable?(@x, @y, 8)
    move_up_caterpillar_later
  end
  
  alias move_lower_left_caterpillar_later move_lower_left
  def move_lower_left
    if passable?(@x, @y, 2) && passable?(@x, @y + 1, 4) ||
       passable?(@x, @y, 4) && passable?(@x - 1, @y, 2)
      update_buffer(1)
    end
    move_lower_left_caterpillar_later
  end
  
  alias move_lower_right_caterpillar_later move_lower_right
  def move_lower_right
    if passable?(@x, @y, 2) && passable?(@x, @y + 1, 6) ||
       passable?(@x, @y, 6) && passable?(@x + 1, @y, 2)
      update_buffer(3)
    end
    move_lower_right_caterpillar_later
  end
  
  alias move_upper_left_caterpillar_later move_upper_left
  def move_upper_left
    if passable?(@x, @y, 8) && passable?(@x, @y - 1, 4) ||
       passable?(@x, @y, 4) && passable?(@x - 1, @y, 8)
      update_buffer(7)
    end
    move_upper_left_caterpillar_later
  end
  
  alias move_upper_right_caterpillar_later move_upper_right
  def move_upper_right
    if passable?(@x, @y, 8) && passable?(@x, @y - 1, 6) ||
       passable?(@x, @y, 6) && passable?(@x + 1, @y, 8)
      update_buffer(9)
    end
    move_upper_right_caterpillar_later
  end
  
  alias jump_caterpillar_later jump
  def jump(x_plus, y_plus)
    if (x_plus != 0 || y_plus != 0) && passable?(@x + x_plus, @y + y_plus, 0)
      update_buffer([x_plus, y_plus])
    end
    jump_caterpillar_later(x_plus, y_plus)
  end
  
  alias moveto_caterpillar moveto
  def moveto(x, y)
    update_buffer(nil)
    moveto_caterpillar(x, y)
    @members.each {|member|
        member.moveto(x, y)
        case @direction
        when 2 then member.turn_down
        when 4 then member.turn_left
        when 6 then member.turn_right
        when 8 then member.turn_up
        end}
  end
  
end
  
#==============================================================================
# Game_Member
#==============================================================================

class Game_Member < Game_Character
  
  attr_accessor :buffer
  
  def initialize(index)
    super()
    @index, @force_movement, @buffer, @through = index, 0, [], true
  end
  
  def refresh
    unless $game_system.CATERPILLAR && actor != nil
      @character_name, @character_hue = '', 0
      return
    end
    @character_name = actor.character_name
    @character_hue = actor.character_hue
    if actor.dead? && DEAD_DISPLAY == 1
      @opacity, @blend_type = Graphics.frame_count % 4 / 2 * 255, 1
    else
      @opacity, @blend_type = 255, 0
    end
  end
  
  def actor
    case DEAD_DISPLAY
    when 0 then return $game_party.actors[@index]
    when 1
      alive = 0
      $game_party.actors.each {|actor| alive += 1 unless actor.dead?}
      if @index >= alive
        ind, flag = @index - alive, true
      else
        ind, flag = @index, false
      end
      $game_party.actors.each_index {|i|
          ind -= 1 if (flag == $game_party.actors[i].dead?)
          return $game_party.actors[i] if ind < 0}
    when 2
      ind = @index
      $game_party.actors.each_index {|i|
          ind -= 1 unless $game_party.actors[i].dead?
          return $game_party.actors[i] if ind < 0}
    end
    return nil
  end
  
  def update
    refresh
    @transparent = $game_player.transparent
    @move_speed = $game_player.move_speed
    unless moving? || @buffer.size <= @index && @force_movement <= 0
      if @buffer.size > 0
        move = @buffer.shift
        if move.is_a?(Array)
          jump(move[0], move[1])
        else
          case move
          when 1 then move_lower_left
          when 2 then move_down(true)
          when 3 then move_lower_right
          when 4 then move_left(true)
          when 6 then move_right(true)
          when 7 then move_upper_left
          when 8 then move_up(true)
          when 9 then move_upper_right
          end
        end
        @force_movement -= 1 if @force_movement > 0
      end
    end
    super
    @step_anime = (ANIMATED_IDS.include?($game_party.actors[@index].id))
  end
  
  def update_buffer(next_move)
    if next_move == nil
      @force_movement = @buffer.size
    else
      @buffer.push(next_move)
      @force_movement = @buffer.size if next_move.is_a?(Array)
    end
  end
  
  def check_event_trigger_touch(x, y) # don't remove this, it's necessary...
  end
  
  def screen_z(height = 0)
    return (super - @index)
  end
  
end

#==============================================================================
# Spriteset_Map
#==============================================================================

class Spriteset_Map
  
  alias init_caterpillar_later initialize
  def initialize
    init_caterpillar_later
    return if $BlizzABS && BlizzABS::VERSION >= 1.01
    $game_player.members.each {|member|
        sprite = Sprite_Character.new(@viewport1, member)
        sprite.update
        @character_sprites.push(sprite)}
  end
  
end

#==============================================================================
# Scene_Map
#==============================================================================

class Scene_Map
  
  alias transfer_player_caterpillar_later transfer_player
  def transfer_player
    transfer_player_caterpillar_later
    return if $BlizzABS
    case $game_temp.player_new_direction
    when 2 then $game_player.members.each {|member| member.turn_down}
    when 4 then $game_player.members.each {|member| member.turn_left}
    when 6 then $game_player.members.each {|member| member.turn_right}
    when 8 then $game_player.members.each {|member| member.turn_up}
    end
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Arrow over Player by Blizzard
# Version: 1.1b
# Type: Game Playability Improvement
# Date: 7.3.2007
# Date v1.01b: 30.7.2007
# Date v1.1b: 17.2.2008
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# new in v1.01b:
#   - shows arrow if tile has higher priority AND isn't completely transparent
#   - slightly faster arrow drawing due to half-optimized code
# 
# new in v1.1b:
#   - fixed problem with turning this add-on on/off
# 
# Explanation:
# 
#   This add-on will show an arrow over the player's head if he's behind a tile
#   with a higher priority that isn't completely transparent.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

INNER_COLOR = Color.new(0, 0, 0, 128)
OUTER_COLOR = Color.new(255, 255, 255, 192)

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#==============================================================================
# Spriteset_Map
#==============================================================================

class Spriteset_Map
  
  alias init_arrow_over_player_later initialize
  def initialize
    create_arrow if $game_system.ARROW_OVER_PLAYER
    init_arrow_over_player_later
  end
  
  def create_arrow
    @arrow = Sprite.new
    @arrow.bitmap = Bitmap.new(16, 9)
    @arrow.bitmap.fill_rect(1, 0, 14, 1, OUTER_COLOR)
    @arrow.bitmap.set_pixel(0, 1, OUTER_COLOR)
    @arrow.bitmap.fill_rect(1, 1, 7, 1, INNER_COLOR)
    @arrow.bitmap.fill_rect(8, 1, 7, 1, INNER_COLOR)
    @arrow.bitmap.set_pixel(15, 1, OUTER_COLOR)
    @arrow.bitmap.set_pixel(1, 2, OUTER_COLOR)
    @arrow.bitmap.fill_rect(2, 2, 6, 1, INNER_COLOR)
    @arrow.bitmap.fill_rect(8, 2, 6, 1, INNER_COLOR)
    @arrow.bitmap.set_pixel(14, 2, OUTER_COLOR)
    @arrow.bitmap.set_pixel(2, 3, OUTER_COLOR)
    @arrow.bitmap.fill_rect(3, 3, 5, 1, INNER_COLOR)
    @arrow.bitmap.fill_rect(8, 3, 5, 1, INNER_COLOR)
    @arrow.bitmap.set_pixel(13, 3, OUTER_COLOR)
    @arrow.bitmap.set_pixel(3, 4, OUTER_COLOR)
    @arrow.bitmap.fill_rect(4, 4, 4, 1, INNER_COLOR)
    @arrow.bitmap.fill_rect(8, 4, 4, 1, INNER_COLOR)
    @arrow.bitmap.set_pixel(12, 4, OUTER_COLOR)
    @arrow.bitmap.set_pixel(4, 5, OUTER_COLOR)
    @arrow.bitmap.fill_rect(5, 5, 3, 1, INNER_COLOR)
    @arrow.bitmap.fill_rect(8, 5, 3, 1, INNER_COLOR)
    @arrow.bitmap.set_pixel(11, 5, OUTER_COLOR)
    @arrow.bitmap.set_pixel(5, 6, OUTER_COLOR)
    @arrow.bitmap.fill_rect(6, 6, 2, 1, INNER_COLOR)
    @arrow.bitmap.fill_rect(8, 6, 2, 1, INNER_COLOR)
    @arrow.bitmap.set_pixel(10, 6, OUTER_COLOR)
    @arrow.bitmap.set_pixel(6, 7, OUTER_COLOR)
    @arrow.bitmap.set_pixel(7, 7, INNER_COLOR)
    @arrow.bitmap.set_pixel(8, 7, INNER_COLOR)
    @arrow.bitmap.set_pixel(9, 7, OUTER_COLOR)
    @arrow.bitmap.fill_rect(7, 8, 2, 1, OUTER_COLOR)
    @arrow.visible = false
    @arrow.z = 5000
    @arrow.ox = 8
    @arrow_mode = true
  end
  
  alias upd_arrow_over_player_later update
  def update
    upd_arrow_over_player_later
    if $game_system.ARROW_OVER_PLAYER
      create_arrow if @arrow == nil
      @arrow.x, @arrow.y = $game_player.screen_x, $game_player.screen_y - 56
      @arrow.visible = false
      (0..2).each {|n|
          tile_id = $game_map.data[$game_player.x, $game_player.y-1, n]
          if tile_id != nil && tile_id != 0 && $game_map.priorities[tile_id] > 1
            tile = RPG::Cache.tile($game_map.tileset_name, tile_id, 0)
            if tile_id < 384
              @arrow.visible = true
            else
              (0...32).each {|i| (0...32).each {|j|
                  unless tile.get_pixel(i, j).alpha == 0
                    @arrow.visible = true
                    break
                  end}}
            end
          end}
      if @arrow_mode
        @arrow.oy += 1
        @arrow_mode = (@arrow.oy < 4)
      else
        @arrow.oy -= 1
        @arrow_mode = (@arrow.oy <= -4)
      end
    elsif @arrow != nil
      @arrow.dispose
      @arrow = nil
    end
  end
  
  alias disp_arrow_over_player_later dispose
  def dispose
    disp_arrow_over_player_later
    @arrow.dispose if @arrow != nil
  end
  
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Animated Battle Background by Blizzard
# Version: 1.1b
# Type: Game Graphic Design Improvement
# Date: 12.3.2007
# Date v1.1b: 12.8.2007
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# new in v1.1b:
#   - shorter code, increased performance and increased compatiblity
# 
# 
# Explanation:
# 
#   This will animate battle backgrounds. To animate them, you MUST HAVE the
#   appropriate picture files. You can name them however you like, but you need
#   to give them numbers. Every other frame than the first has to have a number
#   higher than the one before. If one number is skipped, the animation will
#   loop until it reaches the highest number available before the skipped
#   number.
# 
# Examples:
# 
#   1)
#   Temple.png
#   Temple1.png
#   Temple2.png
#   Temple3.png
#   - all frames will be shown
# 
#   2)
#   Temple.png
#   Temple1.png
#   Temple3.png
#   Temple4.png
#   - only the 1st and 2nd frame will be shown
# 
#   3)
#   Temple.png
#   Temple3.png
#   Temple4.png
#   Temple5.png
#   - no animation at all
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# how many REAL frames that should be skipped before updating the background,
# note that using anything below 8 is not recommended and that using low values
# can increase lag dramatically
SPEED = 8

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#==============================================================================
# Spriteset_Battle
#==============================================================================

class Spriteset_Battle
  
  alias init_animated_battle_background_later initialize
  def initialize
    if $game_system.ANIMATED_BATTLE_BACKGROUND &&
        !$game_system.MAP_AS_BATTLEBACK
      setup_battleback
    end
    init_animated_battle_background_later
  end
  
  alias upd_animated_battle_background_later update
  def update
    if $game_system.ANIMATED_BATTLE_BACKGROUND &&
        !$game_system.MAP_AS_BATTLEBACK
      setup_battleback if @origin_name != $game_temp.battleback_name
      @frame = (@frame + 1) % @max_frame if Graphics.frame_count % SPEED == 0
      $game_temp.battleback_name = @origin_name + (@frame > 0 ? @frame.to_s : '')
      upd_animated_battle_background_later
      $game_temp.battleback_name = @origin_name
    else
      upd_animated_battle_background_later
    end
  end
  
  def setup_battleback
    @origin_name = $game_temp.battleback_name
    @frame, @max_frame = 0, 1
    name = @origin_name + @max_frame.to_s
    while FileTest.exist?("Graphics/Battlebacks/#{name}.jpg") ||
          FileTest.exist?("Graphics/Battlebacks/#{name}.png")
      @max_frame += 1
      name = @origin_name + @max_frame.to_s
    end
  end

end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Map as Battleback by Blizzard
# Version: 1.51b
# Type: Game Design Alteration
# Date: 11.3.2007
# Date v1.5b: 12.8.2007
# Date v1.51b: 3.4.2008
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# new in v1.5b:
#   - shortened code and increased performance
# 
# new in v1.51b:
#   - now compatible with SDK and RTAB
# 
# Explanation:
# 
#   This will make the map to be the battle background. Note that this add-on
#   will automatically turn off Animated Battle Backgrounds.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Include any class definitions which you don't want to see on the background.
# Keep in mind that this works scriptwise, those are object classes. Here are
# a few classes for reference:
#  Game_Player    - the player on the map
#  Game_Member    - caterpillar allies
#  Game_Event     - events on the map
#  Game_Character - all possible characters on the map including player,
#                   allies and events
# Default configuration is [Game_Player, Game_Member]
REMOVE_CLASSES = [Game_Player, Game_Member]

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#==============================================================================
# Spriteset_Map
#==============================================================================

class Spriteset_Map

  def delete_characters
    @character_sprites.clone.each_index {|i|
        if REMOVE_CLASSES.include?(@character_sprites[i].character.class)
          @character_sprites[i].dispose
          @character_sprites[i] = nil
        end}
    @character_sprites.compact!
  end
  
end

#==============================================================================
# Spriteset_Battle
#==============================================================================

class Spriteset_Battle
  
  alias init_map_as_battleback_later initialize
  def initialize
    if $game_system.MAP_AS_BATTLEBACK
      @map_battleback = Spriteset_Map.new
      @map_battleback.delete_characters if REMOVE_CLASSES.size > 0
      init_map_as_battleback_later
      @battleback_sprite.dispose
      @battleback_sprite = nil
    else
      init_map_as_battleback_later
    end
  end
  
  alias disp_map_as_battleback_later dispose
  def dispose
    @battleback_sprite = Sprite.new if @battleback_sprite == nil
    if @map_battleback != nil
      @map_battleback.dispose
      @map_battleback = nil
    end
    disp_map_as_battleback_later
  end
  
end
=end
#==============================================================================
# Facesets for Default Status Screen (DSS) by Zan
# Version: 1.01
# Type: Menu Layout Alteration
# Date: 2.4.2007
# 
# This works just like Simple Facesets, except it applies to the status screen.
# In case you didn't look at that section, here are the incredibly complicated
# rules:
# Ready?
# You have to have pictures in your "Characters" folder for each of your
# characters. The pictures have to have the same name as the character's
# spriteset, with "_face" added on. That's it.
# 
# Note:
# This script is currently set for *my* pictures, which are 108x108 pixels. To
# change it around for different-sized pictures, change the value of FACE_X and
# FACE_Y in the Config settings.
# 
# Another note:
# Not compatible with any CMS that changes drastically the status scene or does
# not use the default status window.
#==============================================================================
 
#==============================================================================
# Config
#==============================================================================

FACE_X = 15 # set the x coordinate offset (higher value -> righter position)
FACE_Y = -30 # set the y coordinate offset (higher value -> lower position)
 
FACE_HUE = false # set it to true to apply the same hue as the spriteset
 
#==============================================================================
# Window_Base
#==============================================================================
 
class Window_Status
  
  alias draw_actor_graphic_faces_when draw_actor_graphic
  def draw_actor_graphic(actor, x, y)
    if $game_system.FACESETS_DSS && self.is_a?(Window_Status)
      if actor != nil && actor.character_name != ''
        draw_actor_face(actor, x, y)
      end
    else
      draw_actor_graphic_faces_when(actor, x, y)
    end
  end
  
  def draw_actor_face(actor, x, y)
    hue = (FACE_HUE ? actor.character_hue : 0)
    bitmap = RPG::Cache.character("#{actor.character_name}_face", hue)
    src_rect = Rect.new(0, 0, bitmap.width, bitmap.height)
    self.contents.blt((x-bitmap.width/2)+FACE_X, (y-bitmap.height/2)+FACE_Y,
        bitmap, src_rect)
  end
 
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Status Effects as Icons by Blizzard
# Version: 1.2b
# Type: Game Design Improvement
# Date: 30.4.2007
# Date v1.0b: 17.11.2007
# Date v1.1b: 13.7.2008
# Date v1.2b: 19.10.2008
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# new in v1.0b:
#   - added possibility that status effects are excluded from icons
#   - now beta
# 
# new in v1.1b:
#   - fixed a bug caused by a typing mistake
# 
# new in v1.2b:
#   - improved system
# 
# 
# Explanation:
# 
#   This add-on will modify your game so no status text is displayed, but icons
#   instead. Note that you need to use default icon size of 24x24. Import the
#   icons into the new folder inside the default icon folder and name them like
#   the status effects, but type everything in lower case. The new folder has
#   to be named "State" so the path would be "Graphics/Icons/State/name.png".
#   In SPECIAL_EFFECTS include all the IDs from status effects that will
#   override the usual icon display and force the display of their name in the
#   default way of displaying.
#   If you want a status effect to have no icon at all, set its rating value in
#   the database to 0.
# 
#   Example:
#   
#     status effect name: "Painful Distortion"
#     icon file name:     "State/painful distortion.png"
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
 
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

SPECIAL_EFFECTS = []

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 
#==============================================================================
# Window_Base
#==============================================================================
 
class Window_Base
  
  alias draw_actor_state_icons_later draw_actor_state
  def draw_actor_state(actor, x, y, width = 120)
    if $game_system.STATUS_ICONS
      if actor != nil
        actor.states.each {|id|
            if SPECIAL_EFFECTS.include?(id)
              text = "[#{$data_states[id].name}]"
              self.contents.font.color = actor.dead? ? knockout_color : normal_color
              self.contents.draw_text(x, y, width, 32, text)
              return
            end}
        s = actor.states.find_all {|id| $data_states[id].rating > 0}
        s.each_index {|i|
            break if i*28 > width
            icon = RPG::Cache.icon("State/#{$data_states[s[i]].name.downcase}")
            self.contents.blt(x+2+i*28, y+4, icon, Rect.new(0, 0, 24, 24))}
      end
    else
      draw_actor_state_icons_later(actor, x, y, width)
    end
  end
  
end

#==============================================================================
# Window_Help
#==============================================================================
=begin
class Window_Help
  
  alias set_enemy_state_icons_later set_enemy
  def set_enemy(enemy)
    if !$game_system.STATUS_ICONS || $game_system.ENEMY_STATUS ||
        enemy.states.size == 0
      set_enemy_state_icons_later(enemy)
      return
    end
    text = enemy.name
    s = enemy.states.find_all {|id| $data_states[id].rating > 0}
    if s.size*28 + self.contents.text_size(text).width > self.contents.width
      width = self.contents.width/self.contents.text_size(' ').width
    else
      width = s.size*28/self.contents.text_size(' ').width
    end
    (0...width).each {|i| text += ' '}
    if @text != text || @align != 1
      enemy.states.each {|id|
          if SPECIAL_EFFECTS.include?(id)
            set_text("#{enemy.name}  [#{$data_states[id].name}]", 1)
            return
          end}
      set_text(text, 1)
      x = self.contents.width/2 - width/2
      s.each_index {|i|
          break if x+2+i*28 > self.contents.width
          icon = RPG::Cache.icon("State/#{$data_states[s[i]].name.downcase}")
          self.contents.blt(x+2+i*28, 4, icon, Rect.new(0, 0, 24, 24))}
    end
  end

end
=end
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Animated Battlers for Non-Action BS by Blizzard
# Version: 1.3b
# Type: Battle Graphic Improvement
# Date: 5.5.2007
# Date v1.3b: 13.8.2007
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# new in v1.3b:
#   - fixed the flicking glitch that appeared when a battler was dying
#   - improved coding, now executed over Sprite_Battler instead of
#     Spriteset_Battle and due to that increased compatibility and shorter code
# 
# 
# Compatibility:
# 
#   95% compatible with SDK v1.x. 70% compatible with SDK v2.x. Not compatible
#   exotic action CBS-es that need special battler animation.
# 
# 
# Explanation:
# 
#   This will animate battlers in the default battle system. To animate them,
#   you MUST HAVE the appropriate picture files. You can name them however you
#   like, but you need to give them numbers. Every other frame than the first
#   has to have a number higher than the one before. If one number is skipped,
#   the animation will loop until it reaches the highest number available
#   before the skipped number. Not that this works for actors AND for enemies.
# 
# Examples:
# 
#   1)
#   Arshes.png
#   Arshes1.png
#   Arshes2.png
#   Arshes3.png
#   - all frames will be shown
# 
#   2)
#   Arshes.png
#   Arshes1.png
#   Arshes3.png
#   Arshes4.png
#   - only the 1st and 2nd frame will be shown
# 
#   3)
#   Arshes.png
#   Arshes3.png
#   Arshes4.png
#   Arshes5.png
#   - no animation at all
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# how many REAL frames that should be skipped before updating the battlers,
# note that using anything below 2 is not recommended and that using low values
# can increase lag dramatically
B_SPEED = 4

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#==============================================================================
# Game_Battler
#==============================================================================

class Game_Battler
  
  attr_accessor :frame
  attr_accessor :max_frame
  attr_accessor :origin_name
  attr_accessor :battler_name
  
end

#==============================================================================
# Sprite_Battler
#==============================================================================

class Sprite_Battler
  
  alias upd_animated_battlers_dbs_later update
  def update
    if $game_system.ANIBATTLERS_NON_ACTION_BS && @battler != nil
      setup_battler if @battler.origin_name != @battler.battler_name
      if Graphics.frame_count % B_SPEED == 0
        @battler.frame = (@battler.frame + 1) % @battler.max_frame
      end
      if @frame != @battler.frame
        @frame = @battler.frame
        name = @battler.origin_name
        name += @frame.to_s if @frame > 0
        self.bitmap = RPG::Cache.battler(name, @battler.battler_hue)
        @width = bitmap.width
        @height = bitmap.height
        self.ox = @width / 2
        self.oy = @height
      end
    end
    upd_animated_battlers_dbs_later
  end
  
  def setup_battler
    @battler.origin_name = @battler.battler_name
    @battler.frame = @frame = 0
    @battler.max_frame = 1
    loop do
      name = @battler.origin_name + @battler.max_frame.to_s
      if FileTest.exist?("Graphics/Battlers/#{name}.jpg") ||
         FileTest.exist?("Graphics/Battlers/#{name}.png")
        @battler.max_frame += 1
      else
        break
      end
    end
  end
  
  def setup_battleback
    @battler.origin_name = @battler.battler_name
    @battler.frame, @frame, @battler.max_frame = 0, 0, 1
    name = @battler.origin_name + @battler.max_frame.to_s
    while FileTest.exist?("Graphics/Battlers/#{name}.jpg") ||
          FileTest.exist?("Graphics/Battlers/#{name}.png")
      @battler.max_frame += 1
      name = @battler.origin_name + @battler.max_frame.to_s
    end
  end

end

if TONS_OF_ADDONS::BATTLE_CURSORS
#==============================================================================
# Enhanced Battle Cursors v2.1 beta
# by Fantasist
#==============================================================================
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# - code reviewed, optimized, integrated into Tons of Add-ons, freed from
#   potential bugs and beta tested by Blizzard
# - this add-on is part of Tons of Add-ons with full permission of the original
#   author(s)
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
#------------------------------------------------------------------------------
# * Config (these can't be changed in-game)
#------------------------------------------------------------------------------
# Position
#       Set the position of the cursor
#
# 1) Monster_Height: The height of the cursor from the monster graphic's base.
# 2) Actor_Height: The height of the cursor from the actor graphic's base.
MONSTER_OFFSET = 0
ACTOR_OFFSET = 0
#------------------------------------------------------------------------------
# Movement Type Config
#       Configuration for the movement types used
#
# 1) Phase_Range: The distance the cursor moves away from the height while
#    phasing.
# 2) Zoom_Factor: The amount the cursor zooms in and out. Recommended range is
#    from 0 to 1, refrain from using more than 2 digits after decimal.
# 3) EBC_Type: This is the configuration of animation types
#        [Anim or not(true/false), movement type, transition type]
#      available movement types   -> phase, zoom, spin, spin2
#      available transition types -> trans, default
#    If you are using animations (first parameter is true) then use numbers
#    instead of movement and transition types to determine the animation IDs
#    of the animations used. The first is the actor, the second is the enemy
#    animation ID.
PHASE_RANGE = 16
ZOOM_FACTOR = 0.2
EBC_TYPE = [false, 'phase', 'trans']
# EBC_type can be changed ingame, refer to $game_system.battle_cursor and
# set the new values. This change is being saved with the save file.
#==============================================================================

#==============================================================================
# ** Game System
#==============================================================================

class Game_System
  
  attr_accessor :battle_cursor
  
  alias init_battle_cursor initialize
  def initialize
    init_battle_cursor
    @battle_cursor = EBC_TYPE
  end  
  
end

#==============================================================================
# ** Arrow_Base
#==============================================================================

class Arrow_Base < RPG::Sprite

  attr_reader   :index
  attr_reader   :help_window
    
  def initialize(viewport)
    super
    if $game_system.battle_cursor[0]
      tmp, @battler = $game_system.battle_cursor, nil
      @actor_cursor = (tmp[1].is_a?(Numeric) ? tmp[1] : 98)
      @enemy_cursor = (tmp[2].is_a?(Numeric) ? tmp[2] : 99)
    else
      # Main Sprite initialization
      self.bitmap = RPG::Cache.windowskin($game_system.windowskin_name)
      self.src_rect.set(128, 96, 32, 32)
      self.ox, self.oy, self.z = 16, 64, 2501
      # Sub-sprite initialization
      if animtype('trans')
        @sp2 = Sprite.new(viewport)
        @sp2.bitmap = self.bitmap
        @sp2.src_rect.set(160, 96, 32, 32)
        @sp2.ox, @sp2.oy, @sp2.z = self.ox, self.oy, self.z-1
      end
      # Variable initialization
      @rad = 0 if animtype('trans') || ['phase', 'zoom', 'spin2'].any? {|i| movetype(i)}
      @deg = 0 if movetype('spin')
      @battler = nil
      @blink_count = 0 if animtype('default')
    end
    @y, @index, @help_window = 0, 0, nil
    update
  end
  
  def movetype(type)
    return ($game_system.battle_cursor[1] == type)
  end
  
  def animtype(type)
    return ($game_system.battle_cursor[2] == type)
  end
  
  def index=(index)
    @index = index
    update
  end

  def help_window=(help_window)
    @help_window = help_window
    # Update help text (update_help is defined by the subclasses)
    update_help if @help_window != nil
  end

  def update
    super
    if $game_system.battle_cursor[0]
      # Update animation
      id = self.is_a?(Arrow_Actor) ? @actor_cursor : @enemy_cursor
      loop_animation($data_animations[id])
    else
      if @rad
        # Cycle @rad from 0 to 2 Pi
        if @rad < 2 * Math::PI
          @rad += Math::PI/(movetype('spin2') ? 30 : 10)
        else
          @rad = 0
        end
      end
      # Animations
      trans if animtype('trans')
      default if animtype('default')
      # Movement Types
      phase if movetype('phase')
      spin if movetype('spin')
      spin2 if movetype('spin2')
      zoom if movetype('zoom')
    end
    # Update Help Window
    update_help if @help_window != nil
  end

  def dispose
    @sp2.dispose unless @sp2 == nil || @sp2.disposed?
    super
  end

  #--------------------------------------------------------------------------
  # * Cursor Animations
  #--------------------------------------------------------------------------
  def trans
    self.opacity = (Math.sin(@rad)*255).round
  end
  
  def default
    @blink_count = (@blink_count + 1) % 8
    self.src_rect.set((@blink_count < 4 ? 128 : 160), 96, 32, 32)
  end

  #--------------------------------------------------------------------------
  # * Cursor Movements
  #--------------------------------------------------------------------------
  def phase
    @y = ((Math.sin(@rad))*PHASE_RANGE).round
  end

  def spin
    # Cycle @deg from 0 to 360
    self.angle = @deg = (@deg + 18) % 360
    @sp2.angle = @deg if @sp2
  end

  def spin2
    self.angle = (Math.sin(@rad)*360).round
    @sp2.angle = self.angle if @sp2
  end
  
  def zoom
    self.zoom_x = self.zoom_y = 1 + Math.sin(@rad)*ZOOM_FACTOR
    @sp2.zoom_x = self.zoom_x if @sp2
  end
 
end

#==============================================================================
# ** Arrow_Enemy
#==============================================================================

class Arrow_Enemy < Arrow_Base
    
  def enemy
    return $game_troop.enemies[@index]
  end

  def update
    super
    # Skip if indicating a nonexistant enemy
    $game_troop.enemies.size.times do
      break if self.enemy.exist?
      @index = (@index + 1) % $game_troop.enemies.size
    end
    # Cursor right
    if Input.repeat?(Input::RIGHT)
      $game_system.se_play($data_system.cursor_se)
      $game_troop.enemies.size.times do
        @index = (@index + 1) % $game_troop.enemies.size
        break if self.enemy.exist?
      end
    # Cursor left
    elsif Input.repeat?(Input::LEFT)
      $game_system.se_play($data_system.cursor_se)
      $game_troop.enemies.size.times do
        @index = (@index + $game_troop.enemies.size - 1) % $game_troop.enemies.size
        break if self.enemy.exist?
      end
    end
    # Set sprite coordinates
    if self.enemy != nil
      self.x = self.enemy.screen_x
      self.y = self.enemy.screen_y
      self.y += -@y - MONSTER_OFFSET
      @sp2.x, @sp2.y = self.x, self.y if @sp2
    end
  end

  def update_help
    if $game_system.ENEMY_STATUS
      # Display enemy name and state in the help window
      @help_window.set_actor(self.enemy)
    else
      @help_window.set_enemy(self.enemy)
    end
  end
  
end

#==============================================================================
# ** Arrow_Actor
#==============================================================================

class Arrow_Actor < Arrow_Base
  
  def actor
    return $game_party.actors[@index]
  end
  
  def update
    super
    # Cursor right
    if Input.repeat?(Input::RIGHT)
      $game_system.se_play($data_system.cursor_se)
      @index = (@index + 1) % $game_party.actors.size
    # Cursor left
    elsif Input.repeat?(Input::LEFT)
      $game_system.se_play($data_system.cursor_se)
      @index = (@index + $game_party.actors.size - 1) % $game_party.actors.size
    end
    # Set sprite coordinates
    if self.actor != nil
      if $game_system.CENTER_BATTLER
        self.x = case $game_party.actors.size
        when 1 then 240 + self.actor.screen_x
        when 2 then 2 * self.actor.screen_x
        when 3 then 80 + self.actor.screen_x
        when 4 then self.actor.screen_x
        end
      else
        self.x = self.actor.screen_x
      end
      self.y = self.actor.screen_y
      self.y += -@y - ACTOR_OFFSET
      @sp2.x, @sp2.y = self.x, self.y if @sp2
    end
  end
  
  def update_help
    # Display actor status in help window
    @help_window.set_actor(self.actor)
  end
  
end

end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Death Image by Blizzard
# Version: 1.2b
# Type: Graphic Alteration
# Date: 17.12.2007
# Date 1.0b: 17.12.2007
# Date 1.1b: 20.3.2008
# Date 1.2b: 22.8.2008
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
#   
#   This add-on will allow the display of an image instead of none for dead
#   actors. Keep in mind that this add-on can increase lag in battle.
#   If you turn this add-on on/off, you shouldn't do that in battle.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

DEATH_IMAGE = 'CAPTURED.png' # the battler file name of your death image

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#==============================================================================
# Sprite_DummyBattler
#==============================================================================

class Sprite_DummyBattler < RPG::Sprite
  
  attr_accessor :battler
  
  def update
    return if @battler == nil
    super
    if self.bitmap == nil
      self.bitmap = RPG::Cache.battler(DEATH_IMAGE, 0)
      @width, @height = bitmap.width, bitmap.height
      self.ox, self.oy = @width / 2, @height
      self.opacity = 0 if @battler.dead? || @battler.hidden
    end
    if @battler_visible
      if !@battler.hidden && !@battler.dead? &&
          (@battler.damage == nil || @battler.damage_pop)
        escape
        @battler_visible = false
      elsif $game_temp.battle_main_phase
        self.opacity += 3 if self.opacity < 255
      elsif self.opacity > 207
        self.opacity -= 3
      end
    elsif @battler.damage == nil && @battler.dead?
      appear
      @battler_visible = true
    end
    if @battler != nil
      if $game_system.CENTER_BATTLER && @battler.is_a?(Game_Actor)
        self.x = case $game_party.actors.size
        when 1 then @battler.screen_x + 240
        when 2 then @battler.screen_x + 80 + @battler.index * 160
        when 3 then @battler.screen_x + 80
        when 4 then @battler.screen_x
        end
      else
        self.x = @battler.screen_x
      end
      self.y, self.z = @battler.screen_y, @battler.screen_z
    end
  end
  
end

#==============================================================================
# Spriteset_Battle
#==============================================================================

class Spriteset_Battle
  
  alias init_death_image_later initialize
  def initialize
    @death_sprites = []
    init_death_image_later
    if $game_system.DEATH_IMAGE
      @actor_sprites.size.times {
          sprite = Sprite_DummyBattler.new(@viewport2)
          sprite.opacity = 0
          @death_sprites.push(sprite)}
    end
  end
  
  alias upd_death_image_later update
  def update
    upd_death_image_later
    return unless $game_system.DEATH_IMAGE
    @death_sprites.each_index {|i|
        @death_sprites[i].battler = @actor_sprites[i].battler
        @death_sprites[i].update}
  end
  
  alias disp_death_image_later dispose
  def dispose
    @death_sprites.each {|sprite| sprite.dispose}
    disp_death_image_later
  end
  
end

#==============================================================================
# Terrain Battlebacks
# Author: game_guy
# Type: Battle Background Changer
# Version: 1.0
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# - code reviewed, optimized, integrated into Tons of Add-ons, freed from
#   potential bugs and beta tested by Blizzard
# - this add-on is part of Tons of Add-ons with full permission of the original
#   author(s)
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
#==============================================================================

module GameGuy
  # Terrain[TAG] = 'BATTLEBACK_FILENAME'
  # If a tag is not defined, the default battle back will be used.
  Terrain = []
  Terrain[0] = '001-Grassland01'
  Terrain[1] = '001-Grassland01'
  Terrain[2] = '002-Woods01'
  Terrain[3] = '003-Forest01'
  Terrain[4] = '004-Mountain01'
  Terrain[5] = '004-Mountain01'
  Terrain[6] = '004-Mountain01'
  Terrain[7] = '004-Mountain01'
end

#==============================================================================
# Game_Map
#==============================================================================

class Game_Map
  
  def battleback_name
    if $game_system.TERRAIN_BATTLEBACKS &&
        GameGuy::Terrain[$game_player.terrain_tag] != nil
      return GameGuy::Terrain[$game_player.terrain_tag]
    end
    return @battleback_name
  end
  
end
