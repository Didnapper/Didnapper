#need to try inserting text event into stack
#[image number, name, origin,appointment method?(0 for direct),x,y,zoomx,zoomy,opacity,blend_type]

class PrivateCellDamselSucc < PrivateCellDamsel
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
    @tag = 'succ'
		super()
		#personality
		@emotions['anger'] = [4,0]
		@emotions['happiness'] = [5,0]
		@emotions['shyness'] = [7,0]
		@emotions['sadness'] = [1,0]
		@emotions['fear'] = [1,0]
    #currently unused
    @homophilia = 0
		@masochism = 0
		
		
		@disposition = 2
		@disposition_index = 651
		@disposition_min = 1
		
		#bases
		list = {'outfitdefault' => [30,'PCSucc_base',0,0,0,0,100,100,255,0],'outfit1'=> [30,'PCSucc_sleepwear',0,0,0,0,100,100,255,0],'outfit2'=> [30,'PCSucc_kinky',0,0,0,0,100,100,255,0]}
		@images['base'] = list
		
		#brows
		list = {'annoy1' => [32,'PCSucc_browannoy1',0,0,0,0,100,100,255,0],'annoy2'=> [32,'PCSucc_browannoy2',0,0,0,0,100,100,255,0], 'normal' => [32,'PCSucc_brownormal',0,0,0,0,100,100,255,0]}
		list = list.merge({'tickle' => [32,'PCSucc_browtickled',0,0,0,0,100,100,255,0],'worry' => [32,'PCSucc_browworry',0,0,0,0,100,100,255,0]})
		@images['brow'] = list
		
		#mouths and gags
		list = {'annoy1' => [34,'PCSucc_mouthopen',0,0,0,0,100,100,255,0],'annoy2'=> [34,'PCSucc_mouthannoy',0,0,0,0,100,100,255,0], 'neutral' => [34,'PCSucc_mouthneutral',0,0,0,0,100,100,255,0]}
		list = list.merge({'tickle' => [34,'PCSucc_mouthopen',0,0,0,0,100,100,255,0],'smile' => [34,'PCSucc_mouthsmile',0,0,0,0,100,100,255,0]})
		list = list.merge({'ball' => [34,'PCSucc_gagball',0,0,0,0,100,100,255,0],'bit' => [34,'PCSucc_gagbit',0,0,0,0,100,100,255,0],'cleave' => [34,'PCSucc_gagcleave',0,0,0,0,100,100,255,0]})
		list = list.merge({'cloth' => [34,'PCSucc_gagotm',0,0,0,0,100,100,255,0],'knot' => [34,'PCSucc_gagknot',0,0,0,0,100,100,255,0],'otn' => [34,'PCSucc_gagotn',0,0,0,0,100,100,255,0]})
    list = list.merge({'sgag1' => [34,'PCSucc_gagseal',0,0,0,0,100,100,255,0],'sgag2' => [34,'PCSucc_gagtape',0,0,0,0,100,100,255,0],'sgag3' => [34,'PCSucc_gagcorset',0,0,0,0,100,100,255,0]})
		@images['mouth'] = list
		
		#eyes and blindfold
		list = {'blindfold' => [36,'PCSucc_blindfold',0,0,0,0,100,100,255,0],'blink' => [33,'PCSucc_eyeblink',0,0,0,0,100,100,255,0]}
		list = list.merge({'normal1' => [33,'PCSucc_eyenormal',0,0,0,0,100,100,255,0],'normal2' => [33,'PCSucc_eyenormal',0,0,0,0,100,100,255,0]})
		list = list.merge({'right' => [33,'PCSucc_eyeright',0,0,0,0,100,100,255,0],'left' => [33,'PCSucc_eyeright',0,0,0,0,100,100,255,0]})
		list = list.merge({'tickle' => [33,'PCSucc_eyewink',0,0,0,0,100,100,255,0],'happy' => [33,'PCSucc_eyewink',0,0,0,0,100,100,255,0]})
		@images['eyes'] = list
		
		#misc
		list = {'blush1' => [31,'PCSucc_blush',0,0,0,0,100,100,255,0],'blush2' => [31,'PCSucc_blush',0,0,0,0,100,100,255,0],'tears' => [35,'blank',0,0,0,0,100,100,255,0]}
		@images['misc'] = list
		
		testIntro = [{'text'=>"This is line 1","proc"=>nil},{'text'=>"This is line 2","proc"=>nil}]
		
		#"speak" dialogue
