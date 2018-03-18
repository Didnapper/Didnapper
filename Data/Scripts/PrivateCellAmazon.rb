#need to try inserting text event into stack
#[image number, name, origin,appointment method?(0 for direct),x,y,zoomx,zoomy,opacity,blend_type]

class PrivateCellDamselAmazon < PrivateCellDamsel
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
    @tag = 'amazon'
		super()
		#personality
		@emotions['fear'] = [3,0]
		@emotions['shyness'] = [2,0]
		@emotions['anger'] = [8,0]
		@emotions['happiness'] = [5,0]
		@emotions['sadness'] = [2,0]
    #currently unused
    @homophilia = 3
		@masochism = -1
		
		
		@disposition = 1
		@disposition_index = 662
		@disposition_min = 1
		
		#bases
		list = {'back' => [30,'PCAmazon2Base',0,0,-100,0,100,100,255,0],'outfit1'=> [30,'PCAmazon2BaseHula',0,0,-100,0,100,100,255,0]}
		@images['base'] = list
		
		#brows
		list = {'annoy1' => [32,'PCAmazon2_browannoy1',0,0,-100,0,100,100,255,0],'annoy2'=> [32,'PCAmazon2_browannoy2',0,0,-100,0,100,100,255,0], 'normal' => [32,'PCAmazon2_brownormal',0,0,-100,0,100,100,255,0]}
		list = list.merge({'tickle' => [32,'PCAmazon2_browtickle',0,0,-100,0,100,100,255,0],'worry' => [32,'PCAmazon2_browtickle',0,0,-100,0,100,100,255,0]})
		@images['brow'] = list
		
		#mouths and gags
		list = {'annoy1' => [34,'PCAmazon2MouthOpen',0,0,-100,0,100,100,255,0],'annoy2'=> [34,'PCAmazon2MouthAnnoy',0,0,-100,0,100,100,255,0], 'neutral' => [34,'PCAmazon2MouthAnnoy',0,0,-100,0,100,100,255,0]}
		list = list.merge({'tickle' => [34,'PCAmazon2MouthTickle',0,0,-100,0,100,100,255,0],'smile' => [34,'PCAmazon2MouthSmile',0,0,-100,0,100,100,255,0]})
		list = list.merge({'ball' => [34,'PCAmazon2_gagball',0,0,-100,0,100,100,255,0],'bit' => [34,'PCAmazon2_gagbit',0,0,-100,0,100,100,255,0],'cleave' => [34,'PCAmazon2_gagcleave',0,0,-100,0,100,100,255,0]})
		list = list.merge({'cloth' => [34,'PCAmazon2_gagotm',0,0,-100,0,100,100,255,0],'knot' => [34,'PCAmazon2_gagknot',0,0,-100,0,100,100,255,0],'otn' => [34,'PCAmazon2_gagotn',0,0,-100,0,100,100,255,0]})
    list = list.merge({'sgag1' => [34,'PCAmazon2_gagbone',0,0,-100,0,100,100,255,0]})
		@images['mouth'] = list
		
		#eyes and blindfold
		list = {'blindfold' => [36,'PCAmazon2Blindfold',0,0,-100,0,100,100,255,0],'blink' => [33,'PCAmazon2_eyeblink',0,0,-100,0,100,100,255,0]}
		list = list.merge({'normal1' => [33,'PCAmazon2_eyenormal',0,0,-100,0,100,100,255,0],'normal2' => [33,'PCAmazon2_eyenormal',0,0,-100,0,100,100,255,0]})
		list = list.merge({'right' => [33,'PCAmazon2_eyenormal',0,0,-100,0,100,100,255,0],'left' => [33,'PCAmazon2_eyeleft',0,0,-100,0,100,100,255,0]})
		list = list.merge({'tickle' => [33,'PCAmazon2_eyeblink',0,0,-100,0,100,100,255,0],'happy' => [33,'PCAmazon2_eyeblink',0,0,-100,0,100,100,255,0]})
		@images['eyes'] = list
		
		#misc
		list = {'blush1' => [31,'PCAmazon2_blush1',0,0,-100,0,100,100,255,0],'blush2' => [31,'PCAmazon2_blush2',0,0,-100,0,100,100,255,0],'tears' => [35,'Blank',0,0,-100,0,100,100,255,0]}
		@images['misc'] = list
		
		testIntro = [{'text'=>"This is line 1","proc"=>nil},{'text'=>"This is line 2","proc"=>nil}]
		
		#"speak" dialogue
		@dialogue =\
{\
	'speak' =>\
	[\
		[\
			{'text'=>'  Suki1:  So I didn\'t catch your name earlier. ', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Kamala:  Maybe because you were too busy abducting my people.','talking'=>true,'proc'=>method(:face_default)}\
		],\
		[\
			{'text'=>'  Suki1:  You were the one harassing those poor villagers. You brought this upon yourself.','talking'=>false,'proc'=>nil},\
			{'text'=>'  Kamala:  You naive fool! Do you really think you have the moral high ground here?!', 'talking'=>true,'proc'=>method(:face_angry)}\
		],\
		[\
			{'text'=>'  Kamala:  Those accursed invaders stole our land and built over our holy grounds. Yet we spared them!', 'talking'=>true,'proc'=>method(:face_default)},\
			{'text'=>'  Kamala:  At any time we could have captured them all without a second thought, but our honor would not allow such an easy victory.', 'talking'=>true,'proc'=>method(:face_default)},\
			{'text'=>'  Suki1:  Well, look where your honor has gotten you now - locked up in a kidnapper\'s cell.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Kamala:  I don\'t expect a dishonorable sneak such as yourself to understand such things as pride in battle.','talking'=>true,'proc'=>method(:face_neutral)}\
		],\
		[\
			{'text'=>'  Suki1:  I couldn\'t just leave those villagers to their fate. I had to do something. Capturing you was the best way to secure peace.','talking'=>false,'proc'=>nil},\
			{'text'=>'  Kamala:  Peace?! You call the ruin of my civilization and loss of all my subjects peace?!', 'talking'=>true,'proc'=>method(:face_angry)},\
			{'text'=>'  Suki1:  Yes, I do. Lives were at stake. You could have died!', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Kamala:  Death would have been preferable to this humiliation! ', 'talking'=>true,'proc'=>method(:face_angry)}\
		],\
		[\
			{'text'=>'  Suki1:  I\'m sorry about what happened to your people, I really am. But this would have happened eventually.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Suki1:  The world\'s changing fast. Sooner or later someone will catch wind of your lands and come looking for treasure or land. At least this way you\'re safe with me.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'  Kamala:  You mean I\'m your prisoner.', 'talking'=>true,'proc'=>method(:face_neutral)},\
			{'text'=>'  Suki1:  Yes, safe as my prisoner.', 'talking'=>false,'proc'=>nil}\
		]\
	],\
	'charm' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You\'re one tough girl. No wonder you were Queen.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  I\'m not used to being spoken to so casually… or being tied up and gagged, for that matter.', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You\'re one tough girl. No wonder you were Queen.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  You\'ll see how tough I am when I get out of here.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'happiness' =>\
			[\
				 {'text'=>'', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1: You\'re one tough girl. No wonder you were Queen.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala: Don\'t try your flattery on me, shadow girl.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1: You\'re one tough girl. No wonder you were Queen.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala: Leave me alone. You\'ve captured me; isn\'t that enough?', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1: You\'re one tough girl. No wonder you were Queen.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala: If I weren\'t tied up I\'d show you how tough I can be.', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1  You already tried that - that\'s how you got tied up.', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You must have been a great leader, to rule such a tribe of powerful women.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  I was, though it\'s probably a little hard to tell right now, on account of me being trussed up and carried off by some random kidnapper.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You must have been a great leader, to rule such a tribe of powerful women.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Naturally. Only the best can be Queen.', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  …', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You must have been a great leader, to rule such a tribe of powerful women.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  I\'m glad you noticed.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  You must have been a great leader, to rule such a tribe of powerful women.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  I was, but alas, no more.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  You must have been a great leader, to rule such a tribe of powerful women.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  I was, before you came along…', 'talking'=>true,'proc'=>method(:face_sad)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  You must have been a great leader, to rule such a tribe of powerful women.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Who are you to speak of such things? What would you know of ruling a Kingdom?', 'talking'=>true,'proc'=>method(:face_annoyed)},\
				{'text'=>'  Suki1:  (…)', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You know, you seem well educated for the leader of a savage tribe of warrior women.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  You make me blush. I would give you the traditional Amazon hug, if I weren\'t tied up like this.  ', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You know, you seem well educated for the leader of a savage tribe of warrior women.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  We Amazons are as skilled with words and knowledge as with our weapons.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You know, you seem well educated for the leader of a savage tribe of warrior women.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Thank you. Honestly, you\'re not quite what I\'d expect of a professional kidnapper either.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  You know, you seem well educated for the leader of a savage tribe of warrior women.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  You\'re very kind. Thank you.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  You know, you seem well educated for the leader of a savage tribe of warrior women.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Apparently I wasn\'t smart enough…', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  You know, you seem well educated for the leader of a savage tribe of warrior women.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  What are implying? That just because we don\'t live like you, we must be backward savages?  ', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  It\'s an honour to have a Queen as beautiful as you in our Guild.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Hehe, you tease. You know, being defeated and captured by such a young flower as yourself, it\'s kind of exciting. I feel like a young girl again.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  It\'s an honour to have a Queen as beautiful as you in our Guild.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Such humility before a captured foe! There\'s hope for you yet, child.', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  It\'s an honour to have a Queen as beautiful as you in our Guild.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  It\'s an honour to be the captive of one as noble as yourself.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  It\'s an honour to have a Queen as beautiful as you in our Guild.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  You are very kind, but these ropes that hold me seem to choke all joy in their shameful embrace.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'fear' =>\
			[\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  It\'s an honour to have a Queen as beautiful as you in our Guild.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Do you always gag guests of honour?', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  Only the loudmouthed ones.', 'talking'=>false,'proc'=>nil}\
			]\
		}\
	],\
	'insult' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Not so high and mighty now that you\'re all trussed up, are you?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  D-Don\'t touch me, you ignominious thief!', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Not so high and mighty now that you\'re all trussed up, are you?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Careful, even a caged tiger is dangerous…', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'happiness' =>\
			[\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Not so high and mighty now that you\'re all trussed up, are you?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Just gag me already so I don\'t have to answer your silly questions.', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Not so high and mighty now that you\'re all trussed up, are you?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Silence me, child, so I can end this conversation.', 'talking'=>true,'anomaly'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Not so high and mighty now that you\'re all trussed up, are you?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  G-Get away from me, you treacherous invader!', 'talking'=>true,'proc'=>method(:face_angry)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Some warrior tribe you all turned out to be.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  We simply underestimated you. Next time you will be the one bound and helpless in a cell.', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Some warrior tribe you all turned out to be.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Shut your mouth! How dare you insult my tribe?!', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Some warrior tribe you all turned out to be.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  You caught us by surprise. That\'s all.', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Some warrior tribe you all turned out to be.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  You can burn me, break me, bury me alive, but as long as I\'m alive you\'re as good as dead.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Some warrior tribe you all turned out to be.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  You poke the dragon too much, child, and you will get burnt.', 'talking'=>true,'anomaly'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Some warrior tribe you all turned out to be.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  If we Amazons are so weak, why are you keeping me tied up?', 'talking'=>true,'proc'=>method(:face_annoyed)},\
				{'text'=>'  Suki1:  Because I like you that way.', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  How does it feel being tied up in a guild full of men?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  T-They wouldn\'t! Would they?!', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  How does it feel being tied up in a guild full of men?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  I am your captive. I expect you to protect my honour.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  How does it feel being tied up in a guild full of men?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  I-it\'s kind of exciting.', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  How does it feel being tied up in a guild full of men?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  I know what you\'re implying, and you don\'t scare me.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  How does it feel being tied up in a guild full of men?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  You wouldn\'t dare!', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  How does it feel being tied up in a guild full of men?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  How does it feel working with such men?', 'talking'=>true,'proc'=>method(:face_neutral)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Go on, mighty Amazon, escape those ropes and teach me a lesson.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  I-I\'m trying, but these damn knots are just too tight!', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Go on, mighty Amazon, escape those ropes and teach me a lesson.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Maybe I will.', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  You won\'t.', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Go on, mighty Amazon, escape those ropes and teach me a lesson.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  You\'d like that, wouldn\'t you?', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Go on, mighty Amazon, escape those ropes and teach me a lesson.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Don\'t mock me.', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'fear' =>\
			[\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Go on, mighty Amazon, escape those ropes and teach me a lesson.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  I would… if you hadn\'t tied me so damn tight!', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			]\
		}\
	],\
	'threaten' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Maybe I should sell you to a museum. You\'d be their prize exhibit.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  But… they would put me on display! All tied up with everyone watching me… How embarrassing for a Queen!', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Maybe I should sell you to a museum. You\'d be their prize exhibit.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  You wouldn\'t dare!', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'happiness' =>\
			[\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Maybe I should sell you to a museum. You\'d be their prize exhibit.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  How could you suggest such a thing!', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Maybe I should sell you to a museum. You\'d be their prize exhibit.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  But they would treat me like a wild animal!', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Maybe I should sell you to a museum. You\'d be their prize exhibit.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Are you calling me old?!', 'talking'=>true,'proc'=>method(:face_annoyed)},\
				{'text'=>'  Suki1:  No, I meant… Because you\'re from… You know… Shut up!', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  We\'ve got some nice panel gags here, complete with locks. Want to try one? Hope I don\'t lose the key!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  In my culture we would attach gags to those girls who spoke ill of the gods. But here you apparently just do it for fun.', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  We\'ve got some nice panel gags here, complete with locks. Want to try one? Hope I don\'t lose the key!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  But I\'m being quiet! You don\'t have to gag me, honestly.', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  We\'ve got some nice panel gags here, complete with locks. Want to try one? Hope I don\'t lose the key!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  I wouldn\'t be able to say anything at all then, right? That could be interesting…', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  We\'ve got some nice panel gags here, complete with locks. Want to try one? Hope I don\'t lose the key!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Please don\'t make jokes like that.', 'talking'=>true,'anomaly'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  We\'ve got some nice panel gags here, complete with locks. Want to try one? Hope I don\'t lose the key!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  You\'d better not lose that key, child, or else you\'ll regret it.', 'talking'=>true,'anomaly'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  We\'ve got some nice panel gags here, complete with locks. Want to try one? Hope I don\'t lose the key!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  You don\'t want to know what I\'m going to shove past those pretty little lips of yours when I get out of here!', 'talking'=>true,'proc'=>method(:face_neutral)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I don\'t think you\'re secure enough. How does a strict hogtie sound?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  As Queen I\'ve had plenty of training being tied up. E-even hogties with a crotch rope.', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I don\'t think you\'re secure enough. How does a strict hogtie sound?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  You would treat me like common swine? What sort of warrior are you?!', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I don\'t think you\'re secure enough. How does a strict hogtie sound?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  I can take anything you dish out! Will I be gagged?', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I don\'t think you\'re secure enough. How does a strict hogtie sound?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  More ropes?! Don\'t you ever run out?!', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I don\'t think you\'re secure enough. How does a strict hogtie sound?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  G-go ahead, do your worst! I can take being hogtied for hours… Left helpless… No problem…', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I don\'t think you\'re secure enough. How does a strict hogtie sound?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  I\'m sure you\'ll look great in anything.', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  Cute. Let\'s see if you\'re still so witty after a few hours.', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Maybe I should take you back to that village as you are now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  No! Not like this!', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Maybe I should take you back to that village as you are now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Hmph, I could beat them all with both hands tied behind my back.', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  (What about hogtied?)', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Maybe I should take you back to that village as you are now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Do you think I\'m your pet or something?', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Maybe I should take you back to that village as you are now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  You wouldn\'t!', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'fear' =>\
			[\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Maybe I should take you back to that village as you are now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Just you try it.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			]\
		}\
	],\
	'slap' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Ugh! Weak!', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Ugh! Weak!', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'happiness' =>\
			[\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Ugh! Weak!', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Ugh! Weak!', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Ugh! Weak!', 'talking'=>true,'proc'=>method(:face_neutral)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Ugh! Weak!', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Ugh! Weak!', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Ugh! Weak!', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Ugh! Weak!', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Ugh! Weak!', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Punishment time!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Ugh! Weak!', 'talking'=>true,'proc'=>method(:face_neutral)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Try this one for size, tough girl.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Ha, you hit like a man.', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Try this one for size, tough girl.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Ha, you hit like a man.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Try this one for size, tough girl.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Ha, you hit like a man.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Try this one for size, tough girl.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Ha, you hit like a man.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Try this one for size, tough girl.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Ha, you hit like a man.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Try this one for size, tough girl.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Ha, you hit like a man.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Remember your place, prisoner.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Oww! Hey, can\'t you smack a part of me that\'s a little softer?', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Remember your place, prisoner.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Oww, that actually hurt a little.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Remember your place, prisoner.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Hmmm, I like a girl who plays rough.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Remember your place, prisoner.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Oww!', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'fear' =>\
			[\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Remember your place, prisoner.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Ouch! Hey, that hurt.', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			]\
		}\
	],\
	'tickle' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You\'re a tough girl, but can you handle this?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  I\'m a trained warrior; I can handle every kind of tortu- AHAHAHHAHAHA! Stop Please!', 'talking'=>true,'proc'=>method(:face_tickle)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You\'re a tough girl, but can you handle this?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  I\'m a trained warrior; I can handle every kind of tortu- AHAHAHHAHAHA! Stop Please!', 'talking'=>true,'proc'=>method(:face_tickle)}\
			],\
			'happiness' =>\
			[\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  You\'re a tough girl, but can you handle this?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  I\'m a trained warrior; I can handle every kind of tortu- AHAHAHHAHAHA! Stop Please!', 'talking'=>true,'proc'=>method(:face_tickle)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  You\'re a tough girl, but can you handle this?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  I\'m a trained warrior; I can handle every kind of tortu- AHAHAHHAHAHA! Stop Please!', 'talking'=>true,'proc'=>method(:face_tickle)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  You\'re a tough girl, but can you handle this?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  I\'m a trained warrior; I can handle every kind of tortu- AHAHAHHAHAHA! Stop Please!', 'talking'=>true,'proc'=>method(:face_tickle)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Ummm, you have lovely skin. I just wanna rub my hands all over it.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Wait, what are you do - HAHAHAHA Stop! Get your hands AHAHAH!', 'talking'=>true,'proc'=>method(:face_tickle)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Ummm, you have lovely skin. I just wanna rub my hands all over it.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Wait, what are you do - HAHAHAHA! Stop! Get your hands AHAHAH!', 'talking'=>true,'proc'=>method(:face_tickle)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Ummm, you have lovely skin. I just wanna rub my hands all over it.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Wait, what are you do - HAHAHAHA! Stop! Get your hands AHAHAH!', 'talking'=>true,'proc'=>method(:face_tickle)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Ummm, you have lovely skin. I just wanna rub my hands all over it.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Wait, what are you do - HAHAHAHA! Stop! Get your hands AHAHAH!', 'talking'=>true,'proc'=>method(:face_tickle)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Ummm, you have lovely skin. I just wanna rub my hands all over it.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Wait, what are you do - HAHAHAHA! Stop! Get your hands AHAHAH!', 'talking'=>true,'proc'=>method(:face_tickle)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Ummm, you have lovely skin. I just wanna rub my hands all over it.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Wait, what are you do - HAHAHAHA! Stop! Get your hands AHAHAH!', 'talking'=>true,'proc'=>method(:face_tickle)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Ummm, you have lovely skin. I just wanna rub my hands all over it.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Wait, you better not do what I think you\'re - HAHAHAHA! Stop! Get your hands off - AHAHAH!', 'talking'=>true,'proc'=>method(:face_tickle)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Ummm, you have lovely skin. I just wanna rub my hands all over it.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Wait, you better not do what I think you\'re - HAHAHAHA! Stop! Get your hands off - AHAHAH!', 'talking'=>true,'proc'=>method(:face_tickle)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Ummm, you have lovely skin. I just wanna rub my hands all over it.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Wait, you better not do what I think you\'re - HAHAHAHA! Stop! Get your hands off - AHAHAH!', 'talking'=>true,'proc'=>method(:face_tickle)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Ummm, you have lovely skin. I just wanna rub my hands all over it.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Wait, you better not do what I think you\'re - HAHAHAHA! Stop! Get your hands off - AHAHAH!', 'talking'=>true,'proc'=>method(:face_tickle)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Ummm, you have lovely skin. I just wanna rub my hands all over it.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Wait, you better not do what I think you\'re - HAHAHAHA! Stop! Get your hands off - AHAHAH!', 'talking'=>true,'proc'=>method(:face_tickle)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Ummm, you have lovely skin. I just wanna rub my hands all over it.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Wait, you better not do what I think you\'re - HAHAHAHA! Stop! Get your hands off - AHAHAH!', 'talking'=>true,'proc'=>method(:face_tickle)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Ummm, you have lovely skin. I just wanna rub my hands all over it.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Well, I mean I\'m all tied up. If you really wanted to, you could do whatever you want to - AHAHAHAH! Wait! I take it back! Stop!  AHAHAHA!', 'talking'=>true,'proc'=>method(:face_tickle)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Ummm, you have lovely skin. I just wanna rub my hands all over it.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Well, I am a queen. It\'s only natural I\'d have - AHAHAHA! Wait! Stop!', 'talking'=>true,'proc'=>method(:face_tickle)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Ummm, you have lovely skin. I just wanna rub my hands all over it.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Thank you. You\'re welcome to touch if you promise to - AHAHAHA! Hey! Listen to me when I\'m - AHAHAHA', 'talking'=>true,'proc'=>method(:face_tickle)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Ummm, you have lovely skin. I just wanna rub my hands all over it.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Wait, a minute, you\'re not gonna do what I - AHAHAHAHA! Wait! Stop!', 'talking'=>true,'proc'=>method(:face_tickle)}\
			],\
			'fear' =>\
			[\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Ummm, you have lovely skin. I just wanna rub my hands all over it.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  You\'re lucky I\'m bound, otherwise such disrespectful talk would earn you a - AHAHAHAH! Get yoUr filthy hands - AHAHAHA!', 'talking'=>true,'proc'=>method(:face_tickle)}\
			]\
		}\
	],\
	'kiss' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Your skin looks so exotic. I want a taste…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Mmmmm!? I-I won\'t be swayed by your flattery!', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  (Did she smile!?)', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Your skin looks so exotic. I want a taste…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Mmmmm!? Keep your hands off me!', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Your skin looks so exotic. I want a taste…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Mmmmm!? How dare you, coward! I bet this is the only way you can get people to kiss you!', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Kamala:  (That actually wasn\'t so bad).', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Your skin looks so exotic. I want a taste…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Mmmmm!? If that was your idea of cheering me up, save it.', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Your skin looks so exotic. I want a taste…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Mmmmm!? Just leave me alone.', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Your skin looks so exotic. I want a taste…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Mmmmm!? Try that again and I\'ll bite your tongue off!', 'talking'=>true,'proc'=>method(:face_angry)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  In my culture, it\'s traditional for cute prisoners to give their captors a kiss.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  How dare you even suggest such a thing?! As if I would ever want you to kiss me!', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Suki1:  (She\'s blushing like a schoolgirl).', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  In my culture, it\'s traditional for cute prisoners to give their captors a kiss.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  I refuse! A queen such as myself should not have to stoop to such -MMMPH!', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  In my culture, it\'s traditional for cute prisoners to give their captors a kiss.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Hmmm, maybe I\'ll like it here after all.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  In my culture, it\'s traditional for cute prisoners to give their captors a kiss.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Don\'t play games with the heart of an Amazon. We are not so easily - Mmmph! Hey! Don\'t just kiss me like that!', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  In my culture, it\'s traditional for cute prisoners to give their captors a kiss.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Just kiss me then and get it over with.', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  In my culture, it\'s traditional for cute prisoners to give their captors a kiss.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Well, it\'s a good thing I\'m not part of your culture, then.', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  You\'re not getting off that easily!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Mmmmm!', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I\'m gonna kiss you now. Try and stop me.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  W-wait! Hold on! You can\'t just tie me up and kiss me!', 'talking'=>true,'proc'=>method(:face_afraid)},\
				{'text'=>'  Suki1:  Actually I can.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Mmmmm…', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I\'m gonna kiss you now. Try and stop me.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Wait, what?', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Kamala:  Mmmmph!Mmmmmm…', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I\'m gonna kiss you now. Try and stop me.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Well I\'m all tied up. I guess I\'ll just have to sit here and take it… Mmmmm…', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I\'m gonna kiss you now. Try and stop me.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Wait, hold on a minute. I\'m not rea-', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'  Kamala:  Mmmmph! Mmmmmm…', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I\'m gonna kiss you now. Try and stop me.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  How can I stop you! You keep me tied up 24 hours a day!', 'talking'=>true,'proc'=>method(:face_annoyed)},\
				{'text'=>'  Suki1:  Exactly!', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I\'m gonna kiss you now. Try and stop me.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Maybe if you hadn\'t (grunt) tied me so damn tight (grunt) then I\'d have a chance!', 'talking'=>true,'proc'=>method(:face_angry)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Kiss me or I gag you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  I\'m a Queen, you know! You can\'t present ultimatums to me!', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Suki1:  Well then if you\'d rather not play', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Wait! Alright… kiss me already!', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Kiss me or I gag you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  So it\'s either your lips or a rotten gag in my mouth, eh?', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Kamala:  Alright then, kiss me.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Kiss me or I gag you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  You mean we can\'t do both…?', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Kiss me or I gag you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Gag me then.', 'talking'=>true,'proc'=>method(:face_annoyed)},\
				{'text'=>'  Suki1:  Maybe later.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  MMMMPH!', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Kamala:  Mmhy mmhven mmsk mmh mmhn!', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'fear' =>\
			[\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Kiss me or I gag you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  How about you gag yourself, then kiss me.', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  Cute. I\'m gonna kiss you twice as long for that.', 'talking'=>false,'proc'=>nil}\
			]\
		}\
	],\
	'ungag' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I think you deserve a little break.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Ugh, that was foul. I must admit, I\'m not used to being silenced and told when to speak…', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Kamala:  It certainly is an… interesting experience.', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I think you deserve a little break.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Ugh, that tasted awful! Don\'t you have any gags better suited for royalty?', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  Sorry. In here you\'re just another prisoner.', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I think you deserve a little break.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Mmmph', 'talking'=>true,'proc'=>method(:face_sad)},\
				{'text'=>'  Kamala:  Ugh, thanks; but what does it matter now. I failed my people. A failed Queen deserves to have her mouth stuffed and silenced…', 'talking'=>true,'proc'=>method(:face_sad)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I think you deserve a little break.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Wait, what do mean a little break? You\'re not going to gag me again, are you?', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I think you deserve a little break.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  A little break? Do you have any idea what it\'s like being gagged like that?!', 'talking'=>true,'proc'=>method(:face_annoyed)},\
				{'text'=>'  Suki1:  You\'d be surprised…', 'talking'=>false,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I\'m gonna let you talk now, but you have to promise to be good. Okay?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Mmmph! Uhhh, alright…', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I\'m gonna let you talk now, but you have to promise to be good. Okay?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Mmmph! Uhhh, finally. A Queen should not be humiliated like this - I demand redress!', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  Or I can just shove this gag back into your mouth.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  (Angry mumble)', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I\'m gonna let you talk now, but you have to promise to be good. Okay?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Mmph! Uhhh, Fine.', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I\'m gonna let you talk now, but you have to promise to be good. Okay?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Uumph! Uhhh, as if I have a choice.', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I\'m gonna let you talk now, but you have to promise to be good. Okay?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Mrrh Uhhh, yes, just please don\'t hurt me.', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I\'m gonna let you talk now, but you have to promise to be good. Okay?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Mmmph! Uhhh, alright… For now.', 'talking'=>true,'proc'=>method(:face_default)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those lovely lips.', 'talking'=>false,'proc'=>method(:face_happy)},\
				{'text'=>'  Kamala:  Mmmph! W-Wait, hold on a minute! I\'m a Queen, remember? You won\'t do anything too debaucherous now, will you?', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those lovely lips.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Uhhh, at last! Wait, what do you want my lips for?', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  Hehe, you\'ll see…', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those lovely lips.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Hmmm, you can do more than look if you want. It\'s not like I can stop you.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those lovely lips.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Mmmph! Ugh, that\'s all I am now is it? Eye candy for a perverted captor…', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those lovely lips.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Why? What are going to do? Haven\'t you shoved enough things over my lips for one day?!', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see those lovely lips.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Ohh, getting quite full of yourself, aren\'t you? Are you sure you can handle a big girl like me?', 'talking'=>true,'proc'=>method(:face_happy)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I think I want to take this off for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Ahh, do you desire my mouth free for something…?', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I think I want to take this off for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala: Ahh, You know in my tribe when beginning a relationship the two would fight and the winner took charge while the loser had to obey. None until you could best me.', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I think I want to take this off for a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Mmh? Ahh, shall we discuss more about Amazonian relationship rules? I bet you\'ll like how we treat the submissives', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I think I want to take this off a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Fine, but put it back when you\'re done. I don\'t deserve the privilege of speech.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'fear' =>\
			[\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I think I want to take this off a while.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Mmmph! Ugh, imagine me, the Queen, allowed to speak only at the whim of my captor! Well, at least you\'re  a cute warrior, so that\'s something.', 'talking'=>true,'proc'=>method(:face_happy)}\
			]\
		}\
	],\
	'blindfold_on' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Nighty night!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  This is unfair! What are you planning that I\'m not allowed to see?', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Nighty night!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Coward! Show yourself!', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'happiness' =>\
			[\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Nighty night!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Hey! Get this off me!', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Nighty night!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  What scheme are you concocting now…?', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Nighty night!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  You trickster! Get this coward\'s toy off my face!', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s try this on. I\'ll think you\'ll look even cuter.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  You mean you think I\'m already cute?', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s try this on. I\'ll think you\'ll look even cuter.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  This is a blindfold!', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  Exactly. Helplessness equals cuteness. Didn\'t they teach you that in your country?', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s try this on. I\'ll think you\'ll look even cuter.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Well, now I can\'t see. How do I look?', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s try this on. I\'ll think you\'ll look even cuter.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  I don\'t feel any cuter.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s try this on. I\'ll think you\'ll look even cuter.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Hey, get this thing off me. I don\'t like not being able to see!', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s try this on. I\'ll think you\'ll look even cuter.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Hey! I swear if I weren\'t tied up I would make you pay for these humiliations!', 'talking'=>true,'proc'=>method(:face_angry)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  I think you\'ve seen too much.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  What do mean? What are you going to do with me now?!', 'talking'=>true,'proc'=>method(:face_default)},\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  I think you\'ve seen too much.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Hmmm- I guess you\'ll just have to keep me locked up then.', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  I think you\'ve seen too much.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  W-what does that mean? Hey!', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  I think you\'ve seen too much.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  What\'s that in your hand? Hey, don\'t you dare put that on me!', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  I think you\'ve seen too much.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Oh really?  All I\'ve seen is a little girl playing at being a warrior', 'talking'=>true,'proc'=>method(:face_default)},\
				{'text'=>'  Suki1:  Well, now you\'re not gonna see anything.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Hey!', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  I think you\'ve seen too much.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  …', 'talking'=>true,'proc'=>method(:face_default)},\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  You were a queen, but now you belong to me. So let\'s put this on.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Ooohh, you tease. Trying to make me guess what you have planned next.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  You were a queen, but now you belong to me. So let\'s put this on.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  We shall see how much longer this lasts.', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  Wait, was that a joke?', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  You were a queen, but now you belong to me. So let\'s put this on.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  I find myself growing more excited at the uncertainty of your next act.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  You were a queen, but now you belong to me. So let\'s put this on.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Well, this isn\'t so bad. But I do prefer being able to look at you…', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'fear' =>\
			[\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  You were a queen, but now you belong to me. So let\'s put this on.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Hah… a blindfold? That\'s amateur at best - I\'ll escape from here and show you what true helplessness is!', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Kamala:  …Hello? Are you still there?', 'talking'=>true,'proc'=>method(:face_afraid)}\
			]\
		}\
	],\
	'blindfold_off' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let there be light!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  How dare you play with me like I was some doll to be toyed with!', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  You are my doll - my little bondage doll.', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let there be light!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Don\'t get cute with me.', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'happiness' =>\
			[\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let there be light!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  So now after a long darkness you force me to stare into my captor\'s eyes. Have I not suffered enough?', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let there be light!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Why do you toy with me so?!', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let there be light!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Finally decided to face me like a woman, have you?', 'talking'=>true,'proc'=>method(:face_neutral)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see your pretty little face unobstructed.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Why do you want to see my face? Answer me! Don\'t just stare at me, you lecherous creep!', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see your pretty little face unobstructed.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Hmmm - I\'m a Queen, remember? False flattery rolls off me like water off a leaf!', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see your pretty little face unobstructed.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Well then, how do I look?', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  Like a captive Queen should. Beautiful and noble in her helplessness.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Hehe, you certainly can pick the right words.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see your pretty little face unobstructed.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  So that\'s what I am reduced to… just a statue to be stared at from afar by drooling perverts.', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  I\'m not drooling (At least I don\'t think I was.)', 'talking'=>false,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see your pretty little face unobstructed.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  What do you plan to do with me now?', 'talking'=>true,'proc'=>method(:face_neutral)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s see your pretty little face unobstructed.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Pretty little - Why you! I think somebody needs to teach you how to talk to your betters.', 'talking'=>true,'proc'=>method(:face_annoyed)},\
				{'text'=>'  Suki1:  I\'m sorry, all I heard there was: \'Please gag me, I\'m such a naughty Queen.\'', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  (Grumble).', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  When I take this off, maybe you\'ll see how good it can be here.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  That\'s not funny.', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  Then why are you smiling?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  I\'m not smiling!', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  When I take this off, maybe you\'ll see how good it can be here.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Did you just make a joke.', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'  Suki1:  Apparently not…', 'talking'=>false,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  When I take this off, maybe you\'ll see how good it can be here.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Oh, I get it, Hehehaha!', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'  Suki1:  (Wow she actually laughed! And it was so cute!)', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  When I take this off, maybe you\'ll see how good it can be here.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Please don\'t make jokes about my suffering.', 'talking'=>true,'proc'=>method(:face_annoyed)},\
				{'text'=>'  Suki1:  Sorry, I couldn\'t help myself.', 'talking'=>false,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  When I take this off, maybe you\'ll see how good it can be here.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  I doubt it.', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'  Suki1:  …', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  When I take this off, maybe you\'ll see how good it can be here.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  And when I get out of here, you\'ll be in quite the bind.', 'talking'=>true,'proc'=>method(:face_neutral)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take another look at those beautiful eyes, cutie.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  (blushing) That\'s my line! Stop it, you charmer!', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take another look at those beautiful eyes, cutie.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  You think my eyes look pretty?', 'talking'=>true,'proc'=>method(:face_default)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take another look at those beautiful eyes, cutie.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Aww, you know just what to say.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take another look at those beautiful eyes, cutie.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala  : Please stop making fun of me.', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'fear' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take another look at those beautiful eyes, cutie.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Why are you staring at me like that? S-stop it!', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'anger' =>\
			[\
				{'text'=>'  Suki1:  Let\'s take another look at those beautiful eyes, cutie.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'  Kamala:  Unhand me! I actually like having it on so I don\'t have to look at you!', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			]\
		}\
	]\
};
	end
end
$privateCellDamsels['amazon'] = PrivateCellDamselAmazon.new