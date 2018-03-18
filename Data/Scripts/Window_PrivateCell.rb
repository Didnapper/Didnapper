#--------------------------------------------------------
#Window_PrivateCell by Kreelos
#--------------------------------------------------------
#Step 1:  Create a new script containing the following.  (I suggest "Window_PrivateCell" as a name.)
#--------------------------------------------------------

class Window_PrivateCell < Window_Base
  def initialize(message)
    super(0, 370, 485, 110) #width 430 for old panels, 485 for new
#    self.windowskin = nil # nil for invisible
    self.contents = Bitmap.new(width - 32, height - 32)
    @message = message
    self.z=1000
    self.opacity = $game_system.opacity
    refresh
  end
  def refresh
    @linewidth = 50
    @lineheight = 15
    
 
    lineArray = []
    lastLineEnd = 0
    thisLineEnd = 0
    while i = @message.index(' ',thisLineEnd+1) do
      if i - lastLineEnd > @linewidth then
        lineArray << @message[lastLineEnd..thisLineEnd]
        lastLineEnd = thisLineEnd
      end
      thisLineEnd = i
    end
    lineArray << @message[lastLineEnd..@message.length] #record the last line
    
    @lines = lineArray.length
    
    
    self.contents.clear
    self.contents.font.color = normal_color #Color.new(255, 255, 255, 255) #system_color
    
    for i in 0..@lines-1 do
      self.contents.draw_text(0, -5-((@lines / 2) * @lineheight) + (i * @lineheight), 400, 90, lineArray[i],1)
    end
    
    #self.contents.draw_text(0, -20, 400, 90, @message,1)
    #self.contents.draw_text(0, 5, 400, 90, @message2,1)
  end
end

def wSay(message,message2)
  message = message.gsub('Suki1',$game_actors[1].name)
  $privateCellWindow = Window_PrivateCell.new(message)
end
def varSay
  wSay("Hit " + $game_variables[24].to_s + " times.","")
end

#--------------------------------------------------------
#Step 2:  When you want the window to appear, declare it in a global variable.  Replace the quoted message.
#--------------------------------------------------------
#$privateCellWindow = Window_PrivateCell.new("Belts, eh?  Belts. eh?  Belts, eh?")

#--------------------------------------------------------
#Step 3:  When you want to close the window, do this:
#--------------------------------------------------------
#$privateCellWindow.dispose()