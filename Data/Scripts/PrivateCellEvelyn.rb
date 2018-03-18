#need to try inserting text event into stack
#[image number, name, origin,appointment method?(0 for direct),x,y,zoomx,zoomy,opacity,blend_type]

class PrivateCellDamselEvelyn < PrivateCellDamsel
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
    @tag = 'evelyn'
		super()
		#personality
		@emotions['fear'] = [3,0]
		@emotions['shyness'] = [5,0]
		@emotions['anger'] = [4,0]
		@emotions['happiness'] = [7,0]
		@emotions['sadness'] = [2,0]
    #currently unused
    @homophilia = 3
		@masochism = -1
		
		
		@disposition = 3
		@disposition_index = 664
		@disposition_min = 2
		
		#bases
		list = {'back' => [30,'PCEvelyn',0,0,0,0,100,100,255,0],'outfit1'=> [30,'PCEvelynWitch',0,0,0,0,100,100,255,0]}
		@images['base'] = list
		
		#brows
		list = {'annoy1' => [32,'PCEvelyn_browannoyed',0,0,0,0,100,100,255,0],'annoy2'=> [32,'PCEvelyn_browangry',0,0,0,0,100,100,255,0], 'normal' => [32,'PCEvelyn_brownormal',0,0,0,0,100,100,255,0]}
		list = list.merge({'tickle' => [32,'PCEvelyn_browtickle',0,0,0,0,100,100,255,0],'worry' => [32,'PCEvelyn_browworried',0,0,0,0,100,100,255,0]})
		@images['brow'] = list
		
		#mouths and gags
		list = {'annoy1' => [34,'PCEvelyn_mouthopen',0,0,0,0,100,100,255,0],'annoy2'=> [34,'PCEvelyn_mouthsad',0,0,0,0,100,100,255,0], 'neutral' => [34,'PCEvelyn_mouthnormal',0,0,0,0,100,100,255,0]}
		list = list.merge({'tickle' => [34,'PCEvelyn_mouthopen',0,0,0,0,100,100,255,0],'smile' => [34,'PCEvelyn_mouthsmile',0,0,0,0,100,100,255,0]})
		list = list.merge({'ball' => [34,'PCEvelyn_gagball',0,0,0,0,100,100,255,0],'bit' => [34,'PCEvelyn_gagbit',0,0,0,0,100,100,255,0],'cleave' => [34,'PCEvelyn_gagcleave',0,0,0,0,100,100,255,0]})
		list = list.merge({'cloth' => [34,'PCEvelyn_gagcloth',0,0,0,0,100,100,255,0],'knot' => [34,'PCEvelyn_gagknotted',0,0,0,0,100,100,255,0],'otn' => [34,'PCEvelyn_gagotn',0,0,0,0,100,100,255,0]})
    list = list.merge({'sgag1' => [34,'PCEvelyn_gagspecial1',0,0,0,0,100,100,255,0]})
		@images['mouth'] = list
		
		#eyes and blindfold
		list = {'blindfold' => [36,'PCEvelyn_blindfold',0,0,0,0,100,100,255,0],'blink' => [33,'PCEvelyn_eyesclosed',0,0,0,0,100,100,255,0]}
		list = list.merge({'normal1' => [33,'PCEvelyn_eyesnormal',0,0,0,0,100,100,255,0],'normal2' => [33,'PCEvelyn_eyesnormal',0,0,0,0,100,100,255,0]})
		list = list.merge({'right' => [33,'PCEvelyn_eyesnormal',0,0,0,0,100,100,255,0],'left' => [33,'PCEvelyn_eyesside',0,0,0,0,100,100,255,0]})
		list = list.merge({'tickle' => [33,'PCEvelyn_eyeshappy',0,0,0,0,100,100,255,0],'happy' => [33,'PCEvelyn_eyeshappy',0,0,0,0,100,100,255,0]})
		@images['eyes'] = list
		
		#misc
		list = {'blush1' => [31,'PCEvelyn_blush1',0,0,0,0,100,100,255,0],'blush2' => [31,'PCEvelyn_blush2',0,0,0,0,100,100,255,0],'tears' => [35,'PCEvelyn_tears',0,0,0,0,100,100,255,0]}
		@images['misc'] = list
		
    #accessories
    @images['accessories'] = {}
    list = {'acc1' => [31,'PCEvelyn_acc1',0,0,0,0,100,100,255,0],'acc2'=>[37,'PCEvelyn_acc2',0,0,0,0,100,100,255,0]}
    @images['accessories']['outfit1'] = list
    
    
		testIntro = [{'text'=>"This is line 1","proc"=>nil},{'text'=>"This is line 2","proc"=>nil}]
		
		#"speak" dialogue

