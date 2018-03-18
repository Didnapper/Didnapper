#need to try inserting text event into stack
#[image number, name, origin,appointment method?(0 for direct),x,y,zoomx,zoomy,opacity,blend_type]

class PrivateCellDamselAlyssa < PrivateCellDamsel
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
    @tag = 'alyssa'
		super()
		#personality
		@emotions['fear'] = [1,0]
		@emotions['shyness'] = [4,0]
		@emotions['anger'] = [7,0]
		@emotions['happiness'] = [5,0]
		@emotions['sadness'] = [1,0]
    #currently unused
    @homophilia = 3
		@masochism = 2
		
		
		@disposition = 1
		@disposition_index = 651
		@disposition_min = 1
		
    
    list = {'outfitdefault' => [30,'PCAlyssaBase',0,0,0,0,100,100,255,0],'outfit1'=> [30,'PCAlyssaBaseBikini',0,0,0,0,100,100,255,0]}
    @images['base'] = list
		
		#brows
		list = {'annoy1' => [32,'PCAlyssa_browannoyed',0,0,-0,0,100,100,255,0],'annoy2'=> [32,'PCAlyssa_browangry',0,0,-0,0,100,100,255,0], 'normal' => [32,'PCAlyssa_brownormal',0,0,-0,0,100,100,255,0]}
		list = list.merge({'tickle' => [32,'PCAlyssa_browtickle',0,0,-0,0,100,100,255,0],'worry' => [32,'PCAlyssa_browworried',0,0,-0,0,100,100,255,0]})
		@images['brow'] = list
		
		#mouths and gags
		list = {'annoy1' => [34,'PCAlyssa_mouthopen',0,0,0,0,100,100,255,0],'annoy2'=> [34,'PCAlyssa_mouthteeth',0,0,0,0,100,100,255,0], 'neutral' => [34,'PCAlyssa_mouthsad',0,0,0,0,100,100,255,0]}
		list = list.merge({'tickle' => [34,'PCAlyssa_mouthopen',0,0,0,0,100,100,255,0],'smile' => [34,'PCAlyssa_mouthsmile',0,0,0,0,100,100,255,0]})
		list = list.merge({'ball' => [34,'PCAlyssa_gagball',0,0,0,0,100,100,255,0],'bit' => [34,'PCAlyssa_gagbit',0,0,0,0,100,100,255,0],'cleave' => [34,'PCAlyssa_gagcleave',0,0,0,0,100,100,255,0]})
		list = list.merge({'cloth' => [34,'PCAlyssa_gagOTM',0,0,0,0,100,100,255,0],'knot' => [34,'PCAlyssa_gagknot',0,0,0,0,100,100,255,0],'otn' => [34,'PCAlyssa_gagOTN',0,0,0,0,100,100,255,0]})
    list = list.merge({'sgag1' => [34,'PCAlyssa_gagtape',0,0,0,0,100,100,255,0]})
		@images['mouth'] = list
		
		#eyes and blindfold
		list = {'blindfold' => [36,'PCAlyssa_blindfold',0,0,-0,0,100,100,255,0],'blink' => [33,'PCAlyssa_eyeblink',0,0,-0,0,100,100,255,0]}
		list = list.merge({'normal1' => [33,'PCAlyssa_eyenormal',0,0,-0,0,100,100,255,0],'normal2' => [33,'PCAlyssa_eyenormal',0,0,-0,0,100,100,255,0]})
		list = list.merge({'left' => [33,'PCAlyssa_eyeside',0,0,-0,0,100,100,255,0]})
		list = list.merge({'tickle' => [33,'PCAlyssa_eyetickle',0,0,-0,0,100,100,255,0],'happy' => [33,'PCAlyssa_eyetickle',0,0,-0,0,100,100,255,0]})
		@images['eyes'] = list
		
		#misc
		list = {'blush1' => [31,'PCAlyssa_blush',0,0,-0,0,100,100,255,0],'blush2' => [31,'PCAlyssa_blush2',0,0,-0,0,100,100,255,0],'tears' => [35,'PCAlyssa_tears',0,0,-0,0,100,100,255,0]}
		@images['misc'] = list
		
		testIntro = [{'text'=>"This is line 1","proc"=>nil},{'text'=>"This is line 2","proc"=>nil}]
		
