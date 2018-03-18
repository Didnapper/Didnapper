#need to try inserting text event into stack
#[image number, name, origin,appointment method?(0 for direct),x,y,zoomx,zoomy,opacity,blend_type]

class PrivateCellDamselAlexie < PrivateCellDamsel
	def mmph
    mood = getMood
		tickle = ticklelevel?
		if tickle >= 1 #tickle
			Audio.se_play(["Audio/SE/gagtalk3.mp3","Audio/SE/Laughing mmmmhhhh.mp3"][rand(2)], 100, 100)
		elsif @action == 'speak'
      Audio.se_play("Audio/SE/Laughing mmmmhhhh.mp3", 100, 100)
    elsif @action == 'ungag'
      Audio.se_play("Audio/SE/Laughing mmmmhhhh.mp3", 100, 100)
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
    @tag = 'alexie'
		super()
		#personality
		@emotions['anger'] = [3,0]
		@emotions['happiness'] = [5,0]
		@emotions['shyness'] = [4,0]
		@emotions['sadness'] = [7,0]
		@emotions['fear'] = [2,0]
    #currently unused
    @homophilia = 3
		@masochism = -1
		
		
		@disposition = 2
		@disposition_index = 664
		@disposition_min = 1
		
		#bases
		list = {'back' => [30,'PCAlexieBaseHat',0,0,-25,0,100,100,255,0],'outfit1'=> [30,'PCAlexieSchoolgirl',0,0,-25,0,100,100,255,0]}
		@images['base'] = list
		
		#brows
		list = {'annoy1' => [32,'PCAlexie_browannoy1',0,0,-25,0,100,100,255,0],'annoy2'=> [32,'PCAlexie_browannoy2',0,0,-25,0,100,100,255,0], 'normal' => [32,'PCAlexie_brownormal',0,0,-25,0,100,100,255,0]}
		list = list.merge({'tickle' => [32,'PCAlexie_browtickle',0,0,-25,0,100,100,255,0],'worry' => [32,'PCAlexie_browtickle',0,0,-25,0,100,100,255,0]})
		@images['brow'] = list
		
		#mouths and gags
		list = {'annoy1' => [34,'PCAlexie_mouthannoy1',0,0,-25,0,100,100,255,0],'annoy2'=> [34,'PCAlexie_mouthannoy2',0,0,-25,0,100,100,255,0], 'neutral' => [34,'PCAlexie_mouthannoy2',0,0,-25,0,100,100,255,0]}
		list = list.merge({'tickle' => [34,'PCAlexie_mouthtickle',0,0,-25,0,100,100,255,0],'smile' => [34,'PCAlexie_mouthsmile',0,0,-25,0,100,100,255,0]})
		list = list.merge({'ball' => [34,'PCAlexie_gagball',0,0,-25,0,100,100,255,0],'bit' => [34,'PCAlexie_gagbit',0,0,-25,0,100,100,255,0],'cleave' => [34,'PCAlexie_gagcleave',0,0,-25,0,100,100,255,0]})
		list = list.merge({'cloth' => [34,'PCAlexie_gagotm',0,0,-25,0,100,100,255,0],'knot' => [34,'PCAlexie_gagknot',0,0,-25,0,100,100,255,0],'otn' => [34,'PCAlexie_gagotn',0,0,-25,0,100,100,255,0]})
    list = list.merge({'sgag1' => [34,'PCAlexie_gagwrap',0,0,-25,0,100,100,255,0]})
		@images['mouth'] = list
		
		#eyes and blindfold
		list = {'blindfold' => [36,'PCAlexie_blind',0,0,-25,0,100,100,255,0],'blink' => [33,'PCAlexie_eyeblink',0,0,-25,0,100,100,255,0]}
		list = list.merge({'normal1' => [33,'PCAlexie_eyenormal',0,0,-25,0,100,100,255,0],'normal2' => [33,'PCAlexie_eyenormal',0,0,-25,0,100,100,255,0]})
		list = list.merge({'right' => [33,'PCAlexie_eyenormal',0,0,-25,0,100,100,255,0],'left' => [33,'PCAlexie_eyeleft',0,0,-25,0,100,100,255,0]})
		list = list.merge({'tickle' => [33,'PCAlexie_eyeblink',0,0,-25,0,100,100,255,0],'happy' => [33,'PCAlexie_eyeblink',0,0,-25,0,100,100,255,0]})
		@images['eyes'] = list
		
		#misc
		list = {'blush1' => [31,'PCAlexie_blush1',0,0,-25,0,100,100,255,0],'blush2' => [31,'PCAlexie_blush2',0,0,-25,0,100,100,255,0],'tears' => [35,'PCAlexie_tears',0,0,-25,0,100,100,255,0]}
		@images['misc'] = list
		
		testIntro = [{'text'=>"This is line 1","proc"=>nil},{'text'=>"This is line 2","proc"=>nil}]
		
		#"speak" dialogue
		@dialogue =\
{\
	'speak' =>\
	[\
		[\
			{'text'=>'  Alexie:  Oh no, you… What do you want with me?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  Cheer up. I\'m not going to hurt you. At least, I don\'t intend to…', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Alexie:  …And that\'s supposed to mean…?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  Just try to be good and nothing bad will happen.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Alexie:  Well I suppose that\'s pleasant to hear.', 'talking'=>true,'proc'=>nil}\
		],\
		[\
			{'text'=>'  Suki1:  What did you say your name was again?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Alexie:  Alexie.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  Oh, right. So, Alexie, when did you first decide to become an archaeologist?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Alexie:  Archaeology has been my passion for as long as I can remember. It\'s been in my family for ages, and I\'ve always loved to explore, see new things and live adventurously. But thanks to you, I guess I won\'t be able to anymore.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  Oh. Sorry about that.', 'talking'=>false,'proc'=>nil}\
		],\
		[\
			{'text'=>'  Alexie:  I don\'t see any good reason why you should do this to other people! Why can\'t you just let me go?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  Why would I? And I\'m sorry you feel that way.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Alexie:  No one should be treated this way! This is demoralizing and a vile thing to do to other people!', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  Perhaps you\'re right. This may not be the kindest line of work.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Alexie:  Do you ever feel even just the smallest amount of guilt from doing this?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  Yes. I quite often feel guilt from kidnapping so many girls.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Alexie:  Then why are you doing it?!', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  If only you could know…', 'talking'=>false,'proc'=>nil}\
		],\
		[\
			{'text'=>'  Suki1:  You seem to be having some trouble getting free from those ropes there.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Alexie:  Wow, great observation. You must be an archaeologist too.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  I just might be…', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Alexie:  Ha! You wish.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  Maybe I do. Archaeology is a very impressive field of study to excel in. You would have to be a genius to make a career of it.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Alexie:  Wait, you really think so?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  Of course I do.', 'talking'=>false,'proc'=>nil}\
		],\
		[\
			{'text'=>'  Suki1:  Comfortable?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Alexie:  I\'m beginning to get used to these ropes, but I would still love to be free.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  Looks like you\'re going to have to get even more used to them, in that case.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Alexie:  I guess so…', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  It isn\'t so bad; you may come to like me if you get to know me.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Alexie:  I suppose I might.', 'talking'=>true,'proc'=>nil}\
		]\
	],\
	'charm' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  “Wow, I didn\'t know archaeologists could be so cute!”', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  “Wha-why would you say that?”', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  “You have a nice hat.”', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  “Wow, such praise. I\'m developing Stockholm Syndrome as we speak.”', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  n/a', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  “Cheer up. You\'re much prettier when you smile.”', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  “I won\'t give you the satisfaction…”', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  “Don\'t be scared. I\'d never mistreat someone as cute as you.”', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  “Well, now I\'m terrified!”', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  “You know, you\'re pretty cute when you\'re mad.”', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  “You\'re as bad as the guards, you creep!”', 'talking'=>true,'proc'=>method(:face_angry)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  “Wow, I didn\'t know archaeologists could be so cute!”', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  “Whu-wa-huh?”', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  “You have really nice hair, you know?”', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  “It would have been much better if I could clean it. You know that\'s kinda hard to do when you\'re being held inside a cell!”', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  “There\'s my favourite smile!”', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  “Flattery will get you nowhere.”', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  “Cheer up. You\'re much prettier when you smile.”', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  “Thanks for trying, but that\'s not really helping…”', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  “Don\'t be scared. I\'d never mistreat someone as cute as  you.”', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  “You\'ll excuse me if I remain a little guarded.”', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  “You know, you\'re pretty cute when you’re mad.”', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  “I got enough of that at the dig site.”', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  “Your blush is absolutely adorable.”', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  “Well, you aren\'t really helping!”', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  “You really do have the whole lady-adventurer vibe going on - like a female Indiana Jones.”', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  “Hmm, not really what I was going for, but I\'ll take it.”', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  “Your blush is absolutely adorable.”', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  “Flattery may get you somewhere.”', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  (I like where this is going.)', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  “Cheer up. You\'re much prettier when you smile.”', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  “Well, I guess I can give it a go…”', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  “Don\'t be scared. I\'d never mistreat someone as cute as you.”', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  “I bet you say that to all the pretty girls.”', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  “You know, you\'re pretty cute when you’re mad.”', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  “Hmmf! Glad you\'re enjoying it.”', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  “Your blush is absolutely adorable.”', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  “Oh, well… thank you?”', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  (She\'s blushing even harder!)', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  “You really do have the whole lady-adventurer vibe going on - like a female Indiana Jones.”', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  “Ha! I bet you\'d like it if that included the whip!”', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  (…oh boy.)', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  “I think I might be an archaeologist; I just found an amazing treasure.”', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  “Oh? What\'s that?”', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  “Your smile.”', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  “Teehee~~”', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  “You\'re cute when you\'re sad. Makes me just wanna hug you!”', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  “Well, I wouldn\'t mind…”', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  “You know, you\'re pretty cute when you\'re mad.”', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  “Well, it\'s a shame I just can\'t stay mad when you talk like that then, isn\'t it?”', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'insult' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  What kind of a career is archeology, anyway? I mean, digging around in the dirt all day… what are you, like seven or something?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Well, I mean… I guess ever since I was a kid I liked finding things and reading about history… so in a way I guess I haven\'t grown up…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  What kind of a career is archeology, anyway? I mean, digging around in the dirt all day… what are you, like seven or something?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Well, not to be rude, but what kind of a career is kidnapping?', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  n/a', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  What kind of a career is archeology, anyway? I mean, digging around in the dirt all day… what are you, like seven or something?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  I mean, it\'s not really exciting or anything, I guess… b-but it\'s important! I know it is!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  What kind of a career is archeology, anyway? I mean, digging around in the dirt all day… what are you, like seven or something?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Please, just keep your cruel words to yourself.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  What kind of a career is archeology, anyway? I mean, digging around in the dirt all day… what are you, like seven or something?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Hmph! I\'d hardly expect a criminal to understand the wonders of history!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Aren\'t you a kidnapper of sorts too? I mean, you take things from their native lands and carry them off to far away museums.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  What?! N-No way! that\'s not what we\'re trying to do at all! We just wanted to protect history and learn about the past. We\'re nothing like you people here. Right…?', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Aren\'t you a kidnapper of sorts too? I mean you take things from their native lands and carry them off to far away museums.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  That\'s not the same thing at all! We do this to protect history and to educate. You do this for money, or your own sick pleasure!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Aren\'t you a kidnapper of sorts too? I mean you take things from their native lands and carry them off to far away museums.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Hehe, that\'s a funny idea. Me, a daring kidnapper of the past… it sounds so romantic! But no, I could never be like you.  ', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Aren\'t you a kidnapper of sorts too? I mean you take things from their native lands and carry them off to far away museums.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Please don\'t try and drag me and my noble profession down to the same level as you rotten kidnappers.  ', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Aren\'t you a kidnapper of sorts too? I mean you take things from their native lands and carry them off to far away museums.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  No! There\'s no way that\'s true! Y-You\'re just trying to hurt me, that\'s all.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Aren\'t you a kidnapper of sorts too? I mean you take things from their native lands and carry them off to far away museums.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  How dare you put the noble and time-honored tradition of archaeology on the same level as kidnapping?! You\'re more rotten than I thought!', 'talking'=>true,'proc'=>method(:face_angry)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Hmmm, maybe I made the wrong choice with you. Those other archaeologists might have been cuter…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  So is that all we prisoners are to you? Things to be gawked at?', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Hmmm, maybe I made the wrong choice with you. Those other archaeologists might have been cuter…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  You leave my friends alone!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Hmmm, maybe I made the wrong choice with you. Those other archaeologists might have been cuter…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Ohh! I think that stung more than your attacks.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Hmmm, maybe I made the wrong choice with you. Those other archaeologists might have been cuter…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Please don\'t hurt my friends! I promise I\'ll try harder to please you!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Hmmm, maybe I made the wrong choice with you. Those other archaeologists might have been cuter…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  You really know how to hurt a girl, you know that?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Hmmm, maybe I made the wrong choice with you. Those other archaeologists might have been cuter…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  What! There\'s no way they’re cuter than me!', 'talking'=>true,'proc'=>nil},\
        {'text'=>'  Alexie:  I\'ll have you know I was voted sexiest archeologist 3 times in a row.', 'talking'=>true,'proc'=>method(:face_happy)},\
        {'text'=>'  Alexie:  It would have been 4 times had it not been for that Croft girl… ', 'talking'=>true,'proc'=>method(:face_default)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You should be glad I kidnapped you. I mean, now you don\'t have to dig around in the dirt all day.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  I mean, that\'s not really all we do. There\'s actually a whole host of interesting discoveries and theories to ponder over! Like, did you know, for instance, that just outside of Ghiaccio we found evidence of angel worshippers? It\'s fascinating because… oh dear, I went on a rant again, didn\'t I?', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You should be glad I kidnapped you. I mean, now you don\'t have to dig around in the dirt all day.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Well, maybe I liked my job - did you ever stop to think of that?', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You should be glad I kidnapped you. I mean, now you don\'t have to dig around in the dirt all day.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  By that logic, maybe someone should kidnap you so you don\'t have to be a kidnapper anymore.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  You should be glad I kidnapped you. I mean, now you don\'t have to dig around in the dirt all day.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  That\'s a strange way to justify kidnapping someone.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  You should be glad I kidnapped you. I mean, now you don\'t have to dig around in the dirt all day.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  You know, there\'s a lot more to archaeology than just digging around in the dirt, right? I mean, it\'s a serious science. Hey, stop yawning!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'threaten' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  If you\'re so keen to get away, maybe I should take you back to where I found you… as you are now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  What?! Do you have any idea what would happen to me if slave traders saw me?! It would be like Christmas for those perverts!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  If you\'re so keen to get away, maybe I should take you back to where I found you… as you are now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  What?! I wouldn\'t last five minutes in the desert tied up like this, and you know it!  ', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  n/a', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  If you\'re so keen to get away, maybe I should take you back to where I found you… as you are now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  What?! There\'s no way you\'d do something so cruel and twisted… right?', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  If you\'re so keen to get away, maybe I should take you back to where I found you… as you are now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  P-Please, no! I\'d never be able to hop my way out of the desert with all these ropes around me!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  If you\'re so keen to get away, maybe I should take you back to where I found you… as you are now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Huh. Getting left in the desert can\'t be much worse than wasting away down here with you!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  So I\'m thinking of opening this place up to the public. Hypothetically, how would you like to be displayed? Because I was thinking strappado.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  What?! Me, on display, like some prized specimen?! All those people looking at me, all tied up… Oh, I can\'t think about it!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  So I\'m thinking of opening this place up to the public. Hypothetically, how would you like to be displayed? Because I was thinking strappado.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Well, actually I\'m more inclined to go with - Wait a minute, what am I saying?! This is a crazy idea!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  So I\'m thinking of opening this place up to the public. Hypothetically, how would you like to be displayed? Because I was thinking strappado.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Huh, that would be deliciously ironic, wouldn\'t it - to be put on display like all the artifacts I\'ve collected.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  So I\'m thinking of opening this place up to the public. Hypothetically, how would you like to be displayed? Because I was thinking strappado.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  That\'s one sick, ironic mind you\'ve got there.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  So I\'m thinking of opening this place up to the public. Hypothetically, how would you like to be displayed? Because I was thinking strappado.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Oh god! I\'ve read about strappado in my history books! Isn\'t that a kind of torture?! What kind of place is this?!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  So I\'m thinking of opening this place up to the public. Hypothetically, how would you like to be displayed? Because I was thinking strappado.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie: T-There\'s no way I\'ll let you put me on display like some stuffed animal! Someone one will come rescue me, and when they do, y-you\'ll be the one on display!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  So I was thinking of doing a little experiment. I want to see how far the muffled cry of someone being spanked will travel.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  You want to do what to me?! W-Wait a minute, I don\'t even… I mean… How would you…', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  (I think I broke her…)', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  So I was thinking of doing a little experiment. I want to see how far the muffled cry of someone being spanked will travel.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Y-You\'re not seriously going to use me for this, are you?!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  So I was thinking of doing a little experiment. I want to see how far the muffled cry of someone being spanked will travel.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Well, if it\'s for science, I guess I have to help… But not too hard, alright?', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  So I was thinking of doing a little experiment. I want to see how far the muffled cry of someone being spanked will travel.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  What?! Find someone else for your little game \'cause I\'m not getting spanked just to please you!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  So I was thinking of doing a little experiment. I want to see how far the muffled cry of someone being spanked will travel.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Please tell me you\'re joking!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  So I was thinking of doing a little experiment. I want to see how far the muffled cry of someone being spanked will travel.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  You can just put that bad idea back in your perverted mind, \'cause there\'s no way I\'m letting you gag me and spank me just to prove some pervert\'s theory!  ', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Hmmm, maybe I should wrap you right up, then I\'d have my own personal Egyptian Mummy.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Oh no! All wrapped up like that would be horrible! I couldn\'t even wriggle!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Hmmm, maybe I should wrap you right up, then I\'d have my own personal Egyptian Mummy.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  I bet you don\'t know the first thing about Egyptology. How do you expect to complete a full mummification ritual is… Oh, you\'re talking bondage again, aren\'t you…  ', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Hmmm, maybe I should wrap you right up, then I\'d have my own personal Egyptian Mummy.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Oh that sounds interesting, but where would you a find a sarcophagus at this time of… Oh wait, you just meant you\'re gonna tie me up some more, right?', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Hmmm, maybe I should wrap you right up, then I\'d have my own personal Egyptian Mummy.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Is that your idea of an ironic joke or something? You know not all archaeologists raid tombs, right?', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Hmmm, maybe I should wrap you right up, then I\'d have my own personal Egyptian Mummy.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Well I\'m not even Egyptian, so how do you possibly expect an accurate reproduction of an Egyptian Mummy without someone from Egypt?', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'slap' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I bet you\'ll like this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Ah! No! Cut it out!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You deserve this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Owww! Stop!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You deserve this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Owww! I can\'t believe you…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  You deserve this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Agh! Don\'t!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  You deserve this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Owww! Get away from me!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  You deserve this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Owww! I hate you!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I bet you\'ll like this~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Ah! No!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You need some punishment.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Ah! Stop!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You need some punishment.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Agh! Ow!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  You need some punishment.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Ow! Stop it…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  You need some punishment.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Ow! Don\'t do that!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  You need some punishment.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Ow! You better not do that again!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I bet you\'ll like this~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Ow! No!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You need some punishment.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Oww! Don\'t!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Here\'s a treat for you~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Ow! Don\'t do that!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  You need some punishment.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Agh! Please don\'t…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  You need some punishment.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Ow! I\'m sorry!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  You need some punishment.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Agh! Stop it, right now!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I bet you’ll like this~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Ow! No! Why would you think that?!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I think you deserve this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Oww! To think I liked you…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Here\'s a treat for you~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Ow! Why?!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I think you deserve this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Ow! What did I do?!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I think you deserve this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Ow! I\'m sorry!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I think you deserve this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Ow! What is wrong with you?!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'tickle' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I think I\'ll take up a science too, and my first subject, will be you…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  What? I mean I don\'t think I\'m that interesting. Besides, studying people is really a branch of sociology, and that\'s not even a real scie - AHAHAH! Stop! Please, I take it back - HAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I think I\'ll take up a science too, and my first subject, will  be you…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Wait, what are you - HAHAHA Stop! This is a mockery to science!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  N/A', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I think I\'ll take up a science too, and my first subject, will  be you…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  HAHAHAHA - Get away from me, you fraud!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I think I\'ll take up a science too, and my first subject, will  be you…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  HAHAHAHA! This is why only scientists are allowed to -AHAHAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I think I\'ll take up a science too, and my first subject, will  be you…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Sure, like you could ever become a- AHAHAHA! Okay, okay I\'m  sorry just st- HAHAHA!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s make science fun!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  But I think it\'s already fun… HEHEHAHAHA! W-What is this!?  What has this got to do with- AHAHAHAHEHEH!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s make science fun!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  But it already is f- AHAHAHAHA! W-What are you doing?!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s make science fun!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Oh, what did you have in mind? Perhaps we could try a new teaching method that would -', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  Tickling!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Wait, what? AHAHAHHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s make science fun!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Somehow I doubt you care at all about - HAHAHAH! Hey, get your hands- HAHAHAH! See, what did I say, no respect for- HEHEHEHHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s make science fun!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Oh no, what are planing now? Wait, what are you doing with those feathers? AHAHAHHEHE! I knew you were planning something stupid!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s make science fun!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Why do we need feathers for that? And why are you smiling maniacally? Oh dear… AHAHAHEHEHHA! Stop this at once, you- AHAHAHEHEHE!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Have you ever met my friend, Feather Duster?', 'talking'=>false,'proc'=>nil},\
				{'text'=>' Alexie:  W-Wait hold on! I\'m super ticklish! Please don\'t do this! Seriously, all the other archeologists used to tease me about it, and I don\'t- AHAHAHEHAHAHA! P-Please stop! HEHEHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Have you ever met my friend, Feather Duster?', 'talking'=>false,'proc'=>nil},\
				{'text'=>' Alexie:  Ummm… Why would I want to- AHAHAHEHEHA! Okay! Okay! I think that\'s enough introductions!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Have you ever met my friend, Feather Duster?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Hehe, I think I know where this is going. I\'d be delighted to meet your friend- AHAHAHHEHE! Yep, I knew it! HEHEHEHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Have you ever met my friend, Feather Duster?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Oh no…', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Alexie:  HEHEHAHAHA! S-Stop it! Please!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Have you ever met my friend, Feather Duster?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Oh, please no… Seriously, I\'m very ticklish! Please keep that away from ME!', 'talking'=>true,'proc'=>method(:face_afraid)},\
				{'text'=>'  Alexie: AHAHAHEHEHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Have you ever met my friend, Feather Duster?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Oh no! Don\'t you even think about it! Seriously, I\'m super ticklish! I can\'t control myself when- AHAHAHEHAHAH! Cut it out!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I\'ve decided to let you go, but first I have to search you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  O-Oh that\'s nice. Now I can go back to my- HAHAHEHEH! S-Stop! Why are you tickling me?! I thought you were gonna- HAHAHHEHE!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Sorry, but you’re just too cute to let go after all!', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I\'ve decided to let you go, but first I have to search you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Really? Oh, that\'s great news! Now I can finally- AHAHAHA! Oh, you sneak! I see what you -HEHEHAHAH!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I\'ve decided to let you go, but first I have to search you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Oh, happy day! Now I can get back to working on- HEHEHAHAHA! Wait, what are you doing?! Oh, you clever little minx! HEHAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I\'ve decided to let you go, but first I have to search you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  I don\'t like the sound of- HEHAHAHAHE! I-I knew it! You just wanted me to drop my- AHAHAHEHEHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I\'ve decided to let you go, but first I have to search you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Oh, thank goodness! I was begining to- wait, why do you have that feather in your hand? Oh no… HAHAHEHEHA! You rotten sneak!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'kiss' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Tell me, what do your books say about this ancient art?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Mmmm… I mean, stop! You can\'t just kiss me out of the blue like that! It\'s not decent!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Stand very still, alright?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  P-Please stop', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  n/a', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Tell me, what do your books say about this ancient art?', 'talking'=>false,'proc'=>nil},\
				{'text'=>' Alexie:  Mmmm… Unfortunately, not enough.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Tell me, what do your books say about this ancient art?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Mmmph! what are you doing?!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Tell me, what do your books say about this ancient art?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Mmmph! Hey! My books are not some cheap erotic thrillers!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Theory is all well and good, but you can\'t beat a good practical lesson…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Oh, my! We never had these when I was at school. Maybe I\'ll have to introduce them if I ever get out of here…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Theory is all well and good, but you can\'t beat a good practical lesson…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Wait, a lesson in wh- Mmmph!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Alexie:  Oh, hehe, I see now.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Theory is all well and good, but you can\'t beat a good practical lesson…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Mmmm… Oh, my! You\'re a fine teacher!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Theory is all well and good, but you can\'t beat a good practical lesson…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Mmmm. That was nice, but I wish I were actually back at work.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Theory is all well and good, but you can\'t beat a good practical lesson…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Mmmph -Stop! I don\'t want any part of your “lessons”!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Theory is all well and good, but you can\'t beat a good practical lesson…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Hmmph! Hey! Keep your perverted lessons to yourself!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  So I was thinking you could help me with some research. I want to do an in-depth analysis on the lips of cute archaeologists.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Oh. Well, I mean… I guess I can let you… but please… you see, I\'ve never kissed a girl, so I don\'t know if I\'ll be any good…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  So I was thinking you could help me with some research. I want to do an in-depth analysis on the lips of cute archaeologists.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Hehe, well I hope I can be of some help there. Mmmm… There! Have you reached any conclusions yet, or do we have to go deeper?', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  So I was thinking you could help me with some research. I want to do an in-depth analysis on the lips of cute archaeologists.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Hehe, all in the name of science eh? Mmmph… Well I learnt something here… that you\'re a great kisser!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  So I was thinking you could help me with some research. I want to do an in-depth analysis on the lips of cute archaeologists.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Well, you\'d better go kidnap another archaeologist then…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  So I was thinking you could help me with some research. I want to do an in-depth analysis on the lips of cute archaeologists.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Wait, what?! You can\'t just treat me like some specimen to be used- Mmmph!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  So I was thinking you could help me with some research. I want to do an in-depth analysis on the lips of cute archaeologists.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Don\'t you even think about - No! Don\'t come any closer, I\'m  warning- Mmmm…', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Stand very still…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Mmmm, you are so sweet.', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Stand very still…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie: Mmmm.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Stand very still…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Mmmm, don\'t stop now.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Keep nice and still. I\'m about to use my deadliest attack on you!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Wait… what\'s going on?! I wasn\'t even doing any- MMMPH!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Alexie:  Oh, hehe - I see what you mean now. Yep, that\'s a deadly attack, alright; you could break someone\'s heart doing that.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Keep nice and still. I\'m about to use my deadliest attack on you!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Mmmph! Hey! That was a dirty trick and you know it. After all, if you want to kiss me, all you have to is ask.', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'ungag' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take this off for a while, shall we?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie: Ugh, thank goodness… I think I was starting to drool…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take this off for a while, shall we?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie: Thanks…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  n/a', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take this off for a while, shall we?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  I guess, but I still have nothing to say to the likes of you.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take this off for a while, shall we?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  I still don\'t trust you.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take this off for a while, shall we?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie: Ugh, that tasted horrible! Couldn\'t you find a more civilised way to keep someone quiet!?', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I think we can take this off now; it\'s not like anyone could hear you anyway.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  W-What?! You mean I\'ve been yelling into that gag all this time for no reason?! Ugh… and I bet all you perverts enjoyed that, didn\'t you?  ', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I think we can take this off now; it\'s not like anyone could hear you anyway.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Then why are we all kept gagged most of the time?!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I think we can take this off now; it\'s not like anyone could hear you anyway.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Thanks. At least now we can talk like civilised people', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I think we can take this off now; it\'s not like anyone could hear you anyway.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Then why gag me at all?! Oh I know, I was warned about people like you. Y-you just enjoy the thrill of it, don\'t you?!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I think we can take this off now; it\'s not like anyone could hear you anyway.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  I don\'t like the sound of this. There\'s only so many reasons you\'d need my mouth and none bode well for me…', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I think we can take this off now; it\'s not like anyone could hear you anyway.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Then why in the name of science am I left gagged all the time?! Is it really just for your sick pleasure?! You pervert!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Okay, I\'ll be nice and let you talk for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Ugh, so now I have to be allowed to talk. I feel like I\'m back in school, only with more gags…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Okay, I\'ll be nice and let you talk for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Oh, thanks! Hey, did you know that some native tribes used gags similar to the ones you have here? Fascinating, isn\'t it? In fact we\'ve found artifacts dating back hundred of years that-', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  (I think I\'ve made a terrible mistake…)', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Okay, I\'ll be nice and let you talk for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Hehe, you\'re so domineering! Once, while on an expedition, our team discovered an Amazon queen a lot like you! She was tough, beautiful, and really quite fascinating. In fact, we -', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  (I think I\'ll need bigger gag…)', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Okay, I\'ll be nice and let you talk for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  I still have nothing to say to you! Ooh, is that an original 5th century vase over there?! This place is fascinating!  ', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Okay, I\'ll be nice and let you talk for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  W-Why? What do you want me to say?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Okay, I\'ll be nice and let you talk for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Well, aren\'t you just little Miss Magnanimous!  ', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  I can always put the gag back in!', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take this off for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie: Hey, why are you looking at my lips, huh? Teehee.', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s  take this off for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Did you want to talk about something?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Alexie:  Finally! Now I can tell you all about the subtle differences between 5th century pottery and 6th century -  ', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Don\'t make me put the gag back in!', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take that out of your mouth, shall we?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Hehe, you know I\'ve been captured a few times on my adventures, but I think I\'ve enjoyed being gagged by you the best.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take that out of your mouth, shall we?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Ah, thanks. But I can still taste it. If only I could taste something else, something sweet and rosy, like the lips of a beautiful captor maybe…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take that out of your mouth, shall we?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Hmph, I expect compensation for this! You\'d better show me some of the artifacts around here, or… or at least let me examine you.', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'blindfold_on' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Blindfold is coming!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  What are you gonna do with me?', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take off your glasses first, and then…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Hey, wait!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I\'ve got something for you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Okay, what is it? - Oh…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Nighty Night!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  No, no, no!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s play hide and seek, shall we?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  No, please, I\'m afraid of the dark!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Lights out!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Take it off, please!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Blindfold coming up!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Please! Don\'t do it.', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take off your glasses first, and then…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Wait a second!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I\'ve got something for you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Please, not again.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Nighty Night!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Please, stop!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s play hide and seek, shall we?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  No, I don\'t want to be blind!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Lights out!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Keep your filthy hands in your pockets!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Blindfold coming up!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Please, please, not again.', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take off your glasses first, and then…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Hey, stop it!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I\'ve got something for you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  An artifact?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  No. Something better!', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Nighty Night!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Just let me go.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s play hide and seek, shall we?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  I don\'t want to play! Go, go away!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Lights out!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  You\'ll pay for that!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Blindfold coming up!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  No, it should stay where it is.', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take off your glasses first, and then…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Please, no! Not this!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I\'ve got something for you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  At least be gentle.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Nighty Night!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  No! Why? Just why?!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s play hide and seek, shall we?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Go away!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Lights out!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  I won\'t forget this!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'blindfold_off' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see what\'s under here, professor. Oh, look… a pair of beautiful eyes!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Don\'t try and butter me up, I-I know you’re just saying this to make me drop my guard.  ', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see what\'s under here, professor. Oh, look… a pair of beautiful eyes!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  That\'s not funny.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  n/a', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see what\'s under here, professor. Oh, look… a pair of beautiful eyes!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  I don\'t have beautiful eyes, and you\'re no archeologist!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see what\'s under here, professor. Oh, look… a pair of beautiful eyes!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  J-Just leave me alone, will you?!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see what\'s under here, professor. Oh, look… a pair of beautiful eyes!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Stop these silly games and just let me go already!  ', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s reveal the treasure that lies beneath!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  W-What? You think my… No, no way…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s reveal the treasure that lies beneath!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Hehe, You think my eyes are a treasure, eh? That\'s sweet.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s reveal the treasure that lies beneath!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Hehe, well I have had people say my eyes glisten like gems… in my fantasies, anyway…  ', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s reveal the treasure that lies beneath!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  There\'s no treasure to be found in a place like this…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s reveal the treasure that lies beneath!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  On, off, on, off, just make up your mind already! Do you want me blindfolded or not?!  ', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s reveal the treasure that lies beneath!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Hmm, flattery won\'t save you, kidnapper! Once the guards find me here, you\'ll be the one locked up in a cell!  ', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Strip!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Huh?! W-Wait a minute! I like you and everything, but this is a bit sudden! And with all those other people - Huh, wait, don\'t tell me you were just talking about… Oh dear…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Strip!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Wait, what?! No you can\'t do that here, I - Oh, you meant just the blindfold. You really scared me there.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Strip!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Well I mean if it\'s for you, then I guess- Oh! Oh you meant just… I thought… (Blushes)', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Strip!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  What?! No, please, not with every- Oh, you meant just the blindfold. That was a mean trick!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Strip!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Oh no! Please, not in front of- Wait, what? The blindfold… Why, you… you little trickster.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Strip!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Just try it! I swear I\'ll - Huh? Oh you just meant… Now why do you have to go and get me angry over nothing?!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I think I know where the real treasure is.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Hehe, you better keep a good eye on me, or someone might steal me away.', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I think I know where the real treasure is.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Hehe, tada! Am I all you hoped for?', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I think I know where the real treasure is.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Hehe, don\'t spend me all in one place.  ', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I think I know where the real treasure is.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Well I\'ll give you one thing… you sure keep your treasure secure…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I think I know where the real treasure is.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Alexie:  Huh… sweet talk won\'t help you. After all, a kidnapper like you could never appreciate a true treasure.', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	]\
};
	end
end
$privateCellDamsels['alexie'] = PrivateCellDamselAlexie.new