@dialogue =\
{\
	'speak' =>\
	[\
		[\
			{'text'=>'Suki1: Well, looks like I won this round.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Evelyn: I\'m sorry, I-I\'ll do better next time!', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: It\'s okay Evelyn, you don\'t need to prove anything to me. I\'ve seen you in battle; ', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Suki1: I know how skilled you are.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Evelyn: T-thanks. It\'s just that, I don\'t want to be a burden for you and the others.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Evelyn: If I\'m gonna be part of the group I... I want to be able to help!', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: Don\'t worry about it Evelyn, with your magic I\'m sure we\'ll be an unbeatable team!', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Evelyn: ...', 'talking'=>true,'proc'=>nil}\
		],\
		[\
			{'text'=>'Suki1: Are you okay Evelyn? You\'re not still upset about losing to me, are you? ', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Evelyn: No, well sort of... It\'s just, it seems like I don\'t really belong anywhere.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: Oh, how so?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Evelyn: Well, first I left all my family at Velis to go to the Academy, hoping that in such a prestigious school I\'d be sure to find a place to fit in.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Evelyn: And, well, you saw what happened there...', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: Yes... You were too good for them Evelyn.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Evelyn: And now, just when I\'m thinking I could be part of your group, I find I can\'t even win a practice battle - even with all my magic...', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: Evelyn... ', 'talking'=>false,'proc'=>nil}\
		],\
		[\
			{'text'=>'Suki1: Look, Evelyn, you proved what kind of person you are back at the Academy. You sided with us even when everyone else was against you.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Suki1: Without your help, Carol and I would be trussed up in some magic cell right now.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Suki1: You\'re our friend, and that means you\'ll always have a place here, no matter how many practice battles you lose.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Evelyn: Hehe, hopefully, my place won\'t always be in one of these cells, though!', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: Haha, well you know me, always looking to increase my collection.', 'talking'=>false,'proc'=>nil}\
		],\
		[\
			{'text'=>'Suki1: Feeling better now?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Evelyn: Hehe, I am! Thanks to you! ', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: Glad to hear it.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Evelyn: You know, even when I first met you and thought you were a creepy kidnapper-', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: (Ouch)', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Evelyn: -Even then I felt there was something special about you; something kind and pleasant about your words...', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Evelyn: I hope we can be friends for a long time.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: Me too Evelyn.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Evelyn: (smiling)', 'talking'=>true,'proc'=>nil}\
		],\
	],\
	'charm' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: I didn\'t know it was possible to cast love spells even while tied up', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: But I\'m not using any magi- Oh I get it. Very funny...', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I didn\'t know it was possible to cast love spells even while tied up', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: It\'s not possible to do much while tied up...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I didn\'t know it was possible to cast love spells even while tied up', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Can you just untie me already?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I didn\'t know it was possible to cast love spells even while tied up', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: That\'s very nice of you but I really would like to be untied now.', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I didn\'t know it was possible to cast love spells even while tied up', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: B-but with my hands tied I can\'t use my- Oh... you\'re saying... (Blush)', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Rescuing you from that cell was one of the best things I ever did. ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: That\'s great, but can you rescue me from this one too?', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Rescuing you from that cell was one of the best things I ever did. ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Hehe, you\'re my knight in shining armor! ', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Rescuing you from that cell was one of the best things I ever did. ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: I\'m very grateful for that, but can you let me out of this cell too?', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Rescuing you from that cell was one of the best things I ever did. ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: I don\'t suppose you could repeat that kindness right now?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Rescuing you from that cell was one of the best things I ever did. ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: And I appreciate that – but now you\'ve stuck me right back in a cell...', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Rescuing you from that cell was one of the best things I ever did. ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Hehe, I was in a bit of trouble there, wasn\'t I.', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>' Suki1: You know, you\'re surprisingly good in a fight – I honestly would never have guessed it when we first met.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Well you know what they say about books and covers...', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You know, you\'re surprisingly good in a fight – I honestly would never have guessed it when we first met.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Hehe, I\'m actually pretty weak – b-but I\'ve been good with magic since I was a little girl!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: You know, you\'re surprisingly good in a fight – I honestly would never have guessed it when we first met.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Apparently not good enough... I\'ll have to practice more! I mean... If you want to...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: You know, you\'re surprisingly good in a fight – I honestly would never have guessed it when we first met.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: I mean, I\'m the one tied up this cell. So I can\'t be that good...', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: You know, you\'re surprisingly good in a fight – I honestly would never have guessed it when we first met.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Hehe, next time I\'ll beat you for sure!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: You know, you\'re surprisingly good in a fight – I honestly would never have guessed it when we first met.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: O-Oh! You really think so? I mean I just like to do the best I can.', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: I hope I wasn\'t too rough in tying you up.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: No, no! Honestly, it was quite exciting. ', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I hope I wasn\'t too rough in tying you up.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Hehe, you were a little rough, but then this is practice. I wanna be ready in case I get caught again! ', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I hope I wasn\'t too rough in tying you up.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: You could have gone – ah – a little easier on my wrists. I can barely move my hands at all!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I hope I wasn\'t too rough in tying you up.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Hehe, it\'s fine – I\'ll just tie you up as tight when I win!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I hope I wasn\'t too rough in tying you up.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: I-It\'s fine, to be honest, it was kind of exciting to be captured. But I still want to win next time!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'insult' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Wow, a mage beaten by someone who can\'t even use magic – are you sure you don\'t need to go back to school?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: No! I don\'t want to go back there... I just need to try harder next time!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Wow, a mage beaten by someone who can\'t even use magic – are you sure you don\'t need to go back to school?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Please don\'t remind me of that place. Those girls are so mean... ', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Wow, a mage beaten by someone who can\'t even use magic – are you sure you don\'t need to go back to school?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Please don\'t say that! The last thing I want is to go back to that awful place!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Wow, a mage beaten by someone who can\'t even use magic – are you sure you don\'t need to go back to school?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: No way! I\'ve learned way more from you and Carol anyway! I just need to get better at tying knots.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Evelyn: Maybe Carol will teach me, and then I\'ll beat you for sure!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Wow, a mage beaten by someone who can\'t even use magic – are you sure you don\'t need to go back to school?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn:', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Hey, know any spells to escape rope?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: One actually, unfortunately, it requires the use of my hands...', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Hey, know any spells to escape rope?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Maybe I don\'t need spells. Maybe I can get out of this all by myself!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: I doubt that.', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Hey, know any spells to escape rope?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: I mean you could just untie me... Right?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Wrong.', 'talking'=>false,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Hey, know any spells to escape rope?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: W-Why!? You\'re not thinking of leaving me like this, are you!?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Hey, know any spells to escape rope?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Well I thought that\'s what my friends were for! ', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Hey, know any spells to escape rope?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Come on, please untie me now. These ropes are squeezing my... my... you know what I\'m talking about!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: You know if you want to be part of our group you\'re gonna have to get a lot stronger.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: I know, I thought I was strong but... Now it doesn\'t matter – I\'ll do better next time I promise!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You know if you want to be part of our group, you\'re gonna have to get a lot stronger.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: I-I will! I just need to practice tying people up, right?', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: You know if you want to be part of our group you\'re gonna have to get a lot stronger.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: I know... But next time I\'ll win – I\'m sure of it!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: You know if you want to be part of our group you\'re gonna have to get a lot stronger.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Please, let me have some more practice! I know I can do better! ', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: You know if you want to be part of our group you\'re gonna have to get a lot stronger.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Well, that\'s a little hard to do when I get tied up every time I lose!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: You know if you want to be part of our group you\'re gonna have to get a lot stronger.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: I-I will! I promise as soon as you untie me I\'ll practice tying knots!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Hmmm, maybe I should find a stronger mage...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: What?! No please! Give me another chance! I-I promise I\'ll do better!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Hmmm, maybe I should find a stronger mage...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: You don\'t mean that... Do you?', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Hmmm, maybe I should find a stronger mage...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: What?! I mean... You don\'t have to... I can do better, I know it!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Hmmm, maybe I should find a stronger mage...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: You wouldn\'t toss your friends away like that would you?! After everything we\'ve been through!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Hmmm, maybe I should find a stronger mage...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: O-Oh... Well, I mean, I can get stronger if you like...', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'threaten' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: How would you like to go back to the cell I found you in?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: I... I don\'t think I\'d like that at all.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: How would you like to go back to the cell I found you in?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: How could you even say that?!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: How would you like to go back to the cell I found you in?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: You wouldn\'t!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: How would you like to go back to the cell I found you in?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Well I mean, either way, I\'m stuck in a cell.', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: How would you like to go back to the cell I found you in?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: W-What?! Where did this come from?', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Hmm, I think I might gag you. In case you try and put a spell on me.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Really that\'s not necessary!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Hmm, I think I might gag you. In case you try and put a spell on me.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: You could just cover my mouth with your hand if I try it.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Hmm, I think I might gag you. In case you try and put a spell on me.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Please no! I had enough of gags being shoved in my mouth back at the academy.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Hmm, I think I might gag you. In case you try and put a spell on me.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: What?! But I haven\'t even opened my mouth! ', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Hmm, I think I might gag you. In case you try and put a spell on me.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: You\'re worse than the girls back at Aurealis!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Hmm, I think I might gag you. In case you try and put a spell on me.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: W-What?! Can\'t we just go back to the living quarters already?', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: I think I might get Carol. I\'m sure she\'d love to see you like this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: No! There\'s no telling what she\'d do if she found me like this!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I think I might get Carol. I\'m sure she\'d love to see you like this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Hehe, if you did that I don\'t think she\'d ever let me go!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I think I might get Carol. I\'m sure she\'d love to see you like this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: No, please! She\'d keep me in her room or something!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I think I might get Carol. I\'m sure she\'d love to see you like this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: You wouldn\'t!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I think I might get Carol. I\'m sure she\'d love to see you like this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Don\'t even joke about that! That girl knows way too much about ropes and gags to be safe around while tied up.', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I think I might get Carol. I\'m sure she\'d love to see you like this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Please no! I don\'t think my body is ready for that!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: You know, I don\'t think I ever gave you a tour of the guild. How about we go now...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: While I\'m tied up like this?! Please no! I get enough creepy stares here as-is!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You know, I don\'t think I ever gave you a tour of the guild. How about we go now...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: I mean, that\'s nice and all but I don\'t think I can hop that far tied like this.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: You know, I don\'t think I ever gave you a tour of the guild. How about we go now...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Can I just stay in the cell?', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: You know, I don\'t think I ever gave you a tour of the guild. How about we go now...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Please don\'t joke about that Suki1... Carol\'s out there.', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: You know, I don\'t think I ever gave you a tour of the guild. How about we go now...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: B-But, then everyone will see me while I\'m tied like this. I couldn\'t I\'d die of embarrassment!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'slap' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ouch! Well, at least you\'re not using a ruler... ', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ouch! I thought we were friends!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ouch! Geez, school is starting to look pretty good about now.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ow! That stung!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ouch! W-Why would you do that? ', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Time for some corporal punishment!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Wait a minute, why would you- Ouch! That hurt!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Time for some corporal punishment!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ouch! Can\'t you try somewhere softer next time?', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Time for some corporal punishment!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Just like school... Ouch! ', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Time for some corporal punishment!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: But I didn\'t do anything – Ouch! ', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Time for some corporal punishment!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ouch! Why would you do that while I\'m tied up like this?!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Time for some corporal punishment!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ouch! No, no, I promised myself I wouldn\'t cry anymore... ', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Let\'s see if you\'re strong enough for the guild.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Oww! I promise I won\'t cry!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Let\'s see if you\'re strong enough for the guild.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Oww! I promise I won\'t let you down!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Let\'s see if you\'re strong enough for the guild.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ouch! I didn\'t realize there would be a test!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Let\'s see if you\'re strong enough for the guild.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Wait a minute I didn\'t know there was a – Ouch! Hey! I wasn\'t ready!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Let\'s see if you\'re strong enough for the guild.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ouch! I know I\'m strong enough! I have to be!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Let\'s see if you\'re strong enough for the guild.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ouch! No, I swear I won\'t cry...', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Try and block this move.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ouch! How can I block it when you\'ve tied me up!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Try and block this move.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Oww! Maybe next time I can hop away!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Try and block this move.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ouch! Now you\'re just mocking me.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Try and block this move.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ouch! Hey now, that\'s not fair!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Try and block this move.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ouch! That hurt you know!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'tickle' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Let\'s see if you can stand this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: I\'m ready! I can-AHAHAHAHA! Please! Wait! Stop – HAHAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Let\'s see if you can stand this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: I don\'t like the sound of- AHAHAHAHAHA! Stop!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Let\'s see if you can stand this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: AHAHAHAHA! Please! Just let me -AHAHAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Let\'s see if you can stand this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: I\'m ready! I can take – AHAHAHAHA! I\'m sorry! Please Stop- AHAHAHAH!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Let\'s see if you can stand this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: No, please! Not the tickling! I\'ll do – AHAHAHAHAHA! Oh please Stop! I\'ll do any- AHAHAHAHAHA!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Are you ready for the ultimate challenge?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: I-I think so, I just hope- AHAHAHAHA! Wait! I give up! Please! I can\'t- AHAHAHA', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Are you ready for the ultimate challenge?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: I\'m ready! I\'ve been practicing my magic so I should- AHAHAHA! I\'m not ready! I\'m not ready! HAHAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Are you ready for the ultimate challenge?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: I don\'t know, maybe if you untied me then- HAHAHAHAH! Wait! What is this!? I- AHAHAH', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Are you ready for the ultimate challenge?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Wait, what you doing!? No please! I- AHAHAHAHA! Stop! I\'m super ticklish!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Are you ready for the ultimate challenge?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: I\'m ready for anything. I won\'t lose to you again! This time I\'ll- HAHAHAHA! Wait! Stop! This is cheating! AHAHAHAHA', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Are you ready for the ultimate challenge?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Wait, you\'re going to... No please! I\'m super ticklish, you can\'t- AHAHAHAHAHA! Please! ', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Tell me, how ticklish are you? ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Incredibly! so Please, don\'t – AHAHAHAHAHA! Wait! Please! I just-AHAHAHA', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Tell me, how ticklish are you? ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: HAHAHAHA! I think- AHAAHA- You have your answer – AHAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Tell me, how ticklish are you? ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Wait why? No wait, seriously I can\'t take being tick-HAHAHAHAHA! Please! Have mercy! AHAHAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Tell me, how ticklish are you? ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Oh no! Wait please, not while I\'m tied up this- HEHEAHAHAHAHA! It\'s too much! HAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Tell me, how ticklish are you? ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Wait, no, I didn\'t agree to this part of the practice- HAHAHAHA! Stop! I swear I\'ll use my magic if you- HEHEHAHAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Tell me, how ticklish are you? ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Oh no! Seriously I can\'t take being AHAHAHAHAH! Please stop! Not while I\'m tied up like this! AHAHAHAHA!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Time for a little magic of my own.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Oh I didn\'t know you were also studying- HAHAHAHA! Hey! That magic is forbidden! AHAHAHAAHA', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Time for a little magic of my own.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Hold on, why are looking at me like that? Oh no- HAHAHAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Time for a little magic of my own.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Well I hope it\'s a rope loosening spell cause these knots are starting to- HAHA- Wait, Stop!-HAHAHEHEHAHAHA! ', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>' ', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Time for a little magic of my own.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Wait, what are you doing!? No, don\'t even think about tickling me while I can\'t defend myself- HAHAHAHAHA! ', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Time for a little magic of my own.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: HAHAHAHA- Wait! Please! Everyone will hear me- HAHAHAHAHA! Stop!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'kiss' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Don\'t tell Carol I did this, but...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Mmmm! Oh, my! That was.. Intense!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Don\'t tell Carol I did this, but...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Mmmph! That was sweet... But I\'m still mad at you for tying me up!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Don\'t tell Carol I did this, but...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Mmmph! Oh no! Do I have to kiss everyone here? Is that like a rule?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Don\'t tell Carol I did this, but...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Mmmm! Is this your way of saying I\'m sorry?', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Don\'t tell Carol I did this, but...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Mmmm... I-I mean, what? You can\'t just kiss me out of nowhere! I-I can\'t even... Curse these ropes, I can\'t even think straight!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Evelyn, want to see something truly magical?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Mmmm! Oh, my! No-one at the academy ever taught me that kind of magic!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Evelyn, want to see something truly magical?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Mmmm! Oh, my! Is this how you treat all your captives? ', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Evelyn, want to see something truly magical?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Okay, I guess... Mmmm! W-what was that! Y-You can\'t just kiss someone out of nowhere – It\'s not proper!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Evelyn, want to see something truly magical?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Mmmm! Wait why did you stop?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Evelyn, want to see something truly magical?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Mmmm! Hey! Don\'t take advantage of me just cause I\'m tied up! ', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Evelyn, want to see something truly magical?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Why are you looking at me like that? Wait what are- Mmmmph!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: How was it?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: ...', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: (I think she\'s stunned.)', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Welcome to the group!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Mmmm!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Evelyn: Hehe, did you welcome the others this way too?', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Welcome to the group!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Mmmm... Hehe, I never got a welcome like this as the Academy. ', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Welcome to the group!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Mmmph! Thanks, I guess...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Welcome to the group!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Mmmph! D-Do you kiss all the people who join? Did Leroy kiss you when you joined? Oh...', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Welcome to the group!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Mmmph! This better not be just a trick to kiss me! I don\'t enjoy people playing with my feelings!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Welcome to the group!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Mmmph! Oh, my! D-Does this mean I have to kiss Carol? And Athena!? Gosh, she\'s so cool! I wonder if she likes me.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: (She\'s lost in her own world...)', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: You know, there\'s something I\'ve wanted to do since we first met...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Oh, really? What\'s- Mmmph! Mmmm...', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Evelyn: Hehe, is this why you wanted to practice? ', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You know, there\'s something I\'ve wanted to do since we first met...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Mmmm... Hehe, you\'re very sweet for a kidnapper you know that.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: You know, there\'s something I\'ve wanted to do since we first met...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Mmmph! Well, you certainly are difficult to predict I\'ll give you that! ', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: You know, there\'s something I\'ve wanted to do since we first met...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Mmmph! Please don\'t say kissing me was the only reason you freed me back at the academy.', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: You know, there\'s something I\'ve wanted to do since we first met...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Mmmm... Hehe, well I\'m glad you waited \'till we were alone. Though you didn\'t have to tie me up to kiss me.', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'ungag' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Let\'s take this off for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ugh, did I really need to be gagged. I mean, we\'re just practicing.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Let\'s take this off for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Oh my! I hope we can skip that part next time...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Let\'s take this off for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Wait, what do you mean, â€œfor a while?!â€', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Let\'s take this off for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ugh, why did you even gag me in the first place?! This was supposed to be practice!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Let\'s take this off for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Oh my! You\'re not gonna put that big thing back in my mouth are you?!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Okay, I think you\'ve earned a few minutes of talking privilege.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Yes teacher... I mean, oops. Thought I was back at school there... ', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Okay, I think you\'ve earned a few minutes of talking privilege.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Hehe, yes mistress!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Okay, I think you\'ve earned a few minutes of talking privilege.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ugh, you know for a mage having the ability to speak taken away is especially humiliating...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Okay, I think you\'ve earned a few minutes of talking privilege.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ugh, that was horrible! I thought you\'d never take it off!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Okay, I think you\'ve earned a few minutes of talking privilege.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ugh, so if I win next time I get to gag you too, right?', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Okay, I think you\'ve earned a few minutes of talking privilege.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: I-Is this really necessary? I\'ll be quiet, you really don\'t have to gag me again I swear! ', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Wanna talk?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Mmmph!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Okay, but just for a little while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ahh, thanks. I was beginning to think you were enjoying this. ', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Wanna talk?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Mmmph!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Okay, but just for a little while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ugh, thanks. I haven\'t really gotten used to those things yet. But I suppose I\'ll have to if I\'m to be of any use to the group.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Wanna talk?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Mmmph!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Okay, but just for a little while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ugh, I don\'t know what worse, getting tied up and gagged by my classmates, or by you...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Wanna talk?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Mmmph!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Okay, but just for a little while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ugh, I don\'t know what worse, getting tied up and gagged by my classmates or by you...', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Wanna talk?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Mmmph!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Okay, but just for a little while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ugh, you know, one of the reasons I left the Academy was to get away from people tying me up and gagging me... ', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Wanna talk?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Mmmph!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Okay, but just for a little while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Y-You\'re not gonna put that thing back in my mouth, are you? Can\'t we just call it a day here? ', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Okay, okay, you can be ungagged for a little while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ah, thank you. ', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Okay, okay, you can be ungagged for a little while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Hehe, this is just like real kidnapping. I feel like a princess!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Okay, okay, you can be ungagged for a little while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Just a while, I was hoping we could talk a while.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Okay, okay, you can be ungagged for a little while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ah finally. I guess this is what I get for losing. Next time I\'ll be the one doing the gagging!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: (Why does she look determined?)', 'talking'=>false,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Okay, okay, you can be ungagged for a little while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ah, thank you. I never mentioned this before but it\'s kind of humiliating for a mage to not be able to speak since it vital for us to use our magic.', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'blindfold_on' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Let\'s try this on.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ummm, I don\'t think this is really necessary... ', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Let\'s try this on.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Hey! But now I can\'t even see you!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Let\'s try this on.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Oh no, I don\'t like where this is going.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Let\'s try this on.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: What the- This isn\'t funny!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Let\'s try this on.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Hey! What\'s going on?! ', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Evelyn: Hello...?', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Time for your next test! ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: My next what? Hey! No fair, now I can\'t even see you!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Time for your next test! ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: What sort of test requires me to be blindfolded?', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Time for your next test! ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Do we have to this? I\'m really not a fan of the dark...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Time for your next test! ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Eh?! Not blindfolds! I hate the dark! Just don\'t leave me like this, okay.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Time for your next test! ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: This is the worst test I ever had to take, and I took advanced potions!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Time for your next test! ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Eh?! I hate blindfolds! The darkness is so creepy, you\'re not gonna leave me like this, are you? ', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Want to see some real magic?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Putting something over my eyes doesn\'t count as magic...', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Want to see some real magic?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Hehe, well now that you have me helpless, what will your next trick be?', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Want to see some real magic?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Well, now I can\'t even see. I hope you\'re at least enjoying this...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Want to see some real magic?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Hey! Come on, I really don\'t like things covering my eyes.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Want to see some real magic?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: A blindfold? Really?', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Want to see some real magic?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: H-Hey! O-Okay, you can take this off now, right? Hello...?', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: I found this in one of the guilds storerooms. I thought it might look good on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: That\'s very sweet of you, too bad I can\'t see it for myself, though... ', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I found this in one of the guilds storerooms. I thought it might look good on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Hehe, well how do I look? I feel a little silly, but I guess I\'m already tied up.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I found this in one of the guilds storerooms. I thought it might look good on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Oh! A blindfold. How... very sweet of you!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I found this in one of the guilds storerooms. I thought it might look good on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Why am I not surprised something like that was lying around here...', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I found this in one of the guilds storerooms. I thought it might look good on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Oh, well if you think so then I guess I can wear it. ', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'blindfold_off' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Okay let\'s take this off, for now...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Ah that\'s much better!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Okay let\'s take this off, for now...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Thanks. Wait, what do you mean for now?! ', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Okay let\'s take this off, for now...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Wait – you\'re not going to put that thing back on me are you?!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Okay let\'s take this off, for now...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: (Sigh) I guess this is what I get for losing.', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Okay let\'s take this off, for now...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Umm, can we just not use the blindfolds anymore. I\'m a little afraid of the dark...', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: There, now everyone can see you\'re beautiful eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Oh, hehe; well thank you!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: There, now everyone can see you\'re beautiful eyes. ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: B-But there\'s only you here.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: There, now everyone can see you\'re beautiful eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Well, they could if you let me out of this cell. ', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: There, now everyone can see you\'re beautiful eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Honestly I kind of hope not too many people see me like this.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: There, now everyone can see you\'re beautiful eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Hmph, I\'m still cross you blindfolded me...', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: There, now everyone can see you\'re beautiful eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: W-Wait, let\'s just keep this between us two.', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: There, feel better?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Yes, thank you!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: There, feel better?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Hehe, I do, because now I can see you too! ', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: There, feel better?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Somewhat.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: There, feel better?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Well, it\'s a start.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: There, feel better?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Hmph, you really shouldn\'t just blindfold me for fun!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: There, feel better?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: I-I guess.', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Ta-Da! ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Hehe, you\'re such a show-off!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Ta-Da! ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Hehe, my hero!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Ta-Da! ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Oh, thanks, I was starting to think I was going to have to wear that permanently.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Ta-Da! ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Please don\'t make a habit of that.', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Ta-Da! ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Evelyn: Oh, thank you. It\'s so much better when we can talk face to face.', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	]\
};
	end
end
$privateCellDamsels['evelyn'] = PrivateCellDamselEvelyn.new
