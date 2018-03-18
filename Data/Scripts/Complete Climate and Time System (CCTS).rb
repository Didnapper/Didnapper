=begin
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:
# Complete Climate and Time System (CCTS)
# Author: ForeverZer0
# Version: 1.2.3
# Date: 2.10.2011
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:
#                             VERSION HISTORY
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:
# v.1.0   5.12.2010
#   - Original Release
# v.1.1   5.26.2010
#   - Added an attr_reader I mistakenly placed in the debugger that would make
#     the debugger a requirement for the script to work.
#   - Added some commands for message text to display the time, day, month, etc.
# v.1.2   10.10.10
#   - Added the "Good Weather Switch" by popular demand.
#   - Added ability to have game variables set to the current time values.
#   - Fixed bug so that the map refreshes properly when switches change.
#   - Fixed it so that window returns when scene changes and returns.
#   - Cleaned up overall code and added comments to help follow the main flow
#     of the script and understand it better.
#   - Changed the debug. No longer just prints to the standard output, but now
#     displays all the same info on-screen in real-time as it occurs.
#   - Built the Missing Climate Logger into the script. Will create a text file
#     in the directory listing any errors every time the game is play-tested.
#   - Added configurable format for how time is displayed.
#   - Added configuration for the look of the clock's windowskin
#   - Added Analog Clock spriteset.
#   - Consolidated the scripts into one.
# v.1.2.1  10.12.10
#   - Fixed a syntax error (Thanks rim1000 for pointing out)
# v.1.2.2  10.16.10
#   - Actually fixed the bug I should have fixed in 1.2.1
#   - Altered 'calculate_time' method, which would not allow the switches to 
#     refresh correctly until the next game hour passed. Switches will not
#     update each game minute as they were intended to.
# v.1.2.3  2.25.11
#   - Added configuration for setting bold and italic in the clock.
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:
#
# Introduction:
#
#   This script will give you TOTAL control of weather and time in your game. It
#   will allow you to set up different climates that use different weather
#   patterns, tints, sounds, and effects. It is also a complete Time System that
#   gives you full control of, and keeps track of, time, with every possible
#   configuration at your disposal. Note this script comes with a preset config
#   that will be suitable for most's needs, but it can be configured to the most
#   extreme level if so desired, which will require more work. It is not
#   neccessary to do this, but the ability is there.
#
# Features:
#
#   - Automatic weather control with defined types, frequency, probabilities,
#     tints, and sounds for any and every map in your game.
#   - Weather tint and BGS will fade in/out smoothly with the weather for a very
#     realistic feel
#   - Configurable screen tints for every climate, month, and hour that will
#     smoothly transition over the course of each hour, not transition to day
#     or night in matter of seconds.
#   - Completely configurable calendar system that can use custom names for days
#     and months, custom month lengths, etc.
#   - Can easily use configurable switches and variables for event conditions
#     based off the hour of the day, the season of the year, or the current
#     weather.
#   - Comes with a clock that can be toggled on/off by the player, with custom
#     location, opacity, and font name/size options.
#   - Also have option to use an analog clock.
#   - Complete control to freeze the time, screen tone, weather, or time speed,
#     seperately or together, with simple script calls.
#   - Comes with error checking and a debugger for easily testing your own
#     customization, and to help understand the system.
#   - Short, simple script calls for easy manipulation
#   - Compatible with Zero Advanced Weather and MAWS (v.1.2 or higher)
#
# Instructions:
# 
#   All instructions for configuration are explained below in each section.
#
#   ------------------------------------------------------------------------
#
#   Script Calls:
#
# * time.freeze(true/false)
#     - Will freeze/unfreeze time, tone, and weather.
#
# * time.tone_freeze(true/false)
#     - Will freeze/unfreeze the screen tone from updating automatically. Use
#       before you would like to set a custom screen tone, otherwise the system
#       will override it.
#
# * time.weather_freeze(true/false)
#     - Will freeze/unfreeze the weather from updating. Freeze if you would like
#       to manually set the weather and do not want the system to override it.
#
# * time.speed_freeze(true/false)
#     - Will keep the time speed set at a specific rate, and not change per each
#       map as the system usually does.
#
# * time.change_speed(SPEED)
#     - Will set the time speed to SPEED. Use time.speed_freeze if you would
#       would like to keep it there indefinitely
#
# * time.set(m, h, d, m, y)
#     - Sets the time to time defined in (minute, hour, day, month, year)
#       This will also allow you to 'go back' in time.
#
# * time.advance_minute(NUMBER)
#     - Advances minute by NUMBER
#
# * time.advance_hour(NUMBER)
#     - Advances hour by NUMBER
#
# * time.advance_day(NUMBER)
#     - Advances day by NUMBER
#
# * time.advance_month(NUMBER)
#     - Advances month by NUMBER
#
# * time.advance_year(NUMBER)
#     - Advances year by NUMBER
#
# * time.memorize(INDEX)
#     - Memorizes the current time to an array at INDEX. The INDEX can be any
#       integer you like, it is used to reference later if the time is restored.
#       This will allow for you to memorize as many 'times' as you need. Using
#       an existing INDEX will over-write the old one.
#
# * time.restore(INDEX)
#     - Sets the time to memorized time at INDEX. Does nothing if INDEX does not
#       exist. Obviously, you must have a memorized time before using.
#
# * time.clock(true/false)
#     - Enables/Disables player from toggling clock. Will dispose the clock
#       if disabled when clock is showing.
#
# * time.simple_clock(true/false)
#     - By default, the clock displays the time, day, and date. If this is true,
#       the clock will only display the time, nothing else.
#
# * time.analog_clock(true/false)
#     - Sets Analog Clock flag ON/OFF. If true, analog clock will be used,
#
# * time.clock_face(x, y, opacity, fontname, fontsize, bold, italic)
#     - Changes the clock settings to defined values. Can be called with any 
#       number of arguments that you would like to change.
#
# * time.analog_face(filename, handoffset, x, y, opacity)
#     - Changes the settings for the analog clock. Can be called with any number
#       of arguments that you would like to change. (see note below for analog)
#
# * time.show_clock
#     - Forcibly toggles the clock ON. Used for showing the clock when it is
#       unknown if the player will have it ON or OFF at that time. The clock must
#       be enabled for this method to work. (Only during Scene_Map)
#
# * time.change_climate(MAP_ID, CLIMATE_ID)
#     - Will permanently change map with MAP_ID from its current climate to the
#       the one defined by CLIMATE_ID. Will not have an immediate effect on the
#       current map, but will be applied next time the player returns.
#
# * CCTS.debug
#     - Toggles the debug sprite ON/OFF. Shows almost every relevant variable
#       associated with the system and how it changes in real-time. See bottom
#       of script (around line 1500) for more information.
#
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:
#                         BEGIN CONFIGURATION
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:

  #    ** Script Generated at 08.04.2012 21:17:45.

