=begin
#+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
# ■ System Options [RMXP]                                        
# ■ Author: Bigace360   
# ■ Version: 1.41
# ■ Date: Aug 16, 2012
# ■ Blog: http://bigaceworld.wordpress.com/
#+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
#                               VERSION HISTORY                                #
#+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
# 08.16.2012 (v1.00) - Original script completed
# 08.17.2012 (v1.01) - Fixed line break issue in help window.
# 02.04.2013 (v1.32) - Improved Coding
#                    - Fixed the issue with the full_screen settings
#                    - Added a comfirmation when trying to click on default.
#                    - Added an layout image
#                    - Added an option to allow the player to save & load their
#                      games
# 03.14.2013 (v1.34) - Improved Coding
#                    - Removed Bars, download Warrior Core Engine for Bars
# 05.13.2013 (v1.40) - You can now set your own custom switches and variables to
#                      be a part of this list.
# 05.25.2013 (v1.41) - Compatibility with Scene_MenuBase to reduce lines and
#                      increase compatibility with other ACMS scripts 
#+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
#                                INTRODUCTION                                  #
#+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
# The "End Game" option is possibly the most useless function in RPG Maker XP
# games. Not only does it have little functionality but its functions can be
# reproduced by Alt+F4 and F12. This script replaces "End Game" with a new menu
# altogether and giving the player some familiar options seen in many of 
# today's commercial RPG's such as changing window skins, adjust sound volume,
# turning off animations during battle, and the like.
#+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
#                                  FEATURES                                    #
#+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
# ** Makes Scene_End not useless
# ** Allows the player to adjust the setting in the game.
# ** Has a Default feature to restore everything.
#+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
#                                INSTRUCTIONS                                  #
#+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
# To install this script, open up your script editor and copy/paste this script
# to an open slot below Scene_Debug, and ACE Menu System but above Main.
# Remember to save.
#
# -----------------------------------------------------------------------------
# Script Calls - These commands are used with script calls.
# -----------------------------------------------------------------------------
# $game_system.volume_change(:bgm, x)
# $game_system.volume_change(:bgs, x)
# $game_system.volume_change(:sfx, x)
# ~ Use the script call to change the bgm, bgs, or sfx sound rate by
# x increment. Use a negative value to lower the volume.
#
# $game_system.set_autodash(true)
# $game_system.set_autodash(false)
# ~Turns autodash on (true) or off (false).
#
# $game_system.set_full_screen(true)
# $game_system.set_full_screen(false)
# ~Turns Full Screen on (true) or off (false).
#
#-------------------------------------------------------------------------------
#
# 1. Scroll down, adjust the various  Variable values to something empty or
#    predetermined. 
# 2. Go to the Windowskin folder in your project's "Graphics" folder to insert
#    the window skins you want to use there and adjust the WINDOW_HASH 
#    accordingly. Do the same with the Battle Music by going to your BGM folder
#    in your project's Audio folder and then adjust the MUSIC_HASH in the module.
# 3. To Restore all back to default press [CTRL + ALT]
#
#+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
#                                  SECTIONS                                    #
#+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
#  ■ Modules
# ** ACE Module
#
#  ■ Game_Objects
# ** Game_Temp
# ** Game_System
#
#  ■ Windows
# ** Window
# ** Window_Base
# ** Window_OptionHelp
# ** Window_OptionTypes
# ** Window_Font
# ** Window_Skins
# ** Window_BattleMusic
# ** Window_SaveFile
# ** Window_CommandBase
# ** Window_SystemOptions
# ** Ask_for_Default
#
#  ■ Scenes
# ** Scene_End
# ** Scene_Save
# ** Scene_Load
#
#+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
#
# Credits/Thanks:
#   - Bigace360, for the script.
#   - ForeverZer0, for fixing the line break issue.
#   - KK20, for fixing the issue with the fullscreen
#
#+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
#                     Script Conflicts and Compatability                       #
#=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
# ● Compatibility
#   Requires the script 'Scene_Base' v1.5 or higher
#   Requires the script 'Scene_MenuBase' v1.00 or higher
#
# ● Alias methods
#   class Game_System
#     def initialize
#     def item_number(item)
#
#   class Window_SaveFile < Window_Base
#     def refresh
#
#   class Scene_Save
#     def on_decision(filename)
#     def on_cancel
#    
#   class Scene_Load
#     def on_cancel
#
# ● Overwrite methods
#   class Game_System
#     def bgm_play(bgm)
#     def bgs_play(bgs)
#     def me_play(me)
#     def se_play(se)
#	    
#   class Window_Base < Window 
#     def initialize(*args)
#
#   class Scene_End
#     All of Scene_End. Expect no functionality with any scripts that
#     will also replace Scene_End.
#
#+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
#
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# ■ Module ACE::CORE
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
module ACE
	module CORE
		#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
		# - General Setting -
		#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
		# These are the general settings that govern the System settings. 
		#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-   
		OPTION_CONFIG ={
			# :option_win => [Opacity, Window Border?]. (Opacity Limit: 0~255)
			:option_win => [200, false],
			# :menu_index - If :menu_access is true, then this value determines where
			# in the menu command window it is inserted.
			:menu_index => 5,
			# :background - Background images
			:background => 'back04',
			# :layout - Image filename for window layout, must be in the Menu folder
			:layout => '',	
		}     		 
		
		#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
		# - Command Settings -
		#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
		# These settings adjust the commands shown in the command list. Add, remove
		# or rearrange the commands as you see fit. Here's a list of which commands
		# do what:
		# 
		# -------------------------------------------------------------------------
		# :command         Description
		# -------------------------------------------------------------------------
		#      :blank,        - Blank Item.
		#      :default       - Returns the option menu to its default settings
		# 
		#      :volume_bgm,   - Adjusts BGM volume.
		#      :volume_bgs,   - Adjusts BGS volume.
		#      :volume_sfx,   - Adjusts SFX volume.
		#      :battle_bgm,   - Change battle bgm name
		#      :windowskin,   - Changes the windowskin.  
		#      :font_name,    - Change the font name            
		#		
		#      :auto_dash,    - Controls if need to hold down dash button to run.
		#                      (Requires Warrior Engine)
		#      :bar_style,    - Choose from a variety of new gradient styles. (1~7)
		#                      (Requires Warrior Engine)
		#      :bar_opacity,  - Change the bar opacity. (0~255)
		#                      (Requires Warrior Engine)
		#
		#      :full_screen,  - Do you want the game in full screen?
		#      :save_game,    - Do you wish to save the game?
		#      :load_game,    - Do you wish to load an old game file?
		#      :return_menu,  - Return back to the menu screen.
		#      :return_title, - Return back to the title screen.
		#      :shutdown,     - Shuts down the game.
		#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
		OPTIONS_COMMANDS =[# Do not remove this line.
			:default,			 # Do you wish to restore settings?
			:windowskin,   # Changes the windowskin.
			:font_name,    # Change the font name
			:battle_bgm,   # Changes battle bgm name
			:blank,			
			:volume_bgm,   # Changes the BGM volume used.
			:volume_bgs,   # Changes the BGS volume used.
			:volume_sfx,   # Changes the SFX volume used.
			:bar_style,    # Choose from a variety of new gradient styles. (1~7)
			:bar_opacity,  # Change the bar opacity. (0~255)
			:blank,			
			:auto_dash,    # Controls if need to hold down dash button to run.
			:full_screen,  # Do you want the game in full screen? 
			:blank,		
			:save_game,    # Do you wish to save the game?
			:load_game,    # Do you wish to load an old game file?
			:return_menu,  # Return back to the menu screen. 
			:return_title, # Return back to the title screen.
			:shutdown,     # Shuts down the game. 			
		] # Do not remove this.
		
		#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
		# - Custom Switches -
		# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		# If you want your game to have system options other than just the ones
		# listed above, you can insert custom switches here to produce such an
		# effect. Adjust the settings here as you see fit.
		#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
		CUSTOM_SWITCHES ={
			# ------------------------------------------------------------------------
			# :switch    => [Switch, Name, Off Text, On Text, 
			#                Help Window Description
			#               ], # Do not remove this.
			# ------------------------------------------------------------------------
			:switch_1  => [ 1, "Custom Switch 1", "OFF", "ON",
				"Help description used for custom switch 1."
			],
			# ------------------------------------------------------------------------
			:switch_2  => [ 2, "Custom Switch 2", "OFF", "ON",
				"Help description used for custom switch 2."
			],
			# ------------------------------------------------------------------------
		} # Do not remove this.
		
		#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
		# - Custom Variables -
		# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		# If you want your game to have system options other than just the ones
		# listed above, you can insert custom variables here to produce such an
		# effect. Adjust the settings here as you see fit.
		#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
		CUSTOM_VARIABLES ={
			# ------------------------------------------------------------------------
			# :variable   => [Switch, Name, 
			#                 Colour1, Colour2, Min, Max, 
			#                 Help Window Description
			#                ], # Do not remove this.
			# ------------------------------------------------------------------------
			:variable_1 => [ 1, "Custom Variable 1", 
				Color.new(32,128,204), Color.new(32,160,214), -100, 100, 
				"Help description used for custom variable 1."
			],
			# ------------------------------------------------------------------------
			:variable_2 => [ 2, "Custom Variable 2", 
				Color.new(255,56,16), Color.new(255,120,76), -10, 10,
				"Help description used for custom variable 2."
			], 
			# ------------------------------------------------------------------------
		} # Do not remove this.
		
		#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
		# - Vocab Settings -
		#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
		# This hash adjusts the vocab used for both the commands and the help
		# description that appears above the command window. Note that for the
		# command help descriptions, you may use text codes. Use \n to linebreak.
		#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-		
		OPTION_DESCRIPTION ={
			# -------------------------------------------------------------------------
			# :command    => [Command Name, Option1, Option2
			#                 Help Window Description,
			#                ], # Do not remove this.
			# -------------------------------------------------------------------------
			:blank      => ["", "None", "None",
				""
			], # Do not remove this.
			# ------------------------------------------------------------------------
			:windowskin => ["Windowskin", 21, "None", # Options 1 is a Variable.
				"Changes the windowskin used for the game."
			], # Do not remove this.
			# ------------------------------------------------------------------------
			:battle_bgm => ["Battle Music", 22, "None", # Options 1 is a Variable.
				"Change the music played during battle"
			], # Do not remove this.
			# ------------------------------------------------------------------------
			:volume_bgm => ["BGM Volume", Color.new(62,154,222), Color.new(153,204,255), 
				"Change the volume used for background music. \n" +
				"Hold SHIFT to change increment by 10."
			], # Do not remove this.
			# ------------------------------------------------------------------------
			:volume_bgs => ["BGS Volume", Color.new(160,152,255), Color.new(204,192,255), 
				"Change the volume used for background sound. \n" +
				"Hold SHIFT to change increment by 10."
			], # Do not remove this.
			# ------------------------------------------------------------------------
			:volume_sfx => ["SFX Volume", Color.new(255,204,32), Color.new(255,255,160), 
				"Change the volume used for sound effects. \n" +
				"Hold SHIFT to change increment by 10."	
			], # Do not remove this.
			# ------------------------------------------------------------------------
			:font_name => ["Font Name", 23, "None", # Options 1 is a Variable.
				"Change the font type name used in the game."
			], # Do not remove this.       
			# ------------------------------------------------------------------------
			:bar_style => ["Bar Style", "None", "None", 
				"Choose from seven bar styles for a unique look."
			], # Do not remove this.
			# ------------------------------------------------------------------------
			:bar_opacity => ["Bar Opacity", Color.new(0,0,0), Color.new(255,255,255),
				"Change the opacity of the bars in the game.\n" +
				"Hold SHIFT to change increment by 10."
			], # Do not remove this.
			# ------------------------------------------------------------------------
			:auto_dash   => ["Auto-Dash", "Walk", "Dash",
				"Automatically dash without holding the run button."
			], # Do not remove this.
			# ------------------------------------------------------------------------
			:full_screen => ["Full Screen", "640x480", "Full",
				"Switchs to full screen" 
			], # Do not remove this.
			# ------------------------------------------------------------------------
			:return_menu => ["Return to Main Menu", "None", "None",
				"Return back to the main menu."
			], # Do not remove this.	
			# ------------------------------------------------------------------------
			:return_title   => ["Return to Title Screen", "None", "None",
				"Go back to the title screen."
			], # Do not remove this.
			# ------------------------------------------------------------------------
			:shutdown   => ["Shutdown Game", "None", "None",
				"Turns off the game."
			], # Do not remove this.
			# ------------------------------------------------------------------------
			:default => ["Default", "None", "None",
				"Do you wish to restore the settings to default?"
			], # Do not remove this.
			# ------------------------------------------------------------------------  
			:save_game => ["Save", "None", "None",
				"Do you wish to save the game?"
			], # Do not remove this.
			# ------------------------------------------------------------------------   
			:load_game => ["Load", "None", "None",
				"Do you wish to load an old game file?"
			], # Do not remove this.
			# ------------------------------------------------------------------------
		} # Do not remove this.
		
		#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
		# - Default Settings -
		#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
		# This hash changes the default settings for some of the options above.
		#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-	
		DEFAULT ={	
			# Enable automatic dashing by default?
			:autodash => false,
			# Enable Full-Screen mode by default?
			# Note: this feature is overwritten by 'ACE Title Screen'
			:full_screen => false,
			# Default style value for bars 
			:bar_style => 6,
			# Default windowskin value 
			:skin_value => 1,
			# Default skin value 
			:music_value => 1,
			# Default font value
			:font_value => 13,
		}
		
		#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
		# - Window Settings -
		#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
		# The following adjusts the window skins used for your game. Match the
		# Window skins with the names accordingly. Within the windowskin hash,
		# the following settings are adjusted as such:
		#     File   - File Name
		#     Name   - As it appears in the game
		#     Back   - Back Opacity   (0-255)
		#     Border - Border Opacity (0-255)
		#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
		WINDOW_HASH ={    
			# Window ID => [        File,   Name, Back,  Border],
			1 => ['001-Blue01', 'Blue', 200,      255],
		} # Do not remove this.
		#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
		# - Battle Music Settings -
		#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
		# The following changes the battle music used in your game. Match the Song
		# with the names accordingly. Within the battle music hash, the following
		# settings are adjusted as such:
		#     File  - File Name
		#     Name  - As it appears in the game
		#     Pitch - Sets the pitch for sound playback
		#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
		BATTLE_HASH ={
			# Music ID => [         File ,             Name,  Pitch],
			1 => ['001-Battle01', 'Battle Music 1',     80],
			2 => ['002-Battle02', 'Battle Music 2',     80],
			3 => ['003-Battle03', 'Battle Music 3',     80],
			4 => ['004-Battle04', 'Battle Music 4',     80],
			5 => ['005-Boss01',   'Boss Music 1',       80],
			6 => ['006-Boss02',   'Boss Music 2',       80],
			7 => ['007-Boss03',   'Boss Music 3',       80],
			8 => ['008-Boss04',   'Boss Music 4',       80],
		} # Do not remove this.
		#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
		# - Font Names -
		#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
		FONT_HASH = {
			1 => 'Courier New', 
			2 => 'Times New Roman', 
			3 => 'Verdana', 
			4 => 'Arial', 
			5 => 'Myriad Pro', 
			6 => 'Mistral', 
			7 => 'Arial Black', 
			8 => 'Georgia', 
			9 => 'Comic Sans MS', 
			10 => 'Tahoma', 
			11 => 'Bookman Old Style', 
			12 => 'Papyrus', 
			13 => 'UmePlus Gothic', 
		} # Do not remove this.
	end
	
	#●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●
	# * BEGIN [ DON'T TOUCH THIS SECTION ]
	#●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●
	#
	# ▼ Warning
	# Editting anything past this point may potentially result in causing
	# computer damage, incontinence, explosion of user's head, coma, death,
	# and/or halitosis so edit at your own risk.
	#
	#●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●
	
	#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:
	# ■  MESSAGE
	# --------------------------------------------------------------------------- 
	#   Setting module for the ACE::MESSAGE
	#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:
	module MESSAGE
		#--------------------------------------------------------------------------
		# * required
		#   This method checks for the existance of the basic module and other
		#   ACMS scripts required for this script to work, don't edit this
		#--------------------------------------------------------------------------
		def self.required(name, req, version, type = nil)
			if !$ace_script[:scene_menu_base]
				msg = "The script '%s' requires the script\n"
				msg += "'scene_MenuBase' v%s or higher above it to work properly\n"
				msg += "Go to http://bigaceworld.wordpress.com/ to download this script."
				print(sprintf(msg, self.script_name(name), version))
				exit
			else
				self.required_script(name, req, version, type)
			end
		end
		#--------------------------------------------------------------------------
		# * script_name
		#   Get the script name base on the imported value, don't edit this
		#--------------------------------------------------------------------------
		def self.script_name(name, ext = "ACMS")
			name = name.to_s.gsub("_", " ").upcase.split
			name.collect! {|char| char == ext ? "#{char} -" : char.capitalize }
			name.join(" ")
		end
	end