@dialogue =\
{\
	'speak' =>\
	[\
		[\
			{'text'=>'Suki1: Ready to give up the pirate life?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Alyssa: You act like I had a choice.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: You didn\'t seem to mind being that close to the captain.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Alyssa: You shut up about Dariana!', 'talking'=>true,'proc'=>method(:face_blush)},\
			{'text'=>'Suki1: (Wow, looks like I hit a nerve...)', 'talking'=>false,'proc'=>nil},\
		],\
		[\
			{'text'=>'Suki1: So what is it between you and... Dariana?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Alyssa: None of your business.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: Seems like you\'re pretty close.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Alyssa: ...I guess.', 'talking'=>true,'proc'=>method(:face_blush)},\
			{'text'=>'Suki1: Are you two-', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Alyssa: Shut it!', 'talking'=>true,'proc'=>nil},\
		],\
		[\
			{'text'=>'Alyssa: How does a girl end up part of a kidnapping guild, anyway?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: ...it\'s a long story.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Alyssa: Well, apparently you have nothing better to do than talk to me.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: I could tell you, but then I\'d have to kill you.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Alyssa: ...seriously?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: It\'s classified.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Alyssa: ...', 'talking'=>true,'proc'=>nil},\
		],\
		[\
			{'text'=>'Suki1: I wouldn\'t really kill you, just so you know.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Alyssa: Oh good. You\'ll tie me up and keep me as your captive forever. You know, I\'d almost prefer death.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: I\'m sure if Dariana did this you wouldn\'t mind.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Alyssa: Dariana is a lot prettier than you.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: And you\'re prettier than either one of us~', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Alyssa: Oh, spare me.', 'talking'=>true,'proc'=>nil}\
		],\
	],\
	'charm' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: You\'re really cute, all tied up like this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: You should try it sometime.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You should try this more often. You look pretty good.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: And you look terrible as always.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Your body looks great. Very healthy.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I\'m not so sure about yours, though.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Your smile is really beautiful.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Well, yours is terrifying.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Your face is pure beauty.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Your face looks like a brick hit a watermelon.', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I love your outfit, by the way.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: And here I was trying to pick outfits you would hate.', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: You\'re really cute, all tied up like this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Someday I\'ll turn the tables.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You should try this more often. You look pretty good.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: You haven\'t given me a choice...', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Your body looks great. Very healthy.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: It\'s not like I can use it now...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Your smile is really beautiful.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I\'ll show it less, then.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Your face is pure beauty.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Even your compliments are terrible...', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I love your outfit, by the way.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: It\'s not like you have great fashion sense...', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: You\'re really cute, all tied up like this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Can\'t say I agree...', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You should try this more often. You look pretty good.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I think I\'ll pass.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Your body looks great. Very healthy.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Well, I try...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Your smile is really beautiful.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I\'m not sure what to make of that...', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Your face is pure beauty.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Not that you would care...', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I love your outfit, by the way.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: ...thanks, I guess?', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: You\'re really cute, all tied up like this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Really? T-thanks...', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You should try this more often. You look pretty good.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Well, thanks, I guess...', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Your body looks great. Very healthy.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Are you sure? I always get so self-conscious-', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: You\'re fine. Seriously.', 'talking'=>false,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Your smile is really beautiful.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Compliments won\'t make me trust you...', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Your face is pure beauty.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I don\'t see how that\'s relevant.', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I love your outfit, by the way.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: ...I\'ll have to remember that...', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'insult' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Your hair color is dumb, you know.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: An idiot like you doesn\'t have much room to call things dumb.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You know, I can\'t think of a single battle you\'ve made a difference in.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Says the lady who can\'t do anything without her precious friends.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Why did you leave Dariana behind? I thought you loved her.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Shut up! I didn\'t leave her behind, you took me away from her!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: The merchants hate you, and you weren\'t good enough for the pirates either. Well done.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I hate you so much... you ruined my entire life, and now you rub my nose in it...', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I\'m a big fan of the \'run right into a losing fight\' strategy. Very original.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I prefer losing to fighting alongside a jerk like you.', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Do you intentionally get captured, or do you just lose that often?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I only get intentionally captured by pretty people. So, looks like I just lost.', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Your hair color is dumb, you know.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Nothing could be dumber than that insult.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You know, I can\'t think of a single battle you\'ve made a difference in.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Right back at you.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Why did you leave Dariana behind? I thought you loved her.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Add that to the list of things you\'ve ruined...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: The merchants hate you, and you weren\'t good enough for the pirates either. Well done.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I was good enough... but you ruined it.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I\'m a big fan of the \'run right into a losing fight\' strategy. Very original.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Luck favors the stupid. Guess you got the luck.', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Do you intentionally get captured, or do you just lose that often?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I prefer fighting alongside friends. Sometimes that means I lose... Not that you\'d understand.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: So, the first one, then.', 'talking'=>false,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Your hair color is dumb, you know.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: If you\'re trying to win me over, you\'ll have to think up cooler insults.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You know, I can\'t think of a single battle you\'ve made a difference in.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Why do you always have to ruin the mood?', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Why did you leave Dariana behind? I thought you loved her.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: It wasn\'t my fault!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: The merchants hate you, and you weren\'t good enough for the pirates either. Well done.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I don\'t know what to say...', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I\'m a big fan of the \'run right into a losing fight\' strategy. Very original.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I had to try something!', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Do you intentionally get captured, or do you just lose that often?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Are you asking because you want to try losing?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Just trying to understand a different perspective.', 'talking'=>false,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Your hair color is dumb, you know.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I thought you liked the way I looked...', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You know, I can\'t think of a single battle you\'ve made a difference in.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: And I was just starting to like you...', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Why did you leave Dariana behind? I thought you loved her.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: ...I don\'t know...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: The merchants hate you, and you weren\'t good enough for the pirates either. Well done.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: If you\'d let me out of here, I\'m sure I could find something better for myself...', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I\'m a big fan of the \'run right into a losing fight\' strategy. Very original.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Well, you bring out my creative side, at least.', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Do you intentionally get captured, or do you just lose that often?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: ...why not both?', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'threaten' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Just be happy I didn\'t parade you through the town.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: You\'d probably have been ambushed, so good choice.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: People don\'t care about you as much as you think.', 'talking'=>false,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Should we send you back to grab Dariana too?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I would never do such a thing, especially not for a horrible person like you.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Oh, I have my methods.', 'talking'=>false,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: How about I make those ropes tighter?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: You\'re already about to cut off circulation. Are you really that stupid?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: According to you... yes.', 'talking'=>false,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I wonder... how much would you like to be suspended from the ceiling?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I\'d much prefer seeing one of your friends suspended from the ceiling.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Not me?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: You aren\'t cute enough to make it work.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: You might make a good maid sometime.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Even a maid is more useful than you.', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Want to see if you can handle a crotch rope?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I\'d suggest we try it on you, but it only really works on cute girls.', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Just be happy I didn\'t parade you through the town.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I bet you\'d have enjoyed that, pervert.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Should we send you back to grab Dariana too?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Her crew would defeat you again.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Oh right, I forgot, you always find a way to lose.', 'talking'=>false,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: How about I make those ropes tighter?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: As long as you add some ropes on yourself to compensate.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I wonder... how much would you like to be suspended from the ceiling?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: When are you going to get gagged?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: You might make a good maid sometime.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Look at the mess in this place, you certainly need one. You\'re a slob...', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Want to see if you can handle a crotch rope?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Can you even tie one? Somehow I doubt it.', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Just be happy I didn\'t parade you through the town.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: You wouldn\'t.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Actually, I still could...', 'talking'=>false,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Should we send you back to grab Dariana too?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: That\'s even worse!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Oh, I know.', 'talking'=>false,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: How about I make those ropes tighter?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: What purpose would that serve? It\'s not like I can get free...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I wonder... how much would you like to be suspended from the ceiling?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Please, no...', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: You might make a good maid sometime.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: If it means I can get away from you, then sure.', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Want to see if you can handle a crotch rope?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: No... I don\'t think that\'s necessary...', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Just be happy I didn\'t parade you through the town.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Well, if you do, just be careful not to cream your panties.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Should we send you back to grab Dariana too?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Why would you even say that? You know how much I like her.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Exactly.', 'talking'=>false,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: How about I make those ropes tighter?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: No, please, they\'re already bad enough...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I wonder... how much would you like to be suspended from the ceiling?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: If that means you can\'t tickle me... sure, I guess.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: You might make a good maid sometime.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Is that supposed to be an insult? Sounds like a compliment...', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Want to see if you can handle a crotch rope?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: You don\'t have to try, I know I can...', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'slap' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Time for some discipline!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: You can\'t even slap well. Try again.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I\'m sure you\'ll like this~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Ah! ...You were misinformed...', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: This should cheer you up!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Oh, tha- Oww! You idiot!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: There\'s no reason to be afraid of me...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: There\'s plent- Ow! Especially that!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: You better calm down, or else!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Ah! I will strangle you!', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Maybe you\'ll like this~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Ow! It only works when I like you, idiot!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Time for some discipline!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Ow! Why?!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I\'m sure you\'ll like this~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Ah! No!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: This should cheer you up!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Wha- Oww! Stop it!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: There\'s no reason to be afraid of me...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Oh, that\'s- Ow! You liar!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Except that.', 'talking'=>false,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: You better calm down, or else!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Mayb- Oww! Not helping!', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Maybe you\'ll like this~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Ow! Stop!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Time for some discipline!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Ah!~', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I\'m sure you\'ll like this~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Ow! Yes!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: This should cheer you up!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Oww! How did you know?!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: There\'s no reason to be afraid of me...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Oww!~', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: You better calm down, or else!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Oww! Maybe I won\'t~', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Maybe you\'ll like this~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Ah! Maybe a little...~', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Time for some discipline!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Ow! Keep going~', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I\'m sure you\'ll like this~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Ah!~ I do!~', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: This should cheer you up!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Ah!~ Thank you!~', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: There\'s no reason to be afraid of me...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Ah!~ You knew just what I needed...', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: You better calm down, or else!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Ah! Punish me~', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Maybe you\'ll like this~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Ah!~ Thanks...', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'tickle' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: I wonder, are you ticklish?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: No! You\'re not allow- AHAHAHAHHA! Stop it, idiot!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You\'ll like this, right?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Wha- HAHAHAHAHA! Go back to insults!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Maybe I can cheer you up...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I doub- AHAHAHA! Cut it out!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Don\'t be scared, we\'re here to have fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: What does- HAHAHAHAHA! Screw you!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Let\'s turn that frown upside-down.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Not ha- AHAHAHAHAHA! Stop it, moron!', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I think I can break you out of that shell.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Not happeni- AHAHAHAHAHHA! Not helping, idiot!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: I wonder, are you ticklish?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Nope, defini- AHAHAHAHAH! No!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You\'ll like this, right?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Wha- AHAHAHA! Stop!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Maybe I can cheer you up...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Nop- HHAHAHAHAHA! Stop!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Don\'t be scared, we\'re here to have fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: But y- AAAHAHAHAHA! Give me some warning!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Let\'s turn that frown upside-down.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Neve- AHAHAHAHAAHA! Make it stop!', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I think I can break you out of that shell.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: But wh- AHAHAHAHAHAAH! It\'s not working!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: I wonder, are you ticklish?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I am not- AHAHAHAHAH! Quit it!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You\'ll like this, right?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Wha- HAHAHAHA! No... only a little...', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Maybe I can cheer you up...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Mayb- AHAHAHAHA! You win!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Don\'t be scared, we\'re here to have fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: AHAHAHAHAHAHAA! I\'m not! I promise! HAHAHAAAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Let\'s turn that frown upside-down.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: You\'ll neve- HHAHAHAHAHA! I surrender!', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I think I can break you out of that shell.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I seriously dou- AHAHAHAHA! AHAHA! Quit it!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: I wonder, are you ticklish?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Maybe a little... AHAHAHAHAHA! Okay, a lot! A lot!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You\'ll like this, right?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: AHAHAHAHAHA! Yes!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Maybe I can cheer you up...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Sure, try- AHAHAHAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Don\'t be scared, we\'re here to have fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: HAHAHAHAHAAHAHA! Fine! I give! AHAHAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Let\'s turn that frown upside-down.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Sure, but- AHAHAHAHAHAAHA! No! Please stop!', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I think I can break you out of that shell.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I wouldn\'t min- HAHAHAHAHAHA! Not like this!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'kiss' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Now for the moment of truth...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: What does th- mmph! Leave me alone, idiot!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Good girls deserve a reward~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Wha- mmmph! That\'s not a reward!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: You look like you need something positive.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Maybe a littl- MMmmph! You\'re not helping...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: There\'s nothing to be afraid of.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: There\'s plenty- mmmmf! You jerk!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Relax, I\'m just trying to have fun~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I will no- mmmmmf! I am not a toy, idiot!', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I think I know what you need.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: No, you- mmmmph! Clearly you have no idea!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Now for the moment of truth...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: What are yo- mmmmph!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Good girls deserve a reward~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Have I- mmmph! Stop!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: You look like you need something positive.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I\'m fin- mmmph! Well, I WAS fine...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: There\'s nothing to be afraid of.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Actuall- Mmmmph! There\'s a lot!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Relax, I\'m just trying to have fun~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Yeah, well- Mmmmmph! It\'s not fun for me!', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I think I know what you need.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Wha- Mmmmf...', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Now for the moment of truth...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Wha- mmmm~', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Good girls deserve a reward~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: But why- mmmmm~', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: You look like you need something positive.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Mayb- mmmmmm~ That was nice...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: There\'s nothing to be afraid of.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: But- mmmmmm~ Maybe you\'re right...', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Relax, I\'m just trying to have fun~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Then jus- mmmmm~ That helped...', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I think I know what you need.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Wha- mmmmmm~ Good guess...', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Now for the moment of truth...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Mmmmm~ You\'re good~', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Good girls deserve a reward~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I\'ve- mmmmm~ I\'ll be good if you keep doing that~', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: You look like you need something positive.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Ye- mmmmmm~ Thanks...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: There\'s nothing to be afraid of.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Mayb- mmmmmmmmmm~ You\'re right, thanks...', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Relax, I\'m just trying to have fun~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: How am I- mmmmmmmm~ You know just how to calm me down...', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I think I know what you need.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Oh? Then- mmmmmm~ You were right~', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'ungag' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: I think I prefer hearing your voice.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: ...And I prefer not hearing yours...', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: This should make you even happier.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: ...It\'s hard to be happy with you around, but sometimes I manage...', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I guess I\'ll take pity on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: ...Don\'t patronize me!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Don\'t worry, everything will be fine.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: ...Nothing is ever fine with an idiot like you in charge...', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Calm down! Your gag\'s coming off!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Now put it on yourself, jerk.', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Time to chat~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Are you starting to like my insults? Secret masochist, eh?', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: I think I prefer hearing your voice.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: ...In that case, I\'ll be quiet...', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: This should make you even happier.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: ...As long as the gag is off forever...', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I guess I\'ll take pity on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: ...I don\'t need your pity...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Don\'t worry, everything will be fine.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: ...That\'s what you said last time...', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Calm down! Your gag\'s coming off!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I\'ll calm down when you throw that thing away.', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Time to chat~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Oh, that can\'t be good.', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: I think I prefer hearing your voice.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Aah... thanks...', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: This should make you even happier.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Aah... A little bit...', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I guess I\'ll take pity on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Aaah... thank you...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Don\'t worry, everything will be fine.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: ...I hope so...', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Calm down! Your gag\'s coming off!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: ...no promises...', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Time to chat~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: ...sure...', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: I think I prefer hearing your voice.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Aah... now can you kiss me again?~', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: This should make you even happier.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Aah... Was I a good girl?', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I guess I\'ll take pity on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Aaah... I think I still need cheering up, though...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Don\'t worry, everything will be fine.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: ...I\'m sure you\'ll make things okay...', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Calm down! Your gag\'s coming off!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: ...only for you.', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Time to chat~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: ...chat about what...? More bondage?', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'blindfold_on' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Time to turn out the lights~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Good. I\'m tired of staring at this ugly wallpaper.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Maybe later I\'ll get rid of the other senses too~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I swear when I break out you will regret all of this.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: You\'re so cute~', 'talking'=>false,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I don\'t like seeing you cry. Here, take this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: You have an impressive talent for making everything worse.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Now you don\'t have to see my scary face.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: It\'s not just the face... it\'s everything about you...', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Loosen up a little!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: If you think hiding your ugly face will make me relax, you\'re sorely mistaken.', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: It\'s okay, I\'ll turn the lights out for you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I was tired of looking at a smug jerk all day, anyway.', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Time to turn out the lights~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Maybe you\'ll give me some alone time too, hm?', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Maybe later I\'ll get rid of the other senses too~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Take this thing off!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: I think it looks good on you~', 'talking'=>false,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I don\'t like seeing you cry. Here, take this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Wha- This doesn\'t help!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Now you don\'t have to see my scary face.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Well, that\'s one way I could describe it...', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Loosen up a little!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: A blindfold doesn\'t help!', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: It\'s okay, I\'ll turn the lights out for you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: You\'re making it worse...', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Time to turn out the lights~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Oh no...', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Maybe later I\'ll get rid of the other senses too~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Please don\'t...', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: You\'d better be good, then.', 'talking'=>false,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I don\'t like seeing you cry. Here, take this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Covering it up doesn\'t solve the problem...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Now you don\'t have to see my scary face.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: It\'s not that bad...', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Loosen up a little!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Try being nice!', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: It\'s okay, I\'ll turn the lights out for you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I don\'t like being blind...', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Time to turn out the lights~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: ...whatever you want...', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Maybe later I\'ll get rid of the other senses too~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: The blindfold is enough for me...', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Then be a good girl for me.', 'talking'=>false,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I don\'t like seeing you cry. Here, take this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Maybe give me a kiss instead...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Now you don\'t have to see my scary face.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I actually prefer looking at you...', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Loosen up a little!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Seeing you would help me relax more...', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: It\'s okay, I\'ll turn the lights out for you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: A blindfold isn\'t what I needed...', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'blindfold_off' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Here, I\'ll get this off for you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: You\'re fatter than I remembered.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Let\'s widen that smile.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I\'m sure it\'s only temporary.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Maybe this will cheer you up.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Seeing your face? Not really...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Relax, I\'ll take your blindfold off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Watching you is kinda scarier.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I\'ll get that off for you... just take it easy.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: As long as you get that hideous face out of my sight, sure, I\'ll take it easy.', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Maybe you want to see my face?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Why would you ever think that?', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Here, I\'ll get this off for you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: About time...', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Let\'s widen that smile.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Sure, I guess...', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Maybe this will cheer you up.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I\'ll be cheered up when you get away from me.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Relax, I\'ll take your blindfold off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: That\'s not what I\'m scared of...', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I\'ll get that off for you... just take it easy.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Can\'t promise anything.', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Maybe you want to see my face?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Not really...', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Here, I\'ll get this off for you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Thank you...', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Let\'s widen that smile.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Oh, thank you!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Maybe this will cheer you up.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: A little...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Relax, I\'ll take your blindfold off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Oh, thanks...', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I\'ll get that off for you... just take it easy.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: You know it\'s just my personality, right?', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Maybe you want to see my face?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Well... maybe a little...', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Here, I\'ll get this off for you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: It\'s good to see your face again~', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Let\'s widen that smile.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Thank you! Can I get a kiss?', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Maybe this will cheer you up.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: It helps to be able to see you~', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Relax, I\'ll take your blindfold off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: Thanks... I knew you\'d help out...', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I\'ll get that off for you... just take it easy.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: I don\'t know how, but I guess I\'ll have to try.', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Maybe you want to see my face?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Alyssa: You always make me feel better.', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	]\
};
	end
end
$privateCellDamsels['alyssa'] = PrivateCellDamselAlyssa.new
