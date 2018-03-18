#need to try inserting text event into stack
#[image number, name, origin,appointment method?(0 for direct),x,y,zoomx,zoomy,opacity,blend_type]

class PrivateCellDamselEsther < PrivateCellDamsel
	def mmph
    mood = getMood
		tickle = ticklelevel?
		if tickle >= 1 #tickle
			Audio.se_play(["Audio/SE/gagtalk3.mp3","Audio/SE/Laughing mmmmhhhh.mp3"][rand(2)], 100, 100)
		elsif @action == 'speak'
      Audio.se_play("Audio/SE/Laughing mmmmhhhh.mp3", 100, 100)
    elsif @action == 'ungag'
      Audio.se_play("Audio/SE/Laughing mmmmhhhh.mp3", 100, 100)
    elsif mood[0] == 'sadness'
			Audio.se_play("Audio/SE/gagtalk4.mp3", 100, 100)
		elsif mood[0] == 'fear'
			Audio.se_play("Audio/SE/gagtalk4.mp3", 100, 100)
		elsif mood[0] == 'neutral'
			Audio.se_play("Audio/SE/gagtalk4.mp3", 100, 100)
		elsif mood[0] == 'happiness'
			Audio.se_play("Audio/SE/gagtalk4.mp3", 100, 100)
		elsif mood[0] == 'anger'
			Audio.se_play("Audio/SE/gagtalk4.mp3", 100, 100)
    else #default
      Audio.se_play("Audio/SE/gagtalk4.mp3", 100, 100)
		end
	end
	def initialize
    @tag = 'esther'
		super()
		#personality
		@emotions['fear'] = [4,0]
		@emotions['shyness'] = [6,0]
		@emotions['anger'] = [7,0]
		@emotions['happiness'] = [5,0]
		@emotions['sadness'] = [2,0]
    #currently unused
    @homophilia = 3
		@masochism = 1
		
		
		@disposition = 1
		@disposition_index = 655
		@disposition_min = 1
		
		#bases