module CCTS

  # The names for your days. Use as many as you want. 
  DAYS = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 
          'Saturday']

  # The name for your months. Use as many as you want. 
  MONTHS = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 
            'August', 'September', 'October', 'November', 'December']

  # How many days in a month? (Per each index above)
  MONTH_LENGTH = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

  # Set up as follows: [Minute, Hour, Day, Month, Year]
  START_DATE = [30, 6, 4, 3, 711]

  # Button used to toggle clock ON/OFF (if enabled). This is the game button, 
  # not just the key on your keyboard.
  CLOCK_BUTTON = Input::Z

  # Default settings for the clock. 
  # Set up using this pattern. [X, Y, OPACITY, FONTNAME, FONTSIZE, BOLD, ITALIC]
  # All can be changed in-game with a script call at any time.
  CLOCK_FACE = [0, 0, 160, 'MS PGothic', 14, false, false]

  # Default settings for the analog clock.
  # Set up using this pattern: ['FILENAME', HAND_OFFSET, X, Y, OPACITY]
  # Can be changed at any time during the game with a script call.
  ANALOG_FACE = ['', 0, 0, 0, 0]

  # Set the skin for the clock (normal). Configure like one of the following:
  #   Set to nil to not use a skin
  #   Set to 'DEFAULT SKIN' to use whatever the player is using.
  #   Set to 'FILENAME' of the skin. Must be in Windowskins folder of game.
  CLOCK_SKIN = '001-Blue01dark'

  # If true, the analog clock will be used by default. Can be changed later.
  ANALOG_CLOCK = false

  # Configure how the time will be displayed. Ignore this if you are unsure of
  # how to set this up. Look up "sprintf Format" in the Help File of the game to
  # learn more of how it works.
  TIME_FORMAT = '%2d:%02d'

  # The minimun/maximum number of seconds before the system re-calculates what
  # weather pattern will be used. The number will be randomly selected from
  # within the defined range.
  WEATHER_WAIT = [20, 30]

  # This variable will be always be equal to the weather type. Lets you create
  # event conditions based off the weather. (must be raining to do this, etc...)
  # If using Zer0 Advanced Weather, just set to same as "Weather_Type_Variable"
  WEATHER_VARIABLE = 406

  # This switch will only be ON during "bad" weather effects (below). Used for
  # event conditions. (Villagers go inside if it is raining, storming, etc...)
  # If using Zer0 Advanced Weather, just set to same as "Adverse_Weather_Switch"
  BAD_WEATHER_SWITCH = 504
  # This switch will always be the opposite of the BAD_WEATHER_SWITCH.
  GOOD_WEATHER_SWITCH = 503

  # Include all "bad" weather types in this array. The above switch will only
  # be on when one of them is occurring
  # Same as from Zer0 Advanced Weather, if using.
  BAD_WEATHER_TYPES = [1, 2, 4, 5, 9, 22]

  # This variable will be set by the "season" of the year. This can also be used
  # as a condition in events.
  SEASON_VARIABLE = 407
  # 0 = Summer
  # 1 = Autumn
  # 2 = Winter
  # 3 = Spring
  # Define the months for each season.
  SEASON_MONTHS = [ [5, 6, 7],   # Summer
                    [8, 9, 10],   # Autumn
                    [0, 1, 11],   # Winter
                    [2, 3, 4]]   # Spring

  # These switches will be used as conditions for events, etc. They will only
  # be ON during the hours defined below.
  DAY_SWITCH = 501
  NIGHT_SWITCH = 502

  # Define the hours that are considered "Day" and "Night". The respective 
  # switch above will be ON/OFF depending on the hour of the day. 
  DAY_START_HOUR = 7
  NIGHT_START_HOUR = 21

  # IDs of variables that will be equal to their named value. They can be used 
  # for eventing, etc. Set any to nil that you do not want to use.
  MINUTE_VARIABLE = 401
  HOUR_VARIABLE = 402
  DAY_VARIABLE = 403
  MONTH_VARIABLE = 404
  YEAR_VARIABLE = 405

  # If true, and $DEBUG, a text file will be created each load in the games
  # directory that lists maps that do not have a climate defined, or those that
  # are defined more than once. 
  WRITE_MISSING_DATA = 

  #-----------------------------------------------------------------------------
  # Weather Tints
  #   Set the tint influence for each weather type. These are NOT the values 
  #   the screen tint will be, rather they are the amount applied to whatever
  #   the current screen tint already is. They will transition in/out at the 
  #   same rate of the weather transition. 
  #-----------------------------------------------------------------------------
  def self.weather_tint(type)
    case type
  # when WEATHER_TYPE then return [RED, GREEN, BLUE, GRAY] 
    when 1, 4  # Rain
      return [-20, -20, -15, 10]
    when 2, 5, 9  # Storm
      return [-30, -30, -20, 15]
    when 3, 16  # Snow
      return [-15, -15, -15, 20]
    end
    return [0, 0, 0, 0]
  end
  #-----------------------------------------------------------------------------
  # Weather BGS
  #   Define the BGS used for each weather type. They BGS will fade in/out at
  #   the same rate of the weather's transition. Volume will be 50% for maps
  #   that do not have weather, but still have weather sound.
  #-----------------------------------------------------------------------------
  def self.weather_BGS(type)
    case type
  # when WEATHER_TYPE then return ['FILENAME', VOLUME, PITCH]
    when 1  # Rain
      return ['005-Rain01', 80, 100]
    when 2  # Heavy Rain
      return ['006-Rain02', 80, 100]
    when 3  # Snow
      return ['001-Wind01', 80, 100]
    when 4  # Hail
      return ['005-Rain01', 60, 75]
    when 5, 9  # Thunder Storm
      return ['007-Rain03', 80, 100]
    when 7  # Blowing Leaves
      return ['003-Wind03', 80, 100]
    when 8, 16  # Swirling Leaves
      return ['004-Wind04', 80, 100]
    when 22  # Falling Rocks
      return ['015-Quake01', 100, 125]
    end
  end
  #-----------------------------------------------------------------------------
  # Weather Probability
  #   Define the weather probabilities for each climate. The climate ID and the
  #   month are passed as arguments for branching. This will allow you to make
  #   it snow in the winter, storm in the summer, etc.
  #
  #   Set up like this:
  #
  #   case climate_id
  #   when CLIMATE_ID
  #     case month
  #     when MONTH then return [[TYPE, PROB], [TYPE, PROB], [TYPE, PROB], etc]
  #
  #   If you are using Zer0 Advanced Weather or MAWS (v.1.2 or >) where the 
  #   "variation" is used, just add the variation value into the respective
  #   array, like this:
  #                     [TYPE, PROBABILITY, VARIATION]
  #
  #   You need not define a probability for 0, or no weather. It is the default
  #   value used for undefined weather and when the weather probability is not
  #   high enough when the system calculates it.
  #
  #   The actual weather will be chosen randomly from all types that have a
  #   probability above the randomly chosen 'chance' at each weather update.
  #-----------------------------------------------------------------------------
  def self.weather_prob(climate_id, month)
    case climate_id
    when 0  # Outdoor
      case month
      when 1, 2, 12
        return [[3, 17], [16, 12]]
      when 3, 4, 5
        return [[1, 30], [2, 25], [9, 25]]
      when 6, 8
        return [[1, 20], [9, 20], [2, 10]]
      when 7
        return [[1, 20], [9, 20], [2, 10],]
      when 9, 10, 11
        return [[1, 15], [9, 10], [6, 25] [7, 25], [8, 25]]
      end
    when 1  # Indoor
      case month
      when 1, 2, 12
        return [[3, 17], [16, 12]]
      when 3, 4, 5
        return [[1, 30], [2, 25], [9, 25]]
      when 6, 7, 8
        return [[1, 20], [9, 20], [2, 10]]
      when 9, 10, 11
        return [[1, 15], [9, 10], [6, 25] [7, 25], [8, 25]]
      end
    when 2  # Snow
      return [[3, 80], [16, 50]]
    when 3  # Desert
      return [[1, 5]]
    end
  end
  #-----------------------------------------------------------------------------
  # Hourly Tints
  #   Define the target tints for each hour of the day, for each climate.
  #   The month, hour, and climate_id are all passed as arguments so you can
  #   create as in-depth of a configuration as you like. Just create branches
  #   within branches using the climate, month, and hour as conditions to define
  #   the desired screen tone. There will be no tint (0, 0, 0, 0) for anything
  #   left undefined. (see presets below for examples)
  #
  #   Setup: [RED, GREEN, BLUE, GRAY]
  #-----------------------------------------------------------------------------
  def self.time_tint(climate_id, hour, month)
    case climate_id
    #-------------------------------------------------------------------
    when 0  # Outdoor
      case month
      when 1, 2, 12
        case hour
        when 0, 1, 2, 3, 4, 5, 6, 19, 20, 21, 22, 23
          return [-100, -100, -20, 15]
        when 7
          return [-15, -15, -25, 10]
        when 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18
          return [-10, -10, -10, 10]
        end
      when 3, 4, 5
        case hour
        when 0, 1, 2, 3, 4, 5, 20, 21, 22, 23
          return [-100, -100, -20, 10]
        when 6
          return [-5, -5, -20, 0]
        when 18
          return [0, 0, -15, 5]
        when 19
          return [-15, -15, -30, 10]
        end
      when 6, 7, 8
        case hour
        when 0, 1, 2, 3, 4, 5, 20, 21, 22, 23
          return [-100, -100, -20, 15]
        when 6
          return [10, 10, -10, 0]
        when 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
          return [5, 5, -5, 0]
        when 18
          return [-25, -25, -10, 5]
        when 19
          return [-50, -50, -15, 10]
        end
      when 9, 10, 11
        case hour
        when 0, 1, 2, 3, 4, 5, 20, 21, 22, 23
          return [-100, -100, -20, 10]
        when 6
          return [10, 5, -10, 10]
        when 18
          return [5, 5, -20, 0]
        when 19
          return [-5, -5, -25, 10] 
        end
      end
    #-------------------------------------------------------------------
    when 0  # Snow
      case month
      when 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
        case hour
        when 0, 1, 2, 3, 4, 5, 6, 19, 20, 21, 22, 23
          return [-100, -100, -20, 15]
        when 7
          return [-15, -15, -25, 10]
        when 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18
          return [-10, -10, -10, 10]
        end
      end
    #-------------------------------------------------------------------
    when 0  # Desert
      case month
      when 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
        case hour
        when 0, 1, 2, 3, 4, 5, 20, 21, 22, 23
          return [-100, -100, -20, 15]
        when 6
          return [10, 10, -10, 0]
        when 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
          return [5, 5, -5, 0]
        when 18
          return [-25, -25, -10, 5]
        when 19
          return [-50, -50, -15, 10]
        end
      end
    #-------------------------------------------------------------------
    when 0  # Underground
      case month
      when 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
        case hour
        when 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23
          return [-20, -20, -20, 0]
        end
      end
    #-------------------------------------------------------------------
    end
    # Default return value for undefined time/climate (Don't edit)
    return [0, 0, 0, 0]
  end