end
#
#=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
#                         ▼ Import to Global Hash ▼                            #
($ace_script ||= {})[:ace_system_menu] = 1.41
ACE::MESSAGE.required_script(:ace_system_menu, :scene_base, 1.5, :above)
ACE::MESSAGE.required_script(:ace_system_menu, :scene_menu_base, 1.00, :above)
#=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

ACE::CORE::WINDOWSKIN_VARIABLE = ACE::CORE::OPTION_DESCRIPTION[:windowskin][1]
ACE::CORE::MUSIC_VARIABLE = ACE::CORE::OPTION_DESCRIPTION[:battle_bgm][1]
ACE::CORE::FONT_VARIABLE = ACE::CORE::OPTION_DESCRIPTION[:font_name][1]

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# ■ Game_Temp
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
class Game_Temp
	attr_accessor :option_index
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# ■ Game_System
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
class Game_System
	include ACE::CORE
	attr_accessor(:bar_style, :fullscreen, :autodash)
	attr_reader(:bar_opacity, :message)
	GetSystemMetrics = Win32API.new('user32', 'GetSystemMetrics', 'l' , 'l')
	alias :ace_initialize :initialize unless $@ 
	def initialize(*args, &block) 
		ace_initialize(*args, &block) # Call Original Method
		init_volume_control
		init_gradient_style
		init_bar_opacity
		init_full_screen
		init_autodash
	end
	def init_volume_control
		(@volume ||= {})[:bgm] = 100
		(@volume ||= {})[:bgs] = 100
		(@volume ||= {})[:sfx] = 100
	end
	def volume(type)
		init_volume_control if @volume.nil?
		return [[@volume[type], 0].max, 100].min
	end
	def volume_change(type, increment)
		init_volume_control if @volume.nil?
		@volume[type] += increment
		@volume[type] = [[@volume[type], 0].max, 100].min
	end
	def init_gradient_style
		@bar_style = DEFAULT[:bar_style]
	end
	def bar_style?
		init_gradient_style if @bar_style.nil?
		return [[@bar_style, 1].max, 8].min
	end
	def set_bar_style(value)
		init_gradient_style if @bar_style.nil?
		@bar_style += value
		@bar_style = [[@bar_style, 1].max, 8].min
	end
	def init_bar_opacity
		@bar_opacity = 255
	end
	def opacity
		init_bar_opacity if @bar_opacity.nil?
		return [[@bar_opacity, 0].max, 255].min
	end
	def opacity_change(increment)
		init_bar_opacity if @bar_opacity.nil?
		@bar_opacity += increment
		@bar_opacity = [[@bar_opacity, 0].max, 255].min
	end
	def init_full_screen
		ace_title = $ace_script[:ace_title_screen]
		@fullscreen = ace_title ? TITLE_CONFIG[:full_screen] : DEFAULT[:full_screen]
	end
	def full_screen? 
		if @called_set.nil?
			w = GetSystemMetrics.call(0); h = GetSystemMetrics.call(1)
			@fullscreen = (w == 640 && h == 480)
		end
		@called_set = nil
		return @fullscreen
	end
	def set_full_screen(value) 
		@fullscreen = value
		@called_set = 1
	end
	def init_autodash
		@autodash = DEFAULT[:autodash]
	end
	def autodash?
		init_autodash if @autodash.nil?
		return @autodash
	end
	def set_autodash(value)
		@autodash = value
	end
	def bgm_play(bgm)
		@playing_bgm = bgm
		if !bgm.nil? && bgm.name != ""
			volume = bgm.volume * $game_system.volume(:bgm) / 100
			Audio.bgm_play("Audio/BGM/" + bgm.name, volume, bgm.pitch)
		else
			Audio.bgm_stop
		end
		Graphics.frame_reset
	end
	def bgs_play(bgs)
		@playing_bgs = bgs
		if !bgs.nil? && bgs.name != ""
			volume = bgs.volume * $game_system.volume(:bgs) / 100
			Audio.bgs_play("Audio/BGS/" + bgs.name, volume, bgs.pitch)
		else
			Audio.bgs_stop
		end
		Graphics.frame_reset
	end
	def me_play(me)
		if !me.nil? && me.name != ""
			volume = me.volume * $game_system.volume(:bgm) / 100
			Audio.me_play("Audio/ME/" + me.name, volume, me.pitch)
		else
			Audio.me_stop
		end
		Graphics.frame_reset
	end
	def se_play(se)
		if !se.nil? && se.name != ""
			volume = se.volume * $game_system.volume(:sfx) / 100
			Audio.se_play("Audio/SE/" + se.name, volume, se.pitch)
		end
	end
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# ■ Window
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
class Window
	def update_windowskin
		return if $game_variables.nil?
		variable1 = ACE::CORE::WINDOWSKIN_VARIABLE
		if $game_variables[variable1] == 0
			$game_variables[variable1] = ACE::CORE::DEFAULT[:skin_value]
		elsif !ACE::CORE::WINDOW_HASH.include?($game_variables[variable1])
			$game_variables[variable1] = ACE::CORE::DEFAULT[:skin_value]
		end
		window = ACE::CORE::WINDOW_HASH[$game_variables[variable1]]
		change_window_settings(window)
	end
	def change_window_settings(window)
		self.windowskin = RPG::Cache.windowskin(window[0])
		self.back_opacity = window[2]
		self.opacity = window[3]	
	end	
	def update_font
		self.contents = Bitmap.new(width - 32, height - 32)
		return if $game_variables.nil?
		variable2 = ACE::CORE::FONT_VARIABLE 
		if $game_variables[variable2] == 0
			$game_variables[variable2] = ACE::CORE::DEFAULT[:font_value]
		elsif !ACE::CORE::FONT_HASH.include?($game_variables[variable2])
			$game_variables[variable2] = ACE::CORE::DEFAULT[:font_value]
		end				
		font = ACE::CORE::FONT_HASH[$game_variables[variable2]]
		change_font_settings(font)
	end
	def change_font_settings(new_font)
		contents.font.bold = Font.default_bold 
		contents.font.italic = Font.default_italic  
		contents.font.size = Font.default_size 
		contents.font.name = Font.default_name = new_font
	end
