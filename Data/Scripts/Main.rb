#==============================================================================
# ** Main
#------------------------------------------------------------------------------
#  After defining each class, actual processing begins here.
#==============================================================================

begin
  # Default Font
  
  #Menu Font below
  #Font.default_name =  ["Arial"]
  
  # Prepare for transition
  Graphics.freeze
  # Make scene object (title screen)
=begin
  $scene = Scene_Title.new
  Audio.bgm_play("Movies/" + 'IntroO', 100, 100) #loads movie
  Audio.bgm_stop
  $scene = Scene_Movie.close_scene #closes active movie window
  $scene = Scene_Movie.new("IntroO")
=end
Graphics.play_movie( "Movies/IntroR.wmv" )
  $scene = Scene_Title.new
  # Call main method as long as $scene is effective
  while $scene != nil
    $scene.main
  end
  # Fade out
  Graphics.transition(20)
rescue Errno::ENOENT
  # Supplement Errno::ENOENT exception
  # If unable to open file, display message and end
  filename = $!.message.sub("No such file or directory - ", "")
  print("Unable to find file #{filename}.")
end