end

  #-----------------------------------------------------------------------------

class Climate

  attr_accessor :maps

  def initialize
    @climate = []
  #-----------------------------------------------------------------------------
  # Initialize New Climates
  #   Simply follow the same pattern for each new climate you create.
  #-----------------------------------------------------------------------------
    @climate[0] = Game_Climate.new(0)
    @climate[1] = Game_Climate.new(1)
    @climate[2] = Game_Climate.new(2)
    @climate[3] = Game_Climate.new(3)
    @climate[4] = Game_Climate.new(4)
  #-----------------------------------------------------------------------------
  # Climate Names
  #   Create names for the different climates.
  #-----------------------------------------------------------------------------
    @climate[0].name = 'Outdoor'
    @climate[1].name = 'Indoor'
    @climate[2].name = 'Snow'
    @climate[3].name = 'Desert'
    @climate[4].name = 'Underground'
  #-----------------------------------------------------------------------------
  # Weather for this Climate?
  #   If false, no weather will be shown for climate, although weather sound and
  #   tinting can still be used if desired.
  #-----------------------------------------------------------------------------
    @climate[0].weather = true
    @climate[1].weather = false
    @climate[2].weather = true
    @climate[3].weather = true
    @climate[4].weather = false
  #-----------------------------------------------------------------------------
  # Weather Tinting?
  #   If true, different weather patterns will influence the screen tint
  #-----------------------------------------------------------------------------
    @climate[0].tinting = true
    @climate[1].tinting = false
    @climate[2].tinting = true
    @climate[3].tinting = true
    @climate[4].tinting = true
  #-----------------------------------------------------------------------------
  # Weather Sound?
  #   If true, weather BGS will be played automatically for that climate
  #-----------------------------------------------------------------------------
    @climate[0].sound = true
    @climate[1].sound = true
    @climate[2].sound = true
    @climate[3].sound = true
    @climate[4].sound = false
  #-----------------------------------------------------------------------------
  # Time Speed
  #   This will be the default time speed used for the climate. It can be 
  #   overridden with script calls in-game if needed. "1" is real-time, and 
  #   any other number is multiples of real-time, so "5" is 5 times as fast as
  #   the real world. (unless you live in a videogame)
  #-----------------------------------------------------------------------------
    @climate[0].speed = 8
    @climate[1].speed = 10
    @climate[2].speed = 8
    @climate[3].speed = 8
    @climate[4].speed = 15
  #-----------------------------------------------------------------------------
  # Maps for each climate
  # Include IDs of maps that use each respective climate. 
  #-----------------------------------------------------------------------------
    @climate[0].maps = [14, 23, 24, 34, 36, 40, 41, 43, 50, 52, 54, 55, 61, 64, 82, 84, 85, 96, 111, 125, 138, 139]
    @climate[1].maps = [35, 39, 44, 45, 46, 48, 49, 51, 53, 58, 59, 60, 62, 63, 66, 70, 89, 97, 98, 107, 114, 118, 120, 123, 142]
    @climate[2].maps = [99, 136]
    @climate[3].maps = [65, 83, 124]
    @climate[4].maps = [37, 38, 42, 67, 68, 69, 71, 73, 74, 75, 76, 77, 78, 79, 80, 81, 88, 94, 95, 122, 137]
  #-----------------------------------------------------------------------------
  end
#-------------------------------------------------------------------------------
  def map_climate(map_id)
    @climate.each {|climate| return climate if climate.maps.include?(map_id)}
    # Returns a dummy climate with empty settings if not defined.
    return Game_Climate.new(-1, 'DUMMY', false, false, false, 5, []) 
  end
end

#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:
#                           END CONFIGURATION 
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:



#            **   EDIT BELOW THIS POINT AT YOUR OWN RISK   ** 

#===============================================================================
# ** Time_System
#===============================================================================

  $ccts = 1.23
  # Variable plug-in. Used so CCTS can be recognized by other scripts.

class Time_System
  
  attr_reader :minute, :hour, :day, :month, :year, :speed_frozen
    
  def initialize
    # Initialize instance variables used in the system.
    @frame_count, @speed, @memory = 0, 1, []
    # Set time variables to configured start values.
    @minute, @hour = CCTS::START_DATE[0], CCTS::START_DATE[1]
    @day, @month = CCTS::START_DATE[2], CCTS::START_DATE[3]
    @year = CCTS::START_DATE[4]
    # Initialize the "frozen" flags.
    @frozen = @speed_frozen = false
    # Check for any errors in the configuration.
    error_check
    # Evaluate and set a variable to the correct count length.
    @count = count_length
  end
#-------------------------------------------------------------------------------    
  def count_length
    return ((Graphics.frame_rate.to_f / @speed) * 60).round
  end
#------------------------------------------------------------------------------- 
  def change_speed(speed)
    # End method if the speed is frozen and attempting to be modified.
    return if @speed_frozen
    # Reset speed variable and reset the count length.
    @speed = speed
    @count = count_length
    # Check for errors and recalibrate the tint rates based on the new speed.
    error_check
    $game_screen.tone_calibrate
  end
#-------------------------------------------------------------------------------  
  def current_time
    # Returns an array of the current time.
    return [@minute, @hour, @day, @month, @year]
  end
#-------------------------------------------------------------------------------  
  def freeze(value = true)
    # Freeze/Unfreeze the time, tone, and weather all in shot.
    @frozen = $game_screen.tone_frozen = $game_screen.weather_frozen = value
    $game_screen.tone_calibrate
    return true
  end
#-------------------------------------------------------------------------------
  def tone_freeze(value = true)
    # Freeze/Unfreeze the tone by itself.
    $game_screen.tone_frozen = value
    $game_screen.tone_calibrate
    return true
  end
#-------------------------------------------------------------------------------  
  def weather_freeze(value = true)
    # Freezes the weather from automatically changing.
    $game_screen.weather_frozen = value
    $game_screen.tone_calibrate
    return true
  end