end 

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# ■ Window_Base
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
class Window_Base < Window
	alias :ace_systembase_initi :initialize unless $@
	def initialize(*args, &block)
		ace_systembase_initi(*args, &block)
		self.update_windowskin
		self.update_font
		stat_opacity? if $scene.is_a?(Scene_End)
	end
	def stat_opacity?
		option_opacity = ACE::CORE::OPTION_CONFIG[:option_win]
		self.back_opacity = option_opacity[0] 
		self.opacity = option_opacity[0] if option_opacity[1]
	end
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# ■ Window_OptionHelp
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
class Window_OptionHelp < Window_Help
	def initialize
		super
		self.height = fitting_height(2)
	end
	alias :multiline_set_text :set_text unless $@
	def set_text(text, align = 0)
		return unless text != nil
		lines = text.split("\n")
		if lines.size <= 1
			multiline_set_text(text, align)
		elsif @text != text || @align != align
			self.contents.dispose
			self.contents = Bitmap.new(self.width - 32, lines.size * 32)
			lines.each_index do |i| 
				contents.draw_text(4, i*32, contents.width, 32, lines[i], align)
			end
			@text = text; @align = align; @actor = nil
		end
		show
	end
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# ■ Window_OptionTypes
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
class Window_OptionTypes < Window_Selectable
	include ACE::CORE
	def initialize
		super(160, 64, 320, fitting_height(10))
		@column_max = 1
		select(0)
		self.z = 999
		self.back_opacity = 255
		hide
		deactivate
		refresh
	end  
	def item_max
		@item_max = @data ? @data.size : 1
	end
	def create_contents
		self.contents = Bitmap.new(width - 32, row_max * 32)
	end
	def refresh; end
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# ■ Window_BattleMusic
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
class Window_BattleMusic < Window_OptionTypes
	def variable
		$game_variables[MUSIC_VARIABLE]
	end
	def refresh
		self.contents.dispose if self.contents != nil
		self.contents = nil if self.contents != nil
		@data = []
		hash = BATTLE_HASH.sort {|a,b| a[0] <=> b[0]}
		hash.each do |key|
			@data << key[0]
			select(key[0] - 1) if key[0] == $game_variables[variable]
		end
		create_contents if item_max > 0 
		draw_all_items if item_max > 0 
	end
	def draw_item(index)
		clear_item(index)
		contents.draw_text(item_rect(index), BATTLE_HASH[@data[index]][1], 1)
	end
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# ■ Window_Font
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
class Window_Font < Window_OptionTypes
	def variable
		$game_variables[FONT_VARIABLE]
	end
	def refresh
		self.contents.dispose if self.contents != nil
		self.contents = nil if self.contents != nil
		@data = []
		hash = FONT_HASH.sort {|a,b| a[0] <=> b[0]}
		hash.each do |key|
			@data << key[0]
			select(key[0] - 1) if key[0] == $game_variables[variable]
		end
		create_contents if item_max > 0 
		draw_all_items if item_max > 0 
	end
	def draw_item(index)
		clear_item(index)
		contents.draw_text(item_rect(index), FONT_HASH[@data[index]], 1)
	end
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# ■ Window_Skins
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
class Window_Skins < Window_OptionTypes
	def variable
		$game_variables[WINDOWSKIN_VARIABLE]
	end
	def refresh
		self.contents.dispose if self.contents != nil
		self.contents = nil if self.contents != nil
		@data = []
		hash = WINDOW_HASH.sort {|a,b| a[0] <=> b[0]}
		hash.each do |key|
			@data << key[0]
			select(key[0] - 1) if key[0] == $game_variables[variable]
		end
		create_contents if item_max > 0 
		draw_all_items if item_max > 0 
	end
	def draw_item(index)
		clear_item(index)
		contents.draw_text(item_rect(index), WINDOW_HASH[@data[index]][1], 1)
	end
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# ■ Window_SaveFile
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
class Window_SaveFile < Window_Base
	alias :refresh_savefile_ace :refresh unless $@
	def refresh
		ace = ACE::CORE
		if @file_exist
			w = @game_variables[ace::WINDOWSKIN_VARIABLE]
			w = ace::DEFAULT_SKIN_VALUE if w == 0 || !ace::WINDOW_HASH.include?(w)
			f = @game_variables[ace::FONT_VARIABLE]
			f = ace::DEFAULT_FONT_VAULE if f == 0 || !ace::FONT_HASH.include?(f)
			window = ace::WINDOW_HASH[w]
			font = ace::FONT_HASH[f]
			change_window_settings(window)
			change_font_settings(font)
		end
		refresh_savefile_ace
	end
