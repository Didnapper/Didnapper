#need to try inserting text event into stack
#[image number, name, origin,appointment method?(0 for direct),x,y,zoomx,zoomy,opacity,blend_type]

class PrivateCellDamselRisette < PrivateCellDamsel
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
    @tag = 'risette'
		super()
		#personality
		@emotions['fear'] = [2,0]
		@emotions['shyness'] = [5,0]
		@emotions['anger'] = [4,0]
		@emotions['happiness'] = [7,0]
		@emotions['sadness'] = [2,0]
    #currently unused
    @homophilia = 1
		@masochism = 1
		
		
		@disposition = 1
		@disposition_index = 664
		@disposition_min = 1
		
		#bases
    list = {'outfitdefault' => [30,'PCRisetteBase',0,0,-100,0,100,100,255,0],'outfit2'=> [30,'PCRisetteBaseCow',0,0,-100,0,100,100,255,0],'outfit1'=> [30,'PCRisetteBaseBunny',0,0,-100,0,100,100,255,0]}
		@images['base'] = list
#    list = {'back' => [30,'PCRisetteBase',0,0,-100,0,100,100,255,0]}
#		@images['base'] = list
		
		#brows
		list = {'annoy1' => [32,'PCRisette_browannoy1',0,0,-100,0,100,100,255,0],'annoy2'=> [32,'PCRisette_browannoy2',0,0,-100,0,100,100,255,0], 'normal' => [32,'PCRisette_brownormal',0,0,-100,0,100,100,255,0]}
		list = list.merge({'tickle' => [32,'PCRisette_browtickle',0,0,-100,0,100,100,255,0],'worry' => [32,'PCRisette_browtickle',0,0,-100,0,100,100,255,0]})
		@images['brow'] = list
		
		#mouths and gags
		list = {'annoy1' => [34,'PCRisette_mouthannoy1',0,0,-100,0,100,100,255,0],'annoy2'=> [34,'PCRisette_mouthannoy2',0,0,-100,0,100,100,255,0], 'neutral' => [34,'PCRisette_mouthneutral',0,0,-100,0,100,100,255,0]}
		list = list.merge({'tickle' => [34,'PCRisette_mouthtickle',0,0,-100,0,100,100,255,0],'smile' => [34,'PCRisette_mouthsmile',0,0,-100,0,100,100,255,0]})
		list = list.merge({'ball' => [34,'PCRisette_gagball',0,0,-100,0,100,100,255,0],'bit' => [34,'PCRisette_gagbit',0,0,-100,0,100,100,255,0],'cleave' => [34,'PCRisette_gagcleave',0,0,-100,0,100,100,255,0]})
		list = list.merge({'cloth' => [34,'PCRisette_gagotm',0,0,-100,0,100,100,255,0],'knot' => [34,'PCRisette_gagknot',0,0,-100,0,100,100,255,0],'otn' => [34,'PCRisette_gagotn',0,0,-100,0,100,100,255,0]})
		list = list.merge({'sgag1' => [34,'PCRisette_gagwestern',0,0,-100,0,100,100,255,0],'sgag2' => [34,'PCRisette_gagbigotm',0,0,-100,0,100,100,255,0]})
    @images['mouth'] = list
		
		#eyes and blindfold
		list = {'blindfold' => [36,'PCRisetteBlindfold',0,0,-100,0,100,100,255,0],'blink' => [33,'PCRisette_eyeclosed',0,0,-100,0,100,100,255,0]}
		list = list.merge({'normal1' => [33,'PCRisette_eyenormal',0,0,-100,0,100,100,255,0],'normal2' => [33,'PCRisette_eyenormal',0,0,-100,0,100,100,255,0]})
		list = list.merge({'right' => [33,'PCRisette_eyenormal',0,0,-100,0,100,100,255,0],'left' => [33,'PCRisette_eyeleft',0,0,-100,0,100,100,255,0]})
		list = list.merge({'tickle' => [33,'PCRisette_eyeclosed',0,0,-100,0,100,100,255,0],'happy' => [33,'PCRisette_eyeclosed',0,0,-100,0,100,100,255,0]})
		@images['eyes'] = list
    
    #accessories
    @images['accessories'] = {}
    list = {'acc1' => [31,'PCRisetteAcc3',0,0,-100,0,100,100,255,0],'acc2'=>[37,'PCRisetteAcc4',0,0,-100,0,100,100,255,0]}
    @images['accessories']['outfit1'] = list
    list = {'acc1' => [31,'PCRisetteAcc1',0,0,-100,0,100,100,255,0],'acc2'=>[37,'PCRisetteAcc2',0,0,-100,0,100,100,255,0]}
    @images['accessories']['outfit2'] = list
		
		#misc
		list = {'blush1' => [31,'PCRisette_blush1',0,0,-100,0,100,100,255,0],'blush2' => [31,'PCRisette_blush2',0,0,-100,0,100,100,255,0],'tears' => [35,'PCRisette_tears',0,0,-100,0,100,100,255,0]}
		@images['misc'] = list
		
		testIntro = [{'text'=>"This is line 1","proc"=>nil},{'text'=>"This is line 2","proc"=>nil}]
		
		@dialogue =\
{\
	'speak' =>\
	[\
		[\
			{'text'=>'  Suki1:  See? This can be a lot of fun, if you give it a chance.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Risette:  It\'s not like you\'ve given me a choice! About anything!', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  Are you angry with me?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Risette:  Yes!', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Risette:  … No. Not really. You\'re a nice girl. I knew that from the start, even if I didn\'t figure the whole \'kidnapper\' thing.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Risette:  I just wish you\'d untie me sometimes. I\'d like to take you on a real date.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  That could be nice… someday.', 'talking'=>false,'proc'=>nil}\
		],\
		[\
			{'text'=>'  Risette:  I can\'t believe you were serious about kidnapping me!', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Risette:  Why did you do this, anyway?! What did I ever do to you?!', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  You didn\'t do anything to me. I just liked you.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Risette:  And how does that translate into tying me up and locking me in a cell?!', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  This is just what I do.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Risette:  That\'s really weird. Couldn\'t you just ask me out on a date?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  This is kind of like a date…', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Risette:  …', 'talking'=>true,'proc'=>nil}\
		],\
		[\
			{'text'=>'  Risette:  This is fun for you, isn\'t it? You honestly enjoy having me tied up like this.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  I know it seems strange…', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Risette:  I don\'t get it! What\'s so appealing about this to you? Is it the way I look?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  That\'s a part of it~', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Risette:  Yes… I can tell from the way you look at me.', 'talking'=>true,'proc'=>nil}\
		],\
		[\
			{'text'=>'  Risette:  Listen… I\'m really worried about my store. There\'s nobody else to attend it.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  Well, you didn\'t seem to have many customers…', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Risette:  Ouch…', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Risette:  Well, I suppose it\'s true. Huston really isn\'t a very big village, and most people don\'t need the kind of things I sell. It\'s a farming community.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  Then why do you still run the store?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Risette:  It was my parents\' store before it was mine, and my grandparents\' before that. There used to be a lot more people in Huston back then.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Risette:  I couldn\'t just abandon it.', 'talking'=>true,'proc'=>nil}\
		],\
		[\
			{'text'=>'  Risette:  I can\'t believe you\'re keeping Esther down here, too! You\'re unbelievable!', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  She\'s your cousin, right? I overheard the two of you talking when I first came to the village.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Risette:  She is. People have a hard time believing that, since she\'s so strait-laced and uptight, and I\'m…', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  Not?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Risette:  No. We\'re pretty different, I know, but she\'s one of the dearest things in the world to me.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Risette:  Esther… she must be hating this.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  You might be surprised.', 'talking'=>false,'proc'=>nil}\
		],\
		[\
			{'text'=>'  Suki1:  I didn\'t expect a shopkeeper to put up such a fight.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Risette:  I didn\'t expect my customers to kidnap me!', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Risette:  Esther taught me how to fight. When we were younger, we planned on going on a journey together. She wouldn\'t even let me talk about it without making sure I could defend myself.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  She\'s really protective of you.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Risette:  She can be overprotective at times.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Risette:  Still, it\'s only because she cares.', 'talking'=>true,'proc'=>nil}\
		]\
	],\
	'charm' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I know part of you enjoys it!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  There are other parts too, and it looks like those are stronger.', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You were the prettiest girl in your whole village.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  You should know, since you kidnapped them all!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I know you\'re not into being tied up, but you do look really good like that.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  I really don\'t know how to feel about that…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  You really are too pretty to be running some tiny, out-of-the-way shop.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  If you\'re going to sweet-talk me, how about untying me first?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  You\'re really looking pretty like that!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Do I now? Then let\'s switch!, You\'ll look even prettier!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You were the prettiest girl in your whole village.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  That\'s going a little far…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I should get back to work, but I just want to stay here with you a while longer.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  You\'re a sweet girl, for a kidnapper.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I know you\'re not into being tied up, but you do look really good like that.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  See? Being nice to me isn\'t so hard.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  You really are too pretty to be running some tiny, out-of-the-way shop.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  You really think so…?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Aren\'t you glad you don\'t have to go back there?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Let\'s just say I have mixed feelings right now.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  You look so good like that!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  …', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Risette:  I\'m really not sure how to respond to that.', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You\'re always so much fun to play with.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Hearing that makes me feel a little better about this…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I\'m surprised you aren\'t already spoken for. You\'re pretty, and smart, and fun…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  It\'s nice when you\'re being… nice.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You should see yourself right now. You look really nice.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Oh? Do you like what you see?', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I wish you wouldn\'t look so down. I don\'t want you to be unhappy.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Well, you have an odd way of showing it…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  You were worth the extra trouble.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  You went out of your way just to abduct me. That\'s pretty flattering.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Risette:  Although, maybe I shouldn\'t be flattered by that.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I guess I\'ve been pretty hard on you. You just look cute when you\'re angry.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Are you just trying to get back on my good side?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Would I do that if I didn\'t care about you?', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You\'re always so much fun to play with.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  I-I\'m glad you think so… I think.', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I\'m surprised you aren\'t already spoken for. You\'re pretty, and smart, and fun…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  It almost sounds like you\'re interested, sweetie.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You should see yourself right now. You look really nice.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  You\'re not so bad yourself, sweetie~', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I wish you wouldn\'t look so down. I don\'t want you to be unhappy.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  I know.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I guess I\'ve been pretty hard on you. You just look cute when you\'re angry.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  You\'re a hard girl to stay mad at.', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'insult' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You\'re single, right? I guess nobody looks twice at you?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Why are you saying this? Are you trying to hurt me?!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Are you sure you should have been running that store? You don\'t really seem smart enough.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  You\'re an awful girl sometimes.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I didn\'t see any other customers in your shop. You had a good inventory, so maybe it\'s you?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  … You have a pretty face, but you can be a very cruel girl.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I\'ll bet this is the most attention anyone\'s paid you in a long time.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  T-That\'s not true! You\'re being awful!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Are you mad because even Esther\'s prettier than you are?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Stop saying those things!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You\'re single, right? I guess nobody looks twice at you?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  That isn\'t true!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Are you sure you should have been running that store? You don\'t really seem smart enough.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  That\'s rude! You\'re not as nice as I thought!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Do people not visit your store because you\'re dishonest? After all, you say you don\'t like being tied up, but I can tell you enjoy it…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette: Don\'t you call me a liar!', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I didn\'t see any other customers in your shop. You had a good inventory, so maybe it\'s you?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Don\'t say things like that!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I\'ll bet this is the most attention anyone\'s paid you in a long time.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Do you like hurting my feelings?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Are you mad because even Esther\'s prettier than you are?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  What do you mean, “even?” You spiteful little thing!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Do you dress that way because it\'s the only way to bring customers to your store?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  No! What are you implying?!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You\'re really a lot easier to spend time with when you have a gag in your mouth.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  I hope you\'re not serious…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Why did you even bother learning to fight? You\'re not even good enough to stop one little kidnapper.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  I… I know…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Esther\'s here with me… do you think anyone else in your village will even notice you\'re gone?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Now you\'re being heartless.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I think I saw a leather hood in the guild\'s inventory.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  A-a what?!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  I\'m tempted to use it on you so I don\'t need to look at your face.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  …You\'re horrible.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  If you admitted you like being tied up, maybe people would pay more attention to you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  I don\'t! Why are you being so mean?!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Do you dress that way because it\'s the only way to bring customers to your store?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  How I dress is my business!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You\'re really a lot easier to spend time with when you have a gag in your mouth.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  W-what?', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Why did you even bother learning to fight? You\'re not even good enough to stop one little kidnapper.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  You don\'t have to rub it in!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Esther\'s here with me… do you think anyone else in your village will even notice you\'re gone?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Of course they will!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Risette:  … won\'t they?', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  If you admitted you like being tied up, maybe people would pay more attention to you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  I\'m not a liar, and I don\'t want that kind of attention!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'threaten' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Do you think your cousin would like to see you like this? Maybe we should show her…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  N-no! No way!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I may just leave you like this. For a long time.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  You can\'t do that!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  You were a shopkeeper. What do you think would be a fair price for you?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  You wouldn\'t sell me! You couldn\'t!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  The guild has connections.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Nnn…', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  (Sometimes I even scare myself.)', 'talking'=>false,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Maybe I\'m being a little too lenient here. You can still move around like this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  You r-really don\'t have to change that…', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  If you don\'t stop squirming around, I\'ll have to hang you from the ceiling.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  What?! You\'re joking, right?', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Do you think your cousin would like to see you like this? Maybe we should show her…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Let her see me like this?! Are you crazy?!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I may just leave you like this. For a long time.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  No! Untie me already!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You seem pretty flexible. How small a space do you think you could fit into?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  I don\'t want to know why you\'re asking that.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  You were a shopkeeper. What do you think would be a fair price for you?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  P-price?! You\'re not…', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Risette:  I\'ve heard stories, but you can\'t be thinking of selling me! I don\'t want-', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  You\'d best behave yourself, then.', 'talking'=>false,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Maybe I\'m being a little too lenient here. You can still move around like this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  H-hey… I\'ve got to have some freedom… right?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  If you don\'t stop squirming around, I\'ll have to hang you from the ceiling.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  You mean little…!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You\'re really blushing a lot, Risette. If I knew you were so into this, I\'d have stopped going easy earlier…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Y-you\'re getting the wrong idea here!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Do you really think this is the worst I can do?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Suki1:  I could make your body bend in all sorts of ways…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Ngh… please don\'t…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I wonder how long you could keep your balance on one leg…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  You\'re… not thinking about…', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Oh, I\'m thinking about it…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Ehh…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Stop trying so hard to get loose.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Suki1:  You look good in ropes. I don\'t want to have to break out the chains.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  No… you don\'t have to do that…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Should I go be mean to your cousin instead?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  N-no, that\'s not fair…', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  If you\'re going to be so noisy, I\‘ll just leave you gagged until you learn to be quiet.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  I can\'t even speak?! Why are you so cruel?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Don\'t say I didn\'t warn you.', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You\'re really blushing a lot, Risette. If I knew you were so into this, I\'d have stopped going easy earlier…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  This is going easy?! I don\'t really want to see you do worse!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Do you really think this is the worst I can do?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Suki1:  I could make your body bend in all sorts of ways…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  There are some things I don\'t need to experience, sweetie.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I wonder how long you could keep your balance on one leg…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  …Do you really need to know these things?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  No, but finding out is the fun part.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Ohhh… I don\'t like this…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Stop trying so hard to get loose.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Suki1:  You look good in ropes. I don\'t want to have to break out the chains.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  I don\'t really want either… but I\'ll be good.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  If you\'re going to be so noisy, I‘ll just leave you gagged until you learn to be quiet.', 'talking'=>false,'anomaly'=>true,'proc'=>nil},\
				{'text'=>'  Risette:  You can\'t threaten me like that!', 'talking'=>true,'anomaly'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  It sounds like you want that to happen.', 'talking'=>false,'anomaly'=>true,'proc'=>nil},\
				{'text'=>'  Risette:  Ugh…', 'talking'=>true,'anomaly'=>true,'proc'=>nil},\
			]\
		}\
	],\
	'slap' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Hold still.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Ahh! Don\'t do that!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Hold still.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Ouch! Stop!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Hold still.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Ah…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Hold still.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Ahh! P-please don\'t!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Hold still.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Stop it!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Hold still.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Ghh-! What did I do?!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Hold still.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Ahh!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Hold still.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  No! Stop!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Hold still.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Uuugh…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Hold still.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Oww…', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Hold still.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  That hurts! Stop!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Hold still.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Nnh!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Hold still.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Nngh!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Hold still.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Ugh!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Hold still.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Aah!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Hold still.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Ahh! Why?!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Hold still.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Ahh! P-please…', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Hold still, you naughty girl.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  AhhhggUgh… P-Please, no more. why are you doing this?!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Hold still.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Ahh! Wh-what?!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Hold still.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Ahh! That feels good! Please… more! Huh?!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Hold still.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  H-hey! That hurts!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Hold still.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Oww! What are you doing?!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'tickle' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I wonder how ticklish you are…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  N-n-no! Hehehehe!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I wonder how ticklish you are…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  I- I don\'t- haha! S-stop! Hehehe!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I wonder how ticklish you are…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Get aw- ahh! Ahahaha!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I wonder how ticklish you are…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  W-what are you- aah! Hahahaha! Ahaha!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I wonder how ticklish you are…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Keep away from-hehehe! I s-said- ahahaha!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I wonder how ticklish you are…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Hehehe! Ahahah!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I wonder how ticklish you are…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Ahh! Ahahahahaha!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I wonder how ticklish you are…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Ehehehehe~', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I wonder how ticklish you are…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Hehehehe! I… I don\'t want to l-laugh n-n-n-ahahaha!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I wonder how ticklish you are…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  What?! D-d-don\'t- ahaha! Hehehehehe!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I wonder how ticklish you are…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  No! Don\'t y- ahahahaha! Hahaha! G-get off me- ehehehehe!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I wonder how ticklish you are…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Hehehehehe! D-don\'t!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I wonder how ticklish you are…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  H-hey-hehe! Hahahaha!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I wonder how ticklish you are…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Hahahaha! S-stop!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I wonder how ticklish you are…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Hehehehehe! Stop! Please stop!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I wonder how ticklish you are…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Hahahaha! W-why are you…?! A-Ahahahaha!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I wonder how ticklish you are…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Y-y-you- ahahahaha! T-too much…!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I wonder how ticklish you are…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Hahahahaaaa!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I wonder how ticklish you are…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  A- a little- hehehehe!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I wonder how ticklish you are…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Ahh! Hahaha- n-not there! Hahaha!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I wonder how ticklish you are…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Eeeeee! Hehehehehe!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I wonder how ticklish you are…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  H-hahahaha! I… I\'m still mad- hehehehe!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'kiss' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Mmmm?!?', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  A-ah! Mmm…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  No! N-mmmm?!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Mmm… that was unexpected…', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Mmmh?! G-get away from me!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  You\'re a little close- mmmm…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Mm… okay…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Mm… that\'s a little more inviting…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Ahh… I don\'t want to… mmm…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Ahh… why\'re you…?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  *gasp* D-don\'t think you can just kiss away the way you\'ve treated me!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Ahh…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Mmm… if you insist…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  *gasp* My pleasure.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Mmm…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Mmm… h-hey…', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  No, I don\'t think- mmm?!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Mmm…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Mmm… I knew you\'d be a good kisser.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Mm… ooh, you\'re good…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Mm… that always cheers me up a little…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Come here…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Don\'t you- mmmm?! Mmm…', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'ungag' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Hold still so I can…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Aah…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Hold still so I can…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  …Thanks, I guess.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Hold still so I can…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Ahh… you really don\'t have to do that to me, you know.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Hold still so I can…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Bleh… you\'re… just going to do that again… aren\'t you?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  I might…', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Hold still so I can…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Enough with the gags! Isn\'t tying me up all the time enough?!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Hold still so I can…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Aah… good…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Hold still so I can…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Aahh… t-thanks.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Hold still so I can…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Whew, that\'s better…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Hold still so I can…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Do you really have to keep gagging me? If you want me to be quiet, just ask…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Hold still so I can…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Thanks… it kind of scares me when you do that…', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Hold still so I can…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  A-am I supposed to be grateful?!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Hold still so I can…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Haah… that\'s better…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Hold still so I can…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Thanks. Those aren\'t really comfortable.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Hold still so I can…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Aah… see? Don\'t I look better without that thing in the way?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Well…', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Hold still so I can…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Thank you…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Hold still so I can…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  W-well, this is a step forward…', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Hold still so I can…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Ngh… okay, you can stop with those now!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Hold still so I can…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Um, thanks…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Hold still so I can…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Thanks, sweetie.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Hold still so I can…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  You just like hearing me make those sounds, hmm?', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Hold still so I can…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Thanks… that was the last time, right? (never mind. I know the answer to that)', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Hold still so I can…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Gah… that\'s the least you can do, you know…', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'blindfold_on' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I\'m putting this on you for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  You really enjoy tormenting me, don\'t you?', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I\'m putting this on you for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  No! D-don\'t!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I\'m putting this on you for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  It doesn\'t matter if I say no, does it?', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I\'m putting this on you for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  W-what\'re you going to do?!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I\'m putting this on you for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Don\'t do that! Stop being so mean!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I\'m putting this on you for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  No! Hey!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I\'m putting this on you for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  But I don\'t want this…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I\'m putting this on you for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  No! I… I was behaving!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I\'m putting this on you for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Please take it of…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I\'m putting this on you for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  I\'m r-really not comfortable with this…', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I\'m putting this on you for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Take it off! This is mean, even for you!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I\'m putting this on you for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Ah! Nooo!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I\'m putting this on you for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  It\'s not like this is necessary…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I\'m putting this on you for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  I can\'t see a thing like this…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I\'m putting this on you for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Nngh…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I\'m putting this on you for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  D-don\'t do this, o-okay? Take it off…', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I\'m putting this on you for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Okay, now you\'re just being cruel!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I\'m putting this on you for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Ahhh…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I\'m putting this on you for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  I guess I should just accept it…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I\'m putting this on you for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Don\'t do that… I want to see your face.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I\'m putting this on you for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  If you really have to…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I\'m putting this on you for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  What are you doing?!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'blindfold_off' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I think that\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Um… thanks…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I think that\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  That was more than long enough.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I think that\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  I hope you weren\'t expecting gratitude.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I think that\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  T-thank you…', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I think that\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Don\'t do that again! I really hate blindfolds, okay?!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I think that\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Ahh…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I think that\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Mmm… thanks, I suppose.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I think that\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Ah… that\'s much better.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I think that\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  I suppose that\'s something.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I think that\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Huh?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I think that\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  You\'re still cruel.', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I think that\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Okay… now what?', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I think that\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Mmm… thank you.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I think that\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Ahh, thank you…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I think that\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Thanks… but you still won\'t untie me, will you?', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I think that\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Okay…?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I think that\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  It\'s about time…', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I think that\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Thank you…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I think that\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  I appreciate it.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I think that\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  Whew… thanks, sweetie.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I think that\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  I appreciate it, but can\'t you loosen the ropes a little, too?', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I think that\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Risette:  You\'re just playing with me, aren\'t you?', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	]\
};
	end
end
$privateCellDamsels['risette'] = PrivateCellDamselRisette.new