#-------------------------------------------------------------------------------  
  def speed_freeze(value = true)
    # Freeze the speed from being modified automatically.
    @speed_frozen = value
    return true
  end
#-------------------------------------------------------------------------------  
  def clock(value = true)
    # Flag to let the system know if the clock should be drawn or not.
    $game_system.clock = value
    return true
  end
#------------------------------------------------------------------------------- 
  def show_clock
    # Shows the clock on the screen if clock is allowed to be shown.
    return unless $scene.is_a?(Scene_Map) && $scene.clock == nil
    if $game_system.clock
      $scene.clock = $game_system.analog_clock ? Analog_Clock.new : Clock.new
    end
  end
#------------------------------------------------------------------------------- 
  def simple_clock(value = true)
    # Flag to let the system know to know how detailed to make the clock.
    $game_system.simple_clock = value
    if $scene.clock != nil 
      $scene.clock.dispose
      $scene.clock = $game_system.analog_clock ? Analog_Clock.new : Clock.new
    end
    return true
  end
#-------------------------------------------------------------------------------
   def analog_clock(value)
     # Sets the analog clock flag true/false.
     $game_system.analog_clock = value
     if $scene.clock != nil
      $scene.clock.dispose
      $scene.clock = $game_system.analog_clock ? Analog_Clock.new : Clock.new
    end
    return true
  end
#-------------------------------------------------------------------------------  
  def clock_face(*args)
    # Changes settings for the clock. Fill in any missing arguments.
    args.each_index {|i| $game_system.clock_face[i] = args[i] }
    # Refresh clock with new settings.
    if $scene.clock != nil 
      $scene.clock.dispose
      $scene.clock = $game_system.analog_clock ? Analog_Clock.new : Clock.new
    end
  end
#------------------------------------------------------------------------------- 
  def analog_face(*args)
    # Store the new settings.
    args.each_index {|i| $game_system.analog_face[i] = args[i] }
    # Dispose the old analog clock if it exists, and refreshes with changes.
    if $scene.clock != nil
      $scene.clock.dispose
      $scene.clock = $game_system.analog_clock ? Analog_Clock.new : Clock.new
    end
  end
#-------------------------------------------------------------------------------    
  def day_name
    # Returns the current day name.
    day = @day
    (0...@month - 1).each {|i| day += CCTS::MONTH_LENGTH[i]}
    return CCTS::DAYS[day % CCTS::DAYS.size]
  end
#-------------------------------------------------------------------------------  
  def advance_minute(minute)
    # Add MINUTE number of minutes to the time, then corrects.
    return unless minute >= 0
    @minute += minute
    time_fix
  end
#-------------------------------------------------------------------------------  
  def advance_hour(hour)
    # Add HOUR number of hours to the time, then corrects.
    return unless hour >= 0
    @hour += hour
    time_fix
  end
#-------------------------------------------------------------------------------  
  def advance_day(day)
    # Add DAY number of days to the time, then corrects.
    return unless day >= 0
    @day += day
    time_fix
  end
#-------------------------------------------------------------------------------  
  def advance_month(month)
    # Add MONTH number of months to the time, then corrects.
    return unless month >= 0
    @month += month
    time_fix
  end
#-------------------------------------------------------------------------------  
  def advance_year(year)
    # Add YEAR many of years to the time. No need to correct.
    return unless (@year + year) >= 0
    @year += year
  end
#-------------------------------------------------------------------------------
  def set(min = @minute, hr = @hour, day = @day, mos = @month, yr = @year)
    # Set the current time to the defined values. Current time is default values.
    return unless min.between?(0, 59)
    return unless hour.between?(0, 23)
    return unless day.between?(1, CCTS::MONTH_LENGTH[month - 1])
    return unless month.between?(1, CCTS::MONTHS.size)
    return unless year >= 0
    @minute, @hour, @day, @month, @year = min, hr, day, mos, yr
    # Refresh the switches and recalibrate the tone based on the new time.
    refresh_switches
    $game_screen.tone_calibrate
  end
#------------------------------------------------------------------------------- 
  def memorize(index)
    # Saves the "current_time" array to the specified index.
    @memory[index] = current_time
  end
#-------------------------------------------------------------------------------   
  def restore(index)
    # Sets the time to the memorized time at index, if it exist.
    return if @memory[index] == nil
    time = @memory[index]
    set(time[0], time[1], time[2], time[3], time[4])
  end
#-------------------------------------------------------------------------------
  def change_climate(map_id, climate_id)
    # Changes the current climate of MAP_ID to climate with CLIMATE_ID.
    current = $game_map.climates.map_climate(map_id)
    current.maps.delete(map_id)
    $game_map.climates.climate[climate_id].maps.push(map_id)
  end
#-------------------------------------------------------------------------------      
  def calculate_time
    # Very simple method to pass time. 
    @hour += 1
    @minute = 0
    if @hour >= 24
      @day += 1
      @hour = 0
      if @day > CCTS::MONTH_LENGTH[@month - 1]
        @month += 1
        @day = 1
        if @month > CCTS::MONTHS.size
          @year += 1
          @month = 1
        end
      end
    end
  end
#-------------------------------------------------------------------------------
  def time_fix
    # Corrects the time for when an out of range value is given for a particular
    # setting, such as "advance_minute(400)"
    if @minute >= 60
      @hour += (@minute / 60)
      @minute = @minute % 60
    end
    if @hour >= 24
      @day += (@hour / 24)
      @hour = @hour % 24
    end
    if @day > CCTS::MONTH_LENGTH[@month - 1]
      @month += 1
      @day = (@day % CCTS::MONTH_LENGTH[@month - 1]) + 1
    end
    if @month > CCTS::MONTHS.size + 1
      @year += 1
      @month = (@month % CCTS::MONTHS.size) + 1
    end
    $scene.clock.refresh if $scene.clock != nil
    refresh_switches
    error_check
  end
#-------------------------------------------------------------------------------  
  def refresh_switches
    # Set Day/Night switches if time is in configured ranges. 
    if @hour.between?(CCTS::DAY_START_HOUR, CCTS::NIGHT_START_HOUR - 1)
      $game_switches[CCTS::DAY_SWITCH] = true
      $game_switches[CCTS::NIGHT_SWITCH] = false
    else
      $game_switches[CCTS::DAY_SWITCH] = false
      $game_switches[CCTS::NIGHT_SWITCH] = true
    end
    # Set Season Variable
    CCTS::SEASON_MONTHS.each_index {|i|
      if CCTS::SEASON_MONTHS[i].include?(@month)
        $game_variables[CCTS::SEASON_VARIABLE] = i
      end
    }
    # Set variables to the current time if configured to do so.
    time = current_time
    ids = [CCTS::MINUTE_VARIABLE, CCTS::HOUR_VARIABLE, CCTS::DAY_VARIABLE, 
     CCTS::MONTH_VARIABLE, CCTS::YEAR_VARIABLE]
    ids.each_index {|i| $game_variables[ids[i]] = time[i] if ids[i] != nil }
    # Have $game_map refresh to have events, etc. respond to changed switches.
    $game_map.need_refresh = true
  end
#-------------------------------------------------------------------------------   
  def error_check
    # Checks that required settings are within permissable range. All of these
    # would mess up the system later, or throw an error themselves. This will
    # just give a better explanation, and catch it earlier.
    raise('Time speed must be greater than 0!') unless @speed > 0
    raise('No Days defined!') if CCTS::DAYS.empty?
    raise('No Months defined!') if CCTS::MONTHS.empty?
    if CCTS::WEATHER_WAIT[0] >= CCTS::WEATHER_WAIT[1]
      raise('Minimum WEATHER_WAIT must be less than Maximum WEATHER_WAIT!')
    end
    if CCTS::MONTH_LENGTH.size != CCTS::MONTHS.size
      raise('\'MONTH_LENGTH\' and \'MONTHS\' arrays must be equal size.')
    end
    if @minute > 60 || @hour > 24 || 
        @day > CCTS::MONTH_LENGTH[@month - 1] || @month > CCTS::MONTHS.size ||
        [@minute, @hour, @day, @month, @year].any? {|time| time < 0}
      raise('Time System Error! Time value(s) not within permitted range.')
    end
  end