@dialogue =\
{\
	'speak' =>\
	[\
		[\
			{'text'=>'Succubus: My, my, my...', 'talking'=>true,'proc'=>method(:face_happy)},\
			{'text'=>'Suki1: Uhmm.. What is it?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Succubus: I knew I didn\'t make a mistake when choosing you, dollface.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: Choosing me? I kidnapped you.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Succubus: I don\'t  mind having such a cute master every once in a while. Well... As  long as you keep things interesting at least.', 'talking'=>true,'proc'=>nil},\
		],\
		[\
			{'text'=>'Suki1: So... How did we end up here in the first place?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Succubus: Let\'s just say a certain someone wanted company and I was happy to oblige.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: ... Wait, what do you mean?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Succubus: Hehehe~', 'talking'=>true,'proc'=>method(:face_happy)}\
		],\
		[\
			{'text'=>'Suki1: Your skin is so soft, you look like you\'re twenty!', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Succubus: Thanks, darling, but I\'m much older than that.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: Oh yeah, don\'t Succubi have immortality or something? How is that?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Succubus: It can get lonely sometimes, You live longer than those around you and you experience things that you should\'t ever have to...', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: I\'m  sorry...', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Succubus: Don\'t be... Not all those experiences are bad, hon.', 'talking'=>true,'proc'=>nil},\
		],\
		[\
			{'text'=>'Suki1: How long have you been creeping in people\'s dreams?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Succubus: ...', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: What\'s the matter?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Succubus: No offense darling, but I just don\'t really feel like talking...', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: Oh, I just thought we could get to know each other a little bit bi-', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Succubus: Look, dollface, you\'re better off gagging me at this point... You\'ll get the same response.', 'talking'=>true,'proc'=>method(:face_annoyed)}\
		],\
		[\
			{'text'=>'Suki1: What do you do when you\'re not chasing after men?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Succubus: ...', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: What is it?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Succubus: Hmmm, it\'s just... I\'ve never really thought of it...', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: You\'ve never done anything else?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Succubus: Heh, well.. Due to a current sequence of events  I can\'t say I have tried anything else.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: ...', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Suki1: You\'re enjoying this, aren\'t you?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Succubus: Maybe just a bit too much, darling.', 'talking'=>true,'proc'=>method(:face_happy)}\
		],\
		[\
			{'text'=>'Suki1: For a creature of the night, you aren\'t that creepy... I mean, I expected a zombie or something.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Succubus: I don\'t suppose that was a compliment, darling. Not all creatures of the night are scary, you know.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: I know that now, but still... I\'m just a bit surprised.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Succubus: Well, not all of us can go “Bump” in the night in the same manner.', 'talking'=>true,'proc'=>nil},\
		],\
		[\
			{'text'=>'Suki1: Honestly, I don\'t know what to say to you that you won\'t end up twisting into some sort of sexual innuendo.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Succubus: I don\'t make everything sexual!', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: I don\'t think we have had one conversation that didn\'t imply at least something sex-related.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Succubus: It\'s a defensive mask hon... I\'m afraid of what you would think if you saw what was inside.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: You don\'t need to be afraid.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Succubus: Is that so? Well then, why  don\'t you creep on in?', 'talking'=>true,'proc'=>method(:face_default)},\
			{'text'=>'Suki1: I seriously think you have a problem.', 'talking'=>false,'proc'=>nil},\
		],\
		[\
			{'text'=>'Suki1: You know, I don\'t think I every asked you for your name...', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Succubus: Oh darling, how inconsiderate of you!', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: So... what is your name?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Succubus: Darling, you\'re going to need to beg for it.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: I don\'t need to know that badly...', 'talking'=>false,'proc'=>nil},\
		],\
		[\
			{'text'=>'Suki1: I\'ve been thinking... I\'m actually really curious about your name...', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Succubus: Oh, so you\'re ready to beg?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: ...No, I\'m not begging for it. Just tell me.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Succubus: Gag me first, we\'ll talk then, Hon.', 'talking'=>true,'proc'=>nil},\
		],\
		[\
			{'text'=>'Suki1: Okay, fine... Please tell me your name? pretty please?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Succubus: Well, well... what a pleasant surprise. All this for little old me?', 'talking'=>true,'proc'=>method(:face_default)},\
			{'text'=>'Suki1: So will you please tell me?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Succubus: I don\'t know, maybe if you beg a little harder?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1:  ...', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Succubus: Darling please, I jest... Please call me Lamia.', 'talking'=>true,'proc'=>nil},\
		],\
		[\
			{'text'=>'Succubus: You know, Suki1, I think this is the first time I\'ve loved someone so much.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: Wait... how do you know my name?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Succubus: Your friend Carol was a doll, she told me.', 'talking'=>true,'proc'=>method(:face_default)},\
			{'text'=>'Suki1: *Sigh*... Carol...', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Succubus: Don\'t be like that, it\'s not good for your cute face.', 'talking'=>true,'proc'=>nil},\
		]\
	],\
	'charm' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: You\'re a creature of lust, right?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Huh? Yes, why do you ask?~', 'talking'=>true, 'proc'=>nil},\
				{'text'=>'Suki1: Because you\'re making me very lustful right now~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Oh dollface...', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Your eyes are so... I\'ve never seen such beautiful colors!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Thank you, hon!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Your wings too, they are just magnificent!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: If you keep playing your cards like this, darling, we may end up getting a full house.', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: You\'re such a tease, I love it!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Succubus: Sometimes I just like to be the play thing, dollface.', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I like your horns! Can I- Can I touch them?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Of course, dear!~', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: ...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Hmm? Is something the matter, dollface?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: You\'re just so cute like this! I want to keep you forever!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Who\'s to say I\'m not keeping you forever, hun?~', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: You\'re really cute for a succubus, did you know that?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: And you\'re really cute for a kidnapper~', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: ...', 'talking'=>false,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki: Dreams in which you meet demons are always portrayed as nightmares... But this is far from one', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Is this a dream, though?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: ...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Hehehe~', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I\'m impressed by how well you can pick up men!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Men aren\'t all I\'m after, darling.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Wait, what do you mean?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Better watch yourself, dollface.', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: You\'re very open with yourself. I\'m actually quite jealous.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: I\'m actually quite jealous of you too hon... But I have an idea, lets trade places.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Nice one... but no.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Can\'t say I regret trying...', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I like the colour of your eyes~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Your eyes are quite beautiful as well, hon!~', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Riddle time - How many succubi does it take to charm me?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: ...', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Succubus: Do tell...', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Just this one~', 'talking'=>false,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: You look really good tied up~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: And I bet you would too', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Succubus: Care to find out?~', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Nice try... But you\'re my captive now.', 'talking'=>false,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: I bet you could see the whole world with wings like that...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Yep, and all the cutie kidnappers too!~', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You know what, you are actually quite beautiful.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Heh, well darling... You aren\'t too bad yourself either.', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: This is weird, but you\'re actually really fun to tie up. You actually enjoy it. Probably more than I do!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: A little bit of humiliation makes a woman beautiful, don\'t you think?', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Is it weird that I just love watching you being tied up?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Oh no, not at all, hun. I do it all the time~', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I want to tell you all the things that look great about you... But then we\'d sit here all day', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Hehehe~', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Succubus: We have all the time in the world, darling~', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I\'ve never met a succubus as good looking as you~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: I bet you say that to everyone~', 'talking'=>false,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: You\'re a creature of lust, right?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Mmm? Yes, I am, why do you ask?~', 'talking'=>true, 'proc'=>nil},\
				{'text'=>'Suki1: Because you\'re making me very lustful right now~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Oh... honey~', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Your eyes are so... I\'ve never seen such beautiful colors!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Thank you, hon!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Your wings too, they\'re just magnificent!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: If you keep playing your cards like this, darling, we may end up getting a full house.', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: You\'re such a tease, I love it!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Sometimes I just like to be the play thing, dollface.', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I like your horns! Can I- Can I touch them?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Why, of course, hun!~', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
			{'text'=>'Suki1: ...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Hmm? Is something the matter>', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: You\'re just so cute like this! I want to keep you forever!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Who\'s to say I\'m not keeping you forever, hun?~', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: You\'re really cute for a succubus, did you know that?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: And you\'re really cute for a kidnapper~', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: ...', 'talking'=>false,'proc'=>nil},\
			]\
		}\
	],\
	'insult' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Everything alright there? Seems like you got yourself stuck.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Trust me, I\'m exactly where I want to be~', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Demon of lust? Heh, more like demon of getting tied up.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: I\'m sensing high levels of lust from you, though, dollface~', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: I- err...', 'talking'=>false,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I would\'ve thought a demon would be harder to defeat...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Perhaps this is what I wanted, dear~', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Score: Kidnapper - 1, Succubus - 0', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Oh, you still think you\'re in control? How cute~', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I\'d taunt you... But I don\'t want to flog a dead horse.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: You should flog me instead~', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I\'d taunt you... But I don\'t want to flog a dead horse.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: There are other things you could flog~', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Hey, want to have- oh nevermind, you didn\'t get out yet.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: I didn\'t *want* to get out~', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You seemed a little tied up right now. Maybe I should come back later.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Succubus: I don\'t have any complaints, dollface.', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: You know what? You look much better as a captive than the other way around.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: If I looked amazing before and this makes me look even better, I applaud you.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Uhmmm... You can\'t. your hands are tied.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Heh, the price of beauty, I suppose.', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Are those supposed to be wings? They don\'t look like much to me.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Untie me, and I\'ll show what I can do with these babies~', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I thought succubi were supposed to be beautiful...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Just ask the dozens of men I\'ve seduced... Oh, and don\'t forget that kidnapper girl~', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: So... How did you ever become a successful succubus looking like that?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: I don\'t know, ask yourself~', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Who would\'ve thought a little bit of rope would take your appearance from garbage to beauty...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: I don\'t know what your garbage looks like, but the men love it~', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: For someone so good at captivating men, you sure do a good job as a captive yourself.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Darling, I\'m still in control... you\'re simply doing exactly what I want you to do.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Is that so? Why don\'t we find out?', 'talking'=>false,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: You know.. looking closer, I think I just realized how much better you look with these ropes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Beauty comes in many shapes, dollface.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Well.. Looks like this one has been wrapped up nicely for me.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Then why don\'t you open her up and see what\'s inside?~', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I bet you\'re here in a dream because people scream if they see you in real life.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Oh they scream... Out of pleasure~', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Succubus: You want me to show you?~', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: ...', 'talking'=>false,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Why do you seduce men anyways? Daddy didn\'t love you enough?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Oh, daddy loved me all right~', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I would insult you... But words can\'t describe how you look.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Feelings can, though. And you\'re feeling very aroused right now, aren\'t you, dollface?~', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: You know... You were awfully easy to beat. You might want to train some more.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: I\'m training... Where it matters~', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Succubus: And you\'re being an awesome \'sparring partner\'~', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I thought you were going to be tough to beat... Guess I was wrong.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Darling, you only won because I let you.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: You can say that as much as you want, but I\'m not the one tied up right now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Sounds more like you lost then, hon.', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I thought you were supposed to be tough.. Seemed pretty easy to me.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Oh darling, I\'m easy in another way as well. Would you like me to show you?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: I\'m sorry, but I like a challenge.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Sassy! You realize this just makes me want you more, right hon?', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Hey, want to have- oh nevermind, you didn\'t get out yet.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: I don\'t see a reason to get out quite yet...', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Succubus: But yes, I do want you~', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Score: Kidnapper - 1, Succubus - 0', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: But I\'m the one tied up, so really, haven\'t I won?~', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: So... How did you ever become a succesful succubus looking like that?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Honey, that\'s exactly why I became successful... Do you want me to show you?~', 'talking'=>true,'proc'=>nil},\
			]\
		}\
	],\
	'threaten' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: I think Leroy\'s birthday is coming up soon... You\'d be a nice gift.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Honey, please, give me a real challenge.', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I think Leroy\'s birthday is coming up soon... You\'d be a nice gift.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: I bet you I can make even that old man scream in delight~', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I think Leroy\'s birthday is coming up soon... You\'d be a nice gift.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Leroy? Oh, I remember him~', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I think Leroy\'s birthday is coming up soon... You\'d be a nice gift.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: I bet he still remembers me~', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I think Leroy\'s birthday is coming up soon... You\'d be a nice gift.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Where do you think those noises in your lair come from at night?~', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I think Leroy\'s birthday is coming up soon... You\'d be a nice gift.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Just Leroy? I expected better from you...', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Hmm... I think I should just leave you here all night...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: You can try - but I know you\'ll come back, hon~', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I wonder what would happen if I tightened your ropes...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: I wonder too, dollface~', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Don\'t test me, things may get rough.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Darling, you know I like it rough~', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Looks like I\'m going to need to tighten your binds to keep any thoughts of escape from arousing in your head.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Darling, why would I want to escape? I\'m already aroused...', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I don\'t want to be the harbinger of bad news... But I\'m afraid I\'ll have to bind you extra tight~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: How\'s that bad news?~', 'talking'=>false,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: If you keep that up, I\'m gonna have to tie you tighter...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: You know that\'ll only motivate me more, right hun?~', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: If you keep that up, I\'m gonna have to tie you tighter...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: You\'re good at giving motivational speeches~', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: If you keep that up, I\'m gonna have to tie you tighter...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Hmm? Keep what up, hon?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: That!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: This? Alright, thank you for specifying~', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: (she\'s only doing it more...)', 'talking'=>false,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You know what, I think I might leave you like this for a while...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Just don\'t wait too long, darling, or you may miss out.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Miss out?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Oh, you poor, sweet, innocent girl...', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Seems like I need to be rougher with you. Maybe I should tighten that rope between your legs a bit.', 'talking'=>false,'anomaly'=>true,'proc'=>nil},\
				{'text'=>'Succubus: Honey, you can try... but I doubt that you can even d- ahhhh!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: How\'s that?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: ...', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Okay, new strategy. If you keep that up, I\'m going to release you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Good, then I can tie you up, dear~', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: ...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Suki1: (This isn\'t helping...)', 'talking'=>false,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Okay, new strategy. If you keep that up, I\'m going to release you!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Release me? Oh no, whatever will I do?!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Succubus: Kidnap the kidnapper, perhaps?~', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: ...Okay, nevermind.', 'talking'=>false,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I might just start tickling those cute wings~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: And I might just decide to keep you, honey~', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Hmm... What to do, what to do...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: How about gagging me?~', 'talking'=>true,'anomaly'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I\'m considering gagging you right now, hmm... what do you think?', 'talking'=>false,'anomaly'=>true,'proc'=>nil},\
				{'text'=>'Succubus: Darling, we shouldn\'t even be having this conversation if you\'d just gagged me already.', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I\'m re-tying all your ropes extra tight... Wouldn\'t want you going anywhere, now would we?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Darling, the more you do this the less I would want to leave in the first place.', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Now... What should we do next...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Suki1: I\'m thinking... Something humiliating.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Sounds good, hun~ Now undress.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: W- wait what?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: You said something humiliating, right love?~', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Now... What should we do next...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Suki1: I\'m thinking... Something tickly.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Ooh~  I\'ve always wondered how ticklish you were...', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: ...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Suki1: Stop wagging that tail!', 'talking'=>false,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Now... What should we do next...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Suki1: Tie you so that you can\'t move an inch, or tie you just tight enough that you can\'t escape...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Honey... You\'re listing the same thing twice~', 'talking'=>true,'proc'=>nil},\
			]\
		}\
	],\
	'slap' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: That\'s what you get when you\'re naughty!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Oh! Now I know what to do~', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: That\'s what you get for being naughty!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Yes! More!', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: That\'s what you get for being naughty!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Oh! So Carol was right...~', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: That\'s what you get when you\'re naughty!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Thanks for the tip, hon~', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: That\'s what you get when you\'re naughty!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: You\'ll have to hit harder than that, hon~', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: That\'s what you get when you\'re naughty!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: I\'ll stay naughty as long as you keep that up~', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Stop making a fuss!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Keep going!', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Stop making a fuss!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Oh, I like it rough!', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Stop making a fuss!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Harder!', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Time for a little punishment', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Mmm... Punishment? Seems like a reward~', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Time for a little punishment.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Yes! Keep it coming!', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Time for a little punishment.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Oh! I like it rough~', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Stop making a fuss!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: I won\'t if you keep reacting like this~', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Stop making a fuss!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Oh! don\'t hold back, dear.', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Stop making a fuss!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Oh! feisty. I love that, honey!', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Stop making a fuss!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Don\'t stop with that, though~', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Harder!', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Oh~ You know how to entertain a succubus~', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Being naughty, are we?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Yup, and I love every second of it~', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Stop making a fuss!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Darling, you are quite aggressive... do me a favor and keep it up, would you?~', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Stop making a fuss!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Oh Yes! Now... call me demeaning names!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Errr.. what?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Come on, darling, do  it!', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Let\'s try this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Ooh~  I approve~', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: There!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Ooh~ More please~', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Take that!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Oh... Gladly~', 'talking'=>true,'proc'=>nil},\
			]\
		}\
	],\
	'tickle' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Let\'s see if you\'re ticklish~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: A-hahahaaa! Hehehehe!', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Let\'s see if you\'re ticklish~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: hehehehehehe~', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Let\'s see if you\'re ticklish~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Hehehe! Ahahaha', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Let\'s see if you\'re ticklish~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Wh-wha- ahahaha!', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Let\'s see if you\'re ticklish~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Hahahahaha!', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Let\'s see if you\'re ticklish~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: hehehahahaaaa!', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Let\'s see if you\'re ticklish~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: A-hahahaaa! Hehehehe!', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Let\'s see if you\'re ticklish~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: hehehehehehe~', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Let\'s see if you\'re ticklish~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Hehehe! Ahahaha', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I wonder... Does this work?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: A-hahahaaa! Hehehehee!', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I wonder... Does this work?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Hahahahaha!', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I wonder... Does this work?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Hahahahaha! Aahaha!', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Tiiiickle tickle tickle tickle~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: A-hahahaaa! Hehehehe!', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
      [\
				{'text'=>'Suki1: I wonder how ticklish you are...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Heeeheeeheee... I love a playful toy.', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I wonder how ticklish you are...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Heeeheee...', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Tiiiickle tickle tickle tickle~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: A-hahahaaa! Hehehehe!', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Tiiiickle tickle tickle tickle~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Hahahahaha!', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I wonder... Does this work?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Hahahahaha! Aahaha!', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: How\'s this feeling?~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: A-hahahaaa! Hehehehe! G- Great!', 'talking'=>true,'proc'=>nil},\
				
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I wonder how ticklish you are...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Heeeheee! Honey, if you k- heeheehee! keep that up, I\'ll end up...  Hahaha! Losing control of myself!', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I wonder... What if I try this?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Wait, what are y- Heeeheee!  Oh, dollface please d-hahaha! not  the tail, please sto- hahahah!', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: How\'s this feeling?~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: A-hahahaaa! Hehehehe!', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: How\'s this feeling?~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Hahahahaha!', 'talking'=>true,'proc'=>nil},\
			],\
