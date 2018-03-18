# Zeus Video Player v2.1.2 for XP, VX and VXace by Zeus81
# Free for commercial use
# Licence : http://creativecommons.org/licenses/by/4.0/
# Contact : zeusex81@gmail.com
#
# How to Use :
#   Graphics.play_movie( filename, cancellable, fit_to_screen )
#   - filename = path of the video file.
#   - cancellable = true if you want to allow the player to stop the video
#                   by pressing Enter or Escape, false otherwise.
#                   This option can be omitted and default value is true.
#   - fit_to_screen = true if you want the video to be stretched to fit the screen in
#                     case it doesn't match, false if you just want it to be centered.
#                     If you're using scripts like Fullscreen++ true is recommended.
#                     This option can be omitted and default value is true.
#   ex : Graphics.play_movie( "Movies/prout.avi", true, true )
#   or   Graphics.play_movie( "Movies/prout.avi" )
#
# Codec choice :
#   I haven't tested all of them but I guess wmv9 (standard) would be a good choice.
#   You can find a list of codecs installed by default on windows here :
#   http://support.microsoft.com/kb/899113
#
# Background Image :
#   You can choose the background image of the player (in case your video doesn't fill all the space).
#   It will automatically load the image named "ZeusVideoPlayer" if found in Pictures folder (the extension doesn't matter).
#   If not found it will be black.
#
# Known bugs :
#  - With some video codecs stretching to fit screen doesn't work in fullscreen mode.
#  - When switching fullscreen mode during playback the display can freeze.
#  - Sometimes the display doesn't render when playing a video for the second time.
#  - Weird behaviour in fullscreen mode.
#
# ZVP_OldAviMode :
#   Just bellow you can enable this mode by setting the variable to true.
#   Advantages :
#     - More stable, no known bugs.
#   Drawbacks :
#     - It can only play avi files.
#     - You must use vfw codecs for video, and windows defaults vfw codecs are very limited.
#       Exhaustive list : MS RLE, MS Video 1, Cinepak, iyuv. And they all sucks.
#       Any other codec will require to be installed on user side to ensure that it's supported.
#       But if it's not a problem then you can find very nice vfw codecs on the internet, eg x264vfw.
#     - You must use acm codecs for audio.
#       Windows defaults : mp3, pcm.
#       You can also find better codecs like aac acm.
 
module Graphics
  ZVP_OldAviMode = false
end
 
$imported ||= {}
$imported[:Zeus_Video_Player] = __FILE__
 
def xp?() false end ; def vx?() false end ; def vxace?() false end
RUBY_VERSION == '1.8.1' ? defined?(Hangup) ?
def xp?() true  end : def vx?() true  end : def vxace?() true  end
 
Cache = RPG::Cache if xp?
 
class String
  alias getbyte  []
  alias setbyte  []=
  alias bytesize size
end unless vxace?
 
module Zeus
  module Encode # 1.1
    MultiByteToWideChar = Win32API.new('kernel32', 'MultiByteToWideChar', 'iipipi'  , 'i')
    WideCharToMultiByte = Win32API.new('kernel32', 'WideCharToMultiByte', 'iipipipp', 'i')
    CodePages = {
      'ANSI'=>0, 'OEM'=>1, 'MAC'=>2, 'THREAD_ANSI'=>3, 'SYMBOL'=>42,
      'WINDOWS874'=>874, 'SHIFT_JIS'=>932, 'BIG5'=>950, 'WINDOWS1250'=>1250,
      'WINDOWS1251'=>1251, 'WINDOWS1252'=>1252, 'WINDOWS1253'=>1253,
      'WINDOWS1254'=>1254, 'WINDOWS1255'=>1255, 'WINDOWS1256'=>1256,
      'WINDOWS1257'=>1257, 'WINDOWS1258'=>1258, 'US_ASCII'=>20127,
      'ISO8859_1'=>28591, 'ISO8859_2'=>28592, 'ISO8859_3'=>28593,
      'ISO8859_4'=>28594, 'ISO8859_5'=>28595, 'ISO8859_6'=>28596,
      'ISO8859_7'=>28597, 'ISO8859_8'=>28598, 'ISO8859_9'=>28599,
      'ISO8859_13'=>28603, 'ISO8859_15'=>28605, 'ISO8859_8I'=>38598,
      'ISO2022_JP'=>50220, 'ISO2022_KR'=>50225, 'ISO2022_CN'=>50227,
      'EUC_JP'=>51932, 'EUC_CN'=>51936, 'EUC_KR'=>51949, 'GB2312'=>52936,
      'UTF7'=>65000, 'UTF8'=>65001, 'UTF16'=>-1
    }
    def self.encode(str, from, to, dchar=nil, dflag=nil)
      if from != -1
        l = MultiByteToWideChar.call(from, 0, str, str.bytesize, nil, 0)
        utf16 = [].pack('x') * (l*2)
        MultiByteToWideChar.call(from, 0, str, str.bytesize, utf16, l)
      else utf16 = str
      end
      if to != -1
        l = WideCharToMultiByte.call(to, 0, utf16, utf16.bytesize/2, nil, 0, dchar, dflag)
        str = [].pack('x') * l
        WideCharToMultiByte.call(to, 0, utf16, utf16.bytesize/2, str, l, dchar, dflag)
      else str = utf16
      end
      case to
      when 20127; str.force_encoding('US-ASCII')
      when 65001; str.force_encoding('UTF-8')
      when    -1; str.force_encoding('UTF-16LE')
      end if vxace?
      str
    rescue raise($!, $!.message, caller(vxace? ? 2 : 1))
    end
    def self.method_missing(method, str, *options)
      from, to = *method.to_s.upcase.split('_TO_', 2).map! {|s| CodePages[s]}
      super unless from and to
      encode(str, from, to, *options)
    rescue raise($!, $!.message, caller(vxace? ? 2 : 1))
    end
  end
