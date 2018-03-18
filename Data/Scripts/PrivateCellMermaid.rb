#need to try inserting text event into stack
#[image number, name, origin,appointment method?(0 for direct),x,y,zoomx,zoomy,opacity,blend_type]
class PrivateCellDamselMermaid < PrivateCellDamsel
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
    @tag = 'mermaid'
		super()
		#personality
		@emotions['fear'] = [5,0]
		@emotions['shyness'] = [5,0]
		@emotions['anger'] = [5,0]
		@emotions['happiness'] = [5,0]
		@emotions['sadness'] = [5,0]
    #currently unused
    @homophilia = 1
		@masochism = 2
		
		
		@disposition = 1
		@disposition_index = 664
		@disposition_min = 1
		
		#bases
		list = {'outfitdefault' => [30,'PCMermaidBase',0,0,-150,0,100,100,255,0],'outfit1'=> [30,'PCMermaidBaseSailor',0,0,-150,0,100,100,255,0]}
		@images['base'] = list
		
		#brows
		list = {'annoy1' => [32,'PCMermaid_browannoy1',0,0,-150,0,100,100,255,0],'annoy2'=> [32,'PCMermaid_browannoy2',0,0,-150,0,100,100,255,0], 'normal' => [32,'PCMermaid_brownormal',0,0,-150,0,100,100,255,0]}
		list = list.merge({'tickle' => [32,'PCMermaid_browtickle',0,0,-150,0,100,100,255,0],'worry' => [32,'PCMermaid_browworry',0,0,-150,0,100,100,255,0]})
		@images['brow'] = list
		
		#mouths and gags
		list = {'annoy1' => [34,'PCMermaidMouthOpen',0,0,-150,0,100,100,255,0],'annoy2'=> [34,'PCMermaidMouthAnnoy',0,0,-150,0,100,100,255,0], 'neutral' => [34,'PCMermaidMouthAnnoy',0,0,-150,0,100,100,255,0]}
		list = list.merge({'tickle' => [34,'PCMermaidMouthTickle',0,0,-150,0,100,100,255,0],'smile' => [34,'PCMermaidMouthSmile',0,0,-150,0,100,100,255,0]})
		list = list.merge({'ball' => [34,'PCMermaid_gagball',0,0,-150,0,100,100,255,0],'bit' => [34,'PCMermaid_gagbit',0,0,-150,0,100,100,255,0],'cleave' => [34,'PCMermaid_gagcleave',0,0,-150,0,100,100,255,0]})
		list = list.merge({'cloth' => [34,'PCMermaid_gagotm',0,0,-150,0,100,100,255,0],'knot' => [34,'PCMermaid_gagknot',0,0,-150,0,100,100,255,0],'otn' => [34,'PCMermaid_gagotn',0,0,-150,0,100,100,255,0]})
    list = list.merge({'sgag1' => [34,'PCMermaid_gagstarfish',0,0,-150,0,100,100,255,0],'sgag2' => [34,'PCMermaid_gagshell',0,0,-150,0,100,100,255,0]})
		@images['mouth'] = list
		
		#eyes and blindfold
		list = {'blindfold' => [36,'PCMermaidBlindfold',0,0,-150,0,100,100,255,0],'blink' => [33,'PCMermaid_eyeblink',0,0,-150,0,100,100,255,0]}
		list = list.merge({'normal1' => [33,'PCMermaid_eyenormal',0,0,-150,0,100,100,255,0],'normal2' => [33,'PCMermaid_eyeannoyed',0,0,-150,0,100,100,255,0]})
		list = list.merge({'right' => [33,'PCMermaid_eyenormal',0,0,-150,0,100,100,255,0],'left' => [33,'PCMermaid_eyeleft',0,0,-150,0,100,100,255,0]})
		list = list.merge({'tickle' => [33,'PCMermaid_eyeblink',0,0,-150,0,100,100,255,0],'happy' => [33,'PCMermaid_eyeblink',0,0,-150,0,100,100,255,0]})
		@images['eyes'] = list
		
    #accessories
    @images['accessories'] = {}
    list = {'acc1' => [37,'PCMermaidHairPonytail',0,0,-150,0,100,100,255,0],'acc2'=>[38,'PCMermaidCap',0,0,-150,0,100,100,255,0],'defaulthair'=>[37,'PCMermaidHairDefault',0,0,-150,0,100,100,255,0]}
    @images['accessories']['outfit1'] = list
    
		#misc
		list = {'blush1' => [31,'PCMermaid_blush1',0,0,-150,0,100,100,255,0],'blush2' => [31,'PCMermaid_blush2',0,0,-150,0,100,100,255,0],'tears' => [35,'PCMermaid_tears',0,0,-150,0,100,100,255,0]}
		@images['misc'] = list


		testIntro = [{'text'=>"This is line 1","proc"=>nil},{'text'=>"This is line 2","proc"=>nil}]
		
		#"speak" dialogue
		@dialogue =\
{\
	'speak' =>\
	[\
		[\
			{'text'=>'  Suki1:  You\'re really cute when you blush.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Mermaid:  I\'m not blushing.', 'talking'=>true,'proc'=>method(:face_shy)},\
			{'text'=>'  Suki1:  I have to ask - why do you wear that?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Mermaid:  Well, I like my clothing.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  It\'s a bit revealing.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Mermaid:  I-it\'s not revealing.', 'talking'=>true,'proc'=>method(:face_shy)},\
			{'text'=>'  Suki1:  (She\'s blushing a lot).', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Suki1:  Well I mean with the rope it\'s kind of a suggestive situation.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Mermaid:  *gasp* I t-think that is none of your b-business, human, thank you very much.', 'talking'=>true,'proc'=>method(:face_shy)}\
		],\
		[\
			{'text'=>'  Suki1:  Tell me, what were you doing in that cave?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Mermaid:  I am not telling you anything!', 'talking'=>false,'proc'=>method(:face_angry)},\
			{'text'=>'  Suki1: Well if you don\'t want to talk…', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Mermaid: I\'m starting to think that you really like gagging girls a bit too much…', 'talking'=>false,'proc'=>method(:face_annoyed)},\
			{'text'=>'  Suki1: There\'s no such thing as too much fun!', 'talking'=>false,'proc'=>nil}\
		],\
		[\
			{'text'=>'  Suki1:  It\'s nice to see a smile on your face.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Mermaid:  Being tied up all the time is not that bad with someone like you, instead of one of those other kidnappers.', 'talking'=>true,'proc'=>method(:face_happy)},\
			{'text'=>'  Suki1:  You\'re very lucky in that regard. Who knows what would happen with one of the other kidnappers…    ', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Mermaid:  Not to mention that you\'re really cute.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  Thanks, I guess (this is weird).', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Mermaid:  I bet you look really good tied up.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  Well, I guess so…', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Mermaid:  So maybe I can have a turn and tie you up?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  (I see what\'s happening here) Nice try…', 'talking'=>false,'proc'=>nil}\
		],\
		[\
			{'text'=>'  Mermaid:  Are you going to keep me tied up like this for… forever? I don\'t belong in a place like this! I belong in the water, not in this infernal cell with something stuffed in my mouth.', 'talking'=>true,'proc'=>method(:face_angry)},\
			{'text'=>'  Suki1:  I haven\'t decided yet… What should I do…?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Mermaid:  Yes?', 'talking'=>true,'proc'=>method(:face_neutral)},\
			{'text'=>'  Suki1:  Cleave gag or OTM gag? Hmmm, I don\'t know…', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Mermaid:  Wait, what? Are we even having the same conversation?', 'talking'=>true,'proc'=>method(:face_angry)}\
		],\
		[\
			{'text'=>'  Suki1:  (My cute captive looks a bit irritated…)', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Mermaid:  C-can you maybe untie me for a l-little while so I can stretch my Legs?', 'talking'=>true,'proc'=>method(:face_annoyed)},\
			{'text'=>'  Suki1:  What? you don\'t even have legs!', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Mermaid:  You can\'t keep me in this place any longer! It\'s driving me crazy! What were you thinking, putting me in a place like this?!', 'talking'=>true,'proc'=>method(:face_angry)},\
			{'text'=>'  Mermaid:  Dried out fins are not a pretty sight to see, not to mention I\'m all tied up all the time and it\'s always too tight!', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Mermaid:  Look at these bruises all over my arms! Do you think that this is comfortable for me?,', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Mermaid:  Well, do you?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  Do you have any idea how much I have to restrain myself not to gag you right now?', 'talking'=>false,'proc'=>nil}\
		],\
		[\
			{'text'=>'  Mermaid:  How long are you going to keep me as your pet, you wicked woman?', 'talking'=>true,'proc'=>method(:face_angry)},\
			{'text'=>'  Suki1: Please don\'t use that language.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Suki1:  But I don\'t blame you for feeling that way. It\'s too bad for you, though, because you\'re not going anywhere anytime soon.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Mermaid:  You enjoy having girls bound and gagged, completely helpless under your full control, but when I get out of this place I\'m going to make you my slave.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  Yeah, That\'s not going to happen.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Mermaid:  Why the hell not? How would you know?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  You don\'t have the balls.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Mermaid:  Wait, what?', 'talking'=>true,'proc'=>method(:face_default)}\
		]\
	],\
	'charm' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You have a nice tail.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Flattery? is that the best you have? But that\'s nice of you to say…', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Suki1:  I\'m glad you think so.', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I\'m sorry to have to keep you tied up like this all the time.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Do you think that it\'s all fine now just because you apologized?', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  Well you could be stuck with someone much worse than me…', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki:  You\'re really cute when you smile.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  That\'s nice of you to say, I guess…', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Hey, I\'m sorry for being so mean.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Then can you maybe untie me, please?.', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Suki1:  You know I can\'t do that. but I can maybe loosen your bindings a bit if you behave.', 'talking'=>false,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Hey, look on the brlight side; this means you\'re cute enough to be kidnapped in the first place.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  That\'s supposed to be the bright side?', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Don\'t look so angry; you\'re way prettier when you\'re happy.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Shut up. I don\'t want to talk with you right now.', 'talking'=>true,'proc'=>method(:face_angry)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You have a nice tail.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Don\'t make it so hard to hate you!.', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  (She\'s starting to blush).', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I\'m sorry to have to keep you tied up like this.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid.  Do you really mean that?', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Suki1:  I do.', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You\'re really cute when you smile.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  That\'s nice of you to say. That made me a little happy', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Hey, I\'m sorry for being so mean.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  That\'s nice of you to make up for what you did to me… I guess.', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Hey, look on the bright side; this means you\'re cute enough to be kidnapped in the first place.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  I guess so.', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  (She\'s smiling a bit).', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Don\'t look so angry; you\'re way prettier when you\'re happy.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Are you trying to appease me? Because that\'s not going to work.', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  (Well, I gave it a shot).', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You\'re just adorable when you blush.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  You like seeing me blush like this?', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  I do.', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You\'re the prettiest mermaid I have ever seen.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Do you really think so?', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  Of course!', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You\'re really cute when you smile.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid: That\'s kind  of you to say.', 'talking'=>false,'proc'=>method(:face_happy)}\
				],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Don\'t be so sad. You have the cutest smile; it\'d be a shame not to show it.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  I\'m not sad!', 'talking'=>true,'proc'=>method(:face_sad)},\
				{'text'=>'  Suki1:  You can lie to yourself, but you can\'t lie to me.', 'talking'=>false,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Don\'t be scared. I\'ll make sure that nothing bad happens to you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  I\'m glad to hear that.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Turn that frown upside down.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Don\'t tell me what to do! I can frown as much as I want!', 'talking'=>true,'proc'=>method(:face_angry)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You\'re just adorable when you blush.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Oh come on, now you\'re making me blush even more!', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  That was the plan.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Suki1:  (She\'s trying not to smile).', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You\'re the prettiest mermaid I have ever seen.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Well of course I am, silly girl. How many other mermaids have you seen?  ', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  Right…', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You\'re so pleasant to be around when you\'re happy; you have a very charming smile.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Thank you. that means a lot to me, even from someone like you', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Don\'t be so sad. You have the cutest smile; it\'d be a shame not to show it.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  You really think that way about me?', 'talking'=>true,'proc'=>method(:face_sad)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  suki:  Don\'t be scared. I\'ll make sure that nothing bad happens to  you.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  I\'m glad to hear that.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Turn that frown upside down.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Maybe you\'re not that bad after all…', 'talking'=>true,'proc'=>method(:face_default)}\
			]\
		}\
	],\
	'insult' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Why is your hair that color? Did some fish puke over it?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Hey! I like my hair!', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Suki1:  How is that even possible?', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You were surprisingly easy to capture for a magical mermaid.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  You don\'t have to keep bringing that up.', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You\'re so cute over there, all bound and helpless.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Stop it! Quit mocking me!', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Don\'t look so sad, it just makes you look worse than you already do.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Hey, that was really mean.', 'talking'=>true,'proc'=>method(:face_sad)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Wow, you are even weaker than I originally thought. Stopped by one little kidnapper and now you can\'t even get out of those ropes…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Sh-shut up!', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  You\'re supposed to be some magical badass mermaid, right? I\'m definitely not seeing it.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Don\'t mock me… you will live to regret it.', 'talking'=>true,'proc'=>method(:face_angry)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Is that your only clothing? Because it\'s a bit, well… revealing.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  I-it\'s not revealing!', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  (She\'s really blushing now).', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You were surprisingly easy to capture for a magical mermaid.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Don\'t flatter yourself… you caught me off guard! In a fair fight you wouldn\'t stand a chance!', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You\'re so cute over there, all bound and helpless.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Just you wait until you see what I can do unbound.', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  Oh, I\'m so terrified! I\'m shaking in my boots.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Arrg! Stop making fun of me!', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Don\'t look so sad; it just makes you look worse then you already do.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  What did I do to deserve this treatment?', 'talking'=>true,'proc'=>method(:face_sad)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Wow, you\'re even weaker than I originally thought. Stopped by one little kidnapper and now you can\'t even get out of those ropes…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  I\'m not weak! You just… ugh…', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  You\'re supposed to be some magical badass mermaid, right? I\'m definitely not seeing it.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  Just shut up!', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  No, you shut up. Or better yet, I\'ll make you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Ooh no! Don\'t even try!', 'talking'=>true,'proc'=>method(:face_default)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You\'re really blushing a lot. Funny, I thought you said you weren\'t into this type of thing. Be honest - do you have a dirty little secret to tell me?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Don\'t be absurd, human.', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I enjoy our talks better when you\'re gagged.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Don\'t get any ideas!', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  So wait, I\'m not meant to gag you?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  No!', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I thought I was awesome, but it turned out you were just pathetic.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  What are you implying? Untie me and say that again, I dare you!', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Hey now, I was just investigating the cave. You were in there and just attacked me for no reason.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Who do you think you are to judge me?', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  You\'re not as powerful as you think you are.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  M-maybe not…', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  You don\'t need to be so angry just because you\'re completely helpless.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Having to look at you - that\'s what I\'m getting angry about.', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  Good for me you can\'t do anything about that.', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You\'re really blushing a lot. Funny, I thought you said you weren\'t into this type of thing. Tell me, do you have a dirty little secret to tell me?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Hey! I don\'t have any dirty secrets.', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I enjoy our talks better when you\'re gagged.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  If you try to put something in my mouth again I\'ll bite your finger off!', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  (That was a little scary).', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I thought I was awesome but it turned out you were just pathetic.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  You\'re not very nice, are you?.', 'talking'=>true,'proc'=>method(:face_sad)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Hey now, I was just investigating the cave. You were in there and just attacked me for no reason.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Because I… they… ugh…', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  You\'re not as powerful as you think you are.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Ok, fine, you won, but you don\'t have to keep bringing that up.', 'talking'=>true,'proc'=>method(:face_annoyed)},\
				{'text'=>'  Suki1:  Don\' t I?', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: You don\'t need to be so angry just because you\'re completely helpless.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  You like having all the power in your hands, don\'t you?', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  Well… sometimes.', 'talking'=>false,'proc'=>nil}\
			]\
		}\
	],\
	'threaten' =>\
	[\
		{\
			'shyness' =>\
			[\
        {'text'=>'  Suki1:  How long do you think you can be ballgagged without hurting your jaw?', 'talking'=>false,'anomaly'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  Don\'t get any ideas.', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Do you mind if I try putting a ballgag on you?', 'talking'=>false,'anomaly'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  Are you giving me a choice? Or are you just making fun of me and just going to gag me anyway, no matter what I say?', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Suki1:  That\'s a good question.', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You look a little too happy. Do I have to put a stop to that?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Hey, that\'s not fair.', 'talking'=>true,'proc'=>method(:face_sad)},\
				{'text'=>'  Suki1:  Life\'s not fair.', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I\'m going to gag you now because I prefer listening to muffled screams.', 'talking'=>false,'anomaly'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  Oh, crap…', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I\'m a bit hungry. I could really go for some nice fish…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  W-w-what are you saying? You\'re not going to do anything to me, right? …Right?', 'talking'=>true,'proc'=>method(:face_afraid)},\
				{'text'=>'  Suki1:  (She looks worried).', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Maybe I should shove a piece of cloth into your mouth to shut you up…', 'talking'=>false,'anomaly'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  Don\'t you dare, bitch!', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  Watch your mouth; I\'m not the one tied up right now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid: Just wait until I get out of this!', 'talking'=>true,'proc'=>method(:face_angry)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  How long do you think you can be ballgagged without hurting your jaw?', 'talking'=>false,'anomaly'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  I don\'t want to find out.', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  Oh, but I do.', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Do you mind if I try putting a ballgag on you?', 'talking'=>false,'anomaly'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  Are you kidding? Get away from me!', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  Well, I guess this isn\'t your lucky day, then. Hehe.', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You look a little too happy. Do I have to put a stop to that?.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  You\'re really cruel, did you know that?.', 'talking'=>true,'proc'=>method(:face_sad)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I think I\'m going to gag you because I prefer listening to muffled screams.', 'talking'=>false,'anomaly'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  W-what are you saying?', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I\'m a bit hungry. I could really go for some nice fish.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  The scary thing is I don\'t know if you\'re kidding or not.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  (She\'s really struggling to get out).', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Suki1:  If you keep trying to squirm out of those bindings I\'ll just have to add some more rope and put you into a strict hogtie to make sure you\'ll stay put.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid: Don\'t you dare put your hands on me!', 'talking'=>true,'proc'=>method(:face_angry)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You really like being tied up, don\'t you? You\'re blushing out of control! Do you want me to add some more rope?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Hey, don\'t get the wrong idea!', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'neutral' =>\
			[\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  How much tighter do you think I can make your bindings?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Oh, come on! Aren\'t they tight enough already?', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Suki1:  Well, there\'s only one way to find out.', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Do you know how much you\'d be worth? I might just sell you; you\'re one of the most extraordinary girls here.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  You\'re not going to do that, are you?', 'talking'=>true,'proc'=>method(:face_afraid)},\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  If you keep trying to get out of those ropes I\'ll just have to tighten them, and it won\'t be very comfortable for you.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  mermaid:  No, please. I\'ll behave. I promise.', 'talking'=>true,'proc'=>method(:face_afraid)},\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  (She\'s really struggling to get out).', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Suki1:  If you keep trying to squirm out of those bindings I\'ll just have to add some more rope and put you into a strict hogtie to make sure you\'ll stay put.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Your threat does not faze me, you bitch.', 'talking'=>true,'proc'=>method(:face_angry)},\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You really like being tied up, don\'t you? You\'re blushing out of control! Do you want me to add some more rope?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  mermaid:  I do not! Don\'t you dare add any more rope!', 'talking'=>true,'proc'=>method(:face_angry)},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Do you mind if I try putting a ballgag on you?', 'talking'=>true,'anomaly'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  If you have to… I don\'t really have much of a choice now, do I?', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  No. No, you don\'t.', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  How much tighter do you think I can make your bindings?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Do you really need to find that out?', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  I don\'t need to find out, but I\'m totally going to.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Why?…', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Do you know how much you\'d be worth? I might just sell you; you\'re one of the most extraordinary girls here.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  That might have been flattering if you didn\'t threaten to sell me like cattle.', 'talking'=>true,'proc'=>method(:face_afraid)},\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  If you keep trying to get out of those ropes I\'ll just have to tighten them, and it won\'t be very comfortable for you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  mermaid:  You\'re n-not scaring me.', 'talking'=>true,'proc'=>method(:face_afraid)},\
				{'text'=>'  Suki1:  (Yeah right, she\'s totally not scared).', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
			]\
		}\
	],\
	'slap' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Naughty girl! You deserve this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  O-ow! That was awful…', 'talking'=>true,'proc'=>method(:face_sad)},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Naughty girl! You deserve this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  While I\'m tied up? How is this fair?', 'talking'=>true,'proc'=>method(:face_sad)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Naughty girl! You deserve this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Ow! Ahh, why?', 'talking'=>true,'proc'=>method(:face_sad)},\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Naughty girl! You deserve this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Ah! Oww… You can stop now, you know.', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Naughty girl! You deserve this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Agh! Please stop.', 'talking'=>true,'proc'=>method(:face_sad)},\
			],\
			'anger' =>\
			[\
				{'text'=>'  suki:  Naughty girl! You deserve this!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  Agh! Please stop.', 'talking'=>true,'proc'=>method(:face_sad)},\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Naughty girl! You deserve this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Don\'t lay your hands there.', 'talking'=>true,'proc'=>method(:face_shy)},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You\'ve been a really bad girl.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Hey! That hurts!', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Naughty girl! You deserve this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  How can you be enjoying this?', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Naughty girl! You deserve this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Aahh…', 'talking'=>true,'proc'=>method(:face_sad)},\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Naughty girl! You deserve this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  No! Please don\'t do that!', 'talking'=>true,'proc'=>method(:face_sad)},\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Naughty girl! You deserve this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid: Ahhh! Ahh!', 'talking'=>true,'proc'=>method(:face_default)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Naughty girl! You deserve this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Stop that!', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:?  How cute, you\'re starting to blush.', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Naughty girl! You deserve this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Ahh! Cut it out!', 'talking'=>true,'proc'=>method(:face_angry)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Naughty girl! You deserve this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Oww! What are you doing?!', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Naughty girl! You deserve this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Sorry for whatever I did wrong.', 'talking'=>true,'proc'=>method(:face_shy)},\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Naughty girl! You deserve this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Do I have a say in this?', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Suki1:  No.', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Naughty girl! You deserve this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Don\'t touch me.', 'talking'=>true,'proc'=>method(:face_shy)},\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Naughty girl! You deserve this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Aahh! There\'s no need to slap me harder just because I\'m blushing!.', 'talking'=>true,'proc'=>method(:face_shy)},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Naughty girl! You deserve this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Hey! Don\'t do that!', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Naughty girl! You deserve this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Ow! Maybe ask first!', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Naughty girl! You deserve this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Ow, ow! What did I do?!', 'talking'=>true,'proc'=>method(:face_afraid)},\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Naughty girl! You deserve this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Please not on my fin! It\'s very sensitive.', 'talking'=>true,'proc'=>method(:face_shy)},\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Naughty girl! You deserve this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Don\'t you dare touch me again.', 'talking'=>true,'proc'=>method(:face_angry)},\
			]\
		}\
	],\
	'tickle' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have a little fun.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  Hahahahaha! Ahahaha!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have a little fun.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  I\'m not ticklish ahh! Ahahaha!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have a little fun.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  Hehehehehe! D-don\'t!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have a little fun.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  Hehehehe! Stop that.', 'talking'=>true,'proc'=>method(:face_tickle)},\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have a little fun.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  Heeheehahaha! Stop!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have a little fun.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  No- hehehahahaaaa! Get the hell off me!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have a little fun.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  A-hahahaaa! Hehehehe! Hehehehehehe!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have a little fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Hehehe! Ahahaha!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have a little fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  N-Not on my tail ahaha! Hehehehehe!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have a little fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Hey! Haha! Ahaha! Stop it, Suki1!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have a little fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Heeheehahaha! Stop!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have a little fun.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  I\'m not in the mood for this right now.', 'talking'=>true,'proc'=>method(:face_tickle)},\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have a little fun.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  Hahahahaha! Not there!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I wonder how ticklish you are here.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid: Hehehehe! Not my tail - hehehehehe!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have a little fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Hahahaha! Ahahaha!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have a little fun', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Ahahaha! Get off me!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have a little fun.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  Please stop! Hahahahaha!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have a little fun.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  Hehehe! Get your hands off of me!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have a little fun.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  Ehehehehe!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have a little fun.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  Hahahahaha! Ahahaha!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have a little fun.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  Hahaha hahahahaha! Ahahaha!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have a little fun.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  Hahaha- n-not there! Hahaha eeeeee!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have a little fun.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  Not on my tail ahaha! Hehehehehe!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have a little fun.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  Hahahahaha! C-curse you!', 'talking'=>true,'proc'=>method(:face_tickle)},\
			]\
		}\
	],\
	'kiss' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You need to hold still.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Hey! Did I give you permission to kiss me?.', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  C\'mere…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Don\'t… Mmmmph', 'talking'=>true,'proc'=>method(:face_shy)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Here\'s something to think about Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Mm… Are you trying to make me not hate you?', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Suki1:  Need to start somewhere.', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Mm….', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  U-ugh… You have no right to do that.', 'talking'=>true,'proc'=>method(:face_annoyed)},\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Here I come.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Mmmh… Please get off me.', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Hold still for a second.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Mmm… How dare you?!', 'talking'=>true,'proc'=>method(:face_angry)},\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Mmh… Can you maybe ask before doing something like that?.', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Come here.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Do you think you can do whatever you want with me?', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  Yes, yes I do.', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Mmmm….', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  I\'m not ok with this.', 'talking'=>true,'proc'=>method(:face_angry)},\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have some practice.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  There\'s no way I\'m letting you get out of this one.  ', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Mmm….', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  I\'m not in the mood for this!', 'talking'=>true,'proc'=>method(:face_annoyed)},\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Mmmm….', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Mmm… Get the hell off me.', 'talking'=>true,'proc'=>method(:face_angry)},\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You are really blushing.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Mmmph… Doing this is really humiliating while being tied up.', 'talking'=>true,'proc'=>method(:face_shy)},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Come here. Mm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Mmm…  Well, I\'ll admit that wasn\'t completely bad.', 'talking'=>true,'proc'=>method(:face_happy)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Now that wasn\'t so bad, was it?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Mmm… I guess not.', 'talking'=>true,'proc'=>method(:face_happy)},\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  You\'re looking a bit down. I might have just the thing for you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Mmp! Just shove something in my mouth and leave me alone.', 'talking'=>true,'proc'=>method(:face_annoyed)},\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Come here. Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Mph… Well, at least you\'re not hurting me.', 'talking'=>true,'proc'=>method(:face_afraid)},\
				{'text'=>'  Suki1:  (She\'s really scared).', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I\'ve got something special for you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Mmm… Get off me! If you think I enjoyed that you\'re crazy, girl!', 'talking'=>true,'proc'=>method(:face_angry)},\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  It\'s cute that you\'re really trying.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Stop it! You\'re making me blush. Mmmm…', 'talking'=>true,'proc'=>method(:face_shy)},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Mmmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Mmm… Oh! You\'re getting a bit ahead of yourself!', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Mmm…  You\'re pretty good at this…', 'talking'=>true,'proc'=>method(:face_happy)},\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Mmm… So that\'s what humans tastes like.', 'talking'=>true,'proc'=>method(:face_happy)},\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Mmmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Mmmm….', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Come here.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Don\'t you- mmmm?! Mmm…', 'talking'=>true,'proc'=>method(:face_default)},\
			]\
		}\
	],\
	'ungag' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: I thought you didn\'t like being tied up.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid: Can you stop putting things in my mouth? It\'s humiliating.', 'talking'=>false,'proc'=>method(:face_shy)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I suppose I can take this out for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid: Do you think this makes us even?', 'talking'=>false,'proc'=>method(:face_angry)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I suppose I can take this out for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  You\'re not so bad…', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I suppose I can take this off for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  How can you keep such a beautiful creature like me tied up like this?', 'talking'=>false,'proc'=>method(:face_sad)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  (She looks really frightened).', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Hey hey, don\'t be scared. I\'m going to remove the gag.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  Mmmpp.', 'talking'=>true,'proc'=>method(:face_afraid)},\
				{'text'=>'  Suki1:  There you go.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  T-there\'s a huge spider in here!', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  There you go. How are things going with you?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  H-how are thing going? There\'s a fire burning inside of me!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  An inferno fueled by all my angry thoughts! I am consumed with hatred for you! I will get out of here and make you regret what you did!', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  If I\'d known you would just talk like this, I wouldn\'t have ungagged you…', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I thought you didn\'t like being tied up.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid: Thank you, it\'s not like I like being gagged.', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  That\'s not what your face is saying.', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I suppose I can take this off for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Well, thank you for that, I guess.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I suppose I can take this off for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  I appreciate that. It\'s good to be able to talk again.', 'talking'=>false,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I suppose I can take this off for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Do you really need to keep me gagged all the time?', 'talking'=>false,'proc'=>method(:face_shy)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  (She looks really frightened)', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Suki1: Hey hey, don\'t be scared. I\'m going to remove the gag.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid: Mmmpp.', 'talking'=>false,'proc'=>method(:face_afraid)},\
				{'text'=>'  Suki1: There you go.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid: T-thank you.', 'talking'=>false,'proc'=>method(:face_happy)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Don\'t look so angry. I\'ll take this out for a bit.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Do you enjoy putting those things in my mouth? Because it\'s not as fun for me.', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I suppose I can take this out for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  You like the way that gag looks on me?', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I suppose I can take this out for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Not for a while, for good!', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I suppose I can take this out for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  I guess that wasn\'t so bad… but can we please have a break from those things?', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I suppose I can take this out for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Hpmh…  Th-thanks?', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  (She looks really frightened)', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1: Hey hey, don\'t be scared. I\'m going to remove the gag.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Mermaid:  Mmpp.', 'talking'=>true,'proc'=>method(:face_afraid)},\
				{'text'=>'  Suki1:  There you go.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Did you kill the spider?', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I suppose I can take this out for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Just wait until you\'re on the other side of the gag.', 'talking'=>true,'proc'=>method(:face_annoyed)},\
				{'text'=>'  Suki1:  (That seems to happen a bit too often).', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I\'ll take this out for a bit.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Thanks a lot for that. Now can you maybe stop putting those things in my mouth?.', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I suppose I can take this out for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  You really like putting those things on me, don\'t you?', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I suppose I can take this out for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  It\'s too bad, I kind of liked it.  ', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I suppose I can take this out for a while.  ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Great, now my jaw hurts.', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I will take this out for a bit.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Hhpmh…  P-please, not again.', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I suppose I can take this out for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Don\'t you dare put that in my mouth again, or I will destroy you when I get out of this place!', 'talking'=>true,'proc'=>method(:face_angry)}\
			]\
		}\
	],\
	'blindfold_on' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Lights out.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Get this off me immediately!', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Lights out, sweetheart.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Don\'t put that on me.', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Nighty night.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Even with no light I will shine like gold.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Good night, you oversized trout.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Hey! That wasn\'t very nice!', 'talking'=>true,'proc'=>method(:face_sad)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Try this on!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Do you enjoy being cruel?', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Nighty night.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  You\'re digging your own grave with that grin.', 'talking'=>true,'anomaly'=> true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  (She looks furious).', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Nighty night.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Get this off me, you crazy girl!', 'talking'=>true,'proc'=>method(:face_angry)},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Lights out.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  No, it\'s ok, I didn\'t need to see anyway.', 'talking'=>true,'proc'=>method(:face_annoyed)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Try this on.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Please take it off…', 'talking'=>true,'proc'=>method(:face_sad)},\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Sorry for this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Please don\'t.', 'talking'=>true,'proc'=>method(:face_afraid)},\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Try this on.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Ahh! No!', 'talking'=>true,'proc'=>method(:face_afraid)},\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Lights out, sweetheart.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Don\'t you dare put that thing on me.', 'talking'=>true,'proc'=>method(:face_angry)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Nighty night.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  I don\'t like being blindfolded.', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Nighty night.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  It\'s not like this is necessary, is it?', 'talking'=>true,'proc'=>method(:face_sad)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Lights out.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Well, if you insist. I cannot stop you.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Nighty night.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Well, I don\'t have much of a choice, I guess…', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Try this on.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Aahh! No! Get it off!', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Lights out, sweetheart.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Hey! Get this thing off me!', 'talking'=>true,'proc'=>method(:face_angry)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Lights out, sweetheart.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  I\'m not blushing because I like this.', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Hold still so I can put this on.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  You\'re blindfolding me? Well I don\'t have much of a choice, do I?', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Lights out, sweetheart.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  I like this, but only a little bit.', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Sorry for this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Do you need to?', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Nighty night.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Why are you so cruel?', 'talking'=>true,'proc'=>method(:face_sad)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Sorry for this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  No! Hey! Stop!', 'talking'=>true,'proc'=>method(:face_afraid)}\
			]\
		}\
	],\
	'blindfold_off' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those cute eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Saying things like that is not going to change my view of you.', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those cute eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  I guess your word is law in here.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those cute eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  How about not putting that thing on me again?', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those cute eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  What do you want me to see?', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those cute eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Aahh… Don\'t! I-I\'m afraid of the light and- Oh wait.', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those cute eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  I wish you didn\'t do that because now I have to look at your stupid face.', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those cute eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  I\'m not your plaything, so don\'t do that again.', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those cute eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Aah… About time! That thing was annoying.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those cute eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  I\'m actually glad to see you for a change…', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those cute eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  That\'s the least you can do.', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those cute eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  I don\'t like the d-dark.', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those cute eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Don\'t you dare put that on me again, woman.', 'talking'=>true,'proc'=>method(:face_angry)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those cute eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  My eyes look cute?', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those cute eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Thank you, I guess.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Thanks. I like being able to see you.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those cute eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  That\'s nice of you, but it\'s not like you\'re going to untie me, is it?', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those cute eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  I-I wasn\'t crying because it was dark. It-it was just my allergy, I swear!', 'talking'=>true,'proc'=>method(:face_sad)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those cute eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Oh, thanks a lot. It\'s not like you put it on me in the first place.', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those cute eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Ok, I guess… it\'s not like I\'m afraid of the dark or something.', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those cute eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Thank you, I do like to be able to see.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those cute eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  You really like my eyes?', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those cute eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  *Yawn* It\'s morning already?.', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those cute eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Please, can you not put that on me again?', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those cute eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Mermaid:  Do you have any idea what you got into when you put that on me?', 'talking'=>true,'proc'=>method(:face_angry)}\
			]\
		}\
	]\
};
  end
	def generateAccessories (mood,tickle)
			commandArray = []
			outfit = @@saved[@tag]['outfit']
			if @@saved[@tag]['accessories'].has_key?(outfit) && @images.has_key?('accessories') && @images['accessories'].has_key?(outfit)
				@@saved[@tag]['accessories'][outfit].each do |key,val|
          if  @images['accessories'][outfit].has_key?(key) && key[0..2]=='acc' && val
            commandArray.push(@images['accessories'][outfit][key])
          end
				end
			end
			if outfit == 'outfit1'
				if !@@saved[@tag]['accessories'].has_key?(outfit)
					@@saved[@tag]['accessories'][outfit] = {}
				end
				unless @@saved[@tag]['accessories'][outfit]['acc1'] == true
					commandArray.push(@images['accessories'][outfit]['defaulthair'])
				end
			end
			return commandArray
    end
end
$privateCellDamsels['mermaid'] = PrivateCellDamselMermaid.new