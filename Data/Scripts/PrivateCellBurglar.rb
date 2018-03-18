#need to try inserting text event into stack
#[image number, name, origin,appointment method?(0 for direct),x,y,zoomx,zoomy,opacity,blend_type]

class PrivateCellDamselBurglar < PrivateCellDamsel
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
    @tag = 'burglar'
		super()
		#personality
		@emotions['anger'] = [3,0]
		@emotions['happiness'] = [5,0]
		@emotions['shyness'] = [4,0]
		@emotions['sadness'] = [7,0]
		@emotions['fear'] = [2,0]
    #currently unused
    @homophilia = 1
		@masochism = 4
		
		
		@disposition = 2
		@disposition_index = 664
		@disposition_min = 1
		
		#bases
		list = {'back' => [30,'PCBurglarBase',0,0,0,0,100,100,255,0]}
		@images['base'] = list
		
		#brows
		list = {'annoy1' => [32,'PCBurglarBrowsLow',0,0,0,0,100,100,255,0],'annoy2'=> [32,'PCBurglarBrowsAnnoyed',0,0,0,0,100,100,255,0], 'normal' => [32,'PCBurglarBrowsNormal',0,0,0,0,100,100,255,0]}
		list = list.merge({'tickle' => [32,'PCBurglarBrowsWorried',0,0,0,0,100,100,255,0],'worry' => [32,'PCBurglarBrowsWorried',0,0,0,0,100,100,255,0]})
		@images['brow'] = list
		
		#mouths and gags
		list = {'annoy1' => [34,'PCBurglarMouthOpen',0,0,0,0,100,100,255,0],'annoy2'=> [34,'PCBurglarMouthSad',0,0,0,0,100,100,255,0], 'neutral' => [34,'PCBurglarMouthNormal',0,0,0,0,100,100,255,0]}
		list = list.merge({'tickle' => [34,'PCBurglarMouthOpen2',0,0,0,0,100,100,255,0],'smile' => [34,'PCBurglarMouthSmile',0,0,0,0,100,100,255,0]})
		list = list.merge({'ball' => [34,'PCBurglarGagBall',0,0,0,0,100,100,255,0],'bit' => [34,'PCBurglarGagBit',0,0,0,0,100,100,255,0],'cleave' => [34,'PCBurglarGagCleave',0,0,0,0,100,100,255,0]})
		list = list.merge({'cloth' => [34,'PCBurglarGagOTM',0,0,0,0,100,100,255,0],'knot' => [34,'PCBurglarGagKnotted',0,0,0,0,100,100,255,0],'otn' => [34,'PCBurglarGagOTN',0,0,0,0,100,100,255,0]})
    list = list.merge({'sgag1' => [34,'PCBurglarGagSock',0,0,0,0,100,100,255,0]})
    @images['mouth'] = list
		
		#eyes and blindfold
		list = {'blindfold' => [36,'PCBurglarBlindfold',0,0,0,0,100,100,255,0],'blink' => [33,'PCBurglarEyesClosed',0,0,0,0,100,100,255,0]}
		list = list.merge({'normal1' => [33,'PCBurglarEyesNormal',0,0,0,0,100,100,255,0],'normal2' => [33,'PCBurglarEyesNormal',0,0,0,0,100,100,255,0]})
		list = list.merge({'right' => [33,'PCBurglarEyesSide',0,0,0,0,100,100,255,0],'left' => [33,'PCBurglarEyesSide',0,0,0,0,100,100,255,0]})
		list = list.merge({'tickle' => [33,'PCBurglarEyesTickle',0,0,0,0,100,100,255,0],'happy' => [33,'PCBurglarEyesTickle',0,0,0,0,100,100,255,0]})
		@images['eyes'] = list
		
		#misc
		list = {'blush1' => [31,'PCBurglarBlush',0,0,0,0,100,100,255,0],'blush2' => [31,'PCBurglarBlush2',0,0,0,0,100,100,255,0],'tears' => [35,'PCBurglarTears',0,0,0,0,100,100,255,0]}
		@images['misc'] = list
		
		testIntro = [{'text'=>"This is line 1","proc"=>nil},{'text'=>"This is line 2","proc"=>nil}]
		
		#"speak" dialogue