end
 
module Graphics
  DefWindowProc       = Win32API.new('user32', 'DefWindowProc'      , 'iiii', 'i')
  DestroyWindow       = Win32API.new('user32', 'DestroyWindow'      , 'i'   , 'i')
  EnableWindow        = Win32API.new('user32', 'EnableWindow'       , 'ii'  , 'i')
  FindWindow          = Win32API.new('user32', 'FindWindow'         , 'pp'  , 'i')
  GetClientRect       = Win32API.new('user32', 'GetClientRect'      , 'ip'  , 'i')
  GetForegroundWindow = Win32API.new('user32', 'GetForegroundWindow', ''    , 'i')
  GetMessage          = Win32API.new('user32', 'GetMessage'         , 'piii', 'i')
  GetWindowLong       = Win32API.new('user32', 'GetWindowLong'      , 'ii'  , 'i')
  PostMessage         = Win32API.new('user32', 'PostMessage'        , 'iiii', 'i')
  RedrawWindow        = Win32API.new('user32', 'RedrawWindow'       , 'ipii', 'i')
  SetWindowLong       = Win32API.new('user32', 'SetWindowLong'      , 'iii' , 'i')
  MciGetErrorString   = Win32API.new('winmm' , 'mciGetErrorStringW' , 'ipi' , 'i')
  MciSendString       = Win32API.new('winmm' , 'mciSendStringW'     , 'ppii', 'i')
   
  HWND = FindWindow.call('RGSS Player', nil)
   
  class << self
    def play_movie(filename, cancellable = true, fit_to_screen = true)
      @zvp ||= {:buffer => [].pack('x') * 256}
      @zvp[:filename] = Dir["#{filename}.*"][0] || filename
      @zvp[:cancellable] = cancellable
      @zvp[:fit_to_screen] = fit_to_screen
      return unless open_video_player
      back_sprite = Sprite.new
      back_sprite.z = 0x7FFF_FFFF
      begin
        cached = true
        back_sprite.bitmap = Cache.picture('ZeusVideoPlayer')
        back_sprite.zoom_x = width  / back_sprite.bitmap.width.to_f
        back_sprite.zoom_y = height / back_sprite.bitmap.height.to_f
      rescue
        cached = false
        back_sprite.bitmap = Bitmap.new(1, 1)
        back_sprite.bitmap.set_pixel(0, 0, Color.new(0,0,0))
        back_sprite.zoom_x = width
        back_sprite.zoom_y = height
      end
      frame_reset
      update
      update_video_player
      back_sprite.bitmap.dispose unless cached
      back_sprite.dispose
    ensure
      close_video_player
    end
    def width()  640 end unless method_defined?(:width)
    def height() 480 end unless method_defined?(:height)
  private
    def mci(command)
      error = mci_silent(command)
      return true if error == 0
      MciGetErrorString.call(error, @zvp[:buffer], @zvp[:buffer].bytesize/2)
      print(mci_result, "\nCommand : ", command)
      return false
    end
    def mci_silent(command)
      command = Zeus::Encode.utf8_to_utf16("#{command}\0")
      MciSendString.call(command, @zvp[:buffer], @zvp[:buffer].bytesize/2, HWND)
    end
    def mci_result
      str = Zeus::Encode.utf16_to_utf8(@zvp[:buffer])
      str[0, str.index("\0")]
    end
    def open_video_player(position=0)
      if ZVP_OldAviMode
        return false unless mci("open \"#{@zvp[:filename]}\" type AVIVideo alias ZeusVideoPlayer")
        return false unless mci("window ZeusVideoPlayer handle #{HWND}")
        return false unless mci("play ZeusVideoPlayer from #{position} notify")
      else
        return false unless mci("open \"#{@zvp[:filename]}\" type MPEGVideo style Child parent #{HWND} alias ZeusVideoPlayer")
        return false unless mci("play ZeusVideoPlayer from #{position} notify")
        return false unless mci('status ZeusVideoPlayer window handle')
        @zvp[:hwnd] = mci_result.to_i
        EnableWindow.call(@zvp[:hwnd], 0)
        style = GetWindowLong.call(HWND, -16) #GWL_STYLE
        SetWindowLong.call(HWND, -16, style | 0x02000000) #WS_CLIPCHILDREN
      end
      return true
    end
    def close_video_player
      if !ZVP_OldAviMode and @zvp[:hwnd]
        DestroyWindow.call(@zvp[:hwnd])
        @zvp[:hwnd] = nil
      end
      mci_silent('stop ZeusVideoPlayer')
      mci_silent('close ZeusVideoPlayer')
    end
    def resize_video_player
      if mci_silent('where ZeusVideoPlayer source') == 0
        x, y, w, h = *mci_result.split(' ', 4).map! {|s| s.to_i}
        GetClientRect.call(HWND, @zvp[:buffer])
        client_w, client_h = *@zvp[:buffer].unpack('x8L2')
        if @zvp[:fit_to_screen]
          ratio = w / h.to_f
          w, h = client_w, (client_w / ratio).round
          h, w = client_h, (client_h * ratio).round if h > client_h
        end
        x, y = (client_w-w)/2, (client_h-h)/2
        window = ZVP_OldAviMode ? 'destination' : 'window'
        mci_silent("put ZeusVideoPlayer #{window} at #{x} #{y} #{w} #{h}")
      end
      RedrawWindow.call(@zvp[:hwnd] || HWND, nil, 0, 0)
    end
    def update_video_player
      focus = false
      loop do
        GetMessage.call(@zvp[:buffer], 0, 0, 0)
        DefWindowProc.call(*msg = @zvp[:buffer].unpack('L4'))
        if focus != (HWND == GetForegroundWindow.call)
          focus = !focus
          mci_silent("#{focus ? 'resume' : 'pause'} ZeusVideoPlayer")
          resize_video_player
        end
        next unless focus
        Input.update
        case msg[1]
        when 0x0012; exit #WM_QUIT
        when 0x0100 #WM_KEYDOWN
          next if msg[3][30] == 1
          case msg[2]
          when 0x70, 0x7B #VK_F1, VK_F12
            focus = false
            mci_silent('pause ZeusVideoPlayer')
            PostMessage.call(*msg)
            update
          when 0x74, 0x75 #VK_F5, VK_F6
            next if !$imported[:Zeus_Fullscreen] or vx_fullscreen?
            update
            resize_video_player
          when 0x0D, 0x1B #VK_RETURN, VK_ESCAPE
            mci_silent('stop ZeusVideoPlayer') if @zvp[:cancellable]
          end
        when 0x0104 #WM_SYSKEYDOWN
          next if msg[2] != 0x0D or msg[3][30] == 1
          next if $imported[:Zeus_Fullscreen] and Disable_VX_Fullscreen
          if ZVP_OldAviMode
            PostMessage.call(*msg)
            update
            resize_video_player
          else
            next if mci_silent('status ZeusVideoPlayer position') != 0
            position = mci_result.to_i
            close_video_player
            PostMessage.call(*msg)
            update
            break unless open_video_player(position)
            resize_video_player
          end
        else
          mci_silent('status ZeusVideoPlayer mode')
          break if mci_result == 'stopped'
        end
      end
    end
    if xp?
      alias anti_hangup_update_video_player update_video_player
      def update_video_player
        anti_hangup_update_video_player
      rescue Hangup
        retry
      end
    end
  end
end