#-------------------------------------------------------------------------------
  def update
    # Update the frame count as long as the frozen flag is false.
    unless @frozen
      @frame_count += 1
      if @frame_count >= @count
        @minute += 1
        calculate_time if @minute == 60
        refresh_switches
        @frame_count = 0
      end
    end
  end
end

#===============================================================================
# ** Game_Climate
#===============================================================================

  # Assign a Struct to a constant to organize data of each climate.
Game_Climate = Struct.new(:id, :name, :weather, :tinting, :sound, :speed, :maps)


#===============================================================================
# ** Game_Map
#===============================================================================

class Game_Map
  
  attr_reader   :climate, :old_climate, :map
  attr_accessor :climates
  
  alias zer0_last_map_init initialize
  def initialize
    zer0_last_map_init
    # Initialize the climate variable for game map.
    @climates = Climate.new
    # Set the "last_map", which will be the starting map by default.
    @last_map = $data_system.start_map_id
  end
#-------------------------------------------------------------------------------  
  alias zer0_map_climate_setup setup
  def setup(map_id)
    # Have the setup method also setup the climate for the current map.
    @climate = @climates.map_climate(map_id)
    # Reset the old climate variable
    @old_climate = @climates.map_climate(@last_map)
    # Call the weather control method of Game_Screen to set weather/tone. 
    $game_screen.weather_control     
    unless $game_system.time.speed_frozen
      $game_system.time.change_speed(@climate.speed)
    else
      $game_screen.tone_calibrate
    end
    # Call original setup method.
    zer0_map_climate_setup(map_id)
    # Set the @last_map id to the current map ID. Used for the next map. 
    @last_map = @map_id
  end
#-------------------------------------------------------------------------------
  alias zer0_weather_bgs_autoplay autoplay 
  def autoplay
    # Disable normal BGS if weather sound is occuring.
    $game_system.bgm_play(@map.bgm) if @map.autoplay_bgm
    return if $game_screen.weather_bgs_playing?
    zer0_weather_bgs_autoplay
  end
end

#===============================================================================
# ** Game_System
#===============================================================================

class Game_System

  attr_accessor :time, :clock, :clock_face, :simple_clock 
  attr_accessor :analog_clock, :analog_face, :clock_memory
  
  alias zer0_time_system_init initialize
  def initialize
    zer0_time_system_init
    # Initialize the Time_System class.
    @time = Time_System.new
    # Initialize a few other instance variables used by the system.
    @clock, @simple_clock, @bgs_volume_update = true, false, 0
    @clock_memory, @analog_clock = true, CCTS::ANALOG_CLOCK
    # Set starting values for the clock faces.
    @clock_face, @analog_face = CCTS::CLOCK_FACE, CCTS::ANALOG_FACE
  end
#-------------------------------------------------------------------------------
  def change_bgs_volume(volume)
    # Changes the BGS volume to VOLUME. Does not change the BGS name.
    return if @playing_bgs == nil
    bgs = @playing_bgs
    Audio.bgs_play('Audio/BGS/' + bgs.name, volume, bgs.pitch)
  end
#-------------------------------------------------------------------------------
  def bgs_transition(start_vol, target_vol, frames)
    # Transitions BGS volume from START_VOL to TARGET_VOL over the course of
    # FRAMES number of frames.
    range = target_vol - start_vol
    @bgs_volume = start_vol
    @bgs_volume_rate = range / frames.to_f
    @bgs_volume_update = frames
  end
#-------------------------------------------------------------------------------
  alias zer0_time_system_upd update
  def update
    # Updates the time if current scene is Scene_Map or Scene_Battle
    if $scene.is_a?(Scene_Map) || $scene.is_a?(Scene_Battle)
      @time.update
    end
    # Update BGS volume transitions if needed.
    if @bgs_volume_update != 0
      @bgs_volume += @bgs_volume_rate
      change_bgs_volume(@bgs_volume.round)
      @bgs_volume_update -= 1
    end
    # Call normal update method of Game_System.
    zer0_time_system_upd
  end
end

#===============================================================================
# ** Game_Screen
#===============================================================================

class Game_Screen

  attr_accessor :tone_frozen, :weather_frozen
  
#-------------------------------------------------------------------------------
  alias zer0_screen_control_init initialize
  def initialize
    zer0_screen_control_init
    # Initialize required instance variables.
    @minute = $game_system.time.minute
    # Calculate the weather delay based off the current config and climate.
    @weather_wait = weather_delay
    @weather_count = 0
    # Initialize arrays to retain rates of tinting for time and weather.
    @tint_rate = [0, 0, 0, 0]
    @weather_tint_rate = [0, 0, 0, 0]
    # Initialize the "frozen" flags.
    @tone_frozen = @weather_frozen = false
  end
#-------------------------------------------------------------------------------
  alias zer0_weather_effects weather
  def weather(type, power, duration, variation = 0)
    # Alias weather method to call other methods for setting the tint rates, 
    # sound, etc. when the weather is changed. 
    if type != @weather_type
      # Refresh the tint, and call BGS to transition smoothly if changing.
      @last_weather = @weather_type_target
      weather_tint_refresh(@weather_type, type, duration)
      weather_bgs_control(type, duration, $game_map.climate.weather)
    end
    # Reset BGS if climate has changed.
    if $game_map.climate.id != $game_map.old_climate.id && 
      $game_map.climate.sound
      weather_bgs_control(type, duration, $game_map.climate.weather)
    end
    # Refresh the switches used for Good/Bad Weather, Type variables, etc.
    refresh_weather_switches(type)
    # Set tone change flag if needed.
    @weather_tone_change = (type != @weather_type)
    # Call normal method, use fourth argument if Zer0 Adv. Weather or MAWS.
    if @weather_variation != nil
      zer0_weather_effects(type, power, duration, variation)
    else
      zer0_weather_effects(type, power, duration)
    end
  end
#-------------------------------------------------------------------------------
  def tint_rate_refresh
    # Evaluates the tint rate for the time. Uses configuration to find rate for
    # the next hour. Uses this value, the current, and the time speed to 
    # determine the rate at which it needs to change per frame.
    @minute = $game_system.time.minute
    rate = [0, 0, 0, 0]
    hour = $game_system.time.hour
    month = $game_system.time.month
    current = CCTS.time_tint($game_map.climate.id, hour, month)
    target = CCTS.time_tint($game_map.climate.id, (hour + 1) % 24, month)
    rate.each_index {|i| 
      rate[i] = current[i].abs - target[i].abs
      rate[i] /= (60.0 * $game_system.time.count_length)}
    @tint_rate = rate
  end
#-------------------------------------------------------------------------------
  def weather_tint_refresh(old_type, new_type, duration)
    # Sets the tint rate, based off the current tone that is, the target tone,
    # and the number of frames that it has to do so. This rate change is 
    # independent of the normal tint rate for time.
    old = CCTS.weather_tint(old_type)
    new = CCTS.weather_tint(new_type)
    unless $game_map.climate.tinting
      # End method if the tone cannot from be modified due to freeze status.
      unless @tone_frozen
        @tone.red -= old[0]
        @tone.green -= old[1]
        @tone.blue -= old[2]
        @tone.gray -= old[3]
      end
      return
    end
    # End method if the tones are equal and no change needs done.
    return if old == new
    # Instantly set tone if the duration is 0 and end method.
    if duration == 0 && !@tone_frozen
      @tone.red = (@tone.red - old[0] + new[0])
      @tone.green = (@tone.green - old[1] + new[1])
      @tone.blue = (@tone.blue - old[2] + new[2])
      @tone.gray = (@tone.gray - old[3] + new[3])
      return
    end
    # Initialize new rate array.
    rate = [0, 0, 0, 0]
    rate.each_index {|i| 
      # Evaluates difference in tones and divides by number of frames to change.
      rate[i] = old[i].abs - new[i].abs
      rate[i] /= (duration - 1).to_f}
    @weather_tint_rate = rate
  end
