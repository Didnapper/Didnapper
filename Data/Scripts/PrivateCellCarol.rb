#need to try inserting text event into stack
#[image number, name, origin,appointment method?(0 for direct),x,y,zoomx,zoomy,opacity,blend_type]

class PrivateCellDamselCarol < PrivateCellDamsel
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
    @tag = 'carol'
		super()
		#personality
		@emotions['fear'] = [3,0]
		@emotions['shyness'] = [5,0]
		@emotions['anger'] = [4,0]
		@emotions['happiness'] = [7,0]
		@emotions['sadness'] = [2,0]
    #currently unused
    @homophilia = 0
		@masochism = 0
		
		
		@disposition = 3
		@disposition_index = 664
		@disposition_min = 3
		
		#bases
		list = {'back' => [30,'PCCarol',0,0,0,0,100,100,255,0],'outfit1'=> [30,'PCCarolBurglar',0,0,0,0,100,100,255,0]}
		@images['base'] = list
		
		#brows
		list = {'annoy1' => [32,'PCCarol_browannoy1',0,0,0,0,100,100,255,0],'annoy2'=> [32,'PCCarol_browannoy2',0,0,0,0,100,100,255,0], 'normal' => [32,'PCCarol_brownormal',0,0,0,0,100,100,255,0]}
		list = list.merge({'tickle' => [32,'PCCarol_browtickle',0,0,0,0,100,100,255,0],'worry' => [32,'PCCarol_browtickle',0,0,0,0,100,100,255,0]})
		@images['brow'] = list
		
		#mouths and gags
		list = {'annoy1' => [34,'PCCarol_mouthannoy1',0,0,0,0,100,100,255,0],'annoy2'=> [34,'PCCarol_mouthannoy2',0,0,0,0,100,100,255,0], 'neutral' => [34,'PCCarol_mouthneutral',0,0,0,0,100,100,255,0]}
		list = list.merge({'tickle' => [34,'PCCarol_mouthtickle',0,0,0,0,100,100,255,0],'smile' => [34,'PCCarol_mouthsmile1',0,0,0,0,100,100,255,0]})
		list = list.merge({'ball' => [34,'PCCarol_gagball',0,0,0,0,100,100,255,0],'bit' => [34,'PCCarol_gagbit',0,0,0,0,100,100,255,0],'cleave' => [34,'PCCarol_gagcleave',0,0,0,0,100,100,255,0]})
		list = list.merge({'cloth' => [34,'PCCarol_gagotm',0,0,0,0,100,100,255,0],'knot' => [34,'PCCarol_gagknot',0,0,0,0,100,100,255,0],'otn' => [34,'PCCarol_gagotn',0,0,0,0,100,100,255,0]})
    list = list.merge({'sgag1' => [34,'PCCarol_gagtape',0,0,0,0,100,100,255,0], 'sgag2' => [34,'PCCarol_gagpanel',0,0,0,0,100,100,255,0]})
		@images['mouth'] = list
		
		#eyes and blindfold
		list = {'blindfold' => [36,'PCCarol_blindfold',0,0,0,0,100,100,255,0],'blink' => [33,'PCCarol_eyeblink',0,0,0,0,100,100,255,0]}
		list = list.merge({'normal1' => [33,'PCCarol_eyenormal',0,0,0,0,100,100,255,0],'normal2' => [33,'PCCarol_eyenormal',0,0,0,0,100,100,255,0]})
		list = list.merge({'right' => [33,'PCCarol_eyenormal',0,0,0,0,100,100,255,0],'left' => [33,'PCCarol_eyeleft',0,0,0,0,100,100,255,0]})
		list = list.merge({'tickle' => [33,'PCCarol_eyehappy',0,0,0,0,100,100,255,0],'happy' => [33,'PCCarol_eyehappy',0,0,0,0,100,100,255,0]})
		@images['eyes'] = list
		
    #accessories
    @images['accessories'] = {}
    list = {'acc1' => [31,'PCCarol_acc1',0,0,0,0,100,100,255,]}
    @images['accessories']['outfit1'] = list  
    
		#misc
		list = {'blush1' => [31,'PCCarol_blush1',0,0,0,0,100,100,255,0],'blush2' => [31,'PCCarol_blush2',0,0,0,0,100,100,255,0],'tears' => [35,'PCCarol_tears',0,0,0,0,100,100,255,0]}
		@images['misc'] = list
		
		testIntro = [{'text'=>"This is line 1","proc"=>nil},{'text'=>"This is line 2","proc"=>nil}]
		
		#"speak" dialogue

