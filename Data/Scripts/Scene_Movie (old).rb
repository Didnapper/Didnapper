=begin
##Copy this into a new section of your game.
##To play a file, move the mpg file into a "movies" subdirectory
##(yourgame\data, yourgame\graphics, yourgame\movies).
##Then call '$scene = Scene_Movie.new("filename")' where filename is your movies actual filename
## (minus the .mpg).         #exapmple Scene_Movie.new("???")
## If you want to play multiple movies in a row
##(for example before the game starts, maybe a "developed by", "produced by", "intro movie"
## set or something... Go to the "main" section of code and find the line "$scene = Scene_Title.new".
##Just after that line add:
##CODE
##Audio.bgm_play("Movies/" + 'dev_by', 100, 100) #loads movie
##Audio.bgm_play("Movies/" + 'pro_b', 100, 100) #loads movie
##Audio.bgm_play("Movies/" + 'intro', 100, 100) #loads movie
##Audio.bgm_stop
##$scene = Scene_Movie.close_scene     #closes active movie window
##$scene = Scene_Movie.new("dev_by")
##$scene = Scene_Movie.new("pro_by")
##$scene = Scene_Movie.new("intro")
##$scene = Scene_Title.new
class Scene_Movie
def initialize(movie)
   @readini = Win32API.new 'kernel32', 'GetPrivateProfileStringA', %w(p p p p l p), 'l'
   @movie_name = Dir.getwd()+"\\Movies\\"+movie+".mpg"
   main
end

def main

   game_name = "\0" * 256
   @readini.call('Game','Title','',game_name,255,".\\Game.ini")
   game_name.delete!("\0")
   @wnd = Win32API.new('user32','FindWindowEx','%w(l,l,p,p)','L')
   @temp = @wnd.call(0,0,nil,game_name).to_s
   movie = Win32API.new('winmm','mciSendString','%w(p,p,l,l)','V')
   movie.call("open \""+@movie_name+"\" alias FILE style 1073741824 parent " + @temp.to_s,0,0,0)
   @message = Win32API.new('user32','SendMessage','%w(l,l,l,l)','V')
    
   @detector = Win32API.new('user32','GetSystemMetrics','%w(l)','L')
   @width = @detector.call(0)
   if @width == 640
     fullscreen
     Graphics.update
     sleep(1)
     Graphics.update
     sleep(1)
     Graphics.update
     sleep(1)
   end
  
   status = " " * 255
   movie.call("play FILE",0,0,0)
   loop do
    sleep(0.1)
    @message.call(@temp.to_i,11,0,0)     #Remove '#' if using RMXP
    Graphics.update                      #Remove '#' if using RMXP
    @message.call(@temp.to_i,11,1,0)
    Input.update
    movie.call("status FILE mode",status,255,0)
    true_status = status.unpack("aaaa")
    if true_status.to_s != "play"
      break
    end
    if Input.trigger?(Input::B)           #can change or add Input::C
      Input.update
      break
    end
   end
   movie.call("close FILE",0,0,0)
   bail
end

def bail
   if @width == 640
     fullscreen
   end
  end
end

def fullscreen()

$full.call(18,0,0,0)
$full.call(13,0,0,0)
$full.call(18,0,2,0)
$full.call(13,0,2,0)
end
$full = Win32API.new('user32','keybd_event','%w(l,l,l,l)','')

def close_scene
  $keybd = Win32API.new ('user32.dll', 'keybd_event', ['i', 'i', 'l', 'l'], 'v')
  $keybd.call 0xA4, 0, 0, 0
  $keybd.call 0x73, 0, 0, 0
  $keybd.call 0x73, 0, 2, 0
  $keybd.call 0xA4, 0, 2, 0
end
#End Movie Script#
=end