#-------------------------------------------------------------------------------
  def screen_tint_update
    # Use a clone of the tint rate to avoid actual modification of the rate.
    rate = @tint_rate.clone
    # Adds the weather tint to the screen tint for the duration of the weather.
    if @weather_duration != 0 && @weather_tone_change
      rate.each_index {|i| rate[i] += @weather_tint_rate[i] }
    end
    # Addes total value to each respective value of the current tone.
    @tone.red += rate[0]
    @tone.green += rate[1]
    @tone.blue += rate[2]
    @tone.gray -= rate[3]
  end
#-------------------------------------------------------------------------------
  def tone_calibrate
    # Recalibrates the the system and all its rates, timing, etc. since it can
    # sometimes get slightly off due to frame skips, bad decimal correction, etc.
    min = $game_system.time.minute
    hour = $game_system.time.hour
    month = $game_system.time.month
    weather = CCTS.weather_tint(@weather_type_target)
    current = CCTS.time_tint($game_map.climate.id, hour, month)
    target = CCTS.time_tint($game_map.climate.id, (hour + 1) % 24, month)
    # Instantly sets weather to its target and sets weather duration to 0. 
    tone, @weather_duration, @weather_max = [], 0, @weather_max_target
    # Recalculate each tone to more precise values.
    current.each_index {|i|
      tone[i] = current[i].abs - target[i].abs
      tone[i] /= 60.0
      tone[i] *= min
      tone[i] += current[i]
      tone[i] += weather[i]}
    # Sets tone to recalibrated settings unless the tone is frozen.
    unless @tone_frozen
      @tone.red, @tone.green = tone[0], tone[1] 
      @tone.blue, @tone.gray = tone[2], tone[3]
    end
    # Refresh rates based off corrected data. 
    tint_rate_refresh
  end
#-------------------------------------------------------------------------------
  def refresh_weather_switches(type)
    # Sets the switches to required values. Has Game_Map refresh afterwards.
    $game_variables[CCTS::WEATHER_VARIABLE] = type
    value = CCTS::BAD_WEATHER_TYPES.include?(type)
    $game_switches[CCTS::BAD_WEATHER_SWITCH] = value
    $game_switches[CCTS::GOOD_WEATHER_SWITCH] = !value
    $game_map.need_refresh = true
  end
#-------------------------------------------------------------------------------  
  def weather_delay
    # Gets a random number from within the MIN/MAX range of the weather wait. 
    min = CCTS::WEATHER_WAIT[0]
    max = CCTS::WEATHER_WAIT[1]
    delay = (min + rand(max - min + 1)) * 40
    return delay
  end
#-------------------------------------------------------------------------------  
  def weather_control
    # This is the heart of how weather is controlled. Most calculations of how
    # the weather is handled are either done here, or called from here.
    if @weather_count < @weather_wait 
      # Ensures the weather remains consistant through different maps with the 
      # same climate. Also remembers the weather of the last climate.
      return if $game_map.climate.id == $game_map.old_climate.id
      if $game_map.climate.weather && @last_weather != nil
        weather(@last_weather, rand(50) + 1, 0)
        return
      end
    end
    # Turn the weather off instantly if no weather is allowed for climate.
    unless $game_map.climate.weather
      weather(0, 0, 0)
      @weather_count = 0
      return
    end
    # Reset the weather wait and recalculate a new delay until the next update.
    @weather_count = 0 
    @weather_wait = weather_delay
    transition = rand(120) + 160
    power = rand(50) + 1
    # Get a random number 1..100 to use for the chance of the weather.
    chance = rand(100) + 1
    # Gets the current climate and month to determine weather for the season.
    climate, month = $game_map.climate.id, $game_system.time.month
    climate_weather = CCTS.weather_prob(climate, month)
    # If the climate has no weather defined, turn it off and end method.
    if climate_weather == nil
      weather(0, 0, 0)
      return
    end
    type = variation = 0
    # Trim array down to only types that whose probability is higher than chance
    climate_weather.reject! {|array| array[1] < chance }
    unless climate_weather.empty?
      # Get a random type from all weather types that were greater than chance.
      r = rand(climate_weather.size)
      type = climate_weather[r][0]
      # Get variation if defined.
      if climate_weather[r][2] != nil
        variation = climate_weather[r][2]
      end
    end
    # Call weather, using variation if defined.
    if @weather_variation != nil
      return if (type == @weather_type) && (variation == @weather_variation)
      weather(type, power, transition, variation)
    else
      return if type == @weather_type
      weather(type, power, transition)
    end
  end
#-------------------------------------------------------------------------------  
  def weather_bgs_playing?
    # Returns true if a BGS is playing for the weather.
    return false unless $game_map.climate.sound
    if $game_map.climate.weather
      return false if CCTS.weather_BGS(@weather_type_target) == nil
    end
    if $game_map.climate.sound && !$game_map.climate.weather &&
      CCTS.weather_BGS(@last_weather) == nil
      return false
    end
    return true
  end
#-------------------------------------------------------------------------------  
  def weather_bgs_control(type, duration, weather)
    # Turn weather BGS off if climate does not permit it, then end method.
    unless $game_map.climate.sound
      if weather_bgs_playing?
        $game_system.bgs_fade(0)
        $game_system.bgs_play($game_map.map.bgs) if $game_map.map.autoplay_bgs
        return
      end
    end
    # Use climate uses weather, set BGS to current weather sound.
    if weather
      bgs = CCTS.weather_BGS(type)
      if bgs != nil
        if duration > 0
          $game_system.bgs_play(RPG::AudioFile.new(bgs[0], 0, bgs[2]))
          $game_system.bgs_transition(0, bgs[1], duration)
        else
          $game_system.bgs_play(RPG::AudioFile.new(bgs[0], bgs[1], bgs[2]))
        end
      else
        $game_system.bgs_fade(duration / 25)
      end
    # If weather sound, but no weather is defined. Use the BGS from the last map
    # that used weather. Gives effect that weather is still occuring outside.
    else
      bgs = CCTS.weather_BGS(@last_weather)
      if bgs != nil
        audio = RPG::AudioFile.new(bgs[0], bgs[1], bgs[2])
        $game_system.bgs_play(audio)
        $game_system.change_bgs_volume(bgs[1] / 2)
      else
        $game_system.bgs_fade(duration / 25)
      end
    end
  end
#-------------------------------------------------------------------------------
  alias zer0_screen_tint_upd update
  def update 
    # Refresh tint every game minute.
    tint_rate_refresh if @minute != $game_system.time.minute
    # Update the current tone, unless it is frozen.
    screen_tint_update unless @tone_frozen
    unless @weather_frozen
      # Add 1 to the current weather count.
      @weather_count += 1 
      if @weather_count >= @weather_wait
        # If count duration is reached, call method to re-evaluate the weather.
        weather_control
      end
    end
    # Call normal update method.
    zer0_screen_tint_upd  
  end
#-------------------------------------------------------------------------------
end

#===============================================================================
# ** Scene_Map
#===============================================================================

class Scene_Map
  
  attr_accessor :clock  
  
  alias zer0_clock_main main
  def main
    # Create clock if memory is true.
    if $game_system.clock_memory
      @clock = $game_system.analog_clock ? Analog_Clock.new : Clock.new
    end
    # Main loop.
    zer0_clock_main
    # Dispose clock if it still exists when scene changes.
    if @clock != nil 
      @clock.dispose
    end
  end
  
  alias zer0_clock_upd update
  def update
    zer0_clock_upd
    if Input.trigger?(CCTS::CLOCK_BUTTON)
      # Play SE when button for clock is triggered.
      if $game_system.clock
        $game_system.se_play($data_system.decision_se)
        if @clock == nil
          @clock = $game_system.analog_clock ? Analog_Clock.new : Clock.new
        else
          @clock = @clock.dispose
        end
        $game_system.clock_memory = @clock != nil
      else
        $game_system.se_play($data_system.buzzer_se)
      end
    end
    # Update clock if it exists.
    if @clock != nil 
      @clock.update
    end
    # Dispose click if turned off by player, or explicitly by script call.
    if !$game_system.clock && @clock != nil
      @clock = @clock.dispose
    end
  end