end 

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# ■ Window_SystemOptions
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
class Window_SystemOptions < Window_CommandBase
	attr_reader :full_screen_index   
	def initialize(help_window)
		@help_window = help_window
		super(make_item_list, 0, @help_window.height)
		refresh
	end
	def warriors?
		return $ace_script[:ace_warrior_module]
	end
	def window_width;  640; end
	def window_height; 480 - @help_window.height; end
	def make_item_list
		vocab = []; data = []; @help_descriptions = {}
		OPTIONS_COMMANDS.each do |command|
			case command
			when :blank, :volume_bgm, :volume_bgs, :volume_sfx, :windowskin, :default, 
				:return_title, :return_menu, :shutdown, :save_game, :load_game, 
				:battle_bgm, :font_name 
				data << command; vocab << OPTION_DESCRIPTION[command][0]
				@help_descriptions[command] = OPTION_DESCRIPTION[command][3]
			when :full_screen 
				data << command; vocab << OPTION_DESCRIPTION[command][0]
				@help_descriptions[command] = OPTION_DESCRIPTION[command][3]
				@full_screen_index = data.size
			when :bar_style, :bar_opacity, :auto_dash 
				next unless warriors?
				data << command; vocab << OPTION_DESCRIPTION[command][0]
				@help_descriptions[command] = OPTION_DESCRIPTION[command][3]
			else
				process_custom_switch(command, vocab, data)
				process_custom_variable(command, vocab, data)
			end
		end
		return vocab, data
	end
	def process_custom_switch(command, vocab, data)
		return unless CUSTOM_SWITCHES.include?(command)
		data << command; vocab << CUSTOM_SWITCHES[command][1]
		@help_descriptions[command] = CUSTOM_SWITCHES[command][4]
	end
	def process_custom_variable(command, vocab, data)
		return unless CUSTOM_VARIABLES.include?(command)
		data << command; vocab << CUSTOM_VARIABLES[command][1]
		@help_descriptions[command] = CUSTOM_VARIABLES[command][6]
	end
	def draw_item(index)
		item = @data[index]
		rect = item_rect_for_text(index)
		contents.clear_rect(rect)
		contents.font.color = normal_color
		case item
		when :blank
		when :volume_bgm, :volume_bgs, :volume_sfx then draw_volume(item, rect, index)
		when :windowskin, :battle_bgm, :font_name then draw_window(item, rect, index)
		when :bar_style then draw_bar(item, rect, index)
		when :bar_opacity then draw_bar_opacity(item, rect, index)
		when :full_screen, :auto_dash then draw_toggle(item, rect, index)
		when :return_title, :return_menu, :shutdown, :default
			draw_return(item, rect, index)
		when :save_game, :load_game then draw_save(item, rect, index)
		else
			draw_custom_switch(item, rect, index) if CUSTOM_SWITCHES.include?(item)
			draw_custom_variable(item, rect, index) if CUSTOM_VARIABLES.include?(item)
		end
	end
	def draw_volume(item, rect, index)
		dw = rect.width = contents.width/2
		contents.draw_text(rect, @commands[index], 1)
		rate = case item
		when :volume_bgm then $game_system.volume(:bgm)
		when :volume_bgs then $game_system.volume(:bgs)
		when :volume_sfx then $game_system.volume(:sfx)
		end
		colour1 = OPTION_DESCRIPTION[item][1]
		colour2 = OPTION_DESCRIPTION[item][2]
		value = sprintf("%d%%", rate)
		rate *= 0.01
		if warriors?
			draw_gauge(dw, rect.y-14, contents.width-dw-48, rate, colour1, colour2)
			rect.y -= 4; da = 2
		else
			da = 1
		end
		contents.draw_text(dw, rect.y, contents.width-dw-48, line_height, value, da)		
	end
	def draw_window(item, rect, index)
		dw = rect.width = contents.width/2
		contents.draw_text(rect, @commands[index], 1)
		case item
		when :windowskin
			variable = WINDOWSKIN_VARIABLE
			if $game_variables[variable] == 0 
				$game_variables[variable] = DEFAULT[:skin_value]
			end
			text = WINDOW_HASH[$game_variables[variable]][1]
		when :battle_bgm
			variable = MUSIC_VARIABLE
			if $game_variables[variable] == 0 
				$game_variables[variable] = DEFAULT[:music_value]
			end
			text = BATTLE_HASH[$game_variables[variable]][1]
		when :font_name
			variable = FONT_VARIABLE
			if $game_variables[variable] == 0 
				$game_variables[variable] = DEFAULT[:font_value]
			end
			text = FONT_HASH[$game_variables[variable]]
		end
		rect.x = dw
		contents.draw_text(rect, text, 1)
	end
	def draw_bar(item, rect, index)
		dw = rect.width = contents.width/2
		contents.draw_text(rect, @commands[index], 1)
		value = $game_system.bar_style? - 1
		8.times do |i|
			contents.font.color = normal_color
			contents.font.color.alpha = (value == i) ? 255 : 128
			dx = rect.x + dw * (8 + i)/8
			text = (i + 1).to_s
			contents.draw_text(dx, rect.y, dw/4-60, line_height, text, 1)
		end		
	end
	def draw_bar_opacity(item, rect, index)
		dw = rect.width = contents.width/2
		contents.draw_text(rect, @commands[index], 1)
		rate = $game_system.opacity * 100.0 / 255
		colour1 = OPTION_DESCRIPTION[item][1]
		colour2 = OPTION_DESCRIPTION[item][2]
		value = sprintf("%d%%", rate)
		rate *= 0.01
		draw_gauge(dw, rect.y-14, contents.width-dw-48, rate, colour1, colour2)
		rect.y -= 4
		contents.draw_text(dw, rect.y, contents.width-dw-48, line_height, value, 2)	
	end
	def draw_toggle(item, rect, index)
		dw = rect.width = contents.width/2
		contents.draw_text(rect, @commands[index], 1)
		enabled = case item
		when :auto_dash   then $game_system.autodash?
		when :full_screen then $game_system.full_screen?
		end
		contents.font.color = normal_color
		contents.font.color.alpha = enabled ? 128 : 255
		option1 = OPTION_DESCRIPTION[item][1]
		contents.draw_text(dw, rect.y, contents.width/4, line_height, option1, 1)
		dw += contents.width/4
		contents.font.color.alpha = enabled ? 255 : 128
		option2 = OPTION_DESCRIPTION[item][2]
		contents.draw_text(dw, rect.y, contents.width/4, line_height, option2, 1)
	end
	def draw_return(item, rect, index)
		contents.draw_text(rect, @commands[index], 1)		
	end
	def draw_save(item, rect, index)
		enabled = case item
		when :save_game then !$game_system.save_disabled 
		when :load_game then continue_enabled
		end
		contents.font.color.alpha = enabled ? 255 : 128
		contents.draw_text(rect, @commands[index], 1)	
	end
	def draw_custom_switch(item, rect, index)
		dw = rect.width = contents.width/2
		contents.draw_text(rect, @commands[index], 1)
		enabled = $game_switches[CUSTOM_SWITCHES[item][0]]
		contents.font.color = normal_color
		contents.font.color.alpha = enabled ? 128 : 255
		option1 = CUSTOM_SWITCHES[item][2]
		contents.draw_text(dw, rect.y, contents.width/4, line_height, option1, 1)
		dw += contents.width/4
		contents.font.color.alpha = enabled ? 255 : 128
		option2 = CUSTOM_SWITCHES[item][3]
		contents.draw_text(dw, rect.y, contents.width/4, line_height, option2, 1)
	end
	def draw_custom_variable(item, rect, index)
		dw = rect.width = contents.width/2
		contents.draw_text(rect, @commands[index], 1)
		value = $game_variables[CUSTOM_VARIABLES[item][0]]
		colour1 = CUSTOM_VARIABLES[item][2]
		colour2 = CUSTOM_VARIABLES[item][3]
		minimum = CUSTOM_VARIABLES[item][4]
		maximum = CUSTOM_VARIABLES[item][5]
		rate = (value - minimum).to_f / [(maximum - minimum).to_f, 0.01].max
		if warriors?
			draw_gauge(dw, rect.y-14, contents.width-dw-48, rate, colour1, colour2)
			rect.y -= 4; da = 2
		else
			da = 1
		end
		contents.draw_text(dw, rect.y, contents.width-dw-48, line_height, value.to_s, da)	
	end
	def continue_enabled
		ACE::DataManager.save_file_exists?
	end	
	def description 
		@help_descriptions[method]
	end
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# ■ Ask_Battle_Command
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
class Ask_for_Default < Window_Selectable
	attr_reader :commands
	def initialize
		@commands = ['Yes', 'No']
		super(0, 0, @dw = 332, @commands.size * 32 + 80)
		self.contents = Bitmap.new(width - 32, spacing(item_max) - 6)
		refresh
		select(0)
		self.z = 9999
	end
	def refresh
		contents.clear
		draw_question
		item_max.times {|i| draw_item(i)}
	end
	def draw_question
		text = "Would You Like Restore Settings?"
		contents.draw_text(0, 0, @dw-32, 32, text, 1)
	end
	def spacing(i); i * line_height + 48; end
	def item_max;  @commands.size;        end
	def draw_item(index)
		clear_item(index)
		contents.draw_text(item_rect(index), @commands[index], 1)
	end
	def item_rect(index)
		return rect = Rect.new(0, spacing(index), self.width - 32, 32)
	end
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# ■ Scene_End
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
class Scene_End < Scene_MenuBase
	include ACE::CORE
	def start
		super
		@fullscreen = $game_system.full_screen?
		$game_temp.option_index = true
		create_help_window
		create_option_window
		create_windows
		create_question_window
		create_wait_window
	end
	def create_menu_layout
		super
		return if OPTION_CONFIG[:layout].empty?
		@menulay.bitmap = RPG::Cache.menu("Background/#{OPTION_CONFIG[:layout]}")
	end
	def create_help_window
		@help_window = Window_OptionHelp.new
	end
	def create_option_window
		@options_window = Window_SystemOptions.new(@help_window)
	end
	def create_windows
		@skins_window = Window_Skins.new
		@font_window = Window_Font.new
		@music_window = Window_BattleMusic.new		
	end
	def create_question_window
		@window_question = Ask_for_Default.new
		@window_question.y = 98
		@window_question.x = 320 - @window_question.width / 2
		@window_question.z = 9999
		@window_question.deactivate.hide
	end
	def create_wait_window
		@a = 0
		@wait_window = Window_Base.new(220, 190, 200, 100)
		@wait_window.contents = Bitmap.new(168, 68)
		@wait_window.contents.draw_text(0, 16, 168, 32, 'Please wait.', 1)
		@wait_window.hide; @wait_window.z = 999
	end
	def background_image 
		OPTION_CONFIG[:background]
	end
	def update
		super
		if @options_window.active;  update_system_window
		elsif @skins_window.active; update_skins_window
		elsif @font_window.active;  update_font_window 
		elsif @music_window.active; update_music_window
		elsif @window_question.active; update_question
		else update_wait			
		end
	end
	def update_system_window
		@wait_window.hide
		if $game_system.full_screen? != @fullscreen
			@options_window.draw_item(@options_window.full_screen_index)
			@fullscreen = $game_system.full_screen?
		end
		options_input_c if Input.trigger?(Input::C)
		options_input_b if Input.trigger?(Input::B)
		restore_default if Input.trigger?(Input::SHIFT && Input::CTRL)
		cursor_left (Input.trigger?(Input::LEFT))  if Input.repeat?(Input::LEFT) 
		cursor_right(Input.trigger?(Input::RIGHT)) if Input.repeat?(Input::RIGHT)
	end	
	def options_input_c
		case @options_window.method
		when :windowskin
			Sound.play_se(:decision)
			@options_window.deactivate
			@skins_window.activate.show
		when :battle_bgm 
			Sound.play_se(:decision)
			@options_window.deactivate
			@music_window.activate.show
		when :font_name
			Sound.play_se(:decision)
			@options_window.deactivate	
			@font_window.activate.show
		when :save_game then command_save
		when :load_game then command_load
		when :return_title then command_to_title
		when :shutdown then command_shutdown
		when :default then command_default	
		when :return_menu then command_cancel
		end
	end
	def options_input_b
		Sound.play_se(:cancel)
		command_cancel		
	end
	def cursor_right(wrap = false); cursor_change(Input::RIGHT); end
	def cursor_left(wrap = false);  cursor_change(Input::LEFT);  end
	def cursor_change(direction)
		case @options_window.method
		when :volume_bgm, :volume_bgs, :volume_sfx then change_volume(direction)
		when :bar_opacity then change_opacity(direction)
		when :bar_style then change_bar_style(direction)
		when :full_screen, :auto_dash then change_toggle(direction)
		else
			change_custom_switch(direction)
			change_custom_variables(direction)
		end
	end
	def change_volume(direction)
		value = direction == Input::LEFT ? -1 : 1
		value *= 10 if Input.press?(Input::SHIFT)
		case @options_window.method
		when :volume_bgm
			$game_system.volume_change(:bgm, value)
			$game_system.bgm_play($game_system.bgm_memorize)
		when :volume_bgs
			$game_system.volume_change(:bgs, value)
			$game_system.bgs_play($game_system.bgs_memorize)
		when :volume_sfx  then $game_system.volume_change(:sfx, value)
		end
		Sound.play_se(:cursor)
		@options_window.draw_item(@options_window.index)
	end
	def change_opacity(direction)
		Sound.play_se(:cursor)
		value = direction == Input::LEFT ? -1 : 1
		value *= 25.5 if Input.press?(Input::SHIFT)
		$game_system.opacity_change(value)
		@options_window.refresh
		@options_window.draw_item(@options_window.index)		
	end
	def change_bar_style(direction)
		Sound.play_se(:cursor)
		value = direction == Input::LEFT ? -1 : 1
		$game_system.set_bar_style(value)
		@options_window.refresh
		@options_window.draw_item(@options_window.index)
	end
	def change_toggle(direction)
		value = direction == Input::LEFT ? false : true
		case @options_window.method
		when :full_screen
			current_case = $game_system.full_screen?
			$game_system.set_full_screen(value)
			return if value == current_case
			ACE::DataManager.full_screen	
			@options_window.deactivate
		when :auto_dash
			current_case = $game_system.autodash?
			$game_system.set_autodash(value)
		end
		Sound.play_se(:cursor) if value != current_case
		@options_window.draw_item(@options_window.index)
	end
	def change_custom_switch(direction) 
		return unless CUSTOM_SWITCHES.include?(@options_window.method)
		value = direction == Input::LEFT ? false : true
		ext = @options_window.method
		current_case = $game_switches[CUSTOM_SWITCHES[ext][0]]
		$game_switches[CUSTOM_SWITCHES[ext][0]] = value
		Sound.play_se(:cursor) if value != current_case
		@options_window.draw_item(@options_window.index)
	end
	def change_custom_variables(direction)
		return unless CUSTOM_VARIABLES.include?(@options_window.method)
		Sound.play_se(:cursor)
		value = direction == Input::LEFT ? -1 : 1
		value *= 10 if Input.press?(Input::SHIFT)
		ext = @options_window.method
		var = $game_variables[CUSTOM_VARIABLES[ext][0]]
		minimum = CUSTOM_VARIABLES[ext][4]
		maximum = CUSTOM_VARIABLES[ext][5]
		$game_variables[var] += value
		$game_variables[var] = [[$game_variables[var], minimum].max, maximum].min
		@options_window.draw_item(@options_window.index)
	end
	def update_skins_window
		update_skins
		select_skins if Input.trigger?(Input::C)
		cancel_skins if Input.trigger?(Input::B)
	end	
	def select_skins
		Sound.play_se(:decision)
		@skins_window.deactivate.hide
		@options_window.activate		
	end
	def cancel_skins
		Sound.play_se(:cancel)
		@skins_window.deactivate.hide
		@options_window.activate	
	end
	def update_skins
		return if @last_index == @skins_window.index
		@last_index = @skins_window.index
		$game_variables[WINDOWSKIN_VARIABLE] = @last_index + 1
		@options_window.update_windowskin
		@options_window.refresh
		@help_window.update_windowskin
		@help_window.set_text("")
		@options_window.update_help
		@skins_window.update_windowskin
		@skins_window.refresh
		@skins_window.back_opacity = 255
		@options_window.refresh
		@options_window.draw_item(@options_window.index)		
	end
	def update_font_window 
		update_fonts
		select_font if Input.trigger?(Input::B)
		cancel_font if Input.trigger?(Input::C)
	end	
	def select_font
		Sound.play_se(:decision)
		@font_window.deactivate.hide
		@options_window.activate		
	end
	def cancel_font 
		Sound.play_se(:cancel)
		@font_window.deactivate.hide
		@options_window.activate		
	end
	def update_fonts
		return if @last_index == @font_window.index
		@last_index = @font_window.index
		$game_variables[FONT_VARIABLE] = @last_index + 1
		@options_window.update_font
		@options_window.refresh
		@font_window.update_font
		@font_window.refresh
		@font_window.back_opacity = 255
		@options_window.refresh
		@options_window.draw_item(@options_window.index)		
	end
	def update_music_window
		update_songs
		select_music if Input.trigger?(Input::B)
		cancel_music if Input.trigger?(Input::C)
	end
	def select_music 
		Sound.play_se(:cancel)
		@music_window.deactivate.hide
		@options_window.activate
		$game_system.bgm_play($game_system.bgm_memorize)		
	end
	def cancel_music 
		Sound.play_se(:decision)
		@music_window.deactivate.hide
		@options_window.activate
		$data_system.battle_bgm.name = BATTLE_HASH[@music_window.index]
	end	
	def update_songs
		return if @last_index == @music_window.index
		@last_index = @music_window.index
		$game_variables[MUSIC_VARIABLE] = @last_index + 1
		@music_window.refresh
		@music_window.back_opacity = 255
		@options_window.draw_item(@options_window.index)	
	end
	def command_default
		@options_window.deactivate
		@window_question.activate.show
	end
	def update_question
		open_question if Input.trigger?(Input::C)
		exit_question if Input.trigger?(Input::B)
	end
	def open_question
		case @window_question.index
		when 0 then restore_default
		when 1 then Sound.play_se(:cancel); exit_question
		end
	end
	def restore_default
		ACE::DataManager.full_screen if $game_system.fullscreen
		if $ace_script[:ace_title_screen]
			$game_system.fullscreen = TITLE_CONFIG[:full_screen]
		else $game_system.fullscreen = DEFAULT[:full_screen]
		end
		$game_system.autodash = DEFAULT[:autodash]
		$game_system.bar_style = DEFAULT[:bar_style]
		$game_system.opacity_change(255)
		$game_system.volume_change(:bgm, 100)
		$game_system.bgm_play($game_system.bgm_memorize)
		$game_system.volume_change(:bgs, 100)
		$game_system.bgs_play($game_system.bgs_memorize)
		$game_system.volume_change(:sfx, 100)
		@options_window.change_font_settings(FONT_HASH[DEFAULT[:font_value]])
		$game_variables[FONT_VARIABLE] = DEFAULT[:font_value]
		@options_window.change_window_settings(WINDOW_HASH[DEFAULT[:skin_value]])
		$game_variables[WINDOWSKIN_VARIABLE] = DEFAULT[:skin_value]
		$data_system.battle_bgm.name = BATTLE_HASH[DEFAULT[:music_value]]
		$game_variables[MUSIC_VARIABLE] = DEFAULT[:music_value]
		@options_window.refresh
		exit_question
	end
	def exit_question
		@window_question.deactivate.hide.select(0)
		@options_window.activate
	end
	def update_wait
		@wait_window.show
		@a += 1
		return unless @a == 100
		@a = 0
		@options_window.activate
	end
	def command_save
		if !$game_system.save_disabled
			Sound.play_se(:decision)
			$return_option_save = true
			$scene = Scene_Save.new
		else Sound.play_se(:buzzer)
		end
	end
	def command_load
		if @options_window.continue_enabled
			Sound.play_se(:decision)
			$scene = Scene_Load.new
		else Sound.play_se(:buzzer)
		end 
	end
	def command_to_title
		fadeout_all(800)
		$scene = Scene_Title.new
	end
	def command_shutdown
		fadeout_all(800)
		$scene = nil
	end
	def command_cancel
		Sound.play_se(:cancel)
		$game_temp.option_index = nil
		if $ace_script[:ace_main_menu]
			return unless $game_temp.menu_command_index.has_key?(:system)
			$scene = Scene_Menu.new($game_temp.menu_command_index[:system])
		else
			$scene = Scene_Menu.new(OPTION_CONFIG[:menu_index])
		end
	end
end

if !$ace_script[:ace_save_system]
	#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
	# ■ Scene_File
	#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
	class Scene_Save < Scene_File
		alias :ace_on_decision :on_decision unless $@
		alias :ace_on_cancel :on_cancel     unless $@
		def on_decision(filename)
			ace_on_decision(filename)
			return_scene
		end
		def on_cancel
			ace_on_cancel
			return_scene
		end
		def return_scene
			if $game_temp.save_calling && $game_temp.option_index.nil?
				$game_temp.save_calling = false
				$scene = Scene_Map.new
			elsif $ace_script[:ace_main_menu] && $game_temp.option_index.nil?
				return unless $game_temp.menu_command_index.has_key?(:save)
				$scene = Scene_Menu.new($game_temp.menu_command_index[:save])
			else $scene = Scene_End.new
			end
		end
	end
	class Scene_Load < Scene_File
		alias :ace_on_cancel :on_cancel unless $@
		def on_cancel
			ace_on_cancel
			if $game_temp.option_index.nil?
				$scene = Scene_Title.new
			else
				$scene = Scene_End.new
			end
		end
	end
end
=end