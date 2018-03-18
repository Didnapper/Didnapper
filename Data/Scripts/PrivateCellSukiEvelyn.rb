#need to try inserting text event into stack
#[image number, name, origin,appointment method?(0 for direct),x,y,zoomx,zoomy,opacity,blend_type]

class PrivateCellDamselSukiEvy < PrivateCellDamsel
	def mmph
    mood = getMood
		tickle = ticklelevel?
		if tickle >= 1 #tickle
			Audio.se_play(["Audio/SE/gagtalk3.mp3","Audio/SE/Laughing mmmmhhhh.mp3"][rand(2)], 100, 100)
		elsif @action == 'speak'
      Audio.se_play("Audio/SE/Laughing mmmmhhhh.mp3", 100, 100)
    elsif @action == 'ungag'
      Audio.se_play("Audio/SE/Light mmphf 7", 100, 100)
    elsif @action == 'clothgag'
      Audio.se_play(["Audio/SE/Light mmphf 7","Audio/SE/Light mmphf 8"][rand(2)], 100, 100)
    elsif mood[0] == 'fear'
			Audio.se_play("Audio/SE/gagtalk4.mp3", 100, 100)
		elsif mood[0] == 'anger'
			Audio.se_play("Audio/SE/gagtalk4.mp3", 100, 100)
		elsif mood[0] == 'happiness'
			Audio.se_play("Audio/SE/Laughing mmmmhhhh.mp3", 100, 100)
		elsif mood[0] == 'sadness'
			Audio.se_play("Audio/SE/mediummmmph3", 100, 100)
		elsif mood[0] == 'shyness'
			Audio.se_play("Audio/SE/Light mmphf 8", 100, 100)
    else #default
      Audio.se_play("Audio/SE/mediummmmph3", 100, 100)
		end
	end
	def initialize
    @tag = 'sukiEvy'
		super()
		#personality
		@emotions['anger'] = [3,0]
		@emotions['happiness'] = [5,0]
		@emotions['shyness'] = [4,0]
		@emotions['sadness'] = [7,0]
		@emotions['fear'] = [2,0]
    #currently unused
    @homophilia = 2 #0-5, where 0 is max and 5 is not at all, relative to disposition
		@masochism = -1
		
		
		@disposition = 3
		@disposition_index = 651
		@disposition_min = 3
		
		#bases
		list = {'outfitdefault' => [30,'PCSuki_handsbehind',0,0,0,0,100,100,255,0],'outfit1'=> [30,'PCSuki_maid',0,0,0,0,100,100,255,0],'outfit2'=> [30,'PCSuki_bikini',0,0,0,0,100,100,255,0],'outfit3'=> [30,'PCSuki_princess',0,0,0,0,100,100,255,0],'outfit4'=> [30,'PCSuki_bunnygirl',0,0,0,0,100,100,255,0],'outfit5'=> [30,'PCSuki_wedding',0,0,0,0,100,100,255,0]}
		@images['base'] = list
		
		#brows
		list = {'annoy1' => [32,'PCSuki_browannoy1',0,0,0,0,100,100,255,0],'annoy2'=> [32,'PCSuki_browannoy2',0,0,0,0,100,100,255,0], 'normal' => [32,'PCSuki_brownormal',0,0,0,0,100,100,255,0]}
		list = list.merge({'tickle' => [32,'PCSuki_browtickle',0,0,0,0,100,100,255,0],'worry' => [32,'PCSuki_browworried',0,0,0,0,100,100,255,0]})
		@images['brow'] = list
		
		#mouths and gags
		list = {'annoy1' => [34,'PCSuki_mouthannoy1',0,0,0,0,100,100,255,0],'annoy2'=> [34,'PCSuki_mouthannoy2',0,0,0,0,100,100,255,0], 'neutral' => [34,'PCSuki_mouthneutral',0,0,0,0,100,100,255,0]}
		list = list.merge({'tickle' => [34,'PCSuki_mouthtickle',0,0,0,0,100,100,255,0],'smile' => [34,'PCSuki_mouthsmile1',0,0,0,0,100,100,255,0]})
		list = list.merge({'ball' => [34,'PCSuki_gagball',0,0,0,0,100,100,255,0],'bit' => [34,'PCSuki_gagbit',0,0,0,0,100,100,255,0],'cleave' => [34,'PCSuki_gagcleave',0,0,0,0,100,100,255,0]})
		list = list.merge({'cloth' => [34,'PCSuki_gagotm',0,0,0,0,100,100,255,0],'knot' => [34,'PCSuki_gagknot',0,0,0,0,100,100,255,0],'otn' => [34,'PCSuki_gagotn',0,0,0,0,100,100,255,0]})
    list = list.merge({'sgag1' => [34,'PCSuki_gagtape',0,0,0,0,100,100,255,0],'sgag2' => [34,'PCSuki_gagsock',0,0,0,0,100,100,255,0]})
		@images['mouth'] = list
		
		#eyes and blindfold
		list = {'blindfold' => [36,'PCSuki_blindfold',0,0,0,0,100,100,255,0],'blink' => [33,'PCSuki_eyeblink',0,0,0,0,100,100,255,0]}
		list = list.merge({'normal1' => [33,'PCSuki_eyenormal',0,0,0,0,100,100,255,0],'normal2' => [33,'PCSuki_eyenormal2',0,0,0,0,100,100,255,0]})
		list = list.merge({'right' => [33,'PCSuki_eyeright',0,0,0,0,100,100,255,0],'left' => [33,'PCSuki_eyeleft',0,0,0,0,100,100,255,0]})
		list = list.merge({'tickle' => [33,'PCSuki_eyetickle',0,0,0,0,100,100,255,0],'happy' => [33,'PCSuki_eyehappy',0,0,0,0,100,100,255,0]})
		@images['eyes'] = list
		
    #accessories
    @images['accessories'] = {}
    list = {'acc1' => [31,'PCSuki_maidapron',0,0,0,0,100,100,255,0]}
    @images['accessories']['outfit1'] = list
    list = {'acc1' => [31,'PCSuki_acc1',0,0,0,0,100,100,255,0],'acc2'=>[37,'PCSuki_acc2',0,0,0,0,100,100,255,0]}
    @images['accessories']['outfit2'] = list
    list = {'acc1' => [31,'PCSuki_bunnygirlacc1',0,0,0,0,100,100,255,0],'acc2'=>[37,'PCSuki_bunnygirlacc2',0,0,0,0,100,100,255,0]}
    @images['accessories']['outfit4'] = list

    
		#misc
		list = {'blush1' => [31,'PCSuki_blush',0,0,0,0,100,100,255,0],'blush2' => [31,'PCSuki_blush',0,0,0,0,100,100,255,0],'tears' => [35,'PCSuki_tears',0,0,0,0,100,100,255,0]}
		@images['misc'] = list
		
    #To force a certain face, simply replace nil in proc with method(:face_facename). Supported facenames can be found in Face Library.
    
		testIntro = [{'text'=>"This is line 1","proc"=>nil},{'text'=>"This is line 2","proc"=>nil}]
		
		#"speak" dialogue
		@dialogue['speak'] = []
		diaArray = []
		diaArray.push({'text'=>'Evelyn: I rarely come here, except when you tied me up...','proc'=>method(:face_shy)})
		diaArray.push({'text'=>'Suki1: Indeed...How do you feel?','proc'=>method(:face_annoyed),'talking'=>true})
		diaArray.push({'text'=>'Evelyn: A little bit embarrassed...','proc'=>nil})
		diaArray.push({'text'=>'Suki1: You don’t have to, if you want you can untie me now','proc'=>nil})
		diaArray.push({'text'=>'Evelyn: I’m embarassed but not fool, I will get used to all this bondage thing','proc'=>nil,'talking'=>true})
		diaArray.push({'text'=>'Suki1: Crap,I would have tried...','proc'=>nil})
		@dialogue['speak'].push(diaArray)
		
		diaArray = []
		diaArray.push({'text'=>'Evelyn: So...what I’m going to do to you...','proc'=>method(:face_shy)})
		diaArray.push({'text'=>'Suki1: Come on Evelyn, you don’t have any idea what to do with a all tied up girl ?','proc'=>method(:face_annoyed),'talking'=>true})
		diaArray.push({'text'=>'Evelyn: When you bring me here, you tickle me, kiss me, slap me, blindfold me ans try different type of gag on me...','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Hum..hum...Yes but I still untie you at the end, don’t you want to try this ?','proc'=>nil})
		diaArray.push({'text'=>'Evelyn: Shut up or a will firstly try gags on you','proc'=>nil,'talking'=>true})
		diaArray.push({'text'=>'Suki1: Well well...','proc'=>nil})
		@dialogue['speak'].push(diaArray)
		
		diaArray = []
		diaArray.push({'text'=>'Carol: You know, back when I was just an ordinary thief, I could always squirm out of the ropes whenever I was caught and tied up…','proc'=>nil})
		diaArray.push({'text'=>'Carol: I thought I was good at it, but… travelling with you,','proc'=>nil})
		diaArray.push({'text'=>'I’ve learned that the people tying me up before just sucked at it.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Well… I can confirm that you’re a lot better at tying than they were. I really can’t move much at all.','proc'=>nil,'talking'=>true})
		diaArray.push({'text'=>'Carol: I’ve learned a lot, being around you. I hope you don’t mind if I stick around!','proc'=>nil})
		@dialogue['speak'].push(diaArray)
		
		diaArray = []
		diaArray.push({'text'=>'Carol: You really are too cute for this line of work.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: W-what do you mean?','proc'=>nil,'talking'=>true})
		diaArray.push({'text'=>'Carol: Skulking around dungeons like this, beating up guards and spiriting girls away…','proc'=>nil})
		diaArray.push({'text'=>'Carol: Someone who gets kidnapped a lot, instead of doing the kidnapping!','proc'=>nil})
		diaArray.push({'text'=>'Suki1: …Wait, what?','proc'=>nil,'talking'=>true})
		diaArray.push({'text'=>'Carol: Someone who gets kidnapped a lot, instead of doing the kidnapping!','proc'=>nil})
		diaArray.push({'text'=>'Carol: Think about it! That way, you’d end up like this more often, and I’d be way more into the kidnapper career myself…','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Hehe… you say some strange things sometimes.','proc'=>nil,'talking'=>true})
		@dialogue['speak'].push(diaArray)

		#--------------------------------------------------
		#threaten dialogue
		#--------------------------------------------------
		@dialogue['threaten'] = []
		
		# 1/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['threaten'][0] = emoHash
		
		# 2/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['threaten'][1] = emoHash
		
		# 3/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: I’m going to hogtie you so tight your whole body will arch backward. Sound like fun?','proc'=>nil})
		diaArray.push({'text'=>'Suki1: You’re taking this a little too seriously, Carol!','proc'=>nil,'talking'=>true})
		diaArray.push({'text'=>'Carol: Well, you got yourself caught, so you’re going to have to suck it up!','proc'=>nil})
		emoHash['happiness'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: Ooh, I know! I should take you out of your cell like this and show you off to the other prisoners!','proc'=>nil})
		diaArray.push({'text'=>'Suki1: What?! No! Please don’t!','proc'=>nil,'talking'=>true})
		diaArray.push({'text'=>'Carol: Aww. You’re cute when you’re all scared and flustered. I’ll bet they’d love to see you like this…','proc'=>nil})
		emoHash['shyness'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: If you’re going to look so down,I’ll give you a reason to.','proc'=>nil})
		diaArray.push({'text'=>'Carol: Maybe I should get that pretty blonde guard in here…','proc'=>nil})
		diaArray.push({'text'=>'Carol: Your voice is shaking. Not so sure of that, huh?','proc'=>nil})
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: Hey! If you’re gonna squirm around that much, I’m gonna need some more rope!','proc'=>nil})
		diaArray.push({'text'=>'Carol: I read about how to suspend a girl from the ceiling…','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Wh-what?! That’s a little too much!','proc'=>nil,'talking'=>true})
		emoHash['neutral'] = diaArray
		
		@dialogue['threaten'][2] = emoHash
		
		# 4/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: Tell me, how scary do you think it’d be to be blindfolded and gagged and left here alone all night long?','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Ah…','proc'=>nil,'talking'=>true})
		diaArray.push({'text'=>'Carol: All by yourself, helpless, in a place like THIS?','proc'=>nil})
		diaArray.push({'text'=>'Suki1: D-don’t… not that…','proc'=>nil,'talking'=>true})
		emoHash['happiness'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: If you’re that embarrassed, I could hide your whole face for you. I’m sure I saw a hood around here somewhere…','proc'=>nil})
		diaArray.push({'text'=>'Suki1: No! That’s really not necessary!','proc'=>nil,'talking'=>true})
		emoHash['shyness'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: This cell is way too big for one girl. I’m sure I saw a broom closet on the way here…','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Huh? I… I don’t like small spaces…','proc'=>nil,'talking'=>true})
		diaArray.push({'text'=>'Carol: Oh, don’t be silly. After a few hours locked in there, you’ll get used to it. ','proc'=>nil})
		diaArray.push({'text'=>'Suki1: N-no…','proc'=>nil,'talking'=>true})
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: So, do you think the guild would miss you if I kept you like this for…oh, say a whole week?','proc'=>nil})
		diaArray.push({'text'=>'Suki1: You can’t do that!','proc'=>nil,'talking'=>true})
		emoHash['neutral'] = diaArray
		
		@dialogue['threaten'][3] = emoHash
		
		#--------------------------------------------------
		#charm dialogue
		#--------------------------------------------------
		@dialogue['charm'] = []
		
		# 1/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['charm'][0] = emoHash
		
		# 2/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['charm'][1] = emoHash
		
		# 3/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: Ooh, I love it when you smile like that. You should do it more often.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: I’ll smile all you want if you untie me…','proc'=>nil,'talking'=>true})
		diaArray.push({'text'=>'Carol: Whoa, let’s not go crazy here.','proc'=>nil})
		emoHash['happiness'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: You’re adorable when you’re all flustered like this.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Y-you’re teasing me…','proc'=>nil,'talking'=>true})
		diaArray.push({'text'=>'Carol: Well, yeah.','proc'=>nil})
		diaArray.push({'text'=>'Carol: That doesn’t mean it’s not true.','proc'=>nil})
		emoHash['shyness'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: Hey! Smile for me once in a while.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: But you…','proc'=>nil,'talking'=>true})
		diaArray.push({'text'=>'Carol: I’m sorry. I was only playing with you.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: W-well…','proc'=>nil,'talking'=>true})
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: Y’know, you are way too cute to be hanging out with these creeps.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Huh?! U-um…','proc'=>nil,'talking'=>true})
		diaArray.push({'text'=>'Carol: Aww, you’re blushing for me?','proc'=>nil})
		emoHash['neutral'] = diaArray
		
		
		@dialogue['charm'][2] = emoHash
		
		# 4/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: Seeing that smile of yours is almost reason enough for me to avoid gagging you.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Almost?','proc'=>nil,'talking'=>true})
		diaArray.push({'text'=>'Carol: Well, yeah. I’ve got to gag you sometimes. You look pretty that way, too.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: I don’t know whether to be happy about that or not… ','proc'=>nil,'talking'=>true})
		emoHash['happiness'] = diaArray

		
		diaArray = []
		diaArray.push({'text'=>'Carol: Wow, you’re really blushing up a storm, huh?','proc'=>nil})
		diaArray.push({'text'=>'Suki1: I-I can’t help it!','proc'=>nil,'talking'=>true})
		diaArray.push({'text'=>'Carol: I know! That’s what makes it so cute.','proc'=>nil})
		emoHash['shyness'] = diaArray
		

		
		diaArray = []
		diaArray.push({'text'=>'Carol: Aww, cheer up. I can’t stand seeing you looking all mopey.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Ah… but…','proc'=>nil,'talking'=>true})
		diaArray.push({'text'=>'Carol: C’mon. You’re too pretty for that.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Carol…','proc'=>nil,'talking'=>true})
		emoHash['sadness'] = diaArray
		

		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: A pretty girl, just my type, into tying other girls up… I really hit the jackpot with you, didn’t I?','proc'=>nil})
		diaArray.push({'text'=>'Suki1: You truly think that way about me?','proc'=>nil,'talking'=>true})
		diaArray.push({'text'=>'Carol: Yup! You’re perfect.','proc'=>nil})
		emoHash['neutral'] = diaArray
		


		
		@dialogue['charm'][3] = emoHash
		#--------------------------------------------------
		#slap dialogue
		#--------------------------------------------------
		@dialogue['slap'] = []
		
		# 1/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['slap'][0] = emoHash
		
		# 2/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['slap'][1] = emoHash
		
		# 3/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: You haven’t been a good girl…','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Ngh…','proc'=>nil,'talking'=>true})
		emoHash['happiness'] = diaArray
		
		
		diaArray = []
		diaArray.push({'text'=>'Carol: You haven’t been a good girl…','proc'=>nil})
		diaArray.push({'text'=>'Suki1: S-stop…','proc'=>nil,'talking'=>true})
		emoHash['shyness'] = diaArray

		
		diaArray = []
		diaArray.push({'text'=>'Carol: You haven’t been a good girl…','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Ahh…','proc'=>nil,'talking'=>true})
		emoHash['sadness'] = diaArray
		
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: You haven’t been a good girl…','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Oww!','proc'=>nil,'talking'=>true})
		emoHash['neutral'] = diaArray

		
		@dialogue['slap'][2] = emoHash
		
		# 4/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: You haven’t been a good girl…','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Oww! Wh-what?!','proc'=>nil,'talking'=>true})
		emoHash['happiness'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: You haven’t been a good girl…','proc'=>nil})
		diaArray.push({'text'=>'Suki1: A-ahh!','proc'=>nil,'talking'=>true})
		emoHash['shyness'] = diaArray
		
		
		diaArray = []
		diaArray.push({'text'=>'Carol: You haven’t been a good girl…','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Ugh…','proc'=>nil,'talking'=>true})
		emoHash['sadness'] = diaArray
		
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: You haven’t been a good girl…','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Ahh! C-Carol!','proc'=>nil,'talking'=>true})
		emoHash['neutral'] = diaArray
		
		
		@dialogue['slap'][3] = emoHash
		#--------------------------------------------------
		#kiss dialogue
		#--------------------------------------------------
		@dialogue['kiss'] = []
		
		# 1/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['kiss'][0] = emoHash
		
		# 2/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['kiss'][1] = emoHash
		
		# 3/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: C’mere…','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Wh-?! M-mmm…','proc'=>nil,'talking'=>true})
		emoHash['happiness'] = diaArray
		
		
		diaArray = []
		diaArray.push({'text'=>'Carol: C’mere…','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Mmmm?!','proc'=>nil,'talking'=>true})
		emoHash['shyness'] = diaArray
		
		
		diaArray = []
		diaArray.push({'text'=>'Carol: C’mere…','proc'=>nil})
		diaArray.push({'text'=>'Suki1: D-don’t… mmmhh…','proc'=>nil,'talking'=>true})
		emoHash['sadness'] = diaArray
		
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: C’mere…','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Huh? Ahh- mmm…','proc'=>nil,'talking'=>true})
		emoHash['neutral'] = diaArray
		

		
		@dialogue['kiss'][2] = emoHash
		
		# 4/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: C’mere…','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Mmm… hehe…','proc'=>nil,'talking'=>true})
		emoHash['happiness'] = diaArray
		

		
		diaArray = []
		diaArray.push({'text'=>'Carol: C’mere…','proc'=>nil})
		diaArray.push({'text'=>'Suki1: H-hey! Ah-mmmm…','proc'=>nil,'talking'=>true})
		emoHash['shyness'] = diaArray

		
		diaArray = []
		diaArray.push({'text'=>'Carol: C’mere…','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Mmhh?!','proc'=>nil,'talking'=>true})
		emoHash['sadness'] = diaArray

		
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: C’mere…','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Mmm…','proc'=>nil,'talking'=>true})
		emoHash['neutral'] = diaArray
		
		
		@dialogue['kiss'][3] = emoHash
		#--------------------------------------------------
		#tickle dialogue
		#--------------------------------------------------
		@dialogue['tickle'] = []
		
		# 1/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['tickle'][0] = emoHash
		
		# 2/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['tickle'][1] = emoHash
		
		# 3/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: I’ve been wanting to do this for a while…','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Ahahaha! C-Carollll! Hahaha!','proc'=>nil,'talking'=>true})
		emoHash['happiness'] = diaArray
		


		
		diaArray = []
		diaArray.push({'text'=>'Carol: I’ve been wanting to do this for a while…','proc'=>nil})
		diaArray.push({'text'=>'Suki1: No! Nonono- ahahah! Hahaha!','proc'=>nil,'talking'=>true})
		emoHash['shyness'] = diaArray
		

		
		diaArray = []
		diaArray.push({'text'=>'Carol: I’ve been wanting to do this for a while…','proc'=>nil})
		diaArray.push({'text'=>'Suki1: I’m not going t-t-to- hahaha! No! Nnnnhahahaha!','proc'=>nil,'talking'=>true})
		emoHash['sadness'] = diaArray
		

		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: I’ve been wanting to do this for a while…','proc'=>nil})
		diaArray.push({'text'=>'Suki1:  What are you- haha! Ahaha-stop-hahaha!','proc'=>nil,'talking'=>true})
		emoHash['neutral'] = diaArray
		


		
		@dialogue['tickle'][2] = emoHash
		
		# 4/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: I’ve been wanting to do this for a while…','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Aaaah! Hahahaha! Hehehe!','proc'=>nil,'talking'=>true})
		emoHash['happiness'] = diaArray


		
		diaArray = []
		diaArray.push({'text'=>'Carol: I’ve been wanting to do this for a while…','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Heeheehahaha! Stop!','proc'=>nil,'talking'=>true})
		emoHash['shyness'] = diaArray



		
		diaArray = []
		diaArray.push({'text'=>'Carol: I’ve been wanting to do this for a while…','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Hehehe! I don’t wannnnahahaha!','proc'=>nil,'talking'=>true})
		emoHash['sadness'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: I’ve been wanting to do this for a while…','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Aaaah! Hahahaha! Hehehe!','proc'=>nil,'talking'=>true})
		emoHash['fear'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: I’ve been wanting to do this for a while…','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Hey! Don’t- hehehehe! S-s-stop!','proc'=>nil,'talking'=>true})
		emoHash['neutral'] = diaArray

		
		@dialogue['tickle'][3] = emoHash
		#--------------------------------------------------
		#insult dialogue
		#--------------------------------------------------
		@dialogue['insult'] = []
		
		# 1/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['insult'][0] = emoHash
		
		# 2/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['insult'][1] = emoHash
		
		# 3/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: It really wasn’t that smart of you, getting caught like this. What if some guard or smelly bandit got the better of you like this?','proc'=>nil})
		diaArray.push({'text'=>'Suki1: I only let down my guard because it was you!','proc'=>nil,'talking'=>true})
		diaArray.push({'text'=>'Carol: Not good enough! You need to sharpen up.','proc'=>nil})
		emoHash['happiness'] = diaArray
		
		
		diaArray = []
		diaArray.push({'text'=>'Carol: Are you going to laze around all day or are you going to try to get out of this?','proc'=>nil})
		diaArray.push({'text'=>'Suki1: I’m trying! It’s just too tight!','proc'=>nil,'talking'=>true})
		diaArray.push({'text'=>'Carol: Is making excuses all that you’re good at?','proc'=>nil})
		diaArray.push({'text'=>'Suki1: I…','proc'=>nil,'talking'=>true})
		emoHash['shyness'] = diaArray
		
		
		diaArray = []
		diaArray.push({'text'=>'Carol: You’re really okay with all this kidnapping of innocent people? You’re not really as nice as you seem, huh?','proc'=>nil})
		diaArray.push({'text'=>'Suki1: I… I do what I have to.','proc'=>nil,'talking'=>true})
		diaArray.push({'text'=>'Carol: Uh-huh. Right. I think you do what you want to.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: …','proc'=>nil})
		emoHash['sadness'] = diaArray
		




		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: I can’t believe you went down so easily. You’re weaker than I thought!','proc'=>nil})
		diaArray.push({'text'=>'Suki1: I just mis-stepped! That’s all!','proc'=>nil,'talking'=>true})
		emoHash['neutral'] = diaArray
		

		
		@dialogue['insult'][2] = emoHash
		
		# 4/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: It’s too bad you’re not as smart as you are pretty.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: H-huh?','proc'=>nil,'talking'=>true})
		diaArray.push({'text'=>'Carol: No wonder you need me to watch your back. Getting yourself all tied up like this by one little thief…','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Ugh…','proc'=>nil,'talking'=>true})
		emoHash['happiness'] = diaArray
		



		
		diaArray = []
		diaArray.push({'text'=>'Carol: So… you’re not so good with tasting your own medicine, huh?','proc'=>nil})
		diaArray.push({'text'=>'Suki1: …','proc'=>nil,'talking'=>true})
		diaArray.push({'text'=>'Carol: Hey, I’d be embarrassed in your situation, too. The kidnapper gets what’s coming to her.','proc'=>nil})
		emoHash['shyness'] = diaArray
		


		
		diaArray = []
		diaArray.push({'text'=>'Carol: Could you try to look less depressing? Being miserable isn’t attractive, y’know.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: …','proc'=>nil})
		emoHash['sadness'] = diaArray
		

		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: I thought the guildmaster’s pet kidnapper would be a little tougher, you know?','proc'=>nil})
		diaArray.push({'text'=>'Suki1: I-I am not a pet!','proc'=>nil,'talking'=>true})
		diaArray.push({'text'=>'Carol: Really? I’m sure we could find you a collar…','proc'=>nil})
		emoHash['neutral'] = diaArray
		


		
		@dialogue['insult'][3] = emoHash
		#--------------------------------------------------
		#default outfit dialogue
		#--------------------------------------------------
		@dialogue['outfitdefault'] = []
		
		# 1/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['outfitdefault'][0] = emoHash
		
		# 2/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['outfitdefault'][1] = emoHash
		
		# 3/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['outfitdefault'][2] = emoHash
		
		# 4/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['outfitdefault'][3] = emoHash
		
		#--------------------------------------------------
		#bikini outfit dialogue
		#--------------------------------------------------
		@dialogue['outfitbikini'] = []
		
		# 1/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['outfitbikini'][0] = emoHash
		
		# 2/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['outfitbikini'][1] = emoHash
		
		# 3/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['outfitbikini'][2] = emoHash
		
		# 4/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['outfitbikini'][3] = emoHash
		
		#--------------------------------------------------
		# blinfold-on dialogue
		#--------------------------------------------------
		
		@dialogue['blindfold_on'] = []
		
		# 1/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['blindfold_on'][0] = emoHash
		
		# 2/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['blindfold_on'][1] = emoHash
		
		# 3/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: Lights out.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Hey! No!','proc'=>nil,'talking'=>true})
		emoHash['happiness'] = diaArray
		

		
		diaArray = []
		diaArray.push({'text'=>'Carol: Lights out.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: T-take it off!','proc'=>nil,'talking'=>true})
		emoHash['shyness'] = diaArray
		


		
		diaArray = []
		diaArray.push({'text'=>'Carol: Lights out.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: What? That’s not fair!','proc'=>nil,'talking'=>true})
		emoHash['sadness'] = diaArray
		


		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: Lights out.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Please take it off…','proc'=>nil,'talking'=>true})
		emoHash['neutral'] = diaArray
		

		
		@dialogue['blindfold_on'][2] = emoHash
		
		# 4/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: Lights out.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Nnnh…','proc'=>nil,'talking'=>true})
		emoHash['happiness'] = diaArray
		

		
		diaArray = []
		diaArray.push({'text'=>'Carol: Lights out.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: There’s no point asking you to take it off, is there?','proc'=>nil,'talking'=>true})
		emoHash['shyness'] = diaArray


		
		diaArray = []
		diaArray.push({'text'=>'Carol: Lights out.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Nooo…','proc'=>nil,'talking'=>true})
		emoHash['sadness'] = diaArray


		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: Lights out.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Please take it off…','proc'=>nil,'talking'=>true})
		emoHash['neutral'] = diaArray


		
		@dialogue['blindfold_on'][3] = emoHash
		
		#--------------------------------------------------
		# blinfold-off dialogue
		#--------------------------------------------------
		@dialogue['blindfold_off'] = []
		
		# 1/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['blindfold_off'][0] = emoHash
		
		# 2/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['blindfold_off'][1] = emoHash
		
		# 3/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: Well, I guess you’ve been a good girl.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Hehe… thanks…','proc'=>nil,'talking'=>true})
		emoHash['happiness'] = diaArray
		

		
		diaArray = []
		diaArray.push({'text'=>'Carol: Well, I guess you’ve been a good girl.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Thank you…','proc'=>nil,'talking'=>true})
		emoHash['shyness'] = diaArray


		
		diaArray = []
		diaArray.push({'text'=>'Carol: Well, I guess you’ve been a good girl.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Thanks…','proc'=>nil,'talking'=>true})
		emoHash['sadness'] = diaArray

		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: Well, I guess you’ve been a good girl.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: You’re feeling nice now?','proc'=>nil,'talking'=>true})
		emoHash['neutral'] = diaArray

		
		@dialogue['blindfold_off'][2] = emoHash
		
		# 4/4 respect level
		
		emoHash = {}
		
		diaArray = []
		diaArray.push({'text'=>'Carol: Well, I guess you’ve been a good girl.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Ah… light…','proc'=>nil,'talking'=>true})
		emoHash['anger'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: Well, I guess you’ve been a good girl.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: There you are…','proc'=>nil,'talking'=>true})
		emoHash['happiness'] = diaArray

		
		diaArray = []
		diaArray.push({'text'=>'Carol: Well, I guess you’ve been a good girl.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: I’ll be good…','proc'=>nil,'talking'=>true})
		emoHash['shyness'] = diaArray

		
		diaArray = []
		diaArray.push({'text'=>'Carol: Well, I guess you’ve been a good girl.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Finally…','proc'=>nil,'talking'=>true})
		emoHash['sadness'] = diaArray

		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: Well, I guess you’ve been a good girl.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Ah… light…','proc'=>nil,'talking'=>true})
		emoHash['neutral'] = diaArray

		

		
		@dialogue['blindfold_off'][3] = emoHash
		
		#--------------------------------------------------
		# gag dialogue
		#--------------------------------------------------
		@dialogue['gag'] = []
		
		# 1/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['gag'][0] = emoHash
		
		# 2/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['gag'][1] = emoHash
		
		# 3/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['gag'][2] = emoHash
		
		# 4/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['gag'][3] = emoHash
		
		#--------------------------------------------------
		# ungag dialogue
		#--------------------------------------------------
		@dialogue['ungag'] = []
    
		# 1/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['ungag'][0] = emoHash
		
		# 2/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['ungag'][1] = emoHash
		
		# 3/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: Well, I guess you’ve been a good girl.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Aah… that’s better.','proc'=>nil,'talking'=>true})
		emoHash['happiness'] = diaArray


		
		diaArray = []
		diaArray.push({'text'=>'Carol: Well, I guess you’ve been a good girl.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Ahh…','proc'=>nil,'talking'=>true})
		emoHash['shyness'] = diaArray


		
		diaArray = []
		diaArray.push({'text'=>'Carol: Well, I guess you’ve been a good girl.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Haah…','proc'=>nil,'talking'=>true})
		emoHash['sadness'] = diaArray


		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: Well, I guess you’ve been a good girl.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Ugh… thanks…','proc'=>nil,'talking'=>true})
		emoHash['neutral'] = diaArray



		
		@dialogue['ungag'][2] = emoHash
		
		# 4/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: Okay, that’s enough for now.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Ahh, thanks...','proc'=>nil,'talking'=>true})
		emoHash['happiness'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: Okay, that’s enough for now.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Ahh… w-what now?','proc'=>nil,'talking'=>true})
		emoHash['shyness'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: Okay, that’s enough for now.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Thank you.','proc'=>nil,'talking'=>true})
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: Okay, that’s enough for now.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Whew…','proc'=>nil,'talking'=>true})
		emoHash['neutral'] = diaArray


		
		@dialogue['ungag'][3] = emoHash
    
    #--------------------------------------------------
		# intro dialogue
		#--------------------------------------------------
		@dialogue['intro'] = []
		
		# 1/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['intro'][0] = emoHash
		
		# 2/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		
		emoHash['happiness'] = diaArray
		
		diaArray = []
		
		emoHash['shyness'] = diaArray
		
		diaArray = []
		
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		
		emoHash['neutral'] = diaArray
		
		@dialogue['intro'][1] = emoHash
		
		# 3/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: Well, I guess you’ve been a good girl.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Aah… that’s better.','proc'=>nil,'talking'=>true})
		emoHash['happiness'] = diaArray


		
		diaArray = []
		diaArray.push({'text'=>'Carol: Well, I guess you’ve been a good girl.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Ahh…','proc'=>nil,'talking'=>true})
		emoHash['shyness'] = diaArray


		
		diaArray = []
		diaArray.push({'text'=>'Carol: Well, I guess you’ve been a good girl.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Haah…','proc'=>nil,'talking'=>true})
		emoHash['sadness'] = diaArray


		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: Well, I guess you’ve been a good girl.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Ugh… thanks…','proc'=>nil,'talking'=>true})
		emoHash['neutral'] = diaArray



		
		@dialogue['intro'][2] = emoHash
		
		# 4/4 respect level
		
		emoHash = {}
		
		diaArray = []
		
		emoHash['anger'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: Okay, that’s enough for now.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Ahh, thanks...','proc'=>nil,'talking'=>true})
		emoHash['happiness'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: Okay, that’s enough for now.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Ahh… w-what now?','proc'=>nil,'talking'=>true})
		emoHash['shyness'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: Okay, that’s enough for now.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Thank you.','proc'=>nil,'talking'=>true})
		emoHash['sadness'] = diaArray
		
		diaArray = []
		
		emoHash['fear'] = diaArray
		
		diaArray = []
		diaArray.push({'text'=>'Carol: Okay, that’s enough for now.','proc'=>nil})
		diaArray.push({'text'=>'Suki1: Whew…','proc'=>nil,'talking'=>true})
		emoHash['neutral'] = diaArray


		
		@dialogue['intro'][3] = emoHash
	end
	
end
$privateCellDamsels['sukiEvy'] = PrivateCellDamselSukiEvy.new