@dialogue =\
{\
	'speak' =>\
	[\
		[\
			{'text'=>'  Carol:  Sooo… how long do I have to stay like this?', 'talking'=>true,'proc'=>method(:face_neutral)},\
			{'text'=>'  Suki1:  I haven\'t decided yet.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Carol:  Ah… well, that\'s okay. I don\'t mind being tied up.', 'talking'=>true,'proc'=>method(:face_happy)},\
			{'text'=>'  Suki1:  Hehe… I did get that impression.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Carol:  I\'m not hard to read. You already know me pretty well.', 'talking'=>true,'proc'=>nil},\
		],\
		[\
			{'text'=>'  Carol:  Ngh!', 'talking'=>true,'proc'=>method(:face_angry)},\
			{'text'=>'  Carol:  Rrrgh…!', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  Are you okay?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Carol:  I\'m fine! I just… ughh! I don\'t know if I can get out of this!', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  That was the idea.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Carol:  I know, but… I thought I was getting better at escaping! Maybe you have a gift for tying girls up!', 'talking'=>true,'proc'=>method(:face_annoyed)},\
			{'text'=>'  Suki1:  …', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Carol:  …Did I say something wrong?', 'talking'=>true,'proc'=>method(:face_neutral)},\
			{'text'=>'  Suki1:  No… I just… never mind.', 'talking'=>false,'proc'=>nil}\
		],\
		[\
			{'text'=>'  Carol:  You don\'t have to feel guilty about doing this to me, you know.', 'talking'=>true,'proc'=>method(:face_neutral)},\
			{'text'=>'  Suki1:  … What?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Carol:  You didn\'t say so, but I can tell. It\'s written all over your face.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Carol:  You know I\'m having fun, right?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  I know. I just… never thought I\'d enjoy something like this so much. Maybe I\'m not the girl I thought I was.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Carol:  …', 'talking'=>true,'proc'=>nil}\
		],\
		[\
			{'text'=>'  Carol:  “Maybe I\'m not the girl I thought I was…”', 'talking'=>true,'proc'=>method(:face_neutral)},\
			{'text'=>'  Suki1:  Hmm?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Carol:  That\'s what you said before, right?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  Yes…', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Carol:  We\'re always learning things about ourselves, Suki1. So what if you like tying girls up for fun? It\'s part of who you are.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  …', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Carol:  For the record, I like who you are.', 'talking'=>true,'proc'=>method(:face_happy)},\
			{'text'=>'  Suki1:  … Thank you.', 'talking'=>false,'proc'=>nil}\
		],\
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
				{'text'=>'  Suki1:  …', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  You\'re… looking at me awfully closely…', 'talking'=>true,'anomaly'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  Oh! Sorry. I was just… um…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Suki1:  You look nice when you blush.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  You\'re not helping, y\'know!', 'talking'=>true,'proc'=>nil},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Carol:  Rrrgh… ah…', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  I know I tied it pretty tight, but you\'re smart. I know you\'ll get out eventually.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Heh… thanks…', 'talking'=>true,'proc'=>method(:face_happy)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Being around you always cheers me up. You always have a smile on your face.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Well, of course I will if you keep saying things like that!', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Hey, cheer up. You just need a little longer, right?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Y-yeah!', 'talking'=>true,'proc'=>method(:face_happy)},\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  When we first met, I didn\'t realize how cute you were.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Huh? Where did that come from?!', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  Are you blushing?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Hehe…', 'talking'=>true,'proc'=>nil},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You know, half the reason I\'m doing this is to spend time with you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Yeah? What\'s the other half?', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  …', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  You know you\'re blushing, right?', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You really are very pretty.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  I\'ve heard that before… but it means more coming from you.', 'talking'=>true,'proc'=>method(:face_shy)},\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  It\'s not like you to stop smiling.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Mm…', 'talking'=>true,'proc'=>method(:face_sad)},\
				{'text'=>'  Suki1:  Come on, show me that smile. I miss it.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Hehe…', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'insult' =>\
	[\
		{\
		},\
		{\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Do you need help? Should I loosen it a little?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Don\'t patronize me! I can do this!', 'talking'=>true,'proc'=>method(:face_angry)},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You still haven\'t gotten yourself out of this? You\'re slipping…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Hey! You don\'t have to be so mean about it…', 'talking'=>true,'proc'=>method(:face_angry)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I thought you were pretty tough, but beating you wasn\'t that hard.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  You just got in a lucky shot, okay?!', 'talking'=>true,'proc'=>method(:face_angry)},\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Are you sure you\'re that great at escaping ropes?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Ngh… I am, I just… arrrgh!', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  If you say so…', 'talking'=>false,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Can\'t get out? Maybe we should try something simpler.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  It\'s not easy with you watching me!', 'talking'=>true,'proc'=>method(:face_annoyed)},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Are you sure you\'re trying to get out of this?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Knock it off! I\'m trying my best!', 'talking'=>true,'proc'=>method(:face_angry)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You really need to try harder if you want to escape.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  I always try hard! You\'re just freakishly good at this!', 'talking'=>true,'proc'=>method(:face_annoyed)},\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Your escape skills aren\'t really impressing me here.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Rrgh! Just… just give me a few minutes, okay?!', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'threaten' =>\
	[\
		{\
		},\
		{\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  If you can\'t get loose, you\'re going to be in here for a long  time.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  You\'re kidding, right?! You\'ll let me out… won\'t you?', 'talking'=>true,'proc'=>method(:face_afraid)},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  If you can\'t escape this, I\'m just going to make it tighter.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Ughhh… you don\'t play fair!', 'talking'=>true,'proc'=>method(:face_annoyed)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You\'d better hurry and wriggle out of this. I\'ve seen some chains down here that I\'d like to try out if you can\'t…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Hey! That\'s going a little far!', 'talking'=>true,'proc'=>method(:face_afraid)},\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  You know, if I hang you by your feet, that frown might look like a smile…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Y-you can be really mean sometimes!', 'talking'=>true,'proc'=>method(:face_sad)},\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  How long can you stand being tied up? I know you like it, but everyone has their limits.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Suki1:  Actually, never mind. Why don\'t we find out the hard way?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Uh… I really should have fought harder…', 'talking'=>true,'proc'=>method(:face_annoyed)},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  If you can\'t get out of this now, what I have planned is really not going to be fun for you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  I kind of like it when you talk like that… and at the same time, I really don\'t.', 'talking'=>true,'proc'=>method(:face_annoyed)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  …', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  I don\'t like it when you go quiet like this.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Don\'t worry, I\'m just thinking about some things I could do…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Suki1:  … although maybe you SHOULD be worried.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  You\'re scaring me a little…', 'talking'=>true,'proc'=>method(:face_afraid)},\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Hmm… how far do you think you can stretch out?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  What? W-why would you ask that?!', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  No reason.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Ehh…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'slap' =>\
	[\
		{\
		},\
		{\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Time for a little punishment.', 'talking'=>false,'proc'=>method(:face_afraid)},\
				{'text'=>'  Carol:  Owww!', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Time for a little punishment.', 'talking'=>false,'proc'=>method(:face_afraid)},\
				{'text'=>'  Carol:  Oww! Feeling mean, huh?', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Time for a little punishment.', 'talking'=>false,'proc'=>method(:face_afraid)},\
				{'text'=>'  Carol:  Nnnhh~!', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Time for a little punishment.', 'talking'=>false,'proc'=>method(:face_afraid)},\
				{'text'=>'  Carol:  Ahh!', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Time for a little punishment.', 'talking'=>false,'proc'=>method(:face_afraid)},\
				{'text'=>'  Carol:  Ow… you\'re good…', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Time for a little punishment.', 'talking'=>false,'proc'=>method(:face_afraid)},\
				{'text'=>'  Carol:  Ahhh!', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Time for a little punishment.', 'talking'=>false,'proc'=>method(:face_afraid)},\
				{'text'=>'  Carol:  Aahh! Hehe~', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Time for a little punishment.', 'talking'=>false,'proc'=>method(:face_afraid)},\
				{'text'=>'  Carol:  Nngh!', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'tickle' =>\
	[\
		{\
		},\
		{\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Got you!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Nnnnn… hahahahaaa! Hahaha!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Got you!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Hey! I- haha! Ahaha!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Got you!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Nooo! Hahaha! Ehehehe!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Got you!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  I-I\'m not gonna- ehehehe! Hehehe!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Got you!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Get back! Get ba-ahahaha! Cut it ou- hehehehe!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Got you!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Hehehehe! S-stop it! Hehe!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Got you!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Ahahah! S-stop it! You\'re m-making me- hehehehehahaha!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Got you!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Are you tryi- ehehe - trying to make me- ahahahahaha!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'kiss' =>\
	[\
		{\
		},\
		{\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Mm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Mm… heheh…', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Mmmm…', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Mmm… knew you\'d be a good kisser…', 'talking'=>true,'proc'=>method(:face_tickle)},\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  H-hey…', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  *gasp*', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Ah… you can keep doing that if you want…', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Ah… don\'t stop…', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Mmmm… if you\'re trying to cheer me up, it\'s working.', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'ungag' =>\
	[\
		{\
      'shyness' =>\
			[\
			],\
			'neutral' =>\
			[\
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
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Whew…', 'talking'=>true,'proc'=>method(:face_neutral)},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Ah… thanks.', 'talking'=>true,'proc'=>method(:face_neutral)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Hee, if you insist…', 'talking'=>true,'proc'=>method(:face_happy)},\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Heh… thanks.', 'talking'=>true,'proc'=>method(:face_happy)},\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  That\'s nice of you…', 'talking'=>true,'proc'=>method(:face_happy)},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Hey, I didn\'t mind…', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Missed my smile, huh?', 'talking'=>true,'proc'=>method(:face_happy)},\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Are you taking pity on me?', 'talking'=>true,'proc'=>method(:face_happy)},\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'blindfold_on' =>\
	[\
		{\
		},\
		{\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s make this a little harder for you…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Heh… okay…', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s make this a little harder for you…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Hey!', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s make this a little harder for you…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Ha! No problem!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s make this a little harder for you…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Aw, c\'mon!', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s make this a little harder for you…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  I kinda like this…', 'talking'=>true,'proc'=>method(:face_happy)},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s make this a little harder for you…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Well, if you insist…', 'talking'=>true,'proc'=>method(:face_happy)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s make this a little harder for you…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Hee… You sure that\'s why you\'re doing this?', 'talking'=>true,'proc'=>method(:face_happy)},\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s make this a little harder for you…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  That\'s not fair!', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'blindfold_off' =>\
	[\
		{\
		},\
		{\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  That\'s long enough.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Thanks…', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  That\'s long enough.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Thanks!', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  That\'s long enough.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Ah, that\'s better…', 'talking'=>true,'proc'=>method(:face_happy)},\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  That\'s long enough.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Ahh, thanks…', 'talking'=>true,'proc'=>method(:face_happy)},\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  That\'s long enough.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  If you say so!', 'talking'=>true,'proc'=>method(:face_happy)},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  That\'s long enough.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Ah, there you are…', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  That\'s long enough.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  Hey, I could\'ve handled that for longer!', 'talking'=>true,'proc'=>method(:face_annoyed)},\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  That\'s long enough.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Carol:  That makes things a little easier.', 'talking'=>true,'proc'=>method(:face_happy)},\
			],\
			'fear' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  n/a', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	]\
};
  end
end
$privateCellDamsels['carol'] = PrivateCellDamselCarol.new