#			'shyness' =>\
#			[\
#				{'text'=>'Suki1: How\'s this feeling?', 'talking'=>false,'proc'=>nil},\
#				{'text'=>'Succubus: Hahahahaha!', 'talking'=>true,'proc'=>nil},\	
#			]\
		}\
	],\
	'kiss' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Mmm...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Hehe~ feeling frisky, eh?', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
			
				{'text'=>'Suki1: Mmm...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Mmm~  you\'re good~', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Mmm...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Aah~ mmm~', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Mmm...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Mmm... I knew a girl like you would be a good kisser~', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Mmm...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Mmm~ Thanks, honey~', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Mmm...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Mmm~ you really can read my mind~', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Kiss me~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Mmm~ I thought you\'d never ask~', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Mmmm...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Mmmm... Ahh, only a peck? Silly girl, you can do better!', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Kiss me~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Mmm~ Why, of course, honey~', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Kiss me~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Mmm~', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Kiss me~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Are you sure? I might overwhelm you~', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Succubus: Mmm~', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Looks like you\'ll have to try harder~', 'talking'=>false,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Kiss me~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Hehehe~', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Succubus: Mmm~', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: You\'ve earned this~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Mmm~', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Succubus: Hehehe~ No, you have~', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Mmmmm...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Mmmm... Not bad honey, but you need practice. Come here...', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Mmmmm...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Mmmm... Well well well.. And here I thought I was the one who was captivating...', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: You\'ve earned this~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Mmm~', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: You\'ve earned this~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Mmm~', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Succubus: Thanks, dollface~', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: You\'ve earned this~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Mmm~', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Succubus: You\'re a good kisser~  I might just keep you~', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: How\'s this?~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Mmm~', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Succubus: Very good~', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Mmmmm...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Mmmm... Darling, I\'m craving you! I love a tease!', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Mmmmm...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Mmmm...', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: How was th- Mmmm!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Mmmm... Sorry darling, I wasn\'t done.', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: How\'s this?~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Mmm~', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Succubus: You\'re good~ I might keep you~', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: How\'s this?~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Mmm~', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Succubus: Hehehe~', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: How\'s this?~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Mmm~', 'talking'=>true,'proc'=>nil},\
			]\
		}\
	],\
	'ungag' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Would this be a reward, or a punishment?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Both?~', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Would this be a reward, or a punishment?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: I don\'t mind~ As long as you\'re a good captor~', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Would this be a reward, or a punishment?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: It\'d be a reward if you put it back sometimes~', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Would this be a reward, or a punishment?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: As long as you don\t keep it from me~', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Would this be a reward, or a punishment?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: With you, it\'s always a reward~', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Would this be a reward, or a punishment?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Hehehe~ I can kiss you again now~', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Here you go~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Ahh~  Thanks, hun~', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Here, Let me just...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Heh, did you miss my voice, darling? You poor thing.', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Here you go~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Thank you, dear~', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Here you go~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Ahh~  Now we can kiss again~', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Here you go~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: You\'re a doll~', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Here you go~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Hm? I could\'ve gone longer~', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Let me take this off...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Ahh~  Thanks, hun~', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Here, let me just...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Now why did you do that, dollface? It was just starting to get... Interesting.', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Here, let me just...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: heh, heh. You\'re pretty good, darling, how about you give me another lesson?', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Let me take this off...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Ahh~  Now we can kiss again~', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Let me take this off...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: You\'re a doll~', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Let me take this off...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Hm? I could\'ve gone longer~', 'talking'=>true,'proc'=>nil},\

			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Let\'s hear your voice again~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Do we have to?~', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Here, let me just...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Awww... For a second I was enjoying being the captive for once.', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Let me just take that off for you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Heh heh... Are you sure that\'s all you want to take off?', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Let\'s hear your voice again~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Ahh~  Now we can kiss again~', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Let\'s hear your voice again~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: You\'re a doll~', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Let\'s hear your voice again~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Hm? I could\'ve gone longer~', 'talking'=>true,'proc'=>nil},\
			]\
		}\
	],\
	'blindfold_on' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Let\'s try this on...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: You couldn\'t go farther?~', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Lights out!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Why stop there?', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Lights out!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Keep going, darling~', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Let\'s try this on~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Oh~ Now I don\'t know what to expect~~', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Let\'s try this on~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: You\'re good at this~', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Let\'s try this on~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: You can keep it there if you\'d like~', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Let\'s try this on...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: How about we try a little more?~', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Lights out!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Why stop at that?', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Lights out!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: You\'re off to a good start, darling.', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Let\'s try this on~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Oh~ now I can\'t see the fun coming~~', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Let\'s try this on~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: You\'re very good at this~', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Let\'s try this on~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: You can keep it on if you\'d like~', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: This should be fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: How about we try a little more?~', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Lights out!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Aww... Now I can\'t see your pretty face, hon.', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Lights out!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Oh, I wonder what you will do now, darling. I can\'t wait!', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Let\'s have some fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Oh~ now I can\'t see the fun coming~~', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Let\'s have some fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: You\'re very good at this~', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Let\'s have some fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: You can keep it on if you\'d like~', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Let\'s try a blindfold.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: How about we try a little more?~', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Let\'s try a blindfold.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Aww... Now I can\'t see your pretty face, hon.  ', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Let\'s try a blindfold.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Oh, I wonder what you will do now, darling. I can\'t wait!', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Let\'s try a blindfold.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Oh~ now I can\'t see the fun coming~~', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Let\'s try a blindfold.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: You\'re very good at this~', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Let\'s try a blindfold.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: You can keep it on if you\'d like~', 'talking'=>true,'proc'=>nil},\
			]\
		}\
	],\
	'blindfold_off' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Let\'s take that off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Oh, if only you could\'ve seen what I was seeing in my head...', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Rise and shine!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Awww, five more minutes, darling.', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Let me see those beautiful eyes again.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Heh... are they as beautiful as you remember?', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Let\'s take that off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Ha, now I can see your pretty face again.', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Let\'s take that off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: I was waiting for something to go “bump”... or "bang"... in the the  night~', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Let\'s take that off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Ah, thanks.', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Let\'s take that off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Oh, darling, if only you could\'ve seen what I was seeing in my head...', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Rise and shine!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Awww, can\'t I have five more minutes, darling?', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Let me see those beautiful eyes again.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Heh... are they as beautiful as you remember?', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Let\'s take that off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Now I get to see your pretty face again~', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Let\'s take that off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: I was hoping something would go “bump”... or "bang"... in the the  night~', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Let\'s take that off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Thanks, darling~', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: I think you\'ve earned this~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Have I not been naughty enough?~', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Don\'t get any ideas...', 'talking'=>false,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Alright, enough of that!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: I don\'t think that\'s a correct statement, darling.', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I suppose you can look again for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Oh honey, I was loving the dark! If only you could\'ve seen what I was seeing in my head...', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I think you\'ve earned this~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Ooh, now I can see your pretty face again.', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I think you\'ve earned this~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: I was hoping you\'d do something more with my blindness... a groping, perhaps~', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: You don\'t need to be blind for that.', 'talking'=>false,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I think you\'ve earned this~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: That blindfold\'s gonna look so good on you!', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Let\'s see your pretty eyes again.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Oh honey, I was loving the dark! If only you could\'ve seen what I was seeing in my head...', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Rise and shine!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Oh no, darling, I\'m a creature of the night, remember?', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Alright, enough of that!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Oh, I was hoping you\'d play with me a little more...', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: How about if I pinch right... here?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Ooh... Carol said you never do that sort of thing~', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Let\'s see your pretty eyes again.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Now I can see yours too~', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Let\'s see your pretty eyes again.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: That blindfold\'s gonna look so good on you!', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Let\'s see your pretty eyes again.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Succubus: Ooh, now I can see your pretty face again.', 'talking'=>true,'proc'=>nil},\
			]\
		}\
	]\
};
	end
	
end
$privateCellDamsels['succ'] = PrivateCellDamselSucc.new
