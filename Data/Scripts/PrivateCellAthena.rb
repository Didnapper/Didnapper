#need to try inserting text event into stack
#[image number, name, origin,appointment method?(0 for direct),x,y,zoomx,zoomy,opacity,blend_type]

class PrivateCellDamselAthena < PrivateCellDamsel
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
    @tag = 'athena'
		super()
		#personality
		@emotions['fear'] = [1,0]
		@emotions['shyness'] = [4,0]
		@emotions['anger'] = [9,0]
		@emotions['happiness'] = [5,0]
		@emotions['sadness'] = [1,0]
    #currently unused
    @homophilia = 4
		@masochism = 4
		
		
		@disposition = 1
		@disposition_index = 664
		@disposition_min = 1
		
		#bases
    #list = {'outfitdefault' => [30,'PCAthena',0,0,0,0,100,100,255,0],'outfit1'=> [30,'PCAthenaGym',0,0,0,0,100,100,255,0]}
    
    list = {'outfitdefault' => [30,'PCAthena',0,0,0,0,100,100,255,0],'outfit1'=> [30,'PCAthenaGym',0,0,0,0,100,100,255,0]}
    @images['base'] = list
		
		#brows
		list = {'annoy1' => [32,'PCAthena_browannoy1',0,0,0,0,100,100,255,0],'annoy2'=> [32,'PCAthena_browannoy2',0,0,0,0,100,100,255,0], 'normal' => [32,'PCAthena_brownormal',0,0,0,0,100,100,255,0]}
		list = list.merge({'tickle' => [32,'PCAthena_browworried',0,0,0,0,100,100,255,0],'worry' => [32,'PCAthena_browworried',0,0,0,0,100,100,255,0]})
		@images['brow'] = list
		
		#mouths and gags
		list = {'annoy1' => [34,'PCAthena_mouthopen',0,0,0,0,100,100,255,0],'annoy2'=> [34,'PCAthena_mouthsad',0,0,0,0,100,100,255,0], 'neutral' => [34,'PCAthena_mouthneutral',0,0,0,0,100,100,255,0]}
		list = list.merge({'tickle' => [34,'PCAthena_mouthtickle',0,0,0,0,100,100,255,0],'smile' => [34,'PCAthena_mouthsmile',0,0,0,0,100,100,255,0]})
		list = list.merge({'ball' => [34,'PCAthena_gagball',0,0,0,0,100,100,255,0],'bit' => [34,'PCAthena_gagbit',0,0,0,0,100,100,255,0],'cleave' => [34,'PCAthena_gagcleave',0,0,0,0,100,100,255,0]})
		list = list.merge({'cloth' => [34,'PCAthena_gagcloth',0,0,0,0,100,100,255,0],'knot' => [34,'PCAthena_gagknot',0,0,0,0,100,100,255,0],'otn' => [34,'PCAthena_gagotn',0,0,0,0,100,100,255,0]})
		list = list.merge({'sgag1' => [34,'PCAthena_gagspecial1',0,0,0,0,100,100,255,0],'sgag2' => [34,'PCAthena_gagspecial1',0,0,0,0,100,100,255,0]})
    @images['mouth'] = list
		
		#eyes and blindfold
		list = {'blindfold' => [36,'PCAthena_blindfold',0,0,0,0,100,100,255,0],'blink' => [33,'PCAthena_eyeblink',0,0,0,0,100,100,255,0]}
		list = list.merge({'normal1' => [33,'PCAthena_eyenormal',0,0,0,0,100,100,255,0],'normal2' => [33,'PCAthena_eyenormal',0,0,0,0,100,100,255,0]})
		list = list.merge({'right' => [33,'PCAthena_eyenormal',0,0,0,0,100,100,255,0],'left' => [33,'PCAthena_eyeside',0,0,0,0,100,100,255,0]})
		list = list.merge({'tickle' => [33,'PCAthena_eyeclosed',0,0,0,0,100,100,255,0],'happy' => [33,'PCAthena_eyeclosed',0,0,0,0,100,100,255,0]})
		@images['eyes'] = list
		
		#misc
		list = {'blush1' => [31,'PCAthena_blush',0,0,0,0,100,100,255,0],'blush2' => [31,'PCAthena_blush',0,0,0,0,100,100,255,0],'tears' => [35,'Blank',0,0,0,0,100,100,255,0]}
		@images['misc'] = list
		
		testIntro = [{'text'=>"This is line 1","proc"=>nil},{'text'=>"This is line 2","proc"=>nil}]
		
		@dialogue =\
{\
	'speak' =>\
	[\
		[\
			{'text'=>' Suki1:  Too tight?', 'talking'=>false,'proc'=>nil},\
			{'text'=>' Athena:  I\'ve been tied up tighter than this. Although, it\'s not bad...', 'talking'=>true,'proc'=>nil},\
			{'text'=>' Suki1:  Well, good. You\'re tough on your own, but you can\'t do anything with your hands bound.', 'talking'=>false,'proc'=>nil},\
			{'text'=>' Athena:  Let me out of these and I\'ll show you how strong I am!', 'talking'=>true,'proc'=>method(:face_shy)},\
			{'text'=>' Suki1:  I don\'t think so.', 'talking'=>false,'proc'=>nil},\
		],\
		[\
			{'text'=>'  Suki1:  You\'re pretty tough.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Athena:  You haven\'t seen anything yet! Get me outta these, and I\'ll show you!', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  No thanks. You\'re a lot more manageable this way.', 'talking'=>false,'anomaly'=>true,'proc'=>nil},\
			{'text'=>'  Athena:  You...!', 'talking'=>true,'proc'=>nil},\

		],\
		[\
			{'text'=>'  Suki1:  You\'re pretty good with that axe. How did you learn to do that?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Athena:  It\'s a halberd. And I practiced all by myself.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  Oh... all by yourself? You\'re lying. I bet Marcia trained you.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Athena:  You\'re calling me a liar?! How dare you! I\'ll...!', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  You\'ll do what?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Athena:  ...', 'talking'=>false,'proc'=>method(:face_annoyed)},\
			
		],\
		[\
			{'text'=>'  Suki1:  Whew...', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Athena:  You got lucky.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  Maybe, but it was all I needed.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Athena:  Fine, I\'ll admit you have some nice moves. Where did you learn them?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'  Suki1:  From Leroy. If you ask nicely, I\'m sure he\'ll teach you some.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Athena:  Like I need help.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Suki:  You might if this keeps happening...', 'talking'=>true,'proc'=>nil},\
		]\
		
	],\
	'charm' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You really are quite strong.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  That\'s the smartest thing you\'ve ever said.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Are you comfortable?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Don\'t concern yourself with my comfort.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  ...', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>' Suki1: You certainly have a fierce personality.', 'talking'=>false, 'proc'=>nil},\
				{'text'=>' Athena: Too bad that isn\'t always enough...', 'talking'=>true, 'proc'=>method(:face_sad)},\
				{'text'=>' Suki1: No, it isn\'t. Just being strong never works.', 'talking'=>false, 'proc'=>nil},\
				{'text'=>' Athena: ...', 'talking'=>false, 'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Are you having a good time?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  ...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Suki1:  Too scared to speak?', 'talking'=>false,'proc'=>nil,'anomaly'=>true},\
				{'text'=>'  Athena:  Yeah, right.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  I didn\'t think you could be frightened at all.', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Your body looks pretty toned. That must\'ve taken a lot of work.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Yes, and I use it to hurt people who annoy me. There\'s this one girl who\'s annoying me right now.', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Athena:  And she\'s standing right in front of me.', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Suki1:  *gulp*', 'talking'=>false,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I must say, you\'ve got some really strong hands.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Untie me and I\'ll show you how strong they are.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  No, thanks.', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I actually like your eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Oh?', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  Yeah, they\'re really intimidating. I wish I had that...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  If you want to be intimidating, then you\'re talking to the right woman.', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  Really? Think you could help me look tougher?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Yes, just loosen my bonds.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  ...No thanks.', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Are you comfortable?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Does knowing how comfortable I am make you feel better?', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  ...It does.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Then I won\'t answer.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  ...', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Do you like to struggle?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  It\'s either that, or give up. And I\'m not one to give up.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  That\'s true.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  (This is really tight. I can\'t believe it...)', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  You certainly do a lot of moaning into your gag. I was thinking if I should add more.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  ...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Suki1:  I think I will!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  ...Please don\'t.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  (Hmm? That didn\'t have her usual spirit. I wonder if she\'s...)', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  You sure do struggle a lot.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  What do you expect? I won\'t just sit here!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  I really don\'t think you have a choice.', 'talking'=>false,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'  Athena:  Let go of me!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  I don\'t think I will. It\'s better watching you struggle.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  You\'re saying you LIKE watching me struggle?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  W-what? No, I just meant-.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I know what you meant. Don\'t get so defensive.', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  Umm...', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  So, do you prefer to be tied up a certain way?', 'talking'=>false,'anomaly'=>true,'proc'=>nil},\
				{'text'=>'  Athena:  I prefer to BE the one tying.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Well, it didn\'t work out that way.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  (I wonder if she\'ll figure out I like my arms tied above my head...)', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  I guess I can tie you up a different way next time.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  You\'re assuming you COULD tie me up next time.', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  (I think she\'s actually enjoying this.)', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I think... you\'re my favorite prisoner.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  ...Really?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  ...Yeah. Really.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena: *blush*', 'talking'=>false,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  (Wow, I can\'t believe it!)', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  You look so down. What\'s wrong?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Sometimes, I don\'t think I\'m all that strong.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Huh? Why?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I\'ll never get out of these ropes, no matter how much I struggle. And you always beat me.', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  Maybe if you wiggle your hips, it\'ll help. (Wait, why am I giving her escape advice...)', 'talking'=>false,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I was thinking of letting you go soon.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  You aren\'t lying, are you?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Why would I lie?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Sometimes, it\'s hard to tell what you\'re thinking.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  You\'re right, I was lying. I\'m gonna tie you up even tighter.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Please don\'t.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Hehehe...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  W-what?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  I was just thinking that you have a really soft side.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  N-no I don\'t!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  See? You aren\'t even angry.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  ...You\'re right.', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I don\'t think you gave it all in that fight.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  ...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Suki1:  I\'m right, aren\'t I? You either held back, or I\'m much stronger than you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  ...Whatever.', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  It isn\'t a bad thing.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  What is? ', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Wanting to be captured by someone you trust.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I don\'t!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  You can act tough if you want to, but I saw it in your eyes. Face it, you like this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I\'ll face no such thing!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  (She definitely has taken a liking to this.)', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Athena:  ...', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Is there something on my face?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I like your hair. Show me how to do that sometime.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  S-sure! (I can\'t believe it...!)', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  You seem down, Athena.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  As if. I\'m thinking.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  About?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  About how I\'m going to get the better of you next time.', 'talking'=>true,'proc'=>nil},\
        {'text'=>'  Suki1:  Good luck.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Hopefully, I won\'t need it.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Athena:  If you\'re this strong, why do I need to fight, then?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Well, it\'s always nice to have a little extra help...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  At this point, I think your enemies need the help.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Athena:  *sigh*', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Angry that I beat you again?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Not at all. Be quiet!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  You probably shouldn\'t place such a high value on strength.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Suki1:  Find something else to take pride in and you\'ll feel better.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  ...', 'talking'=>false,'proc'=>method(:face_neutral)}\
			],\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  ...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  W-What is it?.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Sometimes, I just feel like watching you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Watching me... fight?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Not exactly...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena: ...', 'talking'=>false,'proc'=>method(:face_shy)}\
			]\
		}\
	],\
	'insult' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Athena:  Quit staring at me!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  I was just wondering how could someone be so... weak.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Take that back!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Why should I? You don\'t look seem all that strong in person.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Why you...', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Not so tough, are you?.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Untie me and you\'ll see just how tough I am!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  If you\'re so tough, then get yourself free.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Just you wait! I\'ll wiggle outta this in no time!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Maybe I should be the one giving fight lessons.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Y-You...! How dare you!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  It was only a suggestion. But I\'m starting to think it\'s a good one.', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Is that all you have?.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Let go of me!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  I thought you\'d be a lot tougher than this...', 'talking'=>false,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  At first, I was afraid of you. But now, I see that was premature.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Grr...', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Got to say, I\'m relieved I can take you easily.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  T-That won\'t last!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Maybe it will, maybe it won\'t...', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  So do you like being tied up or something?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Suki1:  Because you lost pretty badly.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Shut up!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Oh, I think I hit a nerve.', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You\'re supposed to be a solider, right?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Yeah, so?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  I\'ve fought farmers who were tougher.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  You\'re lying!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  I am not. But you do look better than them, so that\'s something.', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  It looks like you are a bit sloppy with that axe.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  It\'s a HALBERD.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Well, you aren\'t using it right.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Says you! Like you had any practice with it.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  I haven\'t, you\'re right. But I still won.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Grr...', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You can stop smiling now. Someone who let themselves get captured has nothing to smile about.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I\'ll smile if I want to.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  You really are a weakling aren\'t you? Letting yourself get tied up by someone like me.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I guess... maybe I just wasn\'t ready.', 'talking'=>true,'proc'=>method(:face_sad)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I think I like you better gagged. At least I won\'t have to listen to your mouth.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Fine... I\'ll talk less.', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'anger' =>\
			[\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Just admit it, you were never meant to be a fighter. Being a helpless damsel suits you so much better.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  ...', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Athena:  Maybe you\'re right.', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  (Is she blushing?)', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I think I might just sell you off. I could use the space for a less worthless prisoner.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Go ahead. It doesn\'t matter to me who I escape from.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You can stop smiling now. Someone who gets tied up by someone like me has nothing to smile about.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I can smile if I want to!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Can you, though?', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  How does it feel knowing the reason you\'re tied up is because you weren\'t strong enough?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  It wasn\'t all my fault... was it?', 'talking'=>true,'proc'=>method(:face_sad)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I think I like you better gagged. I just can\'t stand listening to someone snivel and whine.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  G-Get that gag away from me!', 'talking'=>true,'proc'=>method(:face_angry)},\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Are you even a real blonde?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  How DARE you! Just wait ‘till I get outta these ropes!', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  (Wow, that really set her off)', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Just admit it, you were never meant to be a good fighter.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  T-That\'s not true!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I can\'t believe a weakling like you thought she could take on Marcia\'s whole army.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Suki1:  You should be glad I came and freed you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I had to fight back! I couldn\'t stand serving Marcia any longer!', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'sadness' =>\
			[\

			],\
			'fear' =>\
			[\

			],\
			'anger' =>\
			[\
			],\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You sound smarter with a gag in your mouth.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I can\'t wait to hear what you sound like with a gag in your mouth.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			]\
		}\
	],\
	'threaten' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  If you think you were gagged tightly before, just wait ‘till I get done with you;', 'talking'=>false,'anomaly'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  I\'ll fix it so you\'re so quiet you won\'t even be able to hear yourself think.', 'talking'=>false,'anomaly'=>true,'proc'=>nil},\
				{'text'=>'  Athena:  Don\'t you dare!', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You think this is worst I can do? Believe me, you haven\'t seen anything yet.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  You\'re bluffing. You aren\'t that kind of person.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  I can be. Do you wish to find out? ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  ...I\'m fine.', 'talking'=>true,'proc'=>method(:face_afraid)},\
				{'text'=>'  Suki1:  I thought so.', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I could just leave you down here forever. What do you think about that?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  If you do, I\'ll eventually escape. I always do.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  You mean like how you\'ve escaped from Marcia\'s dungeon?.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  ...', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  What\'s the matter, Athena? You look so scared.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Get away from me!', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Oh, I like that fire in your eyes. It\'s gonna be fun watching it slowly fade.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  You think you can break me.', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  I know I can break you.', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You\'d better abandon all hope of escape. It\'ll be easier for you in the long run.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  There\'s no way I\'m giving up!', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  Well then, I\'ll just have to tighten your bonds.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena: Nngh!', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Hmmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  What\'s the matter?', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1;  You look too content. A prisoner like yourself should be more distressed. Maybe if I took all your clothes...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Don\'t even think about it!', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  You know I can do whatever I want to you, right? I mean you\'re my personal prisoner, after all.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Whatever...', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Suki1:  Good, don\'t forget I could bind and gag you so tight even I might forget you\'re down here.', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  You know I can do whatever I want to you, right?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  If you say so.', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  Don\'t forget, I could bind and gag you so tight even I\'ll forget you\'re down here.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Keep making threats! See what happens!', 'talking'=>true,'proc'=>method(:face_sad)}\
			],\
			'shyness' =>\
			[\

			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You think you\'re so tough, but there are ways to subdue you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  ...Are there?', 'talking'=>true,'proc'=>method(:face_afraid)},\
				{'text'=>'  Suki1:  Plenty. I have already thought of a few.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  N-No, you haven\'t!', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  If you don\'t stop struggling, I\'ll have to tie you to a pole.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Go ahead. Whatever you can dish out, I can take.', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  I think you\'re gonna regret saying that...', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: First you were Marcia\'s prisoner, and now you\'re mine. I wonder how many times you\'ve been defeated...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  That\'s none of your business!', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  Sounds like a lot.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  N-no!', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Maybe I should gag you and take you for a little walk around the guild.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Suki1:  Some of our members have been just dying to see you tied up.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  There\'s no way even you would sink that low.', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I wonder how I should tie you up next...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  W-what do you mean?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  I mean there are a lot of ways I haven\'t tried, yet. Do you have a preference?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  S-stop talking nonsense!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
	
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You think you\'re so tough, but there are ways to subdue you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  ...I guess.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  (Wow, this is having a huge effect on her.)', 'talking'=>false,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  If you want to escape so bad, maybe I should let you go.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Really?! Well then, untie me!', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  Oh no, if you leave here, you do so bound and gagged.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  But I wouldn\'t be able to fight like this!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Hehe, I know.', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\

			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I think I might tie you to the ceiling.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  What\'s the point in that?!', 'talking'=>true,'proc'=>method(:face_afraid)},\
				{'text'=>'  Suki1: I think you need to stay off your feet... but on the other hand, you\'ll be hanging there for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Please don\'t. This is hard enough as it is.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
			{'text'=>'  Suki1:  I think I might tie you to the ceiling.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Don\'t!', 'talking'=>true,'proc'=>method(:face_afraid)},\
				{'text'=>'  Suki1: I\'ve made up my mind. I\'m going to do it!', 'talking'=>false,'proc'=>nil, 'anomaly'=>true},\
				{'text'=>'  Athena:  You little...!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				
			]\
		}\
	],\
	'slap' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Time for a little punishment.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  That didn\'t hurt!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Time for a little punishment..', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Hmph.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Time for a little punishment.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Compared to Marcia\'s whips, this is nothing!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Time for a little punishment.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Keep that up and I\'ll break your hand!', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Time for a little punishment.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I\'ll get you back for this...', 'talking'=>true,'proc'=>method(:face_neutral)}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Think you can take this?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Try harder next time!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Think you can take this?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Ouch!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Think you can take this?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I-I\'ve felt worse!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Think you can take this?.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I-I\'ve felt worse!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Think you can take this?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  You enjoy this, don\'t you?', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Think you can take this?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I can take it!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Time for a little \'friendly\' punishment.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  (Why are those starting to hurt...?)', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Time for a little \'friendly\' punishment.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Again...', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Time for a little \'friendly\' punishment.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  You\'re really starting to get to me...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Time for a little \'friendly\' punishment.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I-I\'ve felt worse!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Time for a little \'friendly\' punishment.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Stop it!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Time for a little \'friendly\' punishment.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Not bad, but I\'ll show you a real slap when I get outta here.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I\'ll see how strong of a soldier you are...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Oww!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I\'ll see how strong of a soldier you are...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Oh! Do that again!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I\'ll see how strong of a soldier you are...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena: I\'m not THAT strong...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I\'ll see how strong of a soldier you are...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Ouch! Is-is that all?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I\'ll see how strong of a soldier you are...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Ouch! Is-is that all?', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\

			]\
		}\
	],\
	'tickle' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Why don\'t I try...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Try wha- HAHAHA HEHE! Stop! This is stupid!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Why don\'t I try...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Try wha- HAHAHA HEHE! Stop! This is stupid!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Athena: You\'re making me laugh!', 'talking'=>true, 'proc'=>nil}
			],\
			'sadness' =>\
			[\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:   Why don\'t I try...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Try wha- HAHAHA! Stop! This is insan- HAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:   Why don\'t I try...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Some of wha- HAHAHA! Stop it!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Athena:  HAHAHAHA!  Stop it or I\'ll - HAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Why don\'t I try...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Some of wha- HAHAHA! Stop it!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Athena:  HAHAHAHA!  Stop it or I\'ll - HAHAHA!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Prepare yourself!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I\'m ready for whatever yo-', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Athena:  HAHAHAHAHEHE! Stop it!', 'talking'=>true,'proc'=>nil}\
				
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Prepare yourself!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I\'m ready for whatever yo-', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Athena:  HAHAHAHAHEHE!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Athena:  P-Please Stop! I can\'t -', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Athena:  HAHAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Prepare yourself!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I\'m ready for whatever yo-', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Athena:  HAHAHAHAHEHE!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Athena:  P-Please Stop!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Prepare yourself!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I\'m ready for whatever yo-', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Athena:  HAHAHAHAHEHE!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Athena:  P-Please Stop!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Prepare yourself!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I\'m ready for whatever yo-', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Athena:  HAHAHAHAHEHE!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Athena:  S-Stop doing that!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Prepare yourself!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I\'m ready for whatever yo-', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Athena:  HAHAAHAHEHE!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Athena:  You better stop before I-', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Athena:  HAHAHEHEHE!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see just how ticklish you really are.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  W-What?!  Tickling!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Yes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  HAHAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see how ticklish you really are.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  What a waste of time. I can take any-', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Athena:  HAHAHAHA! Okay, Okay! I\'m sorry! S-Stop!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see how ticklish you really are.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Tickling?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Yes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  HAHAHA! Would you stop?!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see how ticklish you really are.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Why are you doing this?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Because I want to.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  HAHAHHEHEHHA! Please! Stop!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see how ticklish you really are.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  No please! Don\'t do thi- HAHAHAHA!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Athena:  Stop! HAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see how ticklish you really are.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  If you lay a finger on me, I\'m gonna - HAHAHEHEHE! Okay I give!  HAHA! I said I give!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Tickle time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  HAHEHEHE! P-Please! Enough - HAHAHA! Stop!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Tickle time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  HAHAHAHA', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Athena:  Please!  HEHEHAHAH! No more!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Ready to get tickled?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Mmmm, I do love it wh- HAHAHAHA! Goddammit, Suki1, I wasn\'t done talk- HAHAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: Tickle time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  HAHEHEHE! P-please, just leave me be!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: Tickle time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  HAHEHEHE! When I get outta this, I\'m gonna...! HAHA! HAHAHAHA!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'  Suki1: Tickle time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  HAHEHEHE! When I get outta this, I\'m gonna...! HAHA! HAHAHAHA!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'kiss' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Come here, Athena. I\'m going to kiss you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  W-what! Wait I- Mmph!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Athena:  Mmmmmm.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Have you ever been kissed before?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  That\'s none of your- MMMPH!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Well, now you have.', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Upset? I can fix that.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  What are you- Mmmph!', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Suki1:  There, now you look happy.', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let me get that scowl off your face.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Mmmmm.', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Want a kiss?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  From you?! Why would I- MMPH!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  You have nice tasting lips.', 'talking'=>false,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I\'m going to kiss you now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  No, you\'re not - MMPH!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Liked it?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  ...', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I\'m going to kiss you now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Why? What are planning to- Mmmm', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:   I\'m going to kiss you now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Wait, wha- Mmm.', 'talking'=>true,'proc'=>nil},\

			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I\'m going to kiss you now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  A-Alright - Mmmm!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I\'m going to kiss you now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  D-Don\'t touch my lip - Mmmm!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I\'m going to kiss you now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  F-Fine.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Athena:  Mmmm', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I\'m going to kiss you now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  W-What?!', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Athena:  Mmph! Mmmm...', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  How was it?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Uhhh...', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Time for some fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Mmmmm.', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Athena:  Thanks.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Time for some fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Mmmm.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Athena:  That wasn\'t so bad.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Time for some fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Mmph!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Athena:  Don\'t just kiss me like that!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  I know you like it.', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Time for some fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  F-Fun? What are you - mmmm.', 'talking'=>true,'proc'=>method(:face_afraid)},\
				{'text'=>'  Suki1:  Like it?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Mmmmm...', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'shyness' =>\
			[\
				
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Kiss me.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  O-Okay I guess. Though I don\'t know how- Mmmph!', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Athena:  Mmmmm...', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  (That shut her up.)', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Kiss me.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Hehe, if you insist.', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Athena:  Mmmm…', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Athena:  Hehe, thanks.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Kiss me.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Now you\'re talking!', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Athena:  Mmmm...', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Kiss me.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I don\'t really feel like - MMMPH!', 'talking'=>true,'proc'=>method(:face_annoyed)},\
				{'text'=>'  Suki1:  I wasn\'t asking.', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
			],\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Kiss me.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Make me! Mmmph!', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  (That shut her up.)', 'talking'=>false,'proc'=>nil}\
			]\
		}\
	],\
	'ungag' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Athena:  Mmph! Mmph!!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  I\'ll remove that.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  When I get out of these, I\'ll...', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  IF you get out of these...', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Athena:   Mmph! Mmph!!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:   I\'ll remove that.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  That\'s better...', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Athena:   Mmph! Mmph!!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:   I\'ll remove that.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I can\'t believe I\'m reduced to this...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
			],\
			'anger' =>\
			[\
				{'text'=>'  Athena:   Mmph! Mmph!!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:   I\'ll remove that.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Don\'t put that thing back in my mouth!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Athena:  Mmmph!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Let\'s get that off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  About time...', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Athena:  Mmmph!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Let\'s get that off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  About time...', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				
			],\
			'fear' =>\
			[\
				{'text'=>'  Athena:  Mmmph!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Let\'s get that off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  To think I would need help from you...', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Athena:  Mmmph!', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  Let\'s get that off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I can\'t believe I\'m in this predicament.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'shyness' =>\
			[\
				{'text'=>'  Athena:  Mmmph!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Let\'s get that off you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Finally! Your stupid games are beginning to get on my nerves.', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Athena:  Mmm! Mmmmm!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Okay, I\'ll take it out.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  That was a little embarrassing.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Athena:  Mmm! Mmmmm!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Okay, I\'ll take it out.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I didn\'t mind it as much as I thought...', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
			],\
			'fear' =>\
			[\
				{'text'=>'  Athena:  Mmm! Mmmmm!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Okay, I\'ll take it out.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  That gag was unnecessary!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  I don\'t know... it sure didn\'t seem like it...', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Athena:  Mmm! Mmmmm!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Okay, I\'ll take it out.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  That was actually a little embarrassing.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  I don\'t know... it sure didn\'t seem like it...', 'talking'=>false,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'  Athena:  Mmm! Mmmmm!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  Okay, I\'ll take it out.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  That was actually a little embarrassing.', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I\'ll be nice...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Mmmm- thanks.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I\'ll be nice...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Mmmm- thanks, I\'ve been wanting to speak.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I\'ll be nice...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Mmm, thanks. I didn\'t want to be that way forever.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
			],\
			'anger' =>\
			[\
			],\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I\'ll be nice...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Don\'t put that back in my mouth...', 'talking'=>true,'proc'=>method(:face_shy)}\
			]\
		}\
	],\
	'blindfold_on' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s try this on.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Oh, come on!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s try this on.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  No!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s try this on.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Could this day get any worse...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s try this on.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Oh, come on!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s try this on.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Get this off me right now!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have some fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  H-hey! What are you doing to me?!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have some fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Hey! Get this thing off me!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have some fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Why, you...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have some fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  What now?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have some fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Why, you...', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s have some fun.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Why, you...', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I know what I\'ll do...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  You\'ll do wha- ugh! I can\'t see!', 'talking'=>true,'proc'=>nil},\
				
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I know what I\'ll do...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Hey! I can\'t see!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I know what I\'ll do...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  So annoying...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I know what I\'ll do...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  You little... Just wait \'till I get you!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'	Suki1:  Too bad you won\'t.', 'talking'=> false, 'proc'=>nil}\
			],\
			'shyness' =>\
			[\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You\'re getting blindfolded.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  But then I can\'t see!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You\'re getting blindfolded.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Well... whatever.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I\'m blindfolding you now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I guess I can\'t see what you\'ll do next...', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I\'m blindfolding you now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Wait, no!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I\'m blindfolding you now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  W-what! Stop that now! Ugh.', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I\'m blindfolding you now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  W-what! Stop that now! Ugh.', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'blindfold_off' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take that off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  ...', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take that off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Finally.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take that off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I wouldn\'t do that again if I were you...', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take that off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I\'m still not happy.', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take that off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  About damn time!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Your blindfold is coming off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Finally. That was unnecessary.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Your blindfold is coming off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Geez, took you long enough.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Your blindfold is coming off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I hated not being able to see.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Your blindfold is coming off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  I hated not being able to see.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Your blindfold is coming off.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  That was irritating!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Your blindfold is coming off..', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  About damn time!', 'talking'=>true,'proc'=>method(:face_angry)}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I\'ll give you a break..', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  You call this a break?', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I\'ll give you a break..', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Finally! That\'s off.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I\'ll give you a break..', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Don\'t do that again!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I\'ll give you a break..', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Don\'t do that again!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I\'ll give you a break..', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Don\'t do that again!', 'talking'=>true,'proc'=>nil}\
			],\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I\'ll give you a break..', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Maybe you should wear it next time.', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I want to see your fierce eyes again.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  S-shut up! ', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I want to see your fierce eyes again.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  Fierce eyes? Do you really think so? ', 'talking'=>true,'proc'=>nil},\
				{'text'=>'  Suki1:  I do.', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I want to see your fierce eyes again.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  S-shut up! ', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
			],\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I want to see your fierce eyes again.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Athena:  S-shut up! ', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	]\
};
	end
end
$privateCellDamsels['athena'] = PrivateCellDamselAthena.new