@dialogue =\
{\
	'speak' =>\
	[\
		[\
			{'text'=>'Suki1: Finally decided to stick around then.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Burglar: Well it\'s not like you\'ve given me much of a choice!', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: Well it was either tie you up really tight or glue your feet to the floor. I think we made the right choice.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Burglar: Oh, you think you\'re being cute! Lets see if you are still laughing once I bust out\'a here so fast it makes your head spin!', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: I wouldn\'t get my hopes up too much if I were you.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Suki1: You\'re under my watch now. There\'s no bumbling guards for you to trick this time.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Suki1: Face it, you\'ve probably robbed your last house.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Burglar: ... ', 'talking'=>false,'proc'=>nil}\
		],\
		[\
			{'text'=>'Suki1: So now that you\'re my prisoner I can finally ask you, why were you robbing all those homes?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Burglar: For money.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1 ...That\'s it?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Burglar: Yep.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: No troubled past, no father\'s gambling debts to pay off, no lover to bail out of jail?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Burglar: What world are you from, lady? I like money, that\'s it. I steal stuff, I sell stuff and then I buy more stuff. That all.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: Oh... well. That\'s... disappointing.', 'talking'=>false,'proc'=>nil}\
		],\
		[\
			{'text'=>'Suki1: Didn\'t you ever want to be anything more than a burglar? Don\'t you want to, you know, start again?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Burglar: I\'ve thought about turning over a new leaf now and again, doing something proper and decent, you know?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Burglar: But do you have any idea how expensive it is to live a normal life?! 63 gold for a banana and a magazine, no thanks!', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: But does mean you wouldn\'t have to live a life constantly on the run.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Burglar: Hey! I don\'t wanna hear the whole nice girl speech from you. This place isn\'t exactly a courthouse and you\'re about as far from being a saint as I am.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: (Well, she\'s not wrong...)', 'talking'=>false,'proc'=>nil}\
		],\
		[\
			{'text'=>'Burglar: Hey, can\'t you just let me go! I promise I won\'t steal any more. I might even bring you some nice cuties to put in your cells!', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: I thought you just said you wouldn\'t steal anymore.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Burglar: Hey, grabbing people isn\'t stealing, it\'s kidnapping!', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: ...', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Suki1: I think I should just keep you gagged from now on. ', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Burglar: Eeep! Wait! I\'ll be good! I promise! ', 'talking'=>true,'proc'=>nil}\
		],\
	],\
	'charm' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: You know, you\'re pretty cute. Maybe you\'d have had more success stealing hearts instead of jewelry.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Love is for the weak. I\'m in this game for and me alone.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'N/A', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: You know, you\'re pretty cute. Maybe you\'d have had more success stealing hearts instead of jewelry.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Well, that\'s no good to me now is it! ', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: You know, you\'re pretty cute. Maybe you\'d have had more success stealing hearts instead of jewelry.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: If I ever get of here, maybe I\'ll take your advice...', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: You know, you\'re pretty cute. Maybe you\'d have had more success stealing hearts instead of jewelry.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: If I ever get out of here I\'m stealing you!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: What\'s that supposed to mean?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: It means shut up!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: ...', 'talking'=>false,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: You know, you\'re pretty cute. Maybe you\'d have had more success stealing hearts instead of jewelry.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: What are you saying?! I\'m a thief, not some high class lady! There\'s no place for me in that world...', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: I gotta say, I thought I was a pretty good escape artist until I met you. You could have made a career as like a Houdini.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Or I could not do that, and rob houses instead.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: You\'re no fun, you know that?...', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I gotta say, I thought I was a pretty good escape artist until I met you. You could have made a career as like a Houdini.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Well. I\'ll make you a deal... if I get out\'a here I\'ll do just that.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I gotta say, I thought I was a pretty good escape artist until I met you. You could have made a career as like a Houdini.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Please don\'t fill my head with, “what if\'s...”', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I gotta say, I thought I was a pretty good escape artist until I met you. You could have made a career as like a Houdini.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: What that\'s supposed to mean, you think I\'m just some performer?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I gotta say, I thought I was a pretty good escape artist until I met you. You could have made a career as like a Houdini.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: And you could have made for a cute maid if you\'d just have let me sell you off!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I gotta say, I thought I was a pretty good escape artist until I met you. You could have made a career as like a Houdini.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Well, I do have plenty of experience being tied up...', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: You know, ropes are a good look on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Thanks... I think.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You know, ropes are a good look on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: I\'m sure they\'d look great on you too.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: You know, ropes are a good look on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Well, it doesn\'t look like I\'ll be wearing much else for a while...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: You know, ropes are a good look on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Hey now, let\'s not get any crazy ideas. You\'ve already got me roped up enough as it is. ', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: You know, ropes are a good look on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: You know what would look better on me? 3000 gold, after I sell you as a maid to some pervert!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: You know, ropes are a good look on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Don\'t try and get sweet on me! I-I still hate you for meddling with my work!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: I\'m glad I finally caught you, a cutie like you doesn\'t belong in just any old jail.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Well, this does beat the big-house by a mile.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I\'m glad I finally caught you, a cutie like you doesn\'t belong in just any old jail.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Hehe, well I guess having a cute jailer like you isn\'t so bad... ', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I\'m glad I finally caught you, a cutie like you doesn\'t belong in just any old jail.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Well, I\'d rather not be in any jail if I\'m honest.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'N/A', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I\'m glad I finally caught you, a cutie like you doesn\'t belong in just any old jail.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: I don\'t belong in any jail – Now let me out!... Guh!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: You\'re so cute when you struggle...', 'talking'=>false,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I\'m glad I finally caught you, a cutie like you doesn\'t belong in just any old jail.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: I don\'t know, I\'ve never been in a prison with so many tied up women before...', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'insult' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Well, looks like I won our little game in the end.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Who says this is over?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: The tight ropes holding you bound say so.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: ... ', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'N/A', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Well, looks like I won our little game in the end.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: And now you\'re here to gloat. Why am I not surprised?', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Well, looks like I won our little game in the end.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Can\'t you just leave me alone – you caught me! Isn\'t that enough?!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Well, looks like I won our little game in the end.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Congratulations, you put a hard working street girl in a cell. You must feel very proud.', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Well, looks like I won our little game in the end.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: S-Shut up! I\'ll have you know I\'ve escaped from every prison in the country! Of course, there I wasn\'t tied up constantly...', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: You know, robbing houses is pretty low. Couldn\'t you at least steal from the rich?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Okay, let me go and I\'ll do it.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: ...No. ', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You know, robbing houses is pretty low. Couldn\'t you at least steal from the rich?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Well, rich houses are pretty well guarded. I\'m not an idiot.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: And yet you\'re here...', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: You know, robbing houses is pretty low. Couldn\'t you at least steal from the rich?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Oh wow, is the kidnapper going to judge me? That\'s rich...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: You know, robbing houses is pretty low. Couldn\'t you at least steal from the rich?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Oh right yeah, do you know what they do to cute girls like me in prison!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: You know, robbing houses is pretty low. Couldn\'t you at least steal from the rich?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Do I look like Robin Hood to you?!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: You know, robbing houses is pretty low. Couldn\'t you at least steal from the rich?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Can\'t you just leave me alone! I can\'t rob any more houses, isn\'t that enough for you?!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Well, go on then. Let\'s see you pull another miraculous escape out of your hat. ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: I will, just – ugh – give me a minute to – ugh, damn! These knot are ridiculously tight!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Well, go on then. Let\'s see you pull another miraculous escape out of your hat. ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Hehe, I guess you\'ll have to stick around and watch me. Otherwise I might just slip out your hands. ', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Well, go on then. Let\'s see you pull another miraculous escape out of your hat. ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Well, I can\'t do it with you watching!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Well, go on then. Let\'s see you pull another miraculous escape out of your hat. ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Don\'t pressure me!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Well, go on then. Let\'s see you pull another miraculous escape out of your hat. ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Yeah, laugh it up kidnapper, lets see if you\'re still laughing when I get out\'a here and take you with me!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Well, go on then. Let\'s see you pull another miraculous escape out of your hat. ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Don\'t tease me!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: You know, you\'re only the second cutest thief I\'ve ever encountered.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: What! No way, I\'m the cutest thing on this side of the law!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You know, you\'re only the second cutest thief I\'ve ever encountered.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Hehe, really? You\'ll have to introduce us some time.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: You know, you\'re only the second cutest thief I\'ve ever encountered.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: You lie! You\'re just trying to make me Jealous.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'N/A', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: You know, you\'re only the second cutest thief I\'ve ever encountered.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Well then, when I tie her up and sell her as a maid, I\'ll be number 1 again won\'t I?', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: You know, you\'re only the second cutest thief I\'ve ever encountered.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: W-What?! But I thought I was the only thief girl in your life! ', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'threaten' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: How about I take you back to one of your crime scenes and leave you tied up and gagged.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: You wouldn\'t dare! There\'s no telling what they\'d do to me! ', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'N/A ', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: How about I take you back to one of your crime scenes and leave you tied up and gagged.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Please no! I\'ve seen the kinky stuff in their closets, there\'s no telling what they\'d do to me!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: How about I take you back to one of your crime scenes and leave you tied up and gagged.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: You wouldn\'t! You couldn\'t?! There\'s no way you\'re that cruel, aren\'t you supposed to be the good girl here?!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: How about I take you back to one of your crime scenes and leave you tied up and gagged.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: That\'s just what I\'d expect from a pervert like you!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: How about I take you back to one of your crime scenes and leave you tied up and gagged.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: P-Pervert!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: You know I\'ve been thinking about getting a maid to clean these cells. What\'a you say, ready to pay your debt to society?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: There\'s no way in hell I\'d wear a maid outfit for you!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You know I\'ve been thinking about getting a maid to clean these cells. What\'a you say, ready to pay your debt to society?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: If I do a good job, will you let me go?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: ...No.', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: You know I\'ve been thinking about getting a maid to clean these cells. What\'a you say, ready to pay your debt to society?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Is that all I am now? A servant to wait on your beck and call?', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: You know I\'ve been thinking about getting a maid to clean these cells. What\'a you say, ready to pay your debt to society?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Can\'t I just stay as a prisoner? Manual labour is so below me.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: You know I\'ve been thinking about getting a maid to clean these cells. What\'a you say, ready to pay your debt to society?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: How dare you! I\'m a classy thief! People serve me, not the other way around.', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: You know I\'ve been thinking about getting a maid to clean these cells. What\'a you say, ready to pay your debt to society?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: You mean I\'d have to dress up like a maid! In some frilly dress! I\'d die of embarrassment! ', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: I don\'t like the idea of you escaping again. Hmmm... I wonder if I could get some chains in here...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Woah! I\'m not a monster, you know!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I don\'t like the idea of you escaping again. Hmmm... I wonder if I could get some chains in here... ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Ooh! I\'ve never tried to escape from chains before! This could be fun!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: (That wasn\'t what I was expecting...)', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I don\'t like the idea of you escaping again. Hmmm... I wonder if I could get some chains in here...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Oh come on! Isn\'t being tied up in a cell enough for you!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I don\'t like the idea of you escaping again. Hmmm, I wonder if I could get some chains in here...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Can\'t I just stay tied up like this?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I don\'t like the idea of you escaping again. Hmmm... I wonder if I could get some chains in here...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Don\'t you even think about putting any of your weird kidnapper stuff on me!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I don\'t like the idea of you escaping again. Hmmm... I wonder if I could get some chains in here...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: H-Hey now, lets not get crazy. I\'ve seen some of the stuff you have in here and I don\'t want any part of it!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: You know, I\'ve got a cute thief friend who\'s dying to have some fun with you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Hmmph, she can\'t be as cute as me!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You know, I\'ve got a cute thief friend who\'s dying to have some fun with you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Is she as a big a kink as you?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Oh yes...', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: You know, I\'ve got a cute thief friend who\'s dying to have some fun with you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Can\'t we keep this just between ourselves?', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'N/A', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: You know, I\'ve got a cute thief friend who\'s dying to have some fun with you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Hmmf. At least I do my own dirty work.', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: You know, I\'ve got a cute thief friend who\'s dying to have some fun with you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: You mean while I\'m still tied up?! That\'s a dirty trick! ', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'slap' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Maybe this will straighten you out.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Ouch! How dare you even touch me! ', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'N/A', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Maybe this will straighten you out.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Ouch! Hey, cut that crap out!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Maybe this will straighten you out.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Ouch! Hey, why\'d you do that? I was being good!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Maybe this will straighten you out.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Ouch! What the hell! I\'m a lady you know!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Maybe this will straighten you out.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Ooww! Why would you do that to me?', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Ouch! What the hell!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Hey, cut that out!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Is this gonna be a regular thing?!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Ouch! Geeze, jails is starting to look pretty good about now.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Why don\'t you untie me and try that again.', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Did you just slap my boobs?', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: This should teach you not to steal!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Oww! What the hell?!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: This should teach you not to steal!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Ouch! Why would you do that?', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: This should teach you not to steal!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Don\'t touch me!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: This should teach you not to steal!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: I\'m in a cell, I can\'t steal anything!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: This should teach you not to steal!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Guh... this is only teaching me to hate you...', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: This should teach you not to steal!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: You\'ve got me tied up! I already can\'t steal anything!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: You\'ve been a very naughty girl.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Oooh, that stung!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You\'ve been a very naughty girl.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Oww! Come on, I\'ve been way naughtier than that!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: You\'ve been a very naughty girl.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Oooh, you have no idea...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'N/A', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: You\'ve been a very naughty girl.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Ouch! Can\'t you at least hit me on the butt or something?', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: You\'ve been a very naughty girl.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Ouch! What do I get if I\'m good...', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'tickle' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Fun time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: AHHAHAH – STOP!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'N/A', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Fun time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: AHAHAH – Cut that out!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Fun time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: What are you talk- AHAHAHAHA! Stop it!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Fun time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: AHAHAHA! Hey, get your filthy hands- AHAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Fun time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: HAHAHAHA -Stop it! This is- AHAHAH!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Lets see if you can handle this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: What are planning to -AHAHAHAHA! Yeah! Cut that – HAHAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Lets see if you can handle this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Hmm, I\'m sure I can handle anything you – HAHAHAHA! Please! Please Stop!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Lets see if you can handle this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: I don\'t like the sound of- AHAHAHAHAHA! I knew it would be – AHAHAHHA! Stop!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Lets see if you can handle this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: AHAHAHAHA! Please! Just leave me -AHAHAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Lets see if you can handle this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Hmph! I can handle anything your weak – AHAHAHAAHA! Hey no fair! That\'s – AHAHAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Lets see if you can handle this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: No please! Not the tickling! I\'ll do – AHAHAHAHAHA! Oh please stop! I\'ll do any- AHAHAHAHAHA!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: You\'re always so serious, I wanna see you smile!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Oh! Are you gonna release- AHAHAHAHA! Not fair!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You\'re always so serious, I wanna see you smile!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Ah, that\'s kinda nice. I guess you\'re not a complete- AHAHAHA! H-Hey! That\'s not fair!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: You\'re always so serious, I wanna see you smile!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Well you could start by letting me out of – HAHAHAHAH! ', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: You\'re always so serious, I wanna see you smile!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Well, maybe if you untie these ropes I\'ll... Wait, what are you doing?! No please I- AHAHAHAHA! Stop! I\'m too ticklish!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: You\'re always so serious, I wanna see you smile!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Well how about you start by taking these damn ropes off!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Hmmm, how about I just tickle you instead!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Wait, wha- AHAHAHAAHAHA! No! Stop!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: You\'re always so serious, I wanna see you smile!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Wait... you\'re not going to... no please! I\'m super ticklish, you can\'t- AHAHAHAHAHA! Please! I\'m gonna wet my panties!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Let\'s see how ticklish you are!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: No! Please, don\'t I\'m super – AHAHAHAHAHA! Stop! I can\'t AHAHAHAH!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Let\'s see how ticklish you are!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Mmmm, how about you use those hands for something- HAHAHAHA! Wait! Let me finish what – AHAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Let\'s see how ticklish you are!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: No wait, seriosuly I can\'t take being tick-HAHAHAHAHA! Please have mercy! AHAHAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'N/A', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Let\'s see how ticklish you are!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Hmph, I\'m not ticklish at all, so don\'t even- EEEEK AHAHAHAHAHAHAH ! Okay! Okay I give- HAHAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Let\'s see how ticklish you are!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Oh no! Seriously I can\'t take being AHAHAHAHAH! Please! Stop! N-Not while I\'m tied up like -AHAHAHAHA!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'kiss' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Mmmm, I\'ve been wanting to do this for a while..', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: What are you – Mmmmph!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Burglar: Hey! Keep your kidnapping lips to yourself!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'N/A', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Mmmm, I\'ve been wanting to do this for a while..', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Don\'t you dare come anywhere near- Mmmmph! ', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Mmmm, I\'ve been wanting to do this for a while..', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Mmmm! Well, at least it\'s just a kiss...', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Mmmm, I\'ve been wanting to do this for a while..', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Mmmmph! How dare you! Do I look like that kind of girl?! ', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Mmmm, I\'ve been wanting to do this for a while..', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Mmmm... I mean, w-what the hell are you doing?!', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Burglar: Mmmm! So is this why you kept coming after me?', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Burglar: Mmmm! Wow, that was... kind\'a nice...', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Burglar: Mmmm! Did- Did you catch me just to kiss me?', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Burglar: Mmmm! Can you just keep me gagged...', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Burglar: Mmmm! What the hell are you doing?!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Burglar: Mmmm! H-Hey! T-This changes nothing between us! I still hate you!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Burglar: Mmmm... was that for being good? ', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Burglar: Mmmm... If you\'re trying to give me a reason to stick around, you\'re doing a good job of it.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Burglar: Mmmm... If you\'re trying to make me feel better – you\'re actually doing a good job of it.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Burglar: Mmmph! What the hell was that?! Did I ask to be kissed?!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Your cute expression did.', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Burglar: Mmmph! How dare you kiss me while I\'m tied up and can\'t defend myself! ', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: But that\'s when you\'re the cutest!', 'talking'=>false,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Burglar: Mmmm... wait, why\'d you stop?', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Burglar: Mmmm... hey! Don\'t stop now!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Burglar: Mmmm... is this what I get for being good, or for being bad...', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Burglar: Mmmm... you taste like strawberries.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'N/A', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Burglar: Mmmph! Hey! I didn\'t say stop!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Burglar: Mmmm... So this is why you tied me up.', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'ungag' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Lets take this off for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Ugh, finally!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'N/A', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Lets take this off for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Ugh, what was that thing? Who even uses things like that?!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Lets take this off for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Oh finally! I was beginning to think I\'d never speak again!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Lets take this off for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Ugh, how dare you stick that thing in my mouth!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Lets take this off for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Uh, why did you put that... that... thing, in my mouth?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: I\'ve come to learn that it gives its own reward.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: What the hell does that mean?', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Okay, I\'ll let you talk for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Uhh, that tasted horrible! ', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Okay, I\'ll let you talk for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Oh, you\'ll let me huh? What are you trying to be like one of those dominatrix things or something?', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Okay, I\'ll let you talk for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Ugh, please don\'t put that, that thing, back in my mouth!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Okay, I\'ll let you talk for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Ugh, why do you put those things in your prisoner\'s mouths!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Okay, I\'ll let you talk for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Ugh, I hope you know whatever you do to me here, I\'ll do twice as bad to you when I get out\'a here!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Okay, I\'ll let you talk for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: ugh, is that what I\'m reduced to? Being told when to talk. How humiliating...', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: I\'m going to ungag you now, but you better behave.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Ugh, finally! I could hardly breathe with that thing!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I\'m going to ungag you now, but you better behave.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Hmm, what will you put in my mouth if I\'m bad?', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I\'m going to ungag you now, but you better behave.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Ugh, I\'m tied up, it\'s not like I have much of a choice!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I\'m going to ungag you now, but you better behave.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: W-What will you do if I\'m bad?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I\'m going to ungag you now, but you better behave.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: How dare a kidnapper speak to me like that! You\'re the one that has me tied up in a cell, I think you should behave!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I\'m going to ungag you now, but you better behave.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Ugh, were do find all these horrible things to put in my mouth?!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Hmmm, lets take this off, I wanna see your lips.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Hehe, now why would want that?', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Hmmm, lets take this off, I wanna see your lips.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Up close I hope.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Hmmm, lets take this off, I wanna see your lips.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Why? So you can shove another foul tasting gag in my mouth?!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'N/A', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Hmmm, lets take this off, I wanna see your lips.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Why? So you can shove another one of your gags in my mouth?! ', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Hmmm, lets take this off, I wanna see your lips.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Hey, why are looking at me like that?', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'blindfold_on' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Lets see you steal what you can\'t see!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: This is ridiculous, take this thing off me!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'N/A', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Lets see you steal what you can\'t see!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Hey! What the hell! Isn\'t being tied up enough, you gotta blindfold me too?!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Lets see you steal what you can\'t see!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: This is ridiculous, I\'m tied up! I can\'t steal anything!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Lets see you steal what you can\'t see!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: I\'m tied up in a cell, what\'s to steal?!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Lets see you steal what you can\'t see!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Hey! Get this thing off me! ', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Burglar: Hello...?', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: I\'d bet you\'d look cute with this on!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Hey what the hell! This isn\'t funny you know!', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I\'d bet you\'d look cute with this on!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: ...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Well, do I?', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I\'d bet you\'d look cute with this on!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Hey! Get this thing off of me!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I\'d bet you\'d look cute with this on!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Where do you get these things from?!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I\'d bet you\'d look cute with this on!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Hey no fair! Face me like a woman!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I\'d bet you\'d look cute with this on!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Hey! Get this off me!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Burglar: Hello? Hey! Don\'t leave me like this! ', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Let\'s see you escape with this on!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Hey no fair! I wasn\'t even trying to escape...', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Let\'s see you escape with this on!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Oooh! A blindfold eh? Maybe I don\'t want to escape...', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Let\'s see you escape with this on!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Hey! Come on, you tie me up, gag me, isn\'t that enough!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Let\'s see you escape with this on!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Oh come on! Is this really necessary?!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Let\'s see you escape with this on!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Hmph, I could get out of here anytime I want. I-I just don\'t want to escape yet. ', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Let\'s see you escape with this on!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: H-Hey! No fair! Why do you make me play these silly games...', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Close you eyes – never mind I\'ll do it for you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Hey what the- oh you\'re sneaky!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Close you eyes – never mind I\'ll do it for you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Ohh, you can be quite the little dom when you want to be can\'t you.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Close your eyes – never mind I\'ll do it for you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Hey! Take this weird thing off me!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'N/a', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Close you eyes – never mind I\'ll do it for you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Hey! You little sneak! Take this off before I, I... well I\'ll do something!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Close you eyes – never mind I\'ll do it for you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: W-What? Hey! Get this thing off me! Please, I don\'t like people staring at me!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'blindfold_off' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Okay lets take this off, for now...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Oh, well don\'t expect me to say thank you. ', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'N/A', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Okay lets take this off, for now...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: What does that mean? ', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Okay lets take this off, for now...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Wait – you\'re not planning to put that thing back on me are you?!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Okay lets take this off, for now...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Just you try and blindfold me again. I-I bite you know! ', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Do you really want to know what happens if you bite me?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: ...', 'talking'=>false,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Okay lets take this off, for now...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: H-Hey, can\'t we just forget about the blindfolds?', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: I think we can do without this. It\'s not like you can escape anyway.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Oh, we\'ll see.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I think we can do without this. It\'s not like you can escape anyway.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Thanks...', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I think we can do without this. It\'s not like you can escape anyway.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Is your job seriously just to find and annoy me or what?!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I think we can do without this. It\'s not like you can escape anyway.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Is your job seriously just to find and annoy me or what?!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I think we can do without this. It\'s not like you can escape anyway.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Is your job seriously just to find and annoy me or what?!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I think we can do without this. It\'s not like you can escape anyway.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: I-I could escape, I\'m just waiting until I feel like it...', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: (Suuuure.)', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Lets see those lovely eyes of yours.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Hmph, if you like them so much, why did you cover them up!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Lets see those lovely eyes of yours.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Well, these are eyes are glad to see you too...', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Lets see those lovely eyes of yours.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Why, just so you can watch me cry?', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Lets see those lovely eyes of yours.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Can I just go back to my cell please...', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Lets see those lovely eyes of yours.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: I\'m not your little toy!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Lets see those lovely eyes of yours.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Stop it – you\'re making me blush!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: I wanna look you in the eye for this next part...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Hehe, oh my!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I wanna look you in the eye for this next part...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Oh my. You\'re certainly an interesting one.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I wanna look you in the eye for this next part...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Why?! What are you planning now?!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'N/A', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I wanna look you in the eye for this next part...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: Oh, so we have some guts are all!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I wanna look you in the eye for this next part...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Burglar: W-What?! Hold on a minute – hey guard dude, help! This woman\'s bat-crazy!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	]\
};

	end
end



$privateCellDamsels['burglar'] = PrivateCellDamselBurglar.new
