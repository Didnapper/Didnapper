CREDITS_FONT = ["Trebuchet MS"]
CREDITS_SIZE = 28
CREDITS_OUTLINE = Color.new(255,255,255, 0)
CREDITS_SHADOW = Color.new(100,100,100, 10)
CREDITS_FILL = Color.new(255,255,255, 255)

#==============================================================================
# ¦ Scene_Credits
#------------------------------------------------------------------------------
# Scrolls the credits you make below. Original Author unknown. Edited by
# MiDas Mike (now known as Emily_Konichi) so it doesn't play over the Title, but runs by calling the following:
# $scene = Scene_Credits.new
# New Edit 3/6/2007 11:14 PM by AvatarMonkeyKirby.
# Ok, what I've done is changed the part of the script that was supposed to make
# the credits automatically end so that way they actually end! Yes, they will
# actually end when the credits are finished! So, that will make the people you
# should give credit to now is: UNKOWN, Emily_Konichi, and AvatarMonkeyKirby.
#                                             -sincerly yours,
#                                               Your Beloved
# Oh yea, and I also added a line of code that fades out the BGM so it fades
# sooner and smoother.
#==============================================================================

class Scene_Credits

# This next piece of code is the credits.
CREDIT=<<_END_
Didnapper
__________________________


-Lead Developer and Creator-
Kendrian

-Event Coding and Scripting-
Kendrian
Maezar
Kreelud
bmvd
DTP
Schmetterling
DiDGamer

-Lead Artists-
SharpFFFFF
Tsukemen

-Concept Artists-
Tsukemen
SharpFFFFFF
Kendrian

-Artists-
SharpFFFFFF
Kendrian
Mwatiki
JCDID
Animluster
Tessy

-Private Cell Artists-
Tsukemen
SharpFFFFFF
Kendrian
Mwatiki

-Graphics Cleaning-
Tsukemen
Kendrian
Animluster
JCDID

-Map Design-
Kendrian
Maezar
Schmetterling

-Sprites-
Tsukemen
Kendrian
Schmetterling
Wychkith

-Animation-
Kendrian
Tsukemen
SharpFFFFFF

-Escape Graphics-
Tsukemen
SharpFFFFFF

-Background Artists-
SharpFFFFFF
Kendrian
Tsukemen

-Party Select Interface-
CrimsonWolf64

-Lead Composer -
Tsukemen

-Title Theme-
Napdog

-Jingles-
JCDID

-Other Music-
Aaron Krogh
Sieg
Kendrian
Cherlotte

-Lead Writer-
ImilianArticuno

-Script Writer-
ImilianArticuno
Tsukemen

-Gag Talk Donations-
Sieg
Full Metal Panic Attack

-Private Cell Writer-
ImilianArticuno
The Didnapper Community

-Directing-
Tsukemen
Kendrian

-Video Editor-
Kendrian

-Special Cameo-
LostOneZero
Natsuko-Hiragi

-Special Thanks-
Wychkith
All the great Closed Beta testers
The Didnapper Community

-Scripts used-
UMS - Ccoa
Chaos Project Save Layout - Fantasist
Skill Shop - Game_guy
Tons of Add-ons - Blizzard
Leon's Shopping System
Scene_Credits - Emily_Konichi
Improved Save - gerkrt/gerrtunk
Untouchable Actor States - Kendrian



_END_
def main

#-------------------------------
# Animated Background Setup
#-------------------------------

@sprite = Sprite.new
#@sprite.bitmap = RPG::Cache.title($data_system.title_name)
@backgroundList = [""] #Edit this to the title screen(s) you wish to show in the background. They do repeat.
@backgroundGameFrameCount = 0
# Number of game frames per background frame.
@backgroundG_BFrameCount = 3.4
@sprite.bitmap = RPG::Cache.title(@backgroundList[0])

#------------------
# Credits txt Setup
#------------------

credit_lines = CREDIT.split(/\n/)
credit_bitmap = Bitmap.new(640,32 * credit_lines.size)
credit_lines.each_index do |i|
line = credit_lines[i]
credit_bitmap.font.name = CREDITS_FONT
credit_bitmap.font.size = CREDITS_SIZE
x = 0
credit_bitmap.font.color = CREDITS_OUTLINE
credit_bitmap.draw_text(0 + 1,i * 32 + 1,640,32,line,1)
credit_bitmap.draw_text(0 - 1,i * 32 + 1,640,32,line,1)
credit_bitmap.draw_text(0 + 1,i * 32 - 1,640,32,line,1)
credit_bitmap.draw_text(0 - 1,i * 32 - 1,640,32,line,1)
credit_bitmap.font.color = CREDITS_SHADOW
credit_bitmap.draw_text(0+4,i * 32 + 4,640,32,line,1)
credit_bitmap.font.color = CREDITS_FILL
credit_bitmap.draw_text(0,i * 32,640,32,line,1)
end
@credit_sprite = Sprite.new(Viewport.new(0,50,640,380))
@credit_sprite.bitmap = credit_bitmap
@credit_sprite.z = 9998
@credit_sprite.oy = -430 #-430
@frame_index = 0
@last_flag = false

#--------
# Setup
#--------

#Stops all audio but background music.
Audio.me_stop
Audio.bgs_stop
Audio.se_stop

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
@sprite.dispose
@credit_sprite.dispose
end

##Checks if credits bitmap has reached it's ending point
def last?
    if @frame_index > (@credit_sprite.bitmap.height + 500)
       $scene = Scene_Map.new
       Audio.bgm_fade(10000) #aprox 10 seconds
      return true
    end
      return false
    end

#Check if the credits should be cancelled
def cancel?
    if Input.trigger?(Input::B)
      $scene = Scene_Map.new
      return true
    end
      return false
end


def update
  
@backgroundGameFrameCount = @backgroundGameFrameCount + 1
if @backgroundGameFrameCount >= @backgroundG_BFrameCount
@backgroundGameFrameCount = 0
# Add current background frame to the end
@backgroundList = @backgroundList << @backgroundList[0]
# and drop it from the first position
@backgroundList.delete_at(0)
@sprite.bitmap = RPG::Cache.title(@backgroundList[0])
end
return if cancel?
return if last?

@credit_sprite.oy += 1#this is the speed that the text scrolls. 1 is default
                      #The fastest I'd recomend is 5, after that it gets hard to read. Also change the frame index
@frame_index += 1 #This should fix the non-self-ending credits
end
end