end

#===============================================================================
# ** Clock 
#===============================================================================

class Clock < Window_Base
  
  def initialize
    # Determine dimensions by what type of clock will be created.
    dim = $game_system.simple_clock ? [100, 47] : [176, 80]
    super($game_system.clock_face[0], $game_system.clock_face[1], dim[0], dim[1])
    self.contents = Bitmap.new(width - 32, height - 32)
    self.back_opacity, self.z = $game_system.clock_face[2], 9998
    self.contents.font.name = $game_system.clock_face[3]
    self.contents.font.size = $game_system.clock_face[4]
    self.contents.font.bold = $game_system.clock_face[5]
    self.contents.font.italic = $game_system.clock_face[6]
    # Determine the skin used for the clock.
    if CCTS::CLOCK_SKIN == nil
      self.windowskin = nil
    elsif CCTS::CLOCK_SKIN == 'DEFAULT SKIN'
      self.windowskin = RPG::Cache.windowskin($game_system.windowskin_name)
    else
      self.windowskin = RPG::Cache.windowskin(CCTS::CLOCK_SKIN)
    end
    # Draw the clock.
    refresh
  end

  def refresh
    # Set a few local variables to current time variables.
    day, year = $game_system.time.day.to_s, $game_system.time.year.to_s
    month = CCTS::MONTHS[$game_system.time.month-1]
    time = sprintf(CCTS::TIME_FORMAT, $game_system.time.hour, $game_system.time.minute)
    # Clear the current bitmap.
    self.contents.clear
    # Set local variables equal to different text widths.
    tmw = 8 + contents.text_size('Time:').width
    dyw = 8 + contents.text_size('Day:').width
    dtw = 8 + contents.text_size('Date:').width
    self.contents.font.color = system_color
    # Begin to draw the clock. Only include more details if not Simple Clock.
    self.contents.draw_text(0, 0, 144, 15, 'Time:')
    unless $game_system.simple_clock
      self.contents.draw_text(0, 15, 144, 15, 'Day:')
      self.contents.draw_text(0, 30, 144, 15, 'Date:')
      self.contents.font.color = normal_color
      self.contents.draw_text(dyw, 15, 144, 15, $game_system.time.day_name)
      self.contents.draw_text(dtw, 30, 144, 15, "#{month} #{day}, #{year}")
    end
    self.contents.font.color = normal_color
    self.contents.draw_text(tmw, 0, 144, 15, time)
    # Set instance variable. Used to check when to next refresh.
    @mins = $game_system.time.minute
  end
  
  def update
    super
    # Redraw the clock every game minute.
    refresh if @mins != $game_system.time.minute
  end
end

#===============================================================================
# ** Analog_Clock
#===============================================================================

class Analog_Clock
  
  def initialize
    # Initialize the sprites.
    @clock_back, @minutehand, @hourhand = Sprite.new, Sprite.new, Sprite.new
    [@hourhand, @minutehand, @clock_back].each {|sprite| sprite.z = 9998 }
    # Set instance variable that will be used to determine when to refresh.
    @min = $game_system.time.minute
    # Set graphic and coordinates to each sprite. 
    set_graphic
  end
  
  def set_graphic(*args)
    # Fill in any missing arguments.
    (0..4).each {|i| args[i] = $game_system.analog_face[i] if args[i] == nil }
    filename, handoffset, x, y, alpha = args[0], args[1], args[2], args[3], args[4]
    # Set the bitmaps to the sprites.
    @minutehand.bitmap = RPG::Cache.picture(filename + '_min')
    @hourhand.bitmap = RPG::Cache.picture(filename + '_hour')
    @clock_back.bitmap = RPG::Cache.picture(filename + '_back')
    # Set the coordinates of the clock hands.
    @clock_back.x, @clock_back.y = x, y
    @hourhand.x = @minutehand.x = (@clock_back.bitmap.width / 2) + x
    @hourhand.y = @minutehand.y = (@clock_back.bitmap.height / 2) + y
    # Set the origin points of the clock hands.
    @hourhand.ox = @hourhand.bitmap.width / 2
    @minutehand.ox = @minutehand.bitmap.width / 2
    @hourhand.oy = @minutehand.oy = handoffset
    # Set opacity of each sprite.
    [@hourhand, @minutehand, @clock_back].each {|sprite| sprite.opacity = alpha }
    # Call update now to avoid a frame flicker before normal update starts.
    update
  end
  
  def update
    # Only run any calculations if minute has changed.
    if @mins != $game_system.time.minute
      # Calculate angle for minute hand
      m_angle = (360 * ($game_system.time.minute / 60.0)).to_i - 180
      if m_angle != @minutehand.angle
        @minutehand.angle = -m_angle
        # Calculate hour hand angle, only if minute hand angle has changed.
        h_angle = ($game_system.time.hour % 12) * 30
        h_angle += (($game_system.time.minute / 60.0) * 30).to_i - 180
        if h_angle.to_i != @hourhand.angle
          # Set new hour hand angle if it has changed.
          @hourhand.angle = -h_angle.to_i
        end
      end
      @mins = $game_system.time.minute
    end
  end
  
  def dispose
    # Disposes the sprites.
    [@hourhand, @minutehand, @clock_back].each {|sprite| sprite.dispose }
    return
  end
end

#===============================================================================
# ** Window_Message 
#===============================================================================

class Window_Message < Window_Selectable

  alias zer0_ccts_message_commands_refresh refresh
  def refresh
    if $game_temp.message_text != nil
      text = $game_temp.message_text
      begin
        # Use Regexp to find patterns in the message strings. If found, will
        # replace them with the proper value. 
        last_text = text.clone
        hour, minute = $game_system.time.hour, $game_system.time.minute
        time = sprintf(CCTS::TIME_FORMAT, hour, minute)
        text.gsub!(/\\[Tt][Ii][Mm][Ee]/) { time }
        text.gsub!(/\\[Dd][Aa][Yy]/) { $game_system.time.day_name }
        text.gsub!(/\\[Mm][Oo][Nn]/) { CCTS::MONTHS[$game_system.time.month-1] }
        text.gsub!(/\\[Yy][Rr]/) { $game_system.time.year.to_s }
        text.gsub!(/\\[Mm][Oo][Ss]\[([0-9]+)\]/) {
          CCTS::MONTHS[$1.to_i - 1] != nil ? CCTS::MONTHS[$1.to_i - 1] : ''}
        text.gsub!(/\\[Dd][Yy]\[([0-9]+)\]/) {
          CCTS::DAYS[$1.to_i] != nil ? CCTS::DAYS[$1.to_i] : ''}
      end until text == last_text
    end
    # Call normal refresh method for Window_Message.
    zer0_ccts_message_commands_refresh
  end
end

#===============================================================================
# ** Interpreter
#===============================================================================

class Interpreter
  
  def time
    # Shorten "$game_system.time" to simply "time" for script calls.
    return $game_system.time
  end
end

#===============================================================================
# ** CCTS Debug
#-------------------------------------------------------------------------------
# Everything below is used solely for the Debug aspect of the system, and not 
# required for the actual script at all. It is safe to erase if it not used.
#===============================================================================

#===============================================================================
# ** CCTS_Debug_Sprite
#===============================================================================

