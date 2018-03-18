#need to try inserting text event into stack
#[image number, name, origin,appointment method?(0 for direct),x,y,zoomx,zoomy,opacity,blend_type]

class PrivateCellDamselCilia < PrivateCellDamsel
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
    @tag = 'cilia'
		super()
		#personality
		@emotions['fear'] = [3,0]
		@emotions['shyness'] = [5,0]
		@emotions['anger'] = [4,0]
		@emotions['happiness'] = [7,0]
		@emotions['sadness'] = [2,0]
    #currently unused
    @homophilia = 2
		@masochism = -1
		
		
		@disposition = 1
		@disposition_index = 664
		@disposition_min = 1
		
		#bases
		list = {'back' => [30,'PCCilia',0,0,-250,0,100,100,255,0],'outfit1'=> [30,'PCCiliaExplorer',0,0,-250,0,100,100,255,0],'outfit2'=> [30,'PCCiliaLibrarian',0,0,-250,0,100,100,255,0]}
		@images['base'] = list
		
		#brows
		list = {'annoy1' => [32,'PCCilia_browannoyed',0,0,-250,0,100,100,255,0],'annoy2'=> [32,'PCCilia_browangry',0,0,-250,0,100,100,255,0], 'normal' => [32,'PCCilia_brownormal',0,0,-250,0,100,100,255,0]}
		list = list.merge({'tickle' => [32,'PCCilia_browtickle',0,0,-250,0,100,100,255,0],'worry' => [32,'PCCilia_browworried',0,0,-250,0,100,100,255,0]})
		@images['brow'] = list
		
		#mouths and gags
		list = {'annoy1' => [34,'PCCilia_mouthopen',0,0,-250,0,100,100,255,0],'annoy2'=> [34,'PCCilia_mouthsad',0,0,-250,0,100,100,255,0], 'neutral' => [34,'PCCilia_mouthneutral',0,0,-250,0,100,100,255,0]}
		list = list.merge({'tickle' => [34,'PCCilia_mouthtickle',0,0,-250,0,100,100,255,0],'smile' => [34,'PCCilia_mouthsmile',0,0,-250,0,100,100,255,0]})
		list = list.merge({'ball' => [34,'PCCilia_gagball',0,0,-250,0,100,100,255,0],'bit' => [34,'PCCilia_gagbit',0,0,-250,0,100,100,255,0],'cleave' => [34,'PCCilia_gagcleave',0,0,-250,0,100,100,255,0]})
		list = list.merge({'cloth' => [34,'PCCilia_gagotm',0,0,-250,0,100,100,255,0],'knot' => [34,'PCCilia_gagknot',0,0,-250,0,100,100,255,0],'otn' => [34,'PCCilia_gagotn',0,0,-250,0,100,100,255,0]})
    list = list.merge({'sgag1' => [34,'PCCilia_gagspecial1',0,0,-250,0,100,100,255,0]})
		@images['mouth'] = list
		
		#eyes and blindfold
		list = {'blindfold' => [36,'PCCilia_blindfold',0,0,-250,0,100,100,255,0],'blink' => [33,'PCCilia_eyeclosed',0,0,-250,0,100,100,255,0]}
		list = list.merge({'normal1' => [33,'PCCilia_eyenormal',0,0,-250,0,100,100,255,0],'normal2' => [33,'PCCilia_eyenormal',0,0,-250,0,100,100,255,0]})
		list = list.merge({'right' => [33,'PCCilia_eyenormal',0,0,-250,0,100,100,255,0],'left' => [33,'PCCilia_eyeside',0,0,-250,0,100,100,255,0]})
		list = list.merge({'tickle' => [33,'PCCilia_eyetickle',0,0,-250,0,100,100,255,0],'happy' => [33,'PCCilia_eyenormal',0,0,-250,0,100,100,255,0]})
		@images['eyes'] = list
		
		#misc
		list = {'blush1' => [31,'PCCilia_blush',0,0,-250,0,100,100,255,0],'blush2' => [31,'PCCilia_blush',0,0,-250,0,100,100,255,0],'tears' => [35,'PCCilia_tears',0,0,-250,0,100,100,255,0]}
		@images['misc'] = list
		
    #accessories
    @images['accessories'] = {}
    list = {'acc1' => [31,'PCCilia_acchat',0,0,-250,0,100,100,255,0]}
    @images['accessories']['outfit1'] = list
    list = {'acc1' => [37,'PCCilia_accglasses',0,0,-250,0,100,100,255,0]}
    @images['accessories']['outfit2'] = list
    
		testIntro = [{'text'=>"This is line 1","proc"=>nil},{'text'=>"This is line 2","proc"=>nil}]
		
		#"speak" dialogue
		@dialogue =\
{\
	'speak' =>\
	[\
		[\
			{'text'=>'  Cilia:  I will get out of here, you know.', 'talking'=>true,'proc'=>method(:face_neutral)},\
			{'text'=>'  Suki1:  I doubt it. Besides, where would you go? Your village is long gone by now.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Cilia:  You\'re lying! It can\'t be gone! We all worked so hard…', 'talking'=>true,'proc'=>method(:face_sad)},\
			{'text'=>'  Suki1:  I\'m sorry, but it\'s true. You have to accept that.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Cilia:  …', 'talking'=>true,'proc'=>method(:face_sad)},\
			{'text'=>'  Suki1:  For what it\'s worth, I also know what it\'s like to lose all you\'ve worked for. It\'s not fun, but it is possible to bounce back from.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Cilia:  I\'ve been kidnapped from my home, locked in a cell, and spend most of my time tied up and gagged. There\'s no bouncing back from that.', 'talking'=>true,'proc'=>method(:face_angry)},\
			{'text'=>'  Suki1:  (Smiles)', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Cilia:  What?', 'talking'=>true,'proc'=>method(:face_annoyed)},\
			{'text'=>'  Suki1:  Nothing, just nostalgia.', 'talking'=>false,'proc'=>nil}\
		],\
		[\
			{'text'=>'  Suki1:  You know, things can be pretty okay here, if you play nice.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Cilia:  And if I don\'t?', 'talking'=>true,'proc'=>method(:face_neutral)},\
			{'text'=>'  Suki1:  Well, we do have an extensive gag collection…', 'talking'=>false,'anomaly'=>true,'proc'=>nil},\
			{'text'=>'  Cilia:  That\'s not funny.', 'talking'=>true,'proc'=>method(:face_afraid)},\
			{'text'=>'  Suki1:  I\'m not kidding. Trust me, rowdy prisoners aren\'t rowdy for long.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Cilia:  You know, I was the leader of my village. I\'m not used to being threatened with gags.', 'talking'=>true,'proc'=>method(:face_neutral)},\
			{'text'=>'  Suki1:  Well, get used to it - fast. The only reason you\'re not gagged right now is I want to ask you about your village.', 'talking'=>false,'anomaly'=>true,'proc'=>nil},\
			{'text'=>'  Cilia:  Well, okay, I guess. It\'s not like I can resist.', 'talking'=>true,'proc'=>method(:face_default)},\
			{'text'=>'  Suki1:  (Pity.)', 'talking'=>false,'proc'=>nil}\
		],\
		[\
			{'text'=>'  Suki1:  Why did you decide to build your village next to an angry group of natives? That doesn\'t seem like the brightest of all ideas to me.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Cilia:  We didn\'t know they still existed, at least not until we had already planted all our seeds.', 'talking'=>true,'proc'=>method(:face_default)},\
			{'text'=>'  Cilia:  Do you have any idea how much work it is to try and build a village from scratch?!', 'talking'=>true,'proc'=>method(:face_default)},\
			{'text'=>'  Cilia:  That\'s not something you can just up and do again if you mess up.', 'talking'=>true,'proc'=>method(:face_default)},\
			{'text'=>'  Suki1:  I honestly can\'t say I do.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Cilia:  Of course you don\'t. You\'ve probably never done an honest day\'s work in your life.', 'talking'=>true,'proc'=>method(:face_annoyed)},\
			{'text'=>'  Suki1:  (She\'s not really wrong…)', 'talking'=>false,'proc'=>nil}\
		],\
		[\
			{'text'=>'  Suki1:  How are you finding life in captivity?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Cilia:  I think I\'m getting used to it.', 'talking'=>true,'proc'=>method(:face_neutral)},\
			{'text'=>'  Suki1:  Really?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Cilia:  No.', 'talking'=>true,'proc'=>method(:face_angry)},\
			{'text'=>'  Suki1:  …', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Suki1:  I think I liked you better gagged.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Cilia:  No, wait! Please, not that! I really am starting to get used to it - a little bit anyway…', 'talking'=>true,'proc'=>method(:face_afraid)},\
			{'text'=>'  Suki1:  It can be tough, being locked up day and night, your freedom stolen from you, not even being able to talk when you want to.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Suki1:  But with the right attitude, I think you\'ll find it to be quite enjoyable.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Cilia:  I doubt it…', 'talking'=>true,'proc'=>method(:face_sad)},\
			{'text'=>'  Suki1:  Listen, just think of it as a kind of holiday.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Suki1:  I mean, you\'re completely safe here, we provide you with everything you could possibly ever need, and you never even have to lift a finger.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Cilia:  That\'s because I can\'t. You\'ve tied me too tightly.', 'talking'=>true,'proc'=>method(:face_annoyed)},\
			{'text'=>'  Suki1:  Come on, work with me here. You\'re completely cut off from the outside world and your old life.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Suki1:  Don\'t you want to take advantage of that? Isn\'t there an opportunity there?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Suki1:  I mean, how often does one get to be safely held prisoner? Isn\'t there some fun to be had there?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Cilia:  …', 'talking'=>true,'proc'=>method(:face_default)},\
			{'text'=>'  Cilia:  Well, now that you mention it…', 'talking'=>true,'proc'=>method(:face_neutral)}\
		],\
	],\
	'charm' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You really are too cute when you struggle all seriously like that.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Shut your kidnapping mouth! I\'ll be serious if I want to be.', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You know, tied up like this, you look really cute.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Well, if you like it so much, why don\'t we swap places?', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Suki1:  Nice try.', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Why so glum, chum?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  How can you act so carefree? You took everything away from me.', 'talking'=>true,'proc'=>method(:face_sad)},\
				{'text'=>'  Suki1:  To be fair, those amazons would have gotten you one way or another. If anything, you should just be happy you fell into my clutches and not theirs.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Hmm!', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Suki1:  Cheer up, girl. If you play nice, I can play nice.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  I don\'t want a damn thing to do with you.', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Cilia:  Get away from me!', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  I\'m just checking your restraints to see that they don\'t hurt anywhere.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  No you\'re not! You\'re checking to see if I got any knots loose!', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Suki1:  I don\'t need to do that. I tied you myself. You\'re not going anywhere. Just relax, okay? I mean, a tough, beautiful girl like you shouldn\'t be fretting over something like this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  (grumble)', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  So you were the leader of your whole village. That\'s pretty impressive. I like a girl who\'s not afraid of power.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Untie me and I\'ll show you what real power is.', 'talking'=>true,'proc'=>method(:face_annoyed)},\
				{'text'=>'  Suki1:  No, thanks.', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  There\'s no need for pretense here, Cilia. I know you enjoying squirming in those bonds.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  What?! No! I\'m just trying to find some slack is all.', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  Hmmm, is that so? Would you like me to tighten them,? You look like a girl who enjoys a challenge.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  …', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Cilia:  Okay.', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  (I knew it.)', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  So your name is Cilia. That\'s a very pretty name.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Thanks, I guess. But what do I call you?', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  (Mistress would be nice…)', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  What?', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  Oh, nothing. You don\'t need to worry about my name for now. Just enjoy the mystery of it all.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  I don\'t enjoy feeling helpless.', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  You could - with my help, of course.', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You know, you\'d probably have an easier time here if you just stopped struggling.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Yeah, but where\'s the fun in that?', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  You like to struggle?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Look, you don\'t stay mayor of a village at war with an army of natives without enjoying a bit of a struggle.', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  I see. (She\'s quite the fiery girl; I\'ll have to keep an eye on her).', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Why are you staring at me like that?', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  No reason. Just enjoying the scenery is all.', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  You know, just because you\'re my prisoner doesn\'t mean you have to mope. We can have some fun if you want.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  That\'s easy for you to say. You don\'t spend all day with a foul-tasting gag in your mouth, or tied up so tight you can only waddle around your cell.', 'talking'=>true,'proc'=>method(:face_annoyed)},\
				{'text'=>'  Suki1:  But you look so cute doing that!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  I look… cute?', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  Yeah! The way you angrily hop about, squirming in your bonds and moaning into your gag… it\'s super cute!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  I don\'t quite know what to make of that…', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  You\'re shaking. Just relax. You\'re in no danger here, I promise.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  I\'d feel a lot better if you weren\'t leering at me like that.', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  Sorry, just admiring your hair; it\'s like a river of gold. I\'m sure the people of your village must have seen you as their very own sun goddess or something.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  They did look up to me, in a way. I was the only one capable of using magic, you see. But in the end, I failed them.', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Suki1:  Don\'t lose hope now. I\'m sure your sun will shine again.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Why, are you letting me go?', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  No.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  …', 'talking'=>true,'proc'=>method(:face_sad)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Cilia:  Untie me this instant!', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  And spoil this beautiful scene? I don\'t think so.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  What do you mean beautiful?', 'talking'=>true,'proc'=>method(:face_annoyed)},\
				{'text'=>'  Suki1:  I mean you, silly. The way those ropes wrap around your body really brings out your figure; you really are quite appealing tied like that.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Shut the hell up!', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  (She\'s blushing.)', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Which gag do you prefer?', 'talking'=>false,'anomaly'=>true,'proc'=>nil},\
				{'text'=>'  Cilia:  What?! What sort of question is that?!', 'talking'=>true,'proc'=>method(:face_annoyed)},\
				{'text'=>'  Suki1:  Well I\'m gonna stuff your pretty little mouth with a gag eventually, so I thought it should probably be one you enjoy.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Well, okay, I guess. It\'s not like I can stop you. Let me think.', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  (Wow, she\'s really thinking hard about this. Is she imagining all the ways I could gag her?)', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  I like whichever one you think looks best on me.', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  (I think she\'s starting to enjoy this.)', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Of all the prisoners in this place, I think you might be my favourite (I\'m becoming so smooth).', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  I bet you say that to all the helpless girls you bring in here.', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  I don\'t, but I might start if it gets them to smile like you are now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia: Hehe, you\'re such a charmer.', 'talking'=>false,'proc'=>method(:face_happy)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You look like you\'re having fun. I didn\'t think you\'d take to a life of bondage quite so easily.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Well, to be honest, it\'s pretty tough being tied up all day long, ungagged for just moments at a time, but I kind of enjoy the challenge, you know.', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  How so?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Well, being tied like this turns every little task into a mammoth struggle.', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  And you like that?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  I love it!', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Don\'t let this place get you down, Cilia. We need you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  What do you need me for?', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  We need your lovely smile to brighten up this dump.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  You\'re too much.', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  Plus, your gag talk sounds way better when you\'re happy.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  …', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Cilia:  That really is too much.', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  No need to look so frightened; the only thing a gorgeous girl like you has to fear from me is if I kiss you to death.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  You want… to kiss… me?', 'talking'=>true,'proc'=>method(:face_afraid)},\
				{'text'=>'  Suki1:  And a whole lot more.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  What does that mean?', 'talking'=>true,'proc'=>method(:face_afraid)},\
				{'text'=>'  Suki1:  Oh, you\'ll find out.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  I\'m not sure I\'m ready for all this…', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Did I ever tell you how beautiful your eyes look when you\'re angry?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  They\'re supposed to be frightening…', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  They are frightening; frighteningly cute, that is.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  …', 'talking'=>true,'proc'=>method(:face_shy)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I see what you\'re doing down there.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  What? I wasn\'t doing anything!', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  You little cutie. You were trying to sneak a peek at your fellow captives.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Well… I just wanted to see if you tied them like you did me.', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  You mean tight?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Yeah… but you know, I still think you tied me the tightest.', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  (I think she thinks that\'s a compliment)', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Hmmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  What?', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  Well, I\'m just wondering… if your hair is this beautiful, and you look this good tied up, does that mean if I put you in a hair tie your hair will look even better?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Hehe, you\'re such a kidder, Suki1!', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  (I wasn\'t kidding, though…)', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  There\'s that lovely smile I like to see.', 'talking'=>false,'proc'=>method(:face_happy)},\
				{'text'=>'  Cilia:  Hehe, I\'m just happy to see you is all.', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  Oh? Why\'s that?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  \'Cause every time you show up, fun things happen.', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  Fun things?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Yeah. Each time is like a new challenge to overcome. So what are you gonna do to me today… Mistress?.', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  (Wow she\'s really starting to get into this).', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Don\'t let this place get you down, Cilia. We need you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  What do you need me for?', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  We need your lovely smile to brighten up this dump.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Hehe, you\'re too much.', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  Plus your gag talk sounds way better when you\'re happy.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  You think?', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  I know.', 'talking'=>false,'proc'=>nil}\
			],\
			'fear' =>\
			[\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Having a little trouble with those ropes?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  I\'ll say. You tied them super tight, you sly fox.', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  Well I knew a resourceful girl like yourself would need some special knots to keep her in place. And I wasn\'t wrong, was I?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Hmm… tie me as tight as you want; I\'ll get outta here, and then I\'ll repay the favour.', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  Well, then I better make sure you never escape.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Hehe… challenge accepted.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			]\
		}\
	],\
	'insult' =>\
	[\
		{\
			'anger' =>\
			[\
				{'text'=>'  Cilia:  Quit staring at me!', 'talking'=>true,'proc'=>method(:face_annoyed)},\
				{'text'=>'  Suki1:  I\'m just watching your pathetic struggles is all. I mean, come on! I\'ve gotten outta way tighter ropes than those in my sleep.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  You sleep tied up?', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  No… I mean… That is… What I meant was… ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Suki1:  Shut up!', 'talking'=>false,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I can\'t believe you let your whole village get destroyed by a bunch of savages. You must really suck as a leader.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Screw you! I did all I could! They massively outnumbered us!', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  Excuses…', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I bet all your fellow villagers are bound and gagged in cells just like this one. Who knows what\'s happening to them right now?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Why are doing this to me?!', 'talking'=>true,'proc'=>method(:face_sad)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  How does it feel knowing you\'re responsible for the capture of all your friends?.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  But you\'re the one that did it all!', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  You could have stopped me, but you were too weak.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  That\'s true…', 'talking'=>true,'proc'=>method(:face_sad)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Jeez, you had an entire village to back you up and yet you still lost. Are you sure you\'re cut out to be a leader?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  I…', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  A loser like you deserves to be bound and gagged down here forever, don\'t ya think?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  No! You can\'t keep me here forever!', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  Maybe I will, maybe I won\'t…', 'talking'=>false,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  So do you like being tied up or something?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Suki1:  \'Cause you lost pretty badly.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Shut up!', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  Oh, struck a nerve, did I?', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I think the real reason you were the the head of your village wasn\'t that you were smart or brave, but rather that they probably just thought you were easy on the eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  W-what?! There\'s no way my citizens were that shallow!', 'talking'=>true,'proc'=>method(:face_annoyed)},\
				{'text'=>'  Suki1:  Well they certainly didn\'t elect you for your ability to fight off kidnappers…', 'talking'=>false,'proc'=>method(:face_angry)}\
			],\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  So you can use magic, right?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Yes I can. Why?', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  Well, I was just curious how someone with magic powers was captured so easily is all. Maybe you\'d have been better suited to doing parlour tricks than fighting Amazons.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  You can be very cruel, you know that?', 'talking'=>true,'proc'=>method(:face_sad)},\
				{'text'=>'  Suki1:  Oh, I know.', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You can stop smiling now. Someone who let their whole village get captured has nothing to smile about.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  You had to bring that up, didn\'t you?', 'talking'=>true,'proc'=>method(:face_sad)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You really are a weakling, aren\'t you? Letting yourself get tied up and carried off by a random kidnapper - how exactly did you become the mayor of your village again?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  I guess… maybe I just wasn\'t ready.', 'talking'=>true,'proc'=>method(:face_sad)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I think I like you better gagged. I just can\'t stand listening to someone snivel and whine.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Please, don\'t gag me! I just got the taste outta my mouth from last time!', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  What\'s this? You still haven\'t even gotten a single knot undone! I thought I was just kidding around when I tied these ropes, but apparently even this is too much for you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  You\'re lying! There\'s no way in hell this is supposed to be a joke! I mean, come on! I can hardly move a muscle!', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			]\
		},\
		{\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Just admit it; you were never meant to be a leader. Being a helpless damsel suits you so much better.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  …Maybe you\'re right.', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  (Is she blushing?)', 'talking'=>false,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I think I might just sell you off. I could use the space for a less worthless prisoner.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Go ahead. It doesn\'t matter to me who I escape from.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You can stop smiling now. Someone who let their whole village get captured has nothing to smile about.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  There\'s always something to smile about, Suki1.', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  Not for you there isn\'t.', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  How does it feel, knowing the reason all your friends are in chains is that you weren\'t strong enough?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  It wasn\'t all my fault… was it?', 'talking'=>true,'proc'=>method(:face_sad)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I think I like you better gagged. I just can\'t stand listening to someone snivel and whine.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Have some pity, for goodness\' sake!', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  Pity is for the weak (I sound so cool!).', 'talking'=>false,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Are you even a real blonde?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  How dare you?! Just wait \'til I get outta these ropes!', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  (Wow, that really set her off)', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Just admit it; you were never meant to be a leader. Accept your lowly place as one of my personal bondage slaves.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Y-your personal what?!', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I can\'t believe a weakling like you thought she could take on a whole army of Amazons. You must have serious delusions of grandeur.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  It\'s not like I wanted to fight! Those stupid Amazons started it!', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You can stop smiling now. Someone who let their whole village get captured has nothing to smile about.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  There\'s always something to smile about, Suki1', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  Not for you there isn\'t.', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I met the Amazon Queen, you know. She\'s much prettier and stronger than you are.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  I\'m sure she was…', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'fear' =>\
			[\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  You sound smarter with a gag in your mouth.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  I can\'t wait to hear what you sound like with a gag in your mouth.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			]\
		}\
	],\
	'threaten' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  If you think you were gagged tightly before, just wait \'til I get done with you; I\'ll fix it so you\'re so quiet you won\'t even be able to hear yourself think.', 'talking'=>false,'anomaly'=>true,'proc'=>nil},\
				{'text'=>'  Cilia:  No, please! No more gags! They\'re so humiliating to wear!', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You think this is the worst I can do? Believe me, you haven\'t seen anything yet.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  You\'re bluffing.', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  Am I? It\'s funny - the last girl who said that changed her tune pretty quickly after I left her hogtied on the floor for a few days. I wonder if you\'ll do the same?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  What?! You wouldn\'t! There\'s no way! My body couldn\'t take it!', 'talking'=>true,'proc'=>method(:face_afraid)},\
				{'text'=>'  Suki1:  I thought so.', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I could just leave you down here forever, you know. Not a single person outside this guild even knows or cares that you\'re here.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  You\'re just trying to scare me into surrendering to you!', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Suki1:  (And it\'s working).', 'talking'=>false,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  What\'s the matter, Cilia? You look so scared. And I haven\'t even gotten to use my big girl toys on you yet.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Get away from me, you pervert!', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Oh, I like that fire in your eyes. It\'s gonna be fun watching it slowly fade.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  You think you can break me?', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  I know I can break you.', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Maybe I should send you back to those Amazons like this. I\'m sure they\'d love nothing more than to get their hands on cute little you while you\'re bound and gagged.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  W-what?! You wouldn\'t! There\'s no telling what they\'d do to me if they found me helpless!', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You\'d better abandon all hope of escape. It\'ll be easier for you in the long run.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  There\'s no way I\'m giving up!', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  Well then, I\'ll just have to tighten your bonds.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Eeep! (Me and my big mouth.)', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Hmmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  What\'s the matter?', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1;  You look too content. A prisoner like yourself should be more distressed. Maybe if I took all your clothes…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Don\'t even think about it!', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  You know I can do whatever I want to you, right? I mean you\'re my personal prisoner, after all.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Yes, I know…', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Suki1:  Good. Don\'t forget I could bind and gag you so tight even I might forget you\'re down here.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Please, no! I\'m tied so tight already!', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  You know I can do whatever I want to you, right? I mean, you\'re my personal prisoner, after all.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  How could I forget?', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  Just checking to see if you know your place, that\'s all. Don\'t forget, I could bind and gag you so tight even I\'ll forget you\'re down here.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Don\'t say things like that! It\'s bad enough I have to be tied up down here without you threatening me, too.', 'talking'=>true,'proc'=>method(:face_sad)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  You know I can do whatever I want to you, right? I mean, you\'re my personal prisoner, after all.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  For now, anyway.', 'talking'=>true,'proc'=>method(:face_annoyed)},\
				{'text'=>'  Suki1:  Watch your tongue, Cilia. Don\'t forget, I could bind and gag you so tight even I\'ll forget you\'re down here.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Just try it!', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Suki1:  (She\'s way too cute when she thinks she can resist me.)', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I\'m starting to think just gagging you isn\'t enough. A girl like you needs more humiliation.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  M-more?!', 'talking'=>true,'proc'=>method(:face_afraid)},\
				{'text'=>'  Suki1:  I know! How about I tie one of my socks over your nose? I\'ve been running around all day so I\'m sure they\'ll pack quite a punch.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  You pervert! You wouldn\'t leave me like that… would you?', 'talking'=>true,'proc'=>method(:face_afraid)},\
				{'text'=>'  Suki1:  I might.', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  If you don\'t stop struggling, I\'ll have to tie you to a pole.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Go ahead. Whatever you can dish out, I can take.', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  I think you\'re gonna regret saying that…', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You know I can do whatever I want to you, right? I mean, you\'re my personal prisoner, after all.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Yeah, so?', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  Just checking to see if you know your place, that\'s all. Don\'t forget, I could bind and gag you so tight even I\'ll forget you\'re down here.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  (That sounds kinda fun…)', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Maybe I should gag you and take you for a little walk around the guild. Some of our members have been just dying to meet you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  There\'s no way even you would sink that low.', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  If you think gags and blindfolds are the worst I can do, you better think again.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  W-what do you mean?', 'talking'=>true,'proc'=>method(:face_afraid)},\
				{'text'=>'  Suki1:  I mean you\'ve got a lot more senses for me to mess with. How do ear plugs, nose plugs, and a big, stifling OTN gag all wrapped up in a hair-hogtie sound?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Is that even possible?!', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Cilia:  Let me outta here! I\'m tired of being tied up and gagged all the time!', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  Careful now, Cilia. Remember your place. Any more outbursts like that and I\'ll take you out into the corridor and spank you in front of your fellow prisoners.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  You tyrant! Even ungagged I\'m not allowed to speak…', 'talking'=>true,'proc'=>method(:face_sad)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You know I can do whatever I want to you, right? I mean, you\'re my personal prisoner, after all.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Your… your personal prisoner?', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  Yes. Whatever I say, goes. Don\'t forget, I could bind and gag you so tight even I\'ll forget you\'re down here.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Suki1:  (Wait, why is she  blushing?)', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  If you want to escape so bad, maybe I should let you go.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Really?! Well then, untie me!', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  Oh no. If you leave here, you do so bound and gagged.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  But I wouldn\'t last a minute out there like this! I\'d be grabbed by bandits before I could say mmmph!', 'talking'=>true,'proc'=>method(:face_afraid)},\
				{'text'=>'  Suki1:  Hehe, I know.', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  So far I\'ve only stuffed your mouth with a cloth. Next time I might have to use something a little more… personal.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  W-what are you saying?', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  I\'m saying if you\'re not careful, I may have to buy a new pair of panties.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia: You mean you\'d put… in my…', 'talking'=>false,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  (Hehe, She\'s blushing like a schoolgirl)', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I think I might add a crotch rope to your restraints.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  A crotch rope?! But… but… WHY?!', 'talking'=>true,'proc'=>method(:face_afraid)},\
				{'text'=>'  Suki1:  Well, seeing as you clearly enjoy struggling so much, I thought you might like an added incentive.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Please don\'t. This is hard enough without having to fight against that urge!', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I think I might add a crotch rope to your restraints.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  A crotch rope?! But why?!', 'talking'=>true,'proc'=>method(:face_annoyed)},\
				{'text'=>'  Suki1:  Well, seeing as you clearly enjoy struggling so much, I thought you might like an added incentive.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Please don\'t. This is hard enough without having to fight against that urge!', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Maybe I should just stick you in the cells with the regular captives.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Don\'t you dare! You kidnapped me and took my entire life from me! The least you can do is take some responsibility for me!', 'talking'=>true,'proc'=>method(:face_angry)}\
			]\
		}\
	],\
	'slap' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Hehe, I think you need a little punishment', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Please just leave me alone.', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Hehe, I think you need a little punishment', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Do your worst.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'happiness' =>\
			[\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Hehe, I think you need a little punishment', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Nothing you do to me now can hurt more than what you did to my village.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Hehe, I think you need a little punishment', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Haven\'t you hurt me enough?', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Hehe, I think you need a little punishment', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Whatever you do to me here, I\'ll repay in full once I escape!  ', 'talking'=>true,'proc'=>method(:face_neutral)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Time to see how tough you really are', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Please stop! You\'re messing up my hair!', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Time to see how tough you really are', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Ouch!', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Time to see how tough you really are.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Ouch!', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Time to see how tough you really are.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Please, no more!', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Time to see how tough you really are.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Why are you doing this?', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Time to see how tough you really are.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  I can take it!', 'talking'=>true,'proc'=>method(:face_neutral)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Time for a little punishment.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Oww! I\'ll be good, I promise! Just stop!', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Time for a little punishment.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Ohh!', 'talking'=>true,'proc'=>method(:face_sad)},\
				{'text'=>'  Cilia:  Hey, stop that!', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Time for a little punishment.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Oh!  Don\'t stop!', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Time for a little punishment.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Ouch! Do you just enjoy being mean?', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Time for a little punishment.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Eeep! Please, No more!', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Time for a little punishment.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Not bad, but I\'ll show you a real slap when I get outta here.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I think someone\'s been a bad girl.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Oww!', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Cilia:  P-Please punish me more.', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I think someone\'s been a bad girl.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Oh!', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Cilia:  Punish me more!', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I think someone\'s been a bad girl.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Oh yeah!', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Cilia:  Spank me harder!', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I think someone\'s been a bad girl.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Ouch! M-More please.', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'fear' =>\
			[\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I think someone\'s been a bad girl.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Damn right I have. Now teach me a lesson.', 'talking'=>true,'proc'=>method(:face_happy)}\
			]\
		}\
	],\
	'tickle' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s try some of this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Some of wha- HAHAHA HEHE! Stop! Please! You\'re gonna make me wet myself!', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s try some of this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Some of wha- HAHAHA HEHE! Stop!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Cilia:  HAHAHA! Please!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s try some of this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Some of wha- HAHAHA, HEHE! Please!  HAHAHA!  Stop!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s try some of this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Some of wha- HAHAHA HEHE! Stop! Please!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s try some of this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Some of wha- HAHAHA! Stop it!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Cilia:  HAHAHAHA! Stop it or I\'ll - HAHAHA!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Prepare yourself!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  I\'m ready for whatever yo-', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Cilia:  HAHAHAHAHEHE!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Cilia:  Please! HAHA! Stop! Everyone can hear!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Prepare yourself!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  I\'m ready for whatever yo-', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Cilia:  HAHAHAHAHEHE!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Cilia:  P-Please stop! I can\'t -', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Cilia:  HAHAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Prepare yourself!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  I\'m ready for whatever yo-', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Cilia:  HAHAHAHAHEHE!', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Cilia:  P-Please stop! I\'ll do anything!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Prepare yourself!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  I\'m ready for whatever yo-', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Cilia:  HAHAHAHAHEHE!', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Cilia:  P-Please stop!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Prepare yourself!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  I\'m ready for whatever yo-', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Cilia:  HAHAHAHAHEHE!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Cilia:  P-Please stop! I can\'t take much more!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Prepare yourself!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  I\'m ready for whatever yo-', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Cilia:  HAHAAHAHEHE!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Cilia:  You better stop before I -', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Cilia:  HAHAHEHEHE!', 'talking'=>true,'proc'=>method(:face_default)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see just how ticklish you really are.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  W-What!?  You mean you\'re going to… to tickle me? Touch me? Play with me?', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  Ummm… Tickle time.', 'talking'=>false,'proc'=>method(:face_default)},\
				{'text'=>'  Cilia:  HAHAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see how ticklish you really are.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  What a waste of time. I can take any-', 'talking'=>true,'proc'=>method(:face_annoyed)},\
				{'text'=>'  Cilia:  HAHAHAHA! Okay, Okay! I\'m sorry! Stop!', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see how ticklish you really are.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Hehe, fun time, eh?', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  Yep.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  HAHAHA! Does - HEHEHA! - Does this answer your question!', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see how ticklish you really are.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Are you trying to cheer me up?', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  Just shut up and laugh.', 'talking'=>false,'proc'=>method(:face_default)},\
				{'text'=>'  Cilia:  HAHAHHEHEHHA! Please! Stop!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see how ticklish you really are.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  No please! Don\'t do thi- HAHAHAHA!', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Cilia:  Stop! HAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see how ticklish you really are.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  If you lay a finger on me, I\'m gonna - HAHAHEHEHE! Okay I give!  HAHA! I said I give!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I know what will cheer you up!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  HAHEHEHE! P-Please! M-My dress is slipping! You\'re going to see my - HAHAHA! Stop!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Tickle time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  HAHAHAHA', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Cilia:  Please! HEHEHAHAH! No more!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Ready to get tickled?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Mmmm, I do love it wh- HAHAHAHA! Goddammit, Suki1, I wasn\'t done talk- HAHAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I know what will cheer you up!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  HAHEHEHE! P-Please, just leave me be!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I know what\'ll soften you up! My magic fingers!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  How dare you even think of- HAHAHA!', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Cilia:  Oh you- HEHEHA - You meant tickling! I thought you were gonna- HAHAHA!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'kiss' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Come here, Cilia. I want your lips on mine.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  W-what! Wait, I -Ummph!', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Cilia:  Mmmmmm.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Have you ever been kissed before?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  That\'s none of your- MMMPH!', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  Well, now you have.', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I just can\'t stand to see a cute girl so sad.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  What are you- Ummmph!', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Suki1:  There, now you look happy.', 'talking'=>false,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Don\'t be afraid. I don\'t bite. I only kiss.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Mmmmm.', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  What\'s that over there?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Where? I don\'t see any- MMPH!', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  Oh, you taste good.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  You tricked me!', 'talking'=>true,'proc'=>method(:face_shy)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Close your eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  W-Why?', 'talking'=>true,'proc'=>method(:face_afraid)},\
				{'text'=>'  Suki1:  It\'s a surprise.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Mmmph!', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Cilia:  Mmmmm…', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Close your eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Why? What are planning to -! Ummm!', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Close your eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Okay. But no tricks.', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  I promise…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Mmmmm.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Close your eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Why? What are planning to -! Mmmm!', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Close your eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Why? What are planning to -! Mmmm!', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Close your eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Why! Are going to play a trick on me?', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  No, I\'m gonna give you a treat…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  What are you-', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Cilia:  Mmmph!', 'talking'=>true,'proc'=>method(:face_shy)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I\'m going to kiss you now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  W-What?!', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Cilia:  Ummph! Mmmm…', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  How was it?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Uhhh…', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Hehe, time for some fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Mmmmm.', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Cilia:  Thanks.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Hehe, time for some fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  mmmm.', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Cilia:  I could do with more fun like that.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Hehe, time for some fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Ummph!', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Cilia:  Don\'t just kiss me like that!', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  But you look so much happier now.', 'talking'=>false,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Hehe, time for some fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  W-What are you going to do?', 'talking'=>true,'proc'=>method(:face_afraid)},\
				{'text'=>'  Suki1:  This!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Mmmmm…', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Hehe, time for some fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Mmmh!', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Cilia:  How dare you!', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  Come on. You love it.', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Kiss me.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  O-Okay I guess. Though I don\'t know how - Ummmph!', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Cilia:  Mmmmm…', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  (That shut her up)', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Kiss me.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Hehe, if you insist.', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Cilia:  Mmmm…', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Cilia:  Hehe, thanks.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Kiss me.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Now you\'re talking!', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Cilia:  Mmmm…', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Kiss me.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  I don\'t really feel like - MMMPH!', 'talking'=>true,'proc'=>method(:face_annoyed)},\
				{'text'=>'  Suki1:  I wasn\'t asking.', 'talking'=>false,'proc'=>nil}\
			],\
			'fear' =>\
			[\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Kiss me.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Make me! Mmmph!', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  (That shut her up)', 'talking'=>false,'proc'=>nil}\
			]\
		}\
	],\
	'ungag' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Cilia:  Umm mmph!!', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Suki1:  Okay, okay. I\'ll let you speak.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Uhhh, is that drool?', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Cilia:  Umm mmph!!', 'talking'=>true,'proc'=>method(:face_annoyed)},\
				{'text'=>'  Suki1:  Okay, okay. I\'ll let you speak.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Uhhh… finally. God, that tasted awful!', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'happiness' =>\
			[\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Cilia:  Umm mmph!!', 'talking'=>true,'proc'=>method(:face_annoyed)},\
				{'text'=>'  Suki1:  Okay, okay. I\'ll let you speak.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Uhhh… please don\'t put that back in my mouth.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Cilia:  Umm mmph!!', 'talking'=>true,'proc'=>method(:face_annoyed)},\
				{'text'=>'  Suki1:  Okay, okay. I\'ll let you speak.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Uhhh, please don\'t gag me again!,', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Cilia:  Umm mmph!!', 'talking'=>true,'proc'=>method(:face_annoyed)},\
				{'text'=>'  Suki1:  Okay, okay. I\'ll let you speak.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Uhh, about time! Just wait to see what I gag you with!', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Cilia:  Mmmph!', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  Let\'s get that off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Hmm, thanks. That was kinda humiliating to wear.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Cilia:  Mmmph!', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Suki1:  Let\'s get that off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Oh, thank God! Any longer and I think I was going to go crazy.', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Cilia:  Mmmph!', 'talking'=>true,'proc'=>method(:face_sad)},\
				{'text'=>'  Suki1:  Let\'s get that off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Oh, thank you so much! That was driving me crazy!', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Cilia:  Mmmph!', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  Let\'s get that off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Uhhh. Please, that was some gag!', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Cilia:  Mmmph!', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  Let\'s get that off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Hmm - Uhh thanks. That was starting to get a little hard to bear.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Cilia:  Mmmph!', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  Let\'s get that off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Finally! Your stupid games are beginning to get on my nerves.', 'talking'=>true,'proc'=>method(:face_angry)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Cilia:  Hmmph…', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  Okay, I\'ll take it out.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Thanks, it\'s kind of embarrassing being gagged. But I don\'t mind if it\'s just you.', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Cilia:  Hmmph…', 'talking'=>true,'proc'=>method(:face_sad)},\
				{'text'=>'  Suki1:  Okay, I\'ll take it out.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Ah, finally I can talk.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Cilia:  Hmmph…', 'talking'=>true,'proc'=>method(:face_sad)},\
				{'text'=>'  Suki1:  Okay, I\'ll take it out.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Thanks. Now we talk.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Cilia:  Hmmph…', 'talking'=>true,'proc'=>method(:face_afraid)},\
				{'text'=>'  Suki1:  Okay, I\'ll take it out.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Umm, why do you keep me gagged? It\'s not like anyone can hear me anyway.', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Cilia:  Hmmph…', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  Okay, I\'ll take it out.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Ummm, why do you keep me gagged!? It\'s not like anyone can hear  me anyway.', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Cilia:  Hmmph…', 'talking'=>true,'proc'=>method(:face_annoyed)},\
				{'text'=>'  Suki1:  Okay, I\'ll take it out.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Hmm.', 'talking'=>true,'proc'=>method(:face_annoyed)},\
				{'text'=>'  Cilia:  Uhh, you\'re enjoying this, aren\'t you? You pervert.', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I think you\'ve earned this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Mmmm - thanks.  ', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I think you\'ve earned this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Mmmph.', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Cilia:  Umm, thanks.', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I think you\'ve earned this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Mmm, thanks. Now that my mouth is free, we can do other things…', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I think you\'ve earned this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Mmm - thank you.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'fear' =>\
			[\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I think you\'ve earned this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  I swear if you put that back in mouth later, I\'ll… I\'ll… do something. I swear.', 'talking'=>true,'proc'=>method(:face_angry)}\
			]\
		}\
	],\
	'blindfold_on' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s try this on.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  This isn\'t funny, you know.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s try this on.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Hey, no fair!', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'happiness' =>\
			[\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s try this on.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  What the- Hey, no fair!', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s try this on.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Oh, come on! Haven\'t you got me helpless enough?', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s try this on.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Get this off me right now!', 'talking'=>true,'proc'=>method(:face_angry)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have some fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  H-Hey! What are you going to do to me?', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have some fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Hey! Get this thing off me!', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have some fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  I\'m intrigued.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have some fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  What now!', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have some fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Oh no. Now what…', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have some fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Hey! Get this thing off me, coward!', 'talking'=>true,'proc'=>method(:face_angry)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have some fun!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  What sort of fun requires me to be blindfolded?', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  The best kind of fun!', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have some fun!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Hey I can\'t see!', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have some fun!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  A blindfold? Hehe - kinky!', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have some fun!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  What now?', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have some fun!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Hey! Take this off me!', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have some fun!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Show yourself, coward!', 'talking'=>true,'proc'=>method(:face_angry)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I\'m blindfolding you now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  W-What are you going to do with me once I can\'t see?', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I\'m blindfolding you now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Well I\'m tied up already, so why not?', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I\'m blindfolding you now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Hehe, do whatever you want with me.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I\'m blindfolding you now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  What?!', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I\'m blindfolding you now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  W-What?!', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I\'m blindfolding you now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Hmm!', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Cilia:  I would expect nothing less from someone like you.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			]\
		}\
	],\
	'blindfold_off' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take that off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Ahh… don\'t do that to me again.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take that off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  About time.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'happiness' =>\
			[\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take that off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Don\'t think this makes us friends.', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take that off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  This changes nothing.', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take that off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  About damn time!', 'talking'=>true,'proc'=>method(:face_angry)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take that off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Finally. You\'d think being tied up would be enough.', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take that off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  About time.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take that off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Thanks, I guess.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take that off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Don\'t think this makes us friends.', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take that off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Don\'t think this makes us friends.', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take that off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  About damn time!', 'talking'=>true,'proc'=>method(:face_angry)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s get that off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Now my hair\'s a big mess.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s get that off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Ah, thanks.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s get that off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Ha, now I can see your pretty face again.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s get that off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Hmm, whatever…  ', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s get that off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Hmm, whatever…', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s get that off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  That blindfold\'s gonna look so good on you!', 'talking'=>true,'proc'=>method(:face_happy)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see your pretty eyes again.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  S-Shut up! I won\'t forget you blindfolding me.', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see your pretty eyes again.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Hehe, you\'re such a charmer.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see your pretty eyes again.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Hehe, they\'re not as pretty as yours.', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see your pretty eyes again.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Ah, thanks!', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'fear' =>\
			[\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see your pretty eyes again.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Cilia:  Don\'t try and charm me. I won\'t simply forget being tied up and blindfolded.', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			]\
		}\
	]\
};
	end
end
$privateCellDamsels['cilia'] = PrivateCellDamselCilia.new