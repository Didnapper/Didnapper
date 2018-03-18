#need to try inserting text event into stack
#[image number, name, origin,appointment method?(0 for direct),x,y,zoomx,zoomy,opacity,blend_type]

class PrivateCellDamselAngel < PrivateCellDamsel
	def mmph
    mood = getMood
		tickle = ticklelevel?
		if tickle >= 1 #tickle
			Audio.se_play(["Audio/SE/gagtalk3.mp3","Audio/SE/Laughing mmmmhhhh.mp3"][rand(2)], 100, 100)
		elsif mood[0] == 'fear'
			Audio.se_play("Audio/SE/gagtalk4.mp3", 100, 100)
		elsif mood[0] == 'anger'
			Audio.se_play("Audio/SE/gagtalk4.mp3", 100, 100)
		elsif mood[0] == 'happiness'
			Audio.se_play("Audio/SE/gagtalk4.mp3", 100, 100)
		elsif mood[0] == 'sadness'
			Audio.se_play("Audio/SE/gagtalk4.mp3", 100, 100)
		elsif mood[0] == 'shyness'
			Audio.se_play("Audio/SE/gagtalk4.mp3", 100, 100)
    else #default
      Audio.se_play("Audio/SE/gagtalk4.mp3", 100, 100)
		end
	end
	def initialize
    @tag = 'angel'
		super()
		#personality
		@emotions['anger'] = [8,0]
		@emotions['happiness'] = [5,0]
		@emotions['shyness'] = [5,0]
		@emotions['sadness'] = [3,0]
		@emotions['fear'] = [4,0]
    #currently unused
    @homophilia = 2
		@masochism = -1
		
		
		@disposition = 1
		@disposition_index = 658
		@disposition_min = 1
		
		#bases
		list = {'back' => [30,'PCAngelBase',0,0,0,0,100,100,255,0],'head'=> [30,'PCAngelBase',0,0,0,0,100,100,255,0], 'front' => [30,'PCAngelBase',0,0,0,0,100,100,255,0]}
		@images['base'] = list
		
		#brows
		list = {'annoy1' => [32,'PCAngelBrowsAnnoyed',0,0,0,0,100,100,255,0],'annoy2'=> [32,'PCAngelBrowsAnnoyed2',0,0,0,0,100,100,255,0], 'normal' => [32,'PCAngelBrowsNormal',0,0,0,0,100,100,255,0]}
		list = list.merge({'tickle' => [32,'PCAngelBrowsWorried',0,0,0,0,100,100,255,0],'worry' => [32,'PCAngelBrowsWorried',0,0,0,0,100,100,255,0]})
		@images['brow'] = list
		
		#mouths and gags
		list = {'annoy1' => [34,'PCAngelMouthOpen',0,0,0,0,100,100,255,0],'annoy2'=> [34,'PCAngelMouthSad',0,0,0,0,100,100,255,0], 'neutral' => [34,'PCAngelMouthNeutral',0,0,0,0,100,100,255,0]}
		list = list.merge({'tickle' => [34,'PCAngelMouthTickle',0,0,0,0,100,100,255,0],'smile' => [34,'PCAngelMouthSmile',0,0,0,0,100,100,255,0]})
		list = list.merge({'ball' => [34,'PCAngelGagBall',0,0,0,0,100,100,255,0],'bit' => [34,'PCAngelGagBit',0,0,0,0,100,100,255,0],'cleave' => [34,'PCAngelGagCleave',0,0,0,0,100,100,255,0]})
		list = list.merge({'cloth' => [34,'PCAngelGagOTM',0,0,0,0,100,100,255,0],'knot' => [34,'PCAngelGagKnot',0,0,0,0,100,100,255,0],'otn' => [34,'PCAngelGagOTN',0,0,0,0,100,100,255,0]})
    list = list.merge({'sgag1' => [34,'PCAngelGagSpecial1',0,0,0,0,100,100,255,0],'sgag2' => [34,'PCAngelGagSpecial2',0,0,0,0,100,100,255,0]})
    @images['mouth'] = list
		
		#eyes and blindfold
		list = {'blindfold' => [36,'PCAngelBlindfold',0,0,0,0,100,100,255,0],'blink' => [33,'PCAngelEyesClosed',0,0,0,0,100,100,255,0]}
		list = list.merge({'normal1' => [33,'PCAngelEyesNormal',0,0,0,0,100,100,255,0],'normal2' => [33,'PCAngelEyesNormal',0,0,0,0,100,100,255,0]})
		list = list.merge({'right' => [33,'PCAngelEyesShy',0,0,0,0,100,100,255,0],'left' => [33,'PCAngelEyesShy',0,0,0,0,100,100,255,0]})
		list = list.merge({'tickle' => [33,'PCAngelEyesTickle',0,0,0,0,100,100,255,0],'happy' => [33,'PCAngelEyesTickle',0,0,0,0,100,100,255,0]})
		@images['eyes'] = list
		
		#misc
		list = {'blush1' => [31,'PCAngelBlush',0,0,0,0,100,100,255,0],'blush2' => [31,'PCAngelBlush2',0,0,0,0,100,100,255,0],'tears' => [35,'PCAngelTears',0,0,0,0,100,100,255,0]}
		@images['misc'] = list
		
		testIntro = [{'text'=>"This is line 1","proc"=>nil},{'text'=>"This is line 2","proc"=>nil}]
		
		#"speak" dialogue
	@dialogue =\
{\
	'speak' =>\
	[\
		[\
			{'text'=>'  Suki1: So how does an angel find herself watching over a snowy mountain village?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Margit: Take a guess.','talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1: Hmm… oh, I know! You needed a hobby, right?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Margit: Are you mocking me, mortal?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1: Maybe just a little. It\'s not often I get to capture an angel. I think I\'ll have some fun with you.', 'talking'=>true,'proc'=>nil},\
		],\
		[\
			{'text'=>'  Margit: Do you even know what I am? What I\'m capable of?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1: Well, I know you\'re cute, and you\'re capable of holding a very big gag, as we found out when I nabbed you.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Margit: I warn you, mortal, watch your tongue. I answer to the Gods!', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1: Well, as long as you\'re here, I\'m your God…', 'talking'=>false,'proc'=>nil},\
		],\
		[\
			{'text'=>'  Suki1: So answer me now. What were you doing on that mountain?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Margit: I… I sensed that there would be bloodshed. A battle for control of the town.', 'talking'=>true,'proc'=>method(:face_happy)},\
			{'text'=>'  Margit: It\'s my job as an angel to choose those warriors who have earned the right to go to Valhalla, and be with the greatest warriors who have ever lived!', 'talking'=>true,'proc'=>method(:face_happy)},\
			{'text'=>'  Suki1: I see. So you were there expecting a battle?', '  talking'=>true,'proc'=>nil},\
			{'text'=>'  Margit: Where there is combat, I am not far behind…', 'talking'=>true,'proc'=>nil},\
		],\
		[\
			{'text'=>'  Suki1: To think, I have a real messenger of the Gods, tied in my own  personal cell. Incredible!', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Margit: Incredibly lucky is more like it! You are very skilled to capture me, I\'ll give you that, but no cell can hold an angel for long.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Margit: I will escape and return to my duties, and then I will repay you for your actions here.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1: Well, that doesn\'t sound too promising for me, now does it? I guess I\'ll just have to keep you tied up nice and tight then, won\'t I?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Margit: Haha… you have a warrior\'s soul, mortal. But know this… when your time comes, I will deliver you to the Gods wrapped in the very ropes you have tied me with…', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Margit: …and you will spend your days in the next world, bound as you have bound me.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1: Ha! No escape from being tied up even in the afterlife, eh? That  would be funny. If that is to be my fate, I shall accept it.', 'talking'=>true,'proc'=>nil},\
  			{'text'=>'  Suki1: But such things are for the Gods to decide, not you. Do not forget your place either, angel…', 'talking'=>false,'proc'=>nil}\
		],\
	],\
	'charm' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: To have someone as beautiful as you guide them to the afterlife, must surely be the best part of death.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: I don\'t think it\'s me they\'re interested in, but rather the splendor that awaits them in Valhalla!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Margit: There\'s no way any great warrior would be interested in me when compared to the wonders of the afterlife…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: So, uh… nice wings!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: …', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: (okay, gonna have to do better than that, apparently…)', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: To have someone as beautiful as you guide them to the afterlife, must surely be the best part of death.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Alas, no more, my wings are clipped! And these iron bars are my only companions now.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: To have someone as beautiful as you guide them to the afterlife, must surely be the best part of death.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: What are you up to, with this flattery all of a sudden?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: To have someone as beautiful as you guide them to the afterlife, must surely be the best part of death.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: When I come for you, I\'ll be bringing ropes and a gag!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: You know, with your beauty, it would easy for someone to take you for an angel.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Haha. I know you mean well, mortal, but I think you need to learn more about us angels.', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: You know, with your beauty, it would easy for someone to take you for an angel.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Ha! I am no meek servant! When I arrive the skies roar and battlefield below shakes! My coming is war, and my wake is death!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Still cute as hell, though.', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: You know, with your beauty, it would easy for someone to take you for an angel.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Haha, in a way that\'s kind of insulting, but I will take it as a compliment.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: You know, with your beauty, it would easy for someone to take you for an angel.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: The only thing people will mistake me for here is a humiliated prisoner.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: You know, with your beauty, it would easy for someone to take you for an angel.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Just leave me alone, will you?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: You know, with your beauty, it would easy for someone to take you for an angel.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: If you\'re trying to further injure my pride, you\'ve succeeded.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: No, I meant it as… I meant that… oh dear.', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: You really were a tough opponent, you know. I would be honored if we met again at the end.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: I think I\'d like that, mortal. Perhaps, if you want, we can have a rematch. With the loser getting… tied up.', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>' Suki1: You really were a tough opponent, you know. I would be honored if we met again at the end.', 'talking'=>true,'proc'=>nil},\
				{'text'=>' Margit: I would be honored to carry as strong an opponent as you to Valhalla. Perhaps there, at an audience of the greatest warriors in all of history, we can have a worthy rematch.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: You really were a tough opponent, you know. I would be honored if  we met again at the end.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: I would be honored to carry as strong an opponent as you to Valhalla. Perhaps there, at an audience of the greatest warriors in all of history, we can have a worthy rematch.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: You really were a tough opponent, you know. I would be honored if we met again at the end.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: If you untie me, maybe I\'ll take you straight to Valhalla right now.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: The offer is nice, but I still have business in this realm.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: You really were a tough opponent, you know. I would be honored if we met again at the end.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: If I ever get out of this cell, you mean.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: You really were a tough opponent, you know. I would be honored if we met again at the end.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Ha! What makes you think I\'ll come for you, or that you\'ll die a death worthy of Valhalla?', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: I must say your beauty is truly divine.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Cease your pointless flattery, mortal!', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1: (How cute, she\'s blushing.)', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: I must say your beauty is truly divine.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Margit: Obviously.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: I must say your beauty is truly divine.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Thank you. You know I\'d look more impressive if I were free to spread my wings. Maybe you could loosen these ropes just a…', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Nice try.', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: I must say your beauty is truly divine.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Your words are very kind, but alas they are just words.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: I must say your beauty is truly divine.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Stay back! I know you\'re trying to get me to lower my guard so you can do something to me.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: I must say your beauty is truly divine.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: If that\'s true then you have a funny way of treating beautiful things. Tying them up, gagging them with filthy rags and locking them up in cages?', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'insult' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: For a winged warrior-messenger of the Gods, you were pretty easy to beat.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Seal your lips, mortal. I didn\'t lose. I just… just made a mistake is all. I\'ll get out of here and restore my honor, I swear it!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: You sure were easy to beat.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Laugh while you can.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: For a winged warrior-messenger of the gods, you were pretty easy to beat.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: If I were not forbidden to use my full powers on a living mortal, you might think differently.', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: For a winged warrior-messenger of the Gods, you were pretty easy to beat.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Margit: Huh. You got lucky, mortal. Next time I\'ll wipe the floor with you.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Sorry, there\'s not gonna be a next time.  ', 'talking'=>false,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: For a winged warrior-messenger of the Gods, you were pretty easy to beat.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Don\'t remind me of my shame!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Margit: What the Gods must think of me!', 'talking'=>true,'proc'=>method(:face_sad)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: For a winged warrior-messenger of the Gods, you were pretty easy to beat.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Why don\'t you untie me and say that to my face!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: No thanks, I like you as you are.', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: Sing for me, my little caged bird.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: No way! I mean, it\'s not like anyone would want to hear me sing anyway…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Those feathers make you look like an oversized canary. Why don\'t you be a good little caged bird and sing for me?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: I am not some pet for you to command!', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: Sing for me, my little caged bird.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: I will do no such thing!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: Sing for me, my little caged bird.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Will you just leave me alone?!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: Sing for me, my little caged bird.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Why? What will you do if I refuse?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: Sing for me, my little caged bird.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: The only noise you\'ll get from me is a battle cry!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Or an angry mmph…', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: Maybe I should just let you go. It\'d make room for an actual worthwhile prisoner.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: There\'s no prisoner worth more than me save the Gods. Right…?', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: Maybe I should just let you go. It\'d make room for an actual worthwhile prisoner.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Margit: I don\'t know whether to be happy or insulted.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: Maybe I should just let you go. It\'d make room for an actual worthwhile prisoner.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Then open the door and untie me.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: …No.', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: Maybe I should just let you go. It\'d make room for an actual worthwhile prisoner.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Are you done trying to wound my heart?', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: Maybe I should just let you go. It\'d make room for an actual worthwhile prisoner.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Who are you going to drag off now, kidnapper? Are you not satisfied unless your stealing?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: Maybe I should just let you go. It\'d make room for an actual worthwhile prisoner.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Your prattle is starting to annoy me, mortal. A good gag would end your ceaseless babble.', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: Wow,you can\'t even get out of those ropes?! I\'ve escaped from ties 10 times as tough as those!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Come on… (grunt)… That\'s not fair, ah, I\'m trying my  hardest here!', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Margit: (groan) Stop looking at me like that!', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: Wow, you can\'t even get out of those ropes?! I\'ve escaped from ties 10 times as tough as those!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Margit: Shut up! I\'m… (grunt) trying!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: Wow, you can\'t even get out of those ropes?! I\'ve escaped from ties 10 times as tough as those!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Ha, I think I\'d like to have seen that.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: Wow, you can\'t even get out of those ropes?! I\'ve escaped from ties 10 times as tough as those!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Shut up! I\'m… (grunt) trying!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: Wow, you can\'t even get out of those ropes?! I\'ve escaped from ties 10 times as tough as those!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Hold on a second (grunt), and I\'ll give you a real escape challenge!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'threaten' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: I bet those feathers would make a lovely pillow.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: They are extremely soft. Uh, I mean, you can touch them if you want. But be respectful!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: I bet those feathers would make a lovely pillow.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: You wouldn\'t dare.', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: I bet those feathers would make a lovely pillow.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: They are really soft, but I\'d prefer you didn\'t.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: I bet those feathers would make a lovely pillow.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Margit: Great, not only am I to be a captive, humiliatingly tied up, but apparently next I\'m to become part of a bed… Is there no end to this shame?', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>' Suki1: I bet those feathers would make a lovely pillow.', 'talking'=>true,'proc'=>nil},\
				{'text'=>' Margit: Y-You wouldn\'t dare! W-would you?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: I bet those feathers would make a lovely pillow.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: You won\'t intimidate me, you cowardly mortal!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: Hmmm… Now that I think about it, you\'re wasted down here.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Finally you\'ve come to your senses…', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: You\'d look perfect tied to the front of a ship. We could make a fortune off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Tied to the front of a ship?! On display at every port of call?! I\'d never live the shame down!', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Margit: Though it would make for a fine ship indeed…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: You know, now that I stop to think about it, keeping something as beautiful as you locked down here is a waste.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Well, perhaps you are not fully devoid of reason after all.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: I should have thought of it sooner! A ship captain would pay a fortune to have a real angel for a figurehead!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: You want to turn me into a boat decoration?! And I told you… I am not a simple angel!', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: Hmmm… Now that I think about it, you\'re wasted down here.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Finally you\'ve come to your senses…', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: You\'d look perfect tied to the front of a ship. We could make a fortune off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Wait… What?', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: Hmmm… Now that I think about it, you\'re wasted down here.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Finally you\'ve come to your senses…', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: You\'d look perfect tied to the front of a ship. We could make a fortune off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: I should have known that was coming…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: Hmmm… Now that I think about it, you\'re wasted down here.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Finally you\'ve come to your senses…', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: You\'d look perfect tied to the front of a ship. We could make a fortune off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: What are you saying?! Don\'t even think of doing that to me! Why, I\'d be reduced to a just a piece of furniture!', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: Hmmm… Now that I think about it, you\'re wasted down here.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Finally you\'ve come to your senses…', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: You\'d look perfect tied to the front of a ship. We could make a fortune off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: I\'ll tie you to the front of my Chariot for even suggesting such a thing, you scheming witch!', 'talking'=>true,'proc'=>method(:face_angry)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: Hmmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: What are you staring at me like that for?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: I\'m just thinking… you\'d look great atop a Christmas tree.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: What! Stuck up on some tree, with everyone looking up at me? Oh Gods, what if I\'m wearing a skirt?! No, I can\'t bear to think of it!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: (She\'ll come around. It\'s a great idea.)', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: Hmmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: What are you staring at me like that for?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: I\'m just thinking… you\'d look great atop a Christmas tree.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Sometimes I really can\'t believe I got captured by you…', 'talking'=>true,'proc'=>method(:face_sad)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: Hmmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: What are you staring at me like that for?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: I\'m just thinking… you\'d look great atop a Christmas tree.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Sometimes you say the cutest things, you know that?', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: Hmmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: What are you staring at me like that for?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: I\'m just thinking… you\'d look great atop a Christmas tree.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Oh, so now I\'m to be tied to some tree and put on display for your amusement?', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: Hmmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: What are you staring at me like that for?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: I\'m just thinking… you\'d look great atop a Christmas tree.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Wait, let\'s not go getting any crazy ideas here, okay? Tying people to the tops of trees is not a good idea!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: Hmmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: What are you staring at me like that for?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: I\'m just thinking… you\'d look great atop a Christmas tree.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: How did I allow myself to get captured by this ditz?', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: Just so you know, we can get up to some really kinky stuff here.  Honestly, I don\'t think you\'ll last long.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: W-Wait a minute, what kind of stuff are we talking about here? Hey… don\'t look at me like that!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Margit: Oh no, I don\'t think I like where this going…', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: Just so you know, we can get up to some really kinky stuff here. Honestly, I don\'t think you\'ll last long.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Ha! I think you\'ll find I\'m made of tougher stuff than you imagine…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: Just so you know, we can get up to some really kinky stuff here. Honestly, I don\'t think you\'ll last long.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Heh, we\'ll just see who\'s made of tougher stuff. I\'ll play your little game… give me all you\'ve got!', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1: (oh wow she\'s really into it.)', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: Just so you know, we can get up to some really kinky stuff here. Honestly, I don\'t think you\'ll last long.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Well, whatever tortures await, it can\'t be worse than just sitting here listening to you.', 'talking'=>true,'proc'=>method(:face_annoyed)},\
				{'text'=>'  Suki1: Oh, I\'m gonna have to punish you for that one.', 'talking'=>false,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: Just so you know, we can get up to some really kinky stuff here. Honestly, I don\'t think you\'ll last long.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Just promise you won\'t do anything with candles… fire or melted wax could ruin my wings!', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: Just so you know, we can get up to some really kinky stuff here. Honestly, I don\'t think you\'ll last long.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Ha! We\'ll see how long you last when I get out of here and lock you up in some dank, dark cell!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'slap' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: Let\'s see just how tough you really are.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Huh? Ow! No fair, at least give me a proper warning!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: Let\'s see just how tough you really are.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Uhh! You caught me off guard. That won\'t happen again!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: Let\'s see just how tough you really are.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Ungh! Nice try, but I can handle anything you can dish out, human.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: I guess we\'ll find out, won\'t we?', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: Let\'s see just how tough you really are.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Hey now, that\'s no way to treat someone of my stature!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: Let\'s see just how tough you really are.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Stop it!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: Let\'s see just how tough you really are.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: *grunt*  That\'s it? Hah! I\'ll show you some proper techniques once I\'m free.', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: Maybe I need to get more serious.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Ouch! Okay, okay! I\'ll  be a good girl! Just please stop!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: Maybe I need to get more serious.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Ouch! Why would you do  that?!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: Maybe I need to get more serious.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Ouch! Why would you do that?! I never even tried to escape!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: Maybe I need to get more serious.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Ouch! Why would you do that? Isn\'t tying  me up enough?', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: Maybe I need to get more serious.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Ouch! Why would you do that?! Haven\'t I been good?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: Maybe I need to get more serious.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Ouch! Why would you do that?! On second thought, I don\'t think I\'ll give you those pointers after all.', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: Try this one!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: I don\'t know which is more humiliating, getting slapped on the cheek or on the bum…', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Well I know which one is more fun to spank.', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: Try this one!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Hey! Leave my bum out of this!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>' Suki1: Try this one!', 'talking'=>false,'proc'=>nil},\
				{'text'=>' Margit: Hey, I thought you were supposed to be punishing me!', 'talking'=>true,'proc'=>nil},\
				{'text'=>' Suki1: I am.', 'talking'=>false,'proc'=>nil},\
				{'text'=>' Margit: Then why are you smacking my bum?!', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: Try this one!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Hey, don\'t slap my bum!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: (But it\'s so cute!)', 'talking'=>false,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: Try this one!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: I don\'t know which is worse, getting slapped on the cheek, or on the bum…', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: Try this one!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Hey, don\'t slap my bum!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Ummm! Is that it? You\'re not gonna, maybe, slap me somewhere else?', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Ow! For someone with such feminine hands, your slaps kinda hurt.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Ow! Couldn\'t you have aimed a little lower…?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Like where?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: I don\'t know. Maybe… maybe my butt?', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Ouch! You know, you can be really mean at times.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Ouch! Please, no more, I\'ll do  anything!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Anything?', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Ow! That\'s it! When I get out of here I\'m gonna give you such a spanking!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'tickle' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: You\'re so serious. C\'mon crack a smile!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Aha! Don\'t  put your hands there again, please?', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: You\'re so serious. C\'mon crack a smile!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Heh. There, happy?', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: You\'re so serious. C\'mon crack a smile!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Hehe. Thanks, I appreciate the gesture.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: You\'re so serious. C\'mon crack a smile!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Smiling and being happy aren\'t always the same thing.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: You\'re so serious. C\'mon crack a smile!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Please stop touching me.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: You\'re  so serious. C\'mon crack a smile!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Just what do I have to smile about?', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: Now you\'re really in for it! Let\'s see what you\'re made of!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: H-Hey wait a minute! Put those hands away! J-Just where do you think you\'re going touch me?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Wherever I want!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: AHAHAHA, S-stop!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: Now you\'re really in for it! Let\'s see what you\'re made of!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: I can take anything someone like you could possibly- AHAHAHA! P-please! Please s-stop!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: Now you\'re really in for it! Let\'s see what you\'re  truly  made of!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Margit: I\'m ready. Do your worst, you rotten scoundrel!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Scoundrel? I kind of like the sound of that. But I\'ll still have to tickle you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Tickle? AHAHA WAIT! Stop! I c-can\'t - ahahah!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: Now you\'re really in for it! Let\'s see what you\'re truly  made of!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Look, whatever you\'re going to do to me, please… just gag me first. I don\'t want people to hear me.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Sorry, I think I want to hear your laughter.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Laughter? Wait I thought- HAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: Now you\'re really in for it! Let\'s see what you\'re made of!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Margit: Wait, what are you going to- HAHAHA! W-wait, just torture me instead, I can\'t stand getting tick- AHAHAH!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: Now you\'re really in for it! Let\'s see what you\'re made of!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Ha, I\'m twice the woman you are. Just watch, I won\'t even bat an eyelid to your tor-', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Margit: AHAHAH S-stop! HAHAHA Oh God just wait, I\'ll get out of - AHAHAH!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: How about a little game? If you can keep still for five minutes, I\'ll let you go.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Five minutes doesn\'t sound so bad - Hahahahaha! W-wait, why are you putting your fingers between my toes?!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Margit: Haha! N-No, p-please not the bottom joints! I surrender just stop it! Hahaha!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Looks like I win, and it looks like someone has sensitive toes.', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: How about a little game? If you can keep still for five minutes, I\'ll  let you go.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Margit: Keep still? Well, that sounds easy enough. When should we start the count - HAHAHA! Hey! No fair!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: You lose.', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: How about a little game? If you can keep still for five minutes, I\'ll  let you go.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Oh, I like games! Okay, so I just have to keep still, right? Here I go.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Hmmm, you\'re pretty good at this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Well, it\'s pretty easy when you\'re tied  up. Really, the bindings are doing all the work.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Well, we\'ll just have to fix that.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: AHAHAH! Hey! No fair!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  How about a little game? If you can keep still for five minutes, I\'ll  let you go.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Somehow I don\'t like the sound of this. Hahaha! N-No, HAHAHA, p-please s-stop, HAHAHAHAHA y-you win!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: I guess you\'re staying right here, then.', 'talking'=>false,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: How about a little game? If you can keep still for five minutes, I\'ll  let you go.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: You\'re going to touch me anywhere you want for five minutes straight? I don\'t like the sound of- AHAHAHAHA!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: I win.', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: How about a little game? If you can keep still for five minutes, I\'ll  let you go.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Hmmm, you\'ll be the one stiff as a rock after I put you in a super tight hogtie! Once I get out of here, of course.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Margit: And make no mistake, I will get- AHAHAHAHAHAHA!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Ha! You lose!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: H-Hey! AHAHAH! N-No fair! I wasn\'t even- AHAHAHAHAHA W-Wh-HAHAHA Why are you still tickling me?!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: Hmm. My, what a lot of feathers you have.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: So?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Hehe, all the better to tickle you with!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: AHAHA S-Stop! You can\'t use my body lik- HAHAHA! L-Like some toy!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: Hmm I bet if I make you kneel like that... then move them over  here...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Wait, are you trying to tickle my feet with my own wings?! Stop! HAHAHAHAHAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: Hmm. My what a lot of feathers you have.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: So?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Hehe, all the better to tickle you with!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: HAHAH H-Hey no fair! HAHAHA N-No using my body again- AHAHAHAHAHA a-against me!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: Hmm, my what a lot of feathers you have.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: So?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Hehe, all the better to tickle you with!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: AHAHA! S-Stop it! This is so unfair AHAHAHA, u-using my own wings to torm- HAHAHAHAHAHAHAHA t-torment me.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: Hmm. My what a lot of feathers you have.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: So?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Hehe… all the better to tickle you with!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: What are you…? Wait… no, don\'t grab my win- HAHAHAHAHAHA! N-No, s-stop, HAHAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: Hmm. My what a lot of feathers you have.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: So?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Hehe… all the better to tickle you with!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: AHAHA! How dare- HAHAHA- y-you use my own body like thi -HAHAHAHAHAHA!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'kiss' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: I just can\'t help myself. Hmm.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Ummph?! I\'ll admit that was… unexpected.', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: I just can\'t help myself. Hmm.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Ummph?! Don\'t even think of trying that again!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: I just can\'t help myself. Hmm.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Ummph?! Well I guess that could have been worse.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: I just can\'t help myself. Hmm.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Ummph?! I\'m just something for you to play with, aren\'t I?', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: I just can\'t help myself. Hmm.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Ummph?! Stop it… just lock me away in my cell again.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I just can\'t help myself. Hmm.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Ummph?! How dare you defile me, mortal?!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: Hmm. I think I want a little taste of Heaven.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: No, wait, I - Mmmph!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Oh… tastes like strawberries!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: …', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: (Hehe, I think she\'s a little dazed.)', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: Hmm. I think I want a little taste of Heaven.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: What are you talking-  Ummph!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Mmmm, delicious.', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: Hmm. I think I want a little taste of Heaven.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Oh no, don\'t even think of- Mmmmm…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: Hmm. I think I want a little taste of Heaven.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Mmmm - a kiss? What are you trying to say?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Just that you\'re cute.', 'talking'=>false,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: Hmm.  I think I want a little taste of Heaven.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Wait! What are do- Mmmph!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Just a kiss for a cutey. Don\'t worry, I won\'t bite… yet…', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: Hmm. I think I want a little taste of Heaven.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Don\'t you dare touch my lips with your foul- Ummph!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Oh, I\'m sorry… did my naughty lips steal a kiss from you? I really should keep a hold on them better.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: I don\'t take kindly to being toyed with, mortal!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: Just admit you love this. Hmmm.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Umm! Being tied up all the time? Maybe. Getting kissed by you? Definitely.', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: Just admit it, you love this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: I have no idea what you\'re talking about.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Oh, I\'m talking about this…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Mmmph! Hey you can\'t just do that to me out of nowhere! I mean if you must do it… at least warn me.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: Just admit you love this. Hmmm.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Umm! Yes, it\'s wonderful! I hope you make it into Valhalla so we can do this forever!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: Just admit it, you love this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Mmmm… that\'s sweet of you, but honestly, I don\'t think I\'m in the mood…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: Just admit it, you love this. Mmmm.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Oh, a kiss. I thought you were talking about being tie-', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Margit: You know what? Never mind.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: Just admit it, you love this. Hmmm.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Hey, you can\'t just kiss me like that!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Why not?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Because… because…', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Margit: Just shut up, okay?', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: Pucker up, gorgeous. Umm.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Mmmm. That felt kinda short. Could I have another, please?', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: Pucker up, gorgeous!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Hehe… whatever you say, ma\'am - Mmmm…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: Pucker up, gorgeous. Umm.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Mmm. Anytime. I\'m all yours.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: Pucker up, gorgeous. Umm.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Hehe, I think I feel a little bit better.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Well, my kisses are magic.', 'talking'=>false,'proc'=>nil}\
			],\
			'fear' =>\
			[\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: Pucker up, gorgeous!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: How dare you! - Only one kiss! I expect more from my beautiful captor!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'ungag' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: I\'m going to remove this for now, so behave.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: I suppose, if you want to look upon my perfect face in full so badly.', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: I\'m going to remove this for now, so behave.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Have it your way.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: I\'m going to remove this for now, so behave.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: I can move my jaw again. Thanks, I guess.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: I\'m going to remove this for now, so behave.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Fine, not like there\'s any point disobeying you. Seems I can\'t escape anyway.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: I\'m going to remove this for now, so behave.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: I promise I\'ll be good.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: I\'m going to remove this for now, so behave.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: I refuse to be tamed like some animal!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Then maybe you should stay muzzled.', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: Let\'s see those angelic lips of yours.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Ha… to think I\'ve been reduced to this state - kept gagged, and allowed to speak only when a criminal wants to ogle me…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: Let\'s see those angelic lips of yours.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Is that the only reason I\'m ungagged? For your amusement?!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: Let\'s see those angelic lips of yours.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Ah, at last! I was beginning to forget what my own voice sounded like!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: Let\'s see those angelic lips of yours.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Finally! I\'d almost forgotten I could say more than “Mmph!” and “Ummph!”…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: Let\'s see those angelic lips of yours.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Why?! What are  going to shove into my mouth this time?!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: Let\'s see those angelic lips of yours.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: You\'ll see no such thing!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Okay then, what gag should I put on you this time? Oh, maybe one of the big ones!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: You wouldn\'t dare!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: Alright, I\'ll ungag you, but just for a little while!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Oh please, don\'t tell me you\'re gonna put that horrible thing back in my mouth… are you?!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: Alright, I\'ll ungag you, but just for a little while!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Gee, thanks. Don\'t spoil me or anything now, will you…?', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: Alright, I\'ll ungag you, but just for a little while!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Oh finally! You know, there are things I can do only while ungagged…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: Alright, I\'ll ungag you, but just for a little while!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: So now even my ability to talk is rationed.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: Alright, I\'ll ungag you, but just for a little while!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Dare I even ask for what reason my gag has been removed?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: Alright, I\'ll ungag you, but just for a little while!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Oh, how magnanimous you are! Please don\'t go to too much trouble for me; it\'s not like I\'m tied up and gagged down here all day!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: Why don\'t I take this off to see all of that beautiful face?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Heehee… How do you always know just what to say to get me blushing?', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: Why don\'t I take this off and show everyone that beautiful face of yours?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: As long as you promise you\'ll be the one to put it back on…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: Why don\'t I take this off to see all of that beautiful face?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Thank you, that was very sweet.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: Why don\'t I take this off and show everyone that beautiful face of yours?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Well, being shown off is better than being gagged, I suppose.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: Why don\'t I take this off and show everyone that beautiful face of yours?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Knowing what kind of people are here, I think they\'d prefer to see me with the gag in my mouth.', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'blindfold_on' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: How about you try this on?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Don\'t try anything now. Wait… something is on my back. Is it my wings or your hand?', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: How about you try this on?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Not like I have a real choice.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: How about you try this on?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Are you planning something?', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: How about you try this on?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: You sure love making fun of me.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: How about you try this on?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Promise you won\'t make me walk into a wall on purpose.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: How about you try this on?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Your human methods of torture are so annoying!', 'talking'=>true,'proc'=>method(:face_shy)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: I think you\'ve seen enough for one day!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Hey! Why\'d you put this thing on me? Hey! What touched my wing?! Please say it was you!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: I think you\'ve seen enough for one day!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Hey! What in heaven?!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: I think you\'ve seen enough for one day!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Hey! I can\'t see a thing now!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: I think you\'ve seen enough for one day!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Hey! What in heaven?!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: I think you\'ve seen enough for one day!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Oh no… what scheme are you playing at now?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: I think you\'ve seen enough for one day!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Hey! Get this human contraption off me!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: Try this on. All us mortals wear them!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: B-but then I can\'t see a thing!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: Try this on. All us mortals wear them!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: That\'s strange, mine must not be working \'cause I can\'t see a thing!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Margit: Are you laughing at me?', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: Try this on. All us mortals wear them!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Hmm, I knew mortals were strange, but this is just takes the cake! Okay, you can take it off me now.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Margit: …Hello?', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: Try this on. All us mortals wear them!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Then I want nothing to do with it - Hey, what did I just say!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: Try this on. All us mortals wear them!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Hey! Keep your mortal contraptions to yourself!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: Try this on. All us mortals wear them!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: You mortals really spend your time doing strange things. Wearing devices to stop people talking and seeing…', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Margit: who even comes up with stuff like this?!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: Tell me how you feel with this on.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: I-I don\'t know. I feel like people are staring at me, looking at my tied up body…', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Margit: …and anyone could just reach out and grab me. It feels… funny.', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: Tell me how you feel with this on.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: I feel kinda… helpless.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: Tell me how you feel with this on.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Like… like I\'m glad you\'re here with me.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: Tell me how you feel with this on.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: I feel very… vulnerable. Honestly, I\'m not used to feeling like this.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: Tell me how you feel with this on.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: I feel… stupid.', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'blindfold_off' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: Begone, eternal darkness!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: *smile* Then I guess that makes you my personal sun.', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: Begone, eternal darkness!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: *sarcastic* Haha. You\'re hilarious.', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: Begone, eternal darkness!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: I suppose that was a little funny.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: Begone, eternal darkness!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Hello, dungeon cell.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: Begone, eternal darkness!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Not so fast… my eyes…', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: Begone, eternal darkness!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Lucky for you looks can\'t  kill.', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: Alright, I\'ll cut you a break and take this off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Oh! Sorry, I\'m just not used to having people just touch me like that.', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: Alright, I\'ll cut you a break and take this off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Well, it\'s nice to see your heart isn\'t totally devoid of compassion.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: Alright, I\'ll cut you a break and take this off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Well, now at least we can see each other.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: Alright, I\'ll cut you a break and take this off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: You call this giving me a break?!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: Alright, I\'ll cut you a break and take this off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Thanks, I guess. But I still don\'t trust you!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: Alright, I\'ll cut you a break and take this off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: You call this a break? How about undoing some of these ropes instead?', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: I think I wanna look you in the eyes for this next part.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Wait, what does that mean? Hey, why are you smiling like that?!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: I think I wanna look you in the eyes for this next part.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Hmmm? Well, you\'ve got my attention now…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: I think I wanna look you in the eyes for this next part.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Hehe, I wonder what that means…', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: I think I wanna look you in the eyes for this next part.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: I\'m really not in the mood for games', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: I think I wanna look you in the eyes for this next part.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Margit: That sounds… ominous.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: I think I wanna look you in the eyes for this next part.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Ohh! Finally found some courage, have you?', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>' Suki1: Let\'s not cover up such a cute face!', 'talking'=>true,'proc'=>nil},\
				{'text'=>' Margit: Hehe, you can be so sweet sometimes. I just wish that I could do a little more for you…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1: Let\'s not cover up such a cute face!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Thanks! And now I can see your cute face too!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1: Let\'s not cover up such a cute face!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Hehe. You restored my sight; maybe you\'re the real angel here.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: Let\'s not cover up such a cute face!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Well at least I can see again, so that\'s something, I guess.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: Let\'s not cover up such a cute face!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Margit: Hmph, and here I was thinking you were just a good person, but apparently I\'m only needed for my looks!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	]\
};
	end
end
$privateCellDamsels['angel'] = PrivateCellDamselAngel.new