class CCTS_Debug < Sprite
  
  # Define the colors used to draw the text in, and background color.
  SYSTEM_COLOR = Color.new(192, 224, 255)
  NORMAL_COLOR = Color.new(255, 255, 255)
  CLEAR = Color.new(0, 0, 0, 96)
  
  # Defines what types of info will be drawn
  TIME         = true
  WEATHER      = true
  TONE         = true   # <-- This one tends to make the game lag.
  TINT_RATE    = true
  WEATHER_TINT = true
  
  def initialize
    viewport = Viewport.new(0, 0, 640, 480)
    viewport.z = 10000
    super(viewport)
    # Initialize the words used for each value.
    self.bitmap = Bitmap.new(640, 480)
    self.bitmap.font.name = 'Arial'
    self.bitmap.font.size = 14
    self.bitmap.font.bold = true
    @refresh = [TIME, WEATHER, TONE, TINT_RATE, WEATHER_TINT]
    @data = []
    @data[0] = time_info           if @refresh[0]
    @data[1] = weather_info        if @refresh[1]
    @data[2] = screen_tone_info    if @refresh[2]
    @data[3] = tint_info           if @refresh[3]
    @data[4] = weather_tint_info   if @refresh[4]
    # Draw all the items.
    @data.each_index {|i| 
      if @data[i] != nil
        draw_items(Array.new(@data[i][0].size) {|j| j }, i) 
      end
    }
    # Self updating thread.
    @thread = Thread.new { loop { $ccts_debug.update if $ccts_debug != nil } }
  end
  
  def dispose
    # Terminate the update thread when the sprite is disposed.
    @thread.kill
    @thread = nil
    super
  end
  
  def get_info(index)
    return case index
    when 0 then time_info
    when 1 then weather_info
    when 2 then screen_tone_info
    when 3 then tint_info
    when 4 then weather_tint_info
    end
  end
  
  def update
    # Check for change in values. Re-draws the lines that have changed.
    @refresh.each_index {|i|  
      if @refresh[i]
        info = get_info(i)
       if @data[i][1] != info[1]
          draw_items(get_indexes(@data[i][1], info[1]), i)
          @data[i] = info
        end
      end
    }
    # Dispose debugger and terminate thread if not Scene_Map
    unless $scene.is_a?(Scene_Map)
      $ccts_debug.dispose
    end
  end
  
  def draw_items(indexes, group)
    array = case group
    when 0 then [16, 304, 128]
    when 1 then [160, 424, 128]
    else
      [304+((group-2)*112), 412, 96]
    end
    indexes.each {|index|
      # Create a rect at the specific line.
      rect = Rect.new(array[0], (index*12)+array[1], array[2], 12)
      # Draw line number INDEX.
      self.bitmap.fill_rect(rect, CLEAR)
      self.bitmap.font.color = SYSTEM_COLOR
      self.bitmap.draw_text(rect, @data[group][0][index])
      self.bitmap.font.color = NORMAL_COLOR
      self.bitmap.draw_text(rect, @data[group][1][index], 2)
    }
  end
  
  def get_indexes(array1, array2)
    indexes = []
    array1.each_index {|i| indexes.push(i) if array1[i] != array2[i] }
    return indexes
  end
  
  def time_info
    # Return strings releated to the time.
    return [
    ['** TIME INFO', '  Time Frozen:', '  Tone Frozen:', '  Speed Frozen:', 
     '  Weather Frozen:', '  Time Speed:', '  Count:', '  Minute:', '  Hour:', 
     '  Day:', '  Month:', '  Year:', '  Day Name:', '  Month Name:'],
    ['', $game_system.time.frozen.to_s, 
    $game_screen.tone_frozen.to_s, $game_system.time.speed_frozen.to_s, 
    $game_screen.weather_frozen.to_s, $game_system.time.speed.to_s, 
    $game_system.time.frame_count.to_s + '\\' + $game_system.time.count.to_s,
    $game_system.time.minute.to_s, $game_system.time.hour.to_s, 
    $game_system.time.day.to_s, $game_system.time.month.to_s, 
    $game_system.time.year.to_s, $game_system.time.day_name.to_s, 
    CCTS::MONTHS[$game_system.time.month-1]]]
  end
  
  def weather_info
    # Return strings related to the weather.
    return [
    ['** WEATHER INFO', '  Duration:', '  Weather Type:', '  Count:'],
    ['', $game_screen.weather_duration.to_s, $game_screen.weather_type_target.to_s, 
    $game_screen.weather_count.to_s + '\\' + $game_screen.weather_wait.to_s]]
  end
  
  def screen_tone_info
    # Return strings related to the screen tone.
    return [
    ['** SCREEN_TONE:', '  Red:', '  Green:', '  Blue:', '  Gray:'], 
    ['', sprintf("%20.6s", $game_screen.tone.red), 
    sprintf("%20.6s", $game_screen.tone.green), 
    sprintf("%20.6s", $game_screen.tone.blue), 
    sprintf("%20.6s", $game_screen.tone.gray)]] 
  end
  
  def tint_info
    # Return strings related to the tint rate.
    return [
    ['** TINT RATE', '  Red:', '  Green:', '  Blue:', '  Gray:'],
    ['', sprintf("%20.6s", $game_screen.tint_rate[0]), 
    sprintf("%20.6s", $game_screen.tint_rate[1]), 
    sprintf("%20.6s", $game_screen.tint_rate[2]), 
    sprintf("%20.6s", $game_screen.tint_rate[3])]] 
  end
  
  def weather_tint_info
    # Return strings related to the weather tint.
    return [
    ['** WEATHER TINT', '  Red:', '  Green:', '  Blue:', '  Gray:'], 
    ['', sprintf("%20.6s", $game_screen.weather_tint_rate[0]), 
    sprintf("%20.6s", $game_screen.weather_tint_rate[1]), 
    sprintf("%20.6s", $game_screen.weather_tint_rate[2]), 
    sprintf("%20.6s", $game_screen.weather_tint_rate[3])]]
  end
end

#-------------------------------------------------------------------------------
# Make the following instance variables from each of the below classes public.
#-------------------------------------------------------------------------------
class Climate
  attr_reader :climate
end
#-------------------------------------------------------------------------------
class Game_Screen
  attr_reader :weather_type_target, :weather_duration, :weather_wait
  attr_reader :weather_count, :weather_tint_rate, :tint_rate
end
#-------------------------------------------------------------------------------
class Time_System
  attr_reader :count, :frame_count, :speed, :frozen
end
#-------------------------------------------------------------------------------
module CCTS
  
  def self.debug
    if $DEBUG && $scene.is_a?(Scene_Map)
      $ccts_debug = $ccts_debug == nil ? CCTS_Debug.new : $ccts_debug.dispose
    end
  end

  if $DEBUG && WRITE_MISSING_DATA
    c_maps, map_ids, multi_clim = [], [], []
    climate = Climate.new
    maps = load_data('Data/MapInfos.rxdata')
    maps.each_key {|i| map_ids.push(i)}
    climate.climate.each {|c| c.maps.each_index {|i| c_maps.push(c.maps[i])}}
    [map_ids, c_maps].each {|array| array.sort! }
    file = File.open('Climate Data.txt', 'wb')
    if map_ids == c_maps
      text = 'No climates missing. All maps have climates defined, and are configured correctly.'
      file.write(text)
    end
    no_clim = map_ids - c_maps 
    no_map = c_maps - map_ids
    c_maps.each_index{|i| 
      if c_maps[i] == c_maps[i + 1]
        multi_clim.push(c_maps[i]) unless multi_clim.include?(c_maps[i])
      end
    }
    lines = []
    unless no_clim.empty?
      lines.push("The following maps do not have a climate defined...\r\n") 
      no_clim.each {|id| lines.push("  ID:#{id} (#{maps[id].name})\r\n") }
      lines.push("\r\n")
    end
    unless no_map.empty?
      lines.push("The following map IDs have defined climates, but no map exist with ID(s)...\r\n")
      no_map.each {|id| lines.push("  ID: #{id}\r\n") }
      lines.push("\r\n")
    end
    unless multi_clim.empty?
      lines.push("The following map IDs are defined more than once...\r\n")
      multi_clim.sort.each {|id| lines.push("  ID: #{id} (#{maps[id].name})\r\n") }
    end
    lines.each {|line| file.write(line) }
    file.close
  end
end
=end