#		list = {'back' => [30,'PCEstherBase',0,0,-150,0,100,100,255,0],'head'=> [30,'PCEsther_behind head',0,0,-150,0,100,100,255,0], 'front' => [30,'PCEsther_handsinfront',0,0,-150,0,100,100,255,0]}
#		@images['base'] = list
    list = {'outfitdefault' => [30,'PCEstherBase',0,0,-150,0,100,100,255,0],'outfit1'=> [30,'PCEstherBaseBikini',0,0,-150,0,100,100,255,0],'outfit2'=> [30,'PCEstherBaseDemon',0,0,-150,0,100,100,255,0]}
		@images['base'] = list
    
		#brows
		list = {'annoy1' => [32,'PCEsther_browannoyed',0,0,-150,0,100,100,255,0],'annoy2'=> [32,'PCEsther_browangry',0,0,-150,0,100,100,255,0], 'normal' => [32,'PCEsther_browhappy',0,0,-150,0,100,100,255,0]}
		list = list.merge({'tickle' => [32,'PCEsther_browsadtickle',0,0,-150,0,100,100,255,0],'worry' => [32,'PCEsther_browsadtickle',0,0,-150,0,100,100,255,0]})
		@images['brow'] = list
		
		#mouths and gags
		list = {'annoy1' => [34,'PCEstherMouthAnnoyed1',0,0,-150,0,100,100,255,0],'annoy2'=> [34,'PCEstherMouthAnnoyed2',0,0,-150,0,100,100,255,0], 'neutral' => [34,'PCEstherMouthAnnoyed2',0,0,-150,0,100,100,255,0]}
		list = list.merge({'tickle' => [34,'PCEstherMouthTickle',0,0,-150,0,100,100,255,0],'smile' => [34,'PCEstherMouthSmile',0,0,-150,0,100,100,255,0]})
		list = list.merge({'ball' => [34,'PCEsther_gagball',0,0,-150,0,100,100,255,0],'bit' => [34,'PCEsther_gagbit',0,0,-150,0,100,100,255,0],'cleave' => [34,'PCEsther_gagcleave',0,0,-150,0,100,100,255,0]})
		list = list.merge({'cloth' => [34,'PCEsther_gagotm',0,0,-150,0,100,100,255,0],'knot' => [34,'PCEsther_gagknot',0,0,-150,0,100,100,255,0],'otn' => [34,'PCEsther_gagotn',0,0,-150,0,100,100,255,0]})
    list = list.merge({'sgag1' => [34,'PCEsther_gaglock',0,0,-150,0,100,100,255,0],'sgag2' => [34,'PCEsther_gagpanel',0,0,-150,0,100,100,255,0],'sgag3' => [34,'PCEsther_gagpanelstrap',0,0,-150,0,100,100,255,0]})
		list = list.merge({'sgag1_bikini' => [34,'PCEsther_gaglockbikini',0,0,-150,0,100,100,255,0],'sgag2_demon'=>[34,'PCEsther_gagpanelblack',0,0,-150,0,100,100,255,0],'sgag3_demon'=>[34,'PCEsther_gagpanelstrapblack',0,0,-150,0,100,100,255,0]})
		@images['mouth'] = list
		
		#eyes and blindfold
		list = {'blindfold' => [36,'PCEstherBlindfold',0,0,-150,0,100,100,255,0],'blink' => [33,'PCEsther_eyeblink',0,0,-150,0,100,100,255,0]}
		list = list.merge({'normal1' => [33,'PCEsther_eyeneutral',0,0,-150,0,100,100,255,0],'normal2' => [33,'PCEsther_eyeneutral',0,0,-150,0,100,100,255,0]})
		list = list.merge({'right' => [33,'PCEsther_eyeright',0,0,-150,0,100,100,255,0],'left' => [33,'PCEsther_eyeleft',0,0,-150,0,100,100,255,0]})
		list = list.merge({'tickle' => [33,'PCEsther_eyehappy2',0,0,-150,0,100,100,255,0],'happy' => [33,'PCEsther_eyehappy1',0,0,-150,0,100,100,255,0]})
		@images['eyes'] = list
		
    #accessories
    @images['accessories'] = {}
    list = {'acc1' => [31,'PCEsther_acc1',0,0,-150,0,100,100,255,0],'acc2'=>[37,'PCEsther_acc2',0,0,-150,0,100,100,255,0]}
    @images['accessories']['outfit1'] = list
    list = {'acc1' => [31,'PCEsther_demonacc1',0,0,-150,0,100,100,255,0],'acc2'=>[37,'PCEsther_demonacc2',0,0,-150,0,100,100,255,0]}
    @images['accessories']['outfit2'] = list
    
		#misc
		list = {'blush1' => [31,'PCEsther_blush0',0,0,-150,0,100,100,255,0],'blush2' => [31,'PCEsther_blush1',0,0,-150,0,100,100,255,0],'tears' => [35,'PCEstherTears',0,0,-150,0,100,100,255,0]}
		@images['misc'] = list
		
		testIntro = [{'text'=>"This is line 1","proc"=>nil},{'text'=>"This is line 2","proc"=>nil}]
		
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
      if @@saved[@tag]['gag'] == 'sgag1' && @@saved[@tag]['outfit']=='outfit1'
        commandArray.push(@images['mouth']['sgag1_bikini'])
      elsif @@saved[@tag]['gag'] == 'sgag2' && @@saved[@tag]['outfit']=='outfit2'
        commandArray.push(@images['mouth']['sgag2_demon'])
      elsif @@saved[@tag]['gag'] == 'sgag3' && @@saved[@tag]['outfit']=='outfit2'
        commandArray.push(@images['mouth']['sgag3_demon'])
      else
        commandArray.push(@images['mouth'][@@saved[@tag]['gag']])
      end
		end
    return commandArray
  end
    
		@dialogue =\
{\
	'speak' =>\
	[\
  [\
			{'text'=>'  Suki1:  It\'s written all over your face…', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Esther:  Wha?-', 'talking'=>true,'proc'=>method(:face_neutral)},\
			{'text'=>'  Suki1:  …The fact that you know you\'re not supposed to enjoy this, yet you do…', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Esther:  Wh-What nonsense is this?!', 'talking'=>true,'proc'=>method(:face_shy)},\
			{'text'=>'  Suki1:  See? You\'re beginning to blush!', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Esther:  …', 'talking'=>true,'proc'=>method(:face_shy)},\
			{'text'=>'  Esther:  I-', 'talking'=>true,'proc'=>method(:face_shy)},\
			{'text'=>'  Esther:  …', 'talking'=>true,'proc'=>method(:face_shy)},\
			{'text'=>'  Suki1:  (Looks like I got to her…)', 'talking'=>false,'proc'=>nil}\
		],\
		[\
			{'text'=>'  Esther:  It\'s not like you said…', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  What?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Esther:  Saying I enjoy this… Do I really look like someone who enjoys this type of thing?', 'talking'=>true,'proc'=>method(:face_angry)},\
			{'text'=>'  Suki1:  Do I look like someone who enjoys this?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Esther:  I suppose not. You really don\'t look like someone who enjoys this type of thing… yet.', 'talking'=>true,'proc'=>method(:face_neutral)},\
			{'text'=>'  Suki1:  Yet I do enjoy it.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Esther:  …', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  You don\'t really have a choice, \'cause whether you enjoy it or  not, you\'re still gonna stay tied up here.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Esther:  …', 'talking'=>true,'proc'=>method(:face_afraid)},\
			{'text'=>'  Suki1:  Your only choice is how you take your current predicament. Do you try to fight it, and suffer more than you have to? Or do you try opening up to…', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Esther:  I get it.', 'talking'=>true,'proc'=>method(:face_neutral)},\
			{'text'=>'  Esther:  I get what you\'re trying to say…', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  So what\'s it gonna be?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Esther:  You\'re gonna have to find out, won\'t you?', 'talking'=>true,'proc'=>nil}\
		],\
		[\
			{'text'=>'  Suki1:  You know, I don\'t think I ever got your name.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Esther:  Maybe if I didn\'t spend most of my time gagged, you\'d have had the chance to learn it.', 'talking'=>true,'proc'=>method(:face_angry)},\
			{'text'=>'  Suki1:  You can tell me now.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Esther:  …Esther. Like it matters to you.', 'talking'=>true,'proc'=>method(:face_angry)},\
			{'text'=>'  Suki1:  I wouldn\'t have asked if I didn\'t care.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Esther:  You have an odd way of showing it.', 'talking'=>true,'proc'=>method(:face_angry)}\
		],\
		[\
			{'text'=>'  Suki1:  So why did you join the town guard, Esther?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Esther:  Why do you think? I wanted to protect the people of my village.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  …from people like me.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Esther:  Of course, from people like you! You\'re a kidnapper! Put a friendly face on it if you want - but in the end, you abduct innocent people and hold them captive for money!', 'talking'=>true,'proc'=>method(:face_angry)},\
			{'text'=>'  Suki1:  …', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Esther:  As I said, you seem like a nice girl, but behind that pretty face, you\'re an unrepentant criminal.', 'talking'=>true,'proc'=>method(:face_angry)},\
			{'text'=>'  Esther:  How does a young woman like you end up involved with thugs like these?', 'talking'=>true,'proc'=>method(:face_sad)},\
			{'text'=>'  Suki1:  That\'s… never mind that. You wouldn\'t believe me if I told you.', 'talking'=>false,'proc'=>nil}\
		],\
		[\
			{'text'=>'  Esther:  You\'re not ever going to let me go, are you?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  Maybe someday. I can\'t just let you go now, though. You know my face, and where the guild\'s lair is.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Esther:  What if I promised not to use that information against you or your guild?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  You… wouldn\'t really keep that promise, would you?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Esther:  …No.', 'talking'=>true,'proc'=>method(:face_afraid)},\
			{'text'=>'  Suki1:  I didn\'t think so. You don\'t seem like you could let something like this go. For now, you\'re staying put here… with me.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Esther:  …', 'talking'=>true,'proc'=>method(:face_sad)}\
		],\
		[\
			{'text'=>'  Esther:  Why do you continue to hold me captive? How long must this go on?', 'talking'=>true,'proc'=>method(:face_angry)},\
			{'text'=>'  Suki1:  As I said before, I can\'t let you go just now. I\'m not sure how long you\'ll be here.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Esther:  If it were only a matter of me using what I\'ve learned against you, you could just sell me. Or… or kill me.', 'talking'=>true,'proc'=>method(:face_afraid)},\
			{'text'=>'  Suki1:  I could… but I don\'t want to do those things to you.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Esther:  Why not? That\'s what criminals do, isn\'t it?', 'talking'=>true,'proc'=>method(:face_afraid)},\
			{'text'=>'  Suki1:  I\'d never take your life. As for selling you… I don\'t want to do  that, either. I like having you around.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Esther:  I\'m glad someone is having fun. You really enjoy keeping me tied up like this, don\'t you?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  …Yes.', 'talking'=>false,'proc'=>nil}\
		]\
	],\
	'charm' =>\
	[\
		{\
		},\
		{\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You\'re cute when you blush like that.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  D-don\'t say that!', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You may have lost to me, but you were still pretty impressive', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Must you remind me?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  (She\'s trying not to smile…)', 'talking'=>false,'anomaly'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I like your smile.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Heh… well, thanks, I guess…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  You should smile more often. It makes you look really nice.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  I… appreciate that.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Don\'t be scared. Remember how brave you were back in the  village, coming after me alone…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  And look where that got me.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Esther:  …but, thanks.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Hehe… you\'re even cuter when you\'re angry.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  You\'ll forgive me if I don\'t blush.', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I always liked that pretty face, right from when we first met.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Why would you say that? Is making me blush part of your fun?', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  Maybe a little bit…', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You may have lost to me, but you were still pretty impressive.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  You sure know how to give a backhanded compliment.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I like your smile.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Thank you.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  You should smile more often. It makes you look really nice.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  You really think so?', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Hehe… you\'re even cuter when you\'re angry.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  …I can\'t stay mad at you, at least not for long.', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'insult' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You lost to me pretty easily. Were you secretly hoping you\'d end up like this?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  No! How dare you?!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You were new at your job, right? What do you think the other guards would say if they saw you like this?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  They would be too busy arresting you!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  I hope they\'re better at it than you.', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  If you really were as good as you think, wouldn\'t you have escaped by now?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  It\'s just a matter of time!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  The way you talked back in the village, I really didn\'t think you\'d be so weak.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Untie me and say that again!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  For a member of the town guard, you weren\'t very good at stopping criminals.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Grrrrr!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  There\'s no need to get angry just because you\'re completely powerless.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Shut up! Stop mocking me!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You lost to me pretty easily. Were you secretly hoping you\'d end up like this?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  No! Don\'t be absurd!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You were new at your job, right? What do you think the other guards would say if they saw you like this?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  …', 'talking'=>true,'proc'=>method(:face_afraid)},\
				{'text'=>'  Suki1:  (I think that got to her a little…)', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  If you were really as good as you think, wouldn\'t you have escaped by now?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Hmph…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  The way you talked back in the village, I really didn\'t think you\'d be so weak.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  You wouldn\'t dare say that if I weren\'t bound like this.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  For a member of the town guard, you weren\'t very good at stopping criminals.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  If I were unbound, I\'d…!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  There\'s no need to get angry just because you\'re completely powerless.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  I\'ve got plenty more reasons to be angry!', 'talking'=>true,'proc'=>method(:face_angry)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You\'re easier to embarrass than I thought you\'d be. This tough girl act isn\'t very convincing.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  I am not acting!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You act tough, but I can tell you\'re a masochist under that attitude of yours.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  What would possibly lead you to that conclusion?!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  What do you think the people from your town would say if they knew you were enjoying this?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  What? But… I\'m not…', 'talking'=>true,'anomaly'=>true,'proc'=>method(:face_shy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  The way you talked back in the village, I really didn\'t think you\'d be so weak.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  I\'m not weak! You just… ugh…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  For a member of the town guard, you weren\'t very good at stopping criminals.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  S-say what you want…', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  There\'s no need to get angry just because you\'re completely powerless.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  I am… not… powerless! Ugh!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Hehe… looks like those ropes disagree with you.', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You\'re easier to embarrass than I thought you\'d be. This tough girl act isn\'t very convincing.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  I\'m just not used to… to this!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You act tough, but I can tell you\'re a masochist under that attitude of yours.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  That is not true!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  (You sure about that?)', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  What do you think the people from your town would think if they knew you were enjoying this?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  …', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  The way you talked back in the village, I really didn\'t think you\'d be so weak.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  You needn\'t be so cruel!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  There\'s no need to get angry just because you\'re completely powerless.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  You\'re enjoying this, aren\'t you?!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'threaten' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  How long do you think you can stand being like this? Maybe we should find out.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  No…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  S:  You know, if you keep kicking around, I\'ll have to take away that option. Trust me, it won\'t be very comfortable.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  E:  Ugh…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Maybe I should take you out into the lair like this and show you off…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  No! Don\'t you dare!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  You think this is bad? I can do a lot worse. Should I show you?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  N-No. You shouldn\'t.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  (She\'s getting scared…)', 'talking'=>false,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  S:  How\'d you like to try sleeping standing up? I\'ve got enough rope here to arrange it.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  E:  D-do… what you wish…', 'talking'=>true,'proc'=>method(:face_afraid)},\
				{'text'=>'  S:  (Wow, her voice really shook there…)', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  You\'re looking pretty mad. Do I have to secure you even tighter for my own safety?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  You can\'t be that cowardly!', 'talking'=>true,'proc'=>method(:face_angry)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  How long do you think you can stand being like this? Maybe we should find out?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Is nothing beneath you?', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  S:  You know, if you keep kicking around, I\'ll have to take away that option. Trust me, it won\'t be very comfortable.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  E:  No… no doubt.', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Maybe I should take you out into the lair like this and show you off…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  You can\'t be serious…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  You think this is bad? I can do a lot worse. Should I show you?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  There\'s no need for that…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  S:  How\'d you like to try sleeping standing up? I\'ve got enough rope here to arrange it.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  E:  You\'re… just trying to scare me.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  S:  (Sounds like it\'s working.)', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  You\'re looking pretty mad. Do I have to secure you even tighter for my own safety?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Perhaps you do!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  (Hehe… I can tell she\'s already regretting those words…)', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Oh, you\'re embarrassed? Should I lock you away where nobody can see you?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  No! That\'s not what I want!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I\'m being nice right now. If you want me to stop, just keep doing what you\'re doing.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  N-no…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You\'re smiling? Maybe I\'m slipping, hmm?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Suki1:  Do I need to hogtie you?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  What?! You can\'t do that!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  You\'re pretty athletic… I think you could handle being hung from the ceiling.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  You wouldn\'t…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  How long do you think you could be blindfolded before you\'d go crazy?', 'talking'=>false,'anomaly'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  I think I want to find out.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  D-do you enjoy being so cruel?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Would you calm down if I gave you something else to concentrate on? I have a lot more rope and you have a lot more parts I haven\'t tied.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  You aren\'t scaring me! You\'re not!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Oh, you\'re embarrassed? Should I lock you away where nobody can see you?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  No…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I\'m being nice right now. If you want me to stop, just keep doing what you\'re doing.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  That\'s unnecessary…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You\'re smiling? Maybe I\'m slipping, hmm?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Suki1:  Do I need to hogtie you?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  No, you don\'t!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  You\'re pretty athletic… I think you could handle being hung from the ceiling.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  I… I could, but that doesn\'t mean you should!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Would you calm down if I gave you something else to concentrate on? I have a lot more rope and you have a lot more parts I haven\'t tied.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  You\'d enjoy that, wouldn\'t you?', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'slap' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You could use some discipline, Miss Guard.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Agh! S-stop it!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You could use some discipline, Miss Guard.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Ahh! While I\'m bound?!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  You could use some discipline, Miss Guard.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  D-did you enjoy that?!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  You could use some discipline, Miss Guard.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Aagh! Cut it out!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  You could use some discipline, Miss Guard.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Ugh! You coward!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You could use some discipline, Miss Guard.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Ahhh!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You could use some discipline, Miss Guard.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Ugh! H-how dare you?!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You could use some discipline, Miss Guard.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Nngh… ow…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  You could use some discipline, Miss Guard.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Rrgh…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  You could use some discipline, Miss Guard.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  D-don\'t!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  You could use some discipline, Miss Guard.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Grrr…', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You could use some discipline, Miss Guard.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Ngh! Why are you…?!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You could use some discipline, Miss Guard.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  …', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You could use some discipline, Miss Guard.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Ahh! W-why…?', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  You could use some discipline, Miss Guard.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  O-ow! You\'re awful…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  You could use some discipline, Miss Guard.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Nnh! Stop!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  You could use some discipline, Miss Guard.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Y-you…!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You could use some discipline, Miss Guard.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Ouch! What are you doing?!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You could use some discipline, Miss Guard.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Ahhh… must you?', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You could use some discipline, Miss Guard.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Ahh…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  You could use some discipline, Miss Guard.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Ggh… do you really have to do that?', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  You could use some discipline, Miss Guard.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  …', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'tickle' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  This should be fun…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Will you keep your hands to yourself? I\'m not ticklish!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  This should be fun…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  …Nope.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  This should be fun…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Sorry, I\'m not the ticklish type.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  This should be fun…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  If you\'re trying to make me smile, forget it.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  This should be fun…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Get away from me! That\'s not going to do anything to me!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  This should be fun…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  What are you trying to do?! That won\'t work!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
			],\
			'neutral' =>\
			[\
				{'text'=>'  (Use  -1 lines)', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
			],\
			'sadness' =>\
			[\
			],\
			'fear' =>\
			[\
			],\
			'anger' =>\
			[\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  This should be fun…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Sorry to disappoint you…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  This should be fun…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  That\'s not going to work on me…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  This should be fun…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  You know that\'s not going to work, right?', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  This should be fun…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  …', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  This should be fun…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  T-that\'s… no good…', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  This should be fun…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Cut it out! That doesn\'t do anything to me!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  This should be fun…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  You won\'t make me laugh that way…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  This should be fun…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Heh… sorry. I guess I\'m not that responsive.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  This should be fun…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  That feels kind of nice… but I\'m not ticklish.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  This should be fun…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Sorry…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  This should be fun…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  I\'m not ticklish! Shouldn\'t you know that by now?', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'kiss' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Mmm?! Stop it!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Tch…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Ugh! Back off!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Mmh! Stop it! Get off me!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Mmh?! Get your lips away from me, you cur!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Ah… don\'t do that…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Get away from me.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  I… I am not comfortable with this…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Mmh… no… get away from me….', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Mmmh?! Stop it! I-I didn\'t give you permission to kiss me!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Mmmh?! How dare you?!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  H-hey!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Ah…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Mmm… I admit that wasn\'t completely awful.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  …', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Don\'t…!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Mmm…!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Mmm?!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Mmm…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Mmm… so you do have talents besides kidnapping.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Mmmh… why are you…?', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Nnn… are you trying to cheer me up?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  H-heh…', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'ungag' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  You\'re planning to do it again later?!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Hmph…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Ah…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Do you enjoy putting those things in my mouth?!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  F-for now?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  What do you mean “for now?!” Don\'t put that thing in my mouth again!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Thanks…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  …Thanks, I guess.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Thanks…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Ugh…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  …Thank you.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  No, not for now! For good!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Ahh… you just like the way that looks, don\'t you?!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Ahh… thanks.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Thank you.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Ah… can you… not do that again?', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Ngh… you really don\'t have to use those on me…', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Ugh… cut it out with those things!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Guh… you really like those, huh?', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Gah… can we keep that away from me for a while?', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Ahh, thanks. I don\'t like those.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  T-thank you…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  You\'d better!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'blindfold_on' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Lights out~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Nnh…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Lights out~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  No…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Lights out~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  What?! Ah!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Lights out~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  …', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Lights out~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Ahh! No!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Lights out~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Take this off immediately!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Lights out~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  This is unnecessary…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Lights out~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Ugh…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Lights out~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  You don\'t want me to see, huh? Fine…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Lights out~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Ngh… why?', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Lights out~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Ahh! No!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Lights out~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Take this off immediately!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Lights out~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Come on, take this off…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Lights out~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Ugh…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Lights out~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  You don\'t want me to see, huh? Fine…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Lights out~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  I guess I don\'t get a choice.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Lights out~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Must I be blindfolded too?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Lights out~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Hey! Get this off me!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Lights out~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  You\'re enjoying this…?', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Lights out~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Must you…?', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Lights out~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  O… okay…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Lights out~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  *sigh*', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Lights out~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  What\'re you… don\'t!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'blindfold_off' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I guess this can come off now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  You want to see my eyes? Why?', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I guess this can come off now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  *sigh*', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I guess this can come off now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Whew…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I guess this can come off now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  …Thanks.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I guess this can come off now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Ah…', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I guess this can come off now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Stop playing games with me!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I guess this can come off now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Heh…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I guess this can come off now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Finally…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I guess this can come off now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Ah, thanks.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I guess this can come off now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Appreciated.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I guess this can come off now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Nnh… what are you planning?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I guess this can come off now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  How merciful of you.', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I guess this can come off now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Oh? Well… thanks…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I guess this can come off now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Good…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I guess this can come off now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  That\'s better.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I guess this can come off now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  That\'s the least you can do, don\'t you think?', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I guess this can come off now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Thank you…', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I guess this can come off now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  About time!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I guess this can come off now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Ah… why\'re you staring into my eyes like that?', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I guess this can come off now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Thank you.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I guess this can come off now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  I appreciate it.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I guess this can come off now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  Great… now the ropes, right?', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I guess this can come off now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Esther:  I\'m not really in the mood for thanks right now.', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	]\
};
	end
end
$privateCellDamsels['esther'] = PrivateCellDamselEsther.new
