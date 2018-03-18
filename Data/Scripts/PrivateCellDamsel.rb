def pc_regen
	$privateCellDamsels[$currentPrivateCellDamsel].regeneratePicture
end
def pc_action(act)
  $privateCellDamsels[$currentPrivateCellDamsel].performAction(act)
end
def pc_getMood
  return $privateCellDamsels[$currentPrivateCellDamsel].getMood[0]
end
def pc_getDisposition
  return $privateCellDamsels[$currentPrivateCellDamsel].getDisposition
end

$override_pic['pc_canvas'] = Bitmap.new(640,480)

#print 'A'.unpack('c')[0]
#print 65.chr

#need to try inserting text event into stack
$privateCellDamsels = {}
$currentPrivateCellDamsel = "suki"



#$game_variables[425] = 0 #emergency reset

#to perform action: $privateCellDamsel[$currentPrivateCellDamsel].performAction['action']
class PrivateCellDamsel
  
  include FaceLib
  

    @@saved = {}
    @@gags = ['ungagged','cloth','cleave','knot','otn','bit','ball']
	def initialize
    Graphics.update
    if !@@saved.has_key?(@tag)
      @@saved[@tag] = {}
    end
     @flash_message = []
    @flash_message_time = []
    
    @face= 'mood'
    @loaded = false #if the var is unset, do not load this session
    @dialogue = {} #using commonwealth spelling as a courtesy
    @images = {}
		#emotions['anger'][0] is capacity, emotions['anger'][1] is current
    @emotions = {}
		emotions = {}
		#defaults to be overridden later
		emotions['anger'] = [1,0]
		emotions['happiness'] = [1,0]
		emotions['shyness'] = [7,0]
		emotions['sadness'] = [1,0]
		emotions['fear'] = [1,0]
    
    if !@@saved[@tag].has_key?('emotions')
      @@saved[@tag]['emotions']= emotions
		end
    @eyedart = false
		
		@homophilia = 0 #0-5, 0 is always homo, 5 is never. In-between is relative to disposition (>= makes happy)
		@masochism = 0
    if !@@saved[@tag].has_key?('accessories')
      @@saved[@tag]['accessories']= {}
		end
		
		@disposition_max = 4
		@disposition_min = 1
		#@disposition = 3
    
    if !@@saved[@tag].has_key?('disposition')
      @@saved[@tag]['disposition']= 3
		end
		@disposition_index = 651
		
		@position = "back" #deprecated
		#@currentOutfit = "outfitdefault"
    @@saved[@tag]['outfit'] = "outfitdefault"
		#@blindfold = false
    @@saved[@tag]['blindfold'] = false
		@talking = false
		@eyes_closed = 0
		@tickle_level = 0
		@last_tickle = 0
		@tickle_tears = 0
    @ticklish = true
		#@gag = "cloth"
    @@saved[@tag]['gag'] = "cloth"
		@speechCount = 0
    @textime = 7
    
    @face_override = {'eyes'=>false,'eyes_closed'=>false,'mouth'=>false,'mouth_open'=>false,'brows'=>false,'blush'=>false,'tears'=>false}
    
    
    @action = 'none'
		
		@activePictures = 0
		@conversationStack = []
		@lastInConvo = false #used to mark when at the end of a given convo
    #addMessage('halostatue')
    #print Time.now.tv_sec
	end
  def getDisposition
    return @@saved[@tag]['disposition']
  end
  def reset ()
    @@saved.delete(@tag)
    $privateCellDamsels[@tag] = Object.const_get(self.class.name).new
  end
  def addMessage (message)
    @flash_message.push({'message'=>message,'active'=>-1})
  end
  def getMessage
    #make sure to check time before cycling
    
    #return @flash_message.take
    while @flash_message.length > 0 && @flash_message[0]['active'] != -1 && Time.now.tv_sec - @flash_message[0]['active'] > @textime do
      @flash_message.shift
    end
    if @flash_message.length > 0
      
      if @flash_message[0]['active'] == -1
        @flash_message[0]['active'] = Time.now.tv_sec
      end
      return @flash_message[0]
    end
    return {'message'=>'','active'=>0}
  end
	def mmph
    Audio.se_play("Audio/SE/gagtalk4.mp3", 100, 100)
	end
	def reportDispositionIncrease
		case @@saved[@tag]['disposition']
			when 2
			addMessage('Your captive no longer hates you.')
			when 3
			addMessage('Your captive likes you.')
			when 4
			addMessage('Your captive loves you.')
		end
	end
	def reportDispositionDecrease
		case @@saved[@tag]['disposition']
			when 1
			addMessage('Your captive hates you.')
			when 2
			addMessage('Your captive dislikes you.')
			when 3
			addMessage('Your captive no longer loves you.')
		end
	end
	def reportMoodChange
		case getMood[0]
			when 'neutral'
			addMessage('Your captive is in a neutral mood.')
			when 'anger'
			addMessage('Your captive is angry.')
			when 'happiness'
			addMessage('Your captive is happy.')
			when 'shyness'
			addMessage('Your captive is embarrassed.')
			when 'sadness'
			addMessage('Your captive is sad.')
			when 'fear'
			addMessage('Your captive is afraid.')
		end
    
	end
	def increaseEmotion (emotion)
		
		if emotion == 'happiness' && rand(29) == 5 #Kendrian changed from 19 to 29
      report = @@saved[@tag]['disposition'] < @disposition_max
			@@saved[@tag]['disposition'] = [@@saved[@tag]['disposition']+1,@disposition_max].min
			if report
        reportDispositionIncrease
      end
		end
		@@saved[@tag]['emotions'][emotion][1] = [@@saved[@tag]['emotions'][emotion][1] + @@saved[@tag]['emotions'][emotion][0],50].min
		
	end
	def decreaseEmotion (emotion)
		if emotion == 'happiness' && rand(28) == 5 #Kendrian changed from 18 to 28
      report = @@saved[@tag]['disposition'] > @disposition_min
			@@saved[@tag]['disposition'] = [@@saved[@tag]['disposition']-1,@disposition_min].max
			if report
        reportDispositionDecrease
      end
		end
		@@saved[@tag]['emotions'][emotion][1] = [@@saved[@tag]['emotions'][emotion][1] - (11 - @@saved[@tag]['emotions'][emotion][0]),0].max
	end
	def getMood
    if !@@saved.has_key?(@tag) || !@@saved[@tag].has_key?('emotions')
      reset
    end
		keys = @@saved[@tag]['emotions'].keys
		keys = keys.sort do |a, b|
			if @@saved[@tag]['emotions'][a][1] < @@saved[@tag]['emotions'][b][1]
				1
			else
				-1
			end
		end
		if @@saved[@tag]['emotions'][keys[0]][1] < 25
			return ['neutral','neutral']
		end
		if @@saved[@tag]['emotions'][keys[1]][1] > 25
			return [keys[0],keys[1]]
		else
			return [keys[0],keys[0]]
		end
	end
	def outfit?
		return @@saved[@tag]['outfit']
	end
  def saveVars
    $game_variables[651] = @@saved
  end
  def loadVars
    if $game_variables[651]== 0 then saveVars end
    if !$game_variables[651].has_key?(@tag) then $game_variables[651][@tag] = @@saved[@tag] end
    if @loaded then return end
    @loaded = true
    @@saved = $game_variables[651]
  end
  
	def getDialogue (action,mood,disposition)
		#@conversationStack = @dialogue['charm'][@disposition-1][mood[0]].clone
		if !@dialogue.key?(action)
			return []
		end
		if disposition < 0 || disposition > @dialogue[action].length
			return []
		end
		if !@dialogue[action][disposition].key?(mood)
			return []
		end
		return @dialogue[action][disposition][mood].clone
	end
  
	def performAction (action) #returns text
    oldmood = getMood[0]
    loadVars
		@talking = false
		if @lastInConvo || action=='cancel'
      face_default #reset face
      @conversationStack = []
			$game_variables[425] = 0
			@lastInConvo = false
			Audio.se_play("Audio/SE/003-System03", 100, 100)
			if $privateCellWindow != nil
				$privateCellWindow.dispose()
				$privateCellWindow = nil
			end
			return
		elsif !@conversationStack.nil? && @conversationStack.length <= 0 #if the conversation stack is empty, load a new one
			
      
    
      @action = action.dup
			if action != 'intro' #If it's not the intro being run - Kendrian
				Audio.se_play("Audio/SE/002-System02", 100, 100)
			  #$game_system.se_play("002-System02")
			end
			mood = getMood
			#@disposition = 2
			if action != 'tickle' then
				@tickle_level = 0
			end
			
			case action
				when 'intro'
				#@conversationStack = @dialogue['intro'][@disposition-1][mood[0]].clone
				@conversationStack = getDialogue('intro',mood[0],@@saved[@tag]['disposition']-1)
				when 'speak'
				if !@speechCount.nil? && @speechCount >= @dialogue['speak'].length # if the player has already exhausted all conversation options, loop around
					@speechCount = 0
				end
				
				@conversationStack = @dialogue['speak'][@speechCount].clone
				@speechCount = @speechCount + 1
				
				decreaseEmotion('anger')
				decreaseEmotion('shyness')
				decreaseEmotion('sadness')
				decreaseEmotion('fear')
				when 'charm'
				#@conversationStack = @dialogue['charm'][@disposition-1][mood[0]].clone
				@conversationStack = getDialogue('charm',mood[0],@@saved[@tag]['disposition']-1)
				decreaseEmotion('anger')
				decreaseEmotion('sadness')
				decreaseEmotion('fear')
				increaseEmotion('happiness')
				increaseEmotion('shyness')
				when 'compliment' #redirect to charm
				#@conversationStack = @dialogue['charm'][@@saved[@tag]['disposition']-1][mood[0]].clone
				@conversationStack = getDialogue('charm',mood[0],@@saved[@tag]['disposition']-1)
				decreaseEmotion('anger')
				decreaseEmotion('sadness')
				decreaseEmotion('fear')
				increaseEmotion('happiness')
				when 'insult'
				#@conversationStack = @dialogue['insult'][@@saved[@tag]['disposition']-1][mood[0]].clone
				@conversationStack = getDialogue('insult',mood[0],@@saved[@tag]['disposition']-1)
				increaseEmotion('anger')
				decreaseEmotion('shyness')
				decreaseEmotion('happiness')
				when 'threaten'
				#@conversationStack = @dialogue['threaten'][@@saved[@tag]['disposition']-1][mood[0]].clone
				@conversationStack = getDialogue('threaten',mood[0],@@saved[@tag]['disposition']-1)
				decreaseEmotion('happiness')
				increaseEmotion('sadness')
				increaseEmotion('fear')
				when 'hit' #redirect to slap
				#@conversationStack = @dialogue['slap'][@@saved[@tag]['disposition']-1][mood[0]].clone
				@conversationStack = getDialogue('slap',mood[0],@@saved[@tag]['disposition']-1)
				if @@saved[@tag]['disposition'] >= @masochism
					increaseEmotion('happiness')
					increaseEmotion('shyness')
					decreaseEmotion('fear')
					decreaseEmotion('sadness')
					decreaseEmotion('anger')
				else
					decreaseEmotion('happiness')
					decreaseEmotion('shyness')
					increaseEmotion('fear')
					increaseEmotion('sadness')
					increaseEmotion('anger')
				end
				when 'slap'
				#@conversationStack = @dialogue['slap'][@@saved[@tag]['disposition']-1][mood[0]].clone
				@conversationStack = getDialogue('slap',mood[0],@@saved[@tag]['disposition']-1)
				if @@saved[@tag]['disposition'] >= @masochism
					increaseEmotion('happiness')
					increaseEmotion('shyness')
					decreaseEmotion('fear')
					decreaseEmotion('sadness')
					decreaseEmotion('anger')
				else
					decreaseEmotion('happiness')
					decreaseEmotion('shyness')
					increaseEmotion('fear')
					increaseEmotion('sadness')
					increaseEmotion('anger')
				end
				when 'kiss'
				#@conversationStack = @dialogue['kiss'][@@saved[@tag]['disposition']-1][mood[0]].clone
				@conversationStack = getDialogue('kiss',mood[0],@@saved[@tag]['disposition']-1)
        if @@saved[@tag]['disposition'] >= @homophilia
					increaseEmotion('happiness')
					increaseEmotion('shyness')
					decreaseEmotion('fear')
					decreaseEmotion('sadness')
					decreaseEmotion('anger')
				else
					decreaseEmotion('happiness')
					increaseEmotion('shyness')
					increaseEmotion('fear')
					increaseEmotion('anger')
				end
				when 'tickle'
        if @ticklish
          if (rand(2) == 1) then
            #1 eyes closed, brows, 2 smile, 3 big smile, 4 tears
            @tickle_level = [ticklelevel? + 1,4].min
          end
          @last_tickle = Time.new.to_i
        end
				#@conversationStack = @dialogue['tickle'][@@saved[@tag]['disposition']-1][mood[0]].clone
				@conversationStack = getDialogue('tickle',mood[0],@@saved[@tag]['disposition']-1)
				when 'overhead'
				@position = "behind_head"
				@conversationStack = @dialogue['head'][@@saved[@tag]['disposition']-1][mood[0]].clone
				increaseEmotion('anger')
				increaseEmotion('shyness')
				decreaseEmotion('happiness')
				when 'behind_back'
				@position = "behind_back"
				@conversationStack = @dialogue['back'][@@saved[@tag]['disposition']-1][mood[0]].clone
				increaseEmotion('anger')
				increaseEmotion('shyness')
				decreaseEmotion('happiness')
				when 'front'
				@position = "front"
				@conversationStack = @dialogue['front'][@@saved[@tag]['disposition']-1][mood[0]].clone
				increaseEmotion('anger')
				increaseEmotion('shyness')
				decreaseEmotion('happiness')
				when 'blindfold'
				@@saved[@tag]['blindfold'] = !@@saved[@tag]['blindfold']
				if @@saved[@tag]['blindfold']
					increaseEmotion('fear')
					decreaseEmotion('happiness')
					#@conversationStack = @dialogue['blindfold_on'][@@saved[@tag]['disposition']-1][mood[0]].clone
					@conversationStack = getDialogue('blindfold_on',mood[0],@@saved[@tag]['disposition']-1)
				else
					decreaseEmotion('fear')
					increaseEmotion('happiness')
					#@conversationStack = @dialogue['blindfold_off'][@@saved[@tag]['disposition']-1][mood[0]].clone
					@conversationStack = getDialogue('blindfold_off',mood[0],@@saved[@tag]['disposition']-1)
				end
				when 'clothgag'
				#@conversationStack = @dialogue['gag'][@@saved[@tag]['disposition']-1][mood[0]].clone
				@conversationStack = getDialogue('gag',mood[0],@@saved[@tag]['disposition']-1)
				increaseEmotion('anger')
				increaseEmotion('shyness')
				decreaseEmotion('happiness')
				@@saved[@tag]['gag'] = 'cloth'
				when 'cleavegag'
				#@conversationStack = @dialogue['gag'][@@saved[@tag]['disposition']-1][mood[0]].clone
				@conversationStack = getDialogue('gag',mood[0],@@saved[@tag]['disposition']-1)
				increaseEmotion('anger')
				increaseEmotion('shyness')
				decreaseEmotion('happiness')
				@@saved[@tag]['gag'] = 'cleave'
				when 'knotgag'
				#@conversationStack = @dialogue['gag'][@@saved[@tag]['disposition']-1][mood[0]].clone
				@conversationStack = getDialogue('gag',mood[0],@@saved[@tag]['disposition']-1)
				increaseEmotion('anger')
				increaseEmotion('shyness')
				decreaseEmotion('happiness')
				@@saved[@tag]['gag'] = 'knot'
				when 'otngag'
				#@conversationStack = @dialogue['gag'][@@saved[@tag]['disposition']-1][mood[0]].clone
				@conversationStack = getDialogue('gag',mood[0],@@saved[@tag]['disposition']-1)
				increaseEmotion('anger')
				increaseEmotion('shyness')
				decreaseEmotion('happiness')
				@@saved[@tag]['gag'] = 'otn'
				when 'ballgag'
				#@conversationStack = @dialogue['gag'][@@saved[@tag]['disposition']-1][mood[0]].clone
				@conversationStack = getDialogue('gag',mood[0],@@saved[@tag]['disposition']-1)
				increaseEmotion('anger')
				increaseEmotion('shyness')
				decreaseEmotion('happiness')
				@@saved[@tag]['gag'] = 'ball'
				when 'bitgag'
				#@conversationStack = @dialogue['gag'][@@saved[@tag]['disposition']-1][mood[0]].clone
				@conversationStack = getDialogue('gag',mood[0],@@saved[@tag]['disposition']-1)
				increaseEmotion('anger')
				increaseEmotion('shyness')
				decreaseEmotion('happiness')
        contra = $game_variables[651]
				@@saved[@tag]['gag'] = 'bit'
				when 'ungag'
				#@conversationStack = @dialogue['ungag'][@@saved[@tag]['disposition']-1][mood[0]].clone
				@conversationStack = getDialogue('ungag',mood[0],@@saved[@tag]['disposition']-1)
				decreaseEmotion('anger')
				decreaseEmotion('shyness')
				increaseEmotion('happiness')
				@@saved[@tag]['gag'] = 'ungagged'
				else
					if action[0..5] == 'outfit' && @@saved[@tag]['outfit'] != action
						@@saved[@tag]['outfit'] = action
            
						
						#@conversationStack = @dialogue[@currentOutfit][@@saved[@tag]['disposition']-1][mood[0]].clone
						@conversationStack = getDialogue(@@saved[@tag]['outfit'],mood[0],@@saved[@tag]['disposition']-1)
						outfitEffect
          elsif action[0..2]=='acc'
            case $game_variables[94]
            when 0
              if @images['base'].has_key?('outfitdefault') &&  @@saved[@tag]['outfit']!= 'outfitdefault'
                @@saved[@tag]['outfit'] = 'outfitdefault'
                @conversationStack = getDialogue(@@saved[@tag]['outfit'],mood[0],@@saved[@tag]['disposition']-1)
                outfitEffect
              end
            when 1
              if @images['base'].has_key?('outfit1') &&  @@saved[@tag]['outfit']!= 'outfit1'
                @@saved[@tag]['outfit'] = 'outfit1'
                @conversationStack = getDialogue(@@saved[@tag]['outfit'],mood[0],@@saved[@tag]['disposition']-1)
                outfitEffect
              end
            when 2
              if @images['base'].has_key?('outfit1') &&  @@saved[@tag]['outfit']!= 'outfit2'
                @@saved[@tag]['outfit'] = 'outfit2'
                @conversationStack = getDialogue(@@saved[@tag]['outfit'],mood[0],@@saved[@tag]['disposition']-1)
                outfitEffect
              end
            end
           
            outfit = @@saved[@tag]['outfit']
            if !@@saved[@tag]['accessories'].has_key?(outfit)
              @@saved[@tag]['accessories'][outfit] = {}
            end
            if !@@saved[@tag]['accessories'][outfit].has_key?(action)
              @@saved[@tag]['accessories'][outfit][action] = true
            else
                @@saved[@tag]['accessories'][outfit][action] = ! @@saved[@tag]['accessories'][outfit][action]
            end
          elsif action[0..3]='sgag'
            if @images['mouth'].has_key?(action)
              @conversationStack = getDialogue('gag',mood[0],@@saved[@tag]['disposition']-1)
              increaseEmotion('anger')
              increaseEmotion('shyness')
              decreaseEmotion('happiness')
              @@saved[@tag]['gag'] = action
            end
          end
        end
      end
      if getMood[0] != oldmood
        reportMoodChange
      end
    if $game_switches[124] == true
      @conversationStack = [] #Disables dialogue - Kendrian
      if @@saved[@tag]['gag'] != 'ungagged' then mmph
      end
    end
    
		if @conversationStack.length > 0
			$game_variables[425] = 1
			dia = @conversationStack.shift
			if @conversationStack.length <= 0
				@lastInConvo = true
			end
			@talking = false
			#check talking
			message = dia['text'].clone
    
			if dia.has_key?('talking') && dia['talking']
				@talking = true
				if @@saved[@tag]['gag'] != 'ungagged' then
					mmph()
          @lastInConvo = true
					iter = 0
					if message.index(':') then
						iter = message.index(':') + 1
					end
					gagtalk = ['m','n','g','f','r','h']
					for i in iter..message.length-1 do
						if message[i,1].match(/^[[:alpha:]]$/)
							message[i] = gagtalk[rand(gagtalk.length)]
						end
					end
				end
			end
			#execute the attached script
			if dia.has_key?('proc') && dia['proc'] != nil
				dia['proc'].call
			end
			#wSay the dialogue
			if $privateCellWindow != nil
				$privateCellWindow.dispose()
				$privateCellWindow = nil
			end
			wSay(message,"")
			#if dia.has_key?('text') && dia['text'].include?("\\n")
				#lines = dia['text'].split("\\n")
				#wSay(lines[0],lines[1])
			#else
				#wSay(dia['text'],"")
			#end
		end
    saveVars
	end
 
	def eye_status
		blink_duration = 200
		avg_between_blinks = 4000
		time = (Time.new.to_f * 1000).round
		seed = [41,62,47,21,85,31,90,95,26,16,34,33,37,10,90,7,12,37,37,11,67,35,75,23,37] #pre-generated random numbers
		blocksize = avg_between_blinks + blink_duration
		blocknum = (time / blocksize).round #apparently, integer division is the default
    
		blinkstart = (seed[blocknum % seed.length] / 100.0) * blocksize + blocknum * blocksize

    #norm-norm,norm-left,left-norm
    case blocknum % 3
      when 0
        eyedart = false
      when 1
        eyedart = time > blinkstart
      else
        eyedart = time <= blinkstart
    end
   
 
		if time >= blinkstart && time <= blinkstart + blink_duration
			#print "blink" blinkstart % 2?
			return [true,eyedart]
		else
			#print "start: " + blinkstart.to_s + " end: " + (blinkstart+blink_duration).to_s + "time: " + time.to_s 
			return [false,eyedart]
		end
	end
  def blinking?
    return eye_status[0]
  end
  def outfitEffect
	#placeholder
	Audio.se_play(["Audio/SE/CanvasTent.mp3","Audio/SE/ClothRustle.mp3"][rand(2)], 100, 100)
  end
  
	def ticklelevel?
		time = Time.new.to_i
		wearoff = ((time - @last_tickle) / 5).floor
		return [0,@tickle_level -wearoff].max
	end
	def mouth_open?
		if !@talking
			return false
		end
		time = (Time.new.to_f * 1000).round
		return time / 500 % 2 == 1
	end
  def generateBase (mood,tickle)
    commandArray = []
    if (@images['base'].has_key?(@@saved[@tag]['outfit']))
		commandArray.push(@images['base'][@@saved[@tag]['outfit']])
	elsif (@images['base'].has_key?('back'))
		commandArray.push(@images['base']['back'])
	else
		commandArray.push(@images['base']['outfitdefault'])
    end
  
	return commandArray
  end
   
  def generateEyes (mood,tickle)
    commandArray = []
    if @@saved[@tag]['blindfold'] then
			commandArray.push(@images['eyes']['blindfold'])
    elsif @face_override['eyes'] && !blinking?
      commandArray.push(@images['eyes'][@face_override['eyes']])
    elsif @face_override['eyes_closed'] && blinking?
      commandArray.push(@images['eyes'][@face_override['eyes_closed']])
		elsif tickle >= 1
			commandArray.push(@images['eyes']['tickle'])
		elsif blinking?
			commandArray.push(@images['eyes']['blink'])
    elsif (mood[0] == 'shyness' || mood[1] == 'shyness') && !eye_status[1]
      commandArray.push(@images['eyes']['left'])
    else
			commandArray.push(@images['eyes']['normal1'])
		end
    return commandArray
  end
  def generateBrows (mood,tickle)
    commandArray=[]
    if @face_override['brows']
      commandArray.push(@images['brow'][@face_override['brows']])
    elsif tickle >= 1 then
			commandArray.push(@images['brow']['tickle'])
		elsif mood[0] == 'fear' || mood[0] == 'sadness'
			commandArray.push(@images['brow']['worry'])
		elsif mood[0] == 'anger' && mood[1] == 'anger'
			commandArray.push(@images['brow']['annoy2'])
		elsif mood[0] == 'anger'
			commandArray.push(@images['brow']['annoy1'])
		else
			commandArray.push(@images['brow']['normal'])
		end
    return commandArray
  end
  
  def generateMouth (mood,tickle)
    commandArray = []
    if @@saved[@tag]['gag'] == 'ungagged'
      if @face_override['mouth'] && !mouth_open?
        commandArray.push(@images['mouth'][@face_override['mouth']])
      elsif @face_override['mouth_open'] && mouth_open?
        commandArray.push(@images['mouth'][@face_override['mouth_open']])
			elsif mouth_open? && tickle >= 3
				commandArray.push(@images['mouth']['tickle'])
			elsif mouth_open? then
				commandArray.push(@images['mouth']['annoy1'])
			elsif tickle >= 2 || mood[0] == 'happiness'
				commandArray.push(@images['mouth']['smile'])
			elsif mood[0]=='anger'
				commandArray.push(@images['mouth']['annoy2'])
			else
				commandArray.push(@images['mouth']['neutral'])
			end
		else
			commandArray.push(@images['mouth'][@@saved[@tag]['gag']])
		end
    return commandArray
  end
  def generateAccessories (mood,tickle)
    commandArray = []
    outfit = @@saved[@tag]['outfit']
    if @@saved[@tag]['accessories'].has_key?(outfit) && @images.has_key?('accessories') && @images['accessories'].has_key?(outfit)
      @@saved[@tag]['accessories'][outfit].each do |key,val|
        if  @images['accessories'][outfit].has_key?(key) && key[0..2]=='acc' && val
          commandArray.push(@images['accessories'][outfit][key])
        end
      end
    end
    return commandArray
  end
  def generateMisc (mood,tickle)
    commandArray = []
    if @face_override['blush']
      if @face_override['blush'] == 1
        commandArray.push(@images['misc']['blush1'])
      elsif @face_override['blush'] == 2
        commandArray.push(@images['misc']['blush2'])
        commandArray.push(@images['misc']['blush1'])
      end
    elsif mood[0] == 'shyness'
			commandArray.push(@images['misc']['blush2'])
      commandArray.push(@images['misc']['blush1'])
		elsif mood[1] == 'shyness'
      commandArray.push(@images['misc']['blush1'])
    end
    if @face_override['tears']
      if @face_override['tears'] == 'yes' # if no, it will override anyway
        commandArray.push(@images['misc']['tears'])
      end
		elsif tickle >= 4 || mood[0] == 'sadness'
			commandArray.push(@images['misc']['tears'])
		end
    return commandArray
  end
	def regeneratePicture
		endEvent = $data_common_events[96].list[$data_common_events[96].list.length] #there seems to be hidden event marking the end of the CE, and it won't run without it
		commandArray = []
		#for c1 in 30..38
			#commandArray.push(RPG::EventCommand.new(235,235,[c1]))
		#end
		
		mood = getMood
		tickle = ticklelevel?
    
		#position
		commandArray.push(*generateBase(mood,tickle))
		#eyes
		commandArray.push(*generateEyes(mood,tickle))
		#brows
		commandArray.push(*generateBrows(mood,tickle))
		#mouth and gag
		commandArray.push(*generateMouth(mood,tickle))
		#accessories
		commandArray.push(*generateAccessories(mood,tickle))
		#misc (blush and tears
		commandArray.push(*generateMisc(mood,tickle))
    
		#commandArray.push(endEvent)
    if $override_pic['pc_canvas'].disposed? 
      $override_pic['pc_canvas'] = Bitmap.new(640,480)
    end
    $override_pic['pc_canvas'].clear
		#draw to $override_pic['pc_canvas']
		commandArray.sort! do |a,b|
      a[0] - b[0]
    end
		commandArray.each do |command|
			pic = RPG::Cache.picture(command[1])
			$override_pic['pc_canvas'].blt(command[4],command[5],pic,Rect.new(0,0,pic.width,pic.height))
		end
    #$override_pic['pc_canvas'] = RPG::Cache.picture('PCEstherBase')
    message = getMessage
    if message['message'] != ''
      opacity = 255 *  ((@textime- (Time.now.tv_sec - message['active'])).to_f / @textime)
      #if opacity > 255 
        #opacity = 255
      #end
      bitm = Bitmap.new(350,60)
      bitm.draw_text(0,0,350,60,message['message'])
      $override_pic['pc_canvas'].blt(0,0,bitm,bitm.rect,opacity)
   end
		#still need this to display pc_canvas
		$data_common_events[96].list = [RPG::EventCommand.new(231,231,[30,'pc_canvas',0,0,0,0,100,100,255,0]),endEvent]
  end
end


