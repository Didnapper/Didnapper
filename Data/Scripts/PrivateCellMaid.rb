#need to try inserting text event into stack
#[image number, name, origin,appointment method?(0 for direct),x,y,zoomx,zoomy,opacity,blend_type]

class PrivateCellDamselMaid < PrivateCellDamsel
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
  def generateMouth (mood,tickle)
    commandArray = []
    if @@saved[@tag]['gag'] == 'ungagged'
      if @face_override['mouth'] && !mouth_open?
        commandArray.push(@images['mouth'][@face_override['mouth']])
      elsif @face_override['mouth_open'] && mouth_open?
        commandArray.push(@images['mouth'][@face_override['mouth_open']])
			elsif mouth_open? && tickle >= 3
				commandArray.push(@images['mouth']['tickle'])
			elsif mouth_open? then
				commandArray.push(@images['mouth']['annoy1'])
			elsif tickle >= 2 || mood[0] == 'neutral'
				commandArray.push(@images['mouth']['smile'])
			elsif mood[0]=='fear'
				commandArray.push(@images['mouth']['annoy2'])
			else
				commandArray.push(@images['mouth']['neutral'])
			end
		else
      if @@saved[@tag]['gag'] == 'sgag3' && @@saved[@tag]['outfit']=='outfit1'
        commandArray.push(@images['mouth']['sgag3_cat'])
      else
        commandArray.push(@images['mouth'][@@saved[@tag]['gag']])
      end
		end
    return commandArray
  end
	def initialize
    @tag = 'maid'
		super()
		#personality
		@emotions['fear'] = [3,0]
		@emotions['shyness'] = [5,0]
		@emotions['anger'] = [4,0]
		@emotions['happiness'] = [7,0]
		@emotions['sadness'] = [2,0]
    #currently unused
    @homophilia = 1
		@masochism = -1
		
		
		@disposition = 2
		@disposition_index = 656
		@disposition_min = 1
		
		#bases
		list = {'outfitdefault' => [30,'PCMaidBase',0,0,0,0,100,100,255,0],'outfit1'=> [30,'PCMaidBaseCat',0,0,0,0,100,100,255,0]}
		@images['base'] = list
		
		#brows
		list = {'annoy1' => [32,'PCMaid_browannoyed',0,0,-0,0,100,100,255,0],'annoy2'=> [32,'PCMaid_browangry',0,0,-0,0,100,100,255,0], 'normal' => [32,'PCMaid_brownormal',0,0,-0,0,100,100,255,0]}
		list = list.merge({'tickle' => [32,'PCMaid_browtickle',0,0,-0,0,100,100,255,0],'worry' => [32,'PCMaid_browtickle',0,0,-0,0,100,100,255,0]})
		@images['brow'] = list
		
		#mouths and gags
		list = {'annoy1' => [34,'PCMaidMouthAnnoy2',0,0,-0,0,100,100,255,0],'annoy2'=> [34,'PCMaidMouthAnnoy2',0,0,-0,0,100,100,255,0], 'neutral' => [34,'PCMaidMouthAnnoy1',0,0,-0,0,100,100,255,0]}
		list = list.merge({'tickle' => [34,'PCMaidMouthTickle',0,0,-0,0,100,100,255,0],'smile' => [34,'PCMaidMouthSmile',0,0,-0,0,100,100,255,0]})
		list = list.merge({'ball' => [34,'PCMaid_gagball',0,0,-0,0,100,100,255,0],'bit' => [34,'PCMaid_gagbit',0,0,-0,0,100,100,255,0],'cleave' => [34,'PCMaid_gagcleave',0,0,-0,0,100,100,255,0]})
		list = list.merge({'cloth' => [34,'PCMaid_gagotm',0,0,-0,0,100,100,255,0],'knot' => [34,'PCMaid_gagknot',0,0,-0,0,100,100,255,0],'otn' => [34,'PCMaid_gagotn',0,0,-0,0,100,100,255,0]})
    list = list.merge({'sgag1' => [34,'PCMaid_gagtape',0,0,-0,0,100,100,255,0],'sgag2' => [34,'PCMaid_gagrope',0,0,-0,0,100,100,255,0],'sgag3' => [34,'PCMaid_gaglatex',0,0,-0,0,100,100,255,0]})
		list = list.merge({'sgag3_cat' => [34,'PCMaid_gaglatexcat',0,0,-0,0,100,100,255,0]})
    @images['mouth'] = list
		
		#eyes and blindfold
		list = {'blindfold' => [36,'PCMaid_blind',0,0,-0,0,100,100,255,0],'blink' => [33,'PCMaid_eyeblink',0,0,-0,0,100,100,255,0]}
		list = list.merge({'normal1' => [33,'PCMaid_eyenormal',0,0,-0,0,100,100,255,0],'normal2' => [33,'PCMaid_eyenormal',0,0,-0,0,100,100,255,0]})
		list = list.merge({'left' => [33,'PCMaid_eyeleft',0,0,-0,0,100,100,255,0]})
		list = list.merge({'tickle' => [33,'PCMaid_eyehappy',0,0,-0,0,100,100,255,0],'happy' => [33,'PCMaid_eyehappy',0,0,-0,0,100,100,255,0]})
		@images['eyes'] = list
		
    #accessories
    @images['accessories'] = {}
    list = {'acc1' => [31,'PCMaidAcc1',0,0,-0,0,100,100,255,]}
    @images['accessories']['outfit1'] = list    

		#misc
		list = {'blush1' => [31,'PCMaid_blush1',0,0,-0,0,100,100,255,0],'blush2' => [31,'PCMaid_blush2',0,0,-0,0,100,100,255,0],'tears' => [35,'PCMaid_tear',0,0,-0,0,100,100,255,0]}
		@images['misc'] = list
		
		testIntro = [{'text'=>"This is line 1","proc"=>nil},{'text'=>"This is line 2","proc"=>nil}]
		
		
@dialogue =\
{\
	'speak' =>\
	[\
		[\
			{'text'=>'Suki1:  You know, for a maid, you really have an interesting reputation…', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Nataleigh:  What?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1:  Back in Castle Velis. The guards were talking about you. They said you had a habit of bringing girls to your room and tying them up, even before we met.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Nataleigh:  Maybe I did! What about it?!', 'talking'=>true,'proc'=>method(:face_angry)},\
			{'text'=>'Suki1:  Don\'t worry. I\'m the last person to judge you. After all, you\'re here with me like this right now. Maybe we\'re not so different.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Nataleigh:  … Maybe.', 'talking'=>true,'proc'=>nil}\
		],\
		[\
			{'text'=>'Nataleigh:  How long do you plan on keeping me here? I do have a job to get back to, you know!', 'talking'=>true,'proc'=>method(:face_annoyed)},\
			{'text'=>'Suki1:  Do you really miss being a maid?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Nataleigh:  Well, I wasn\'t just an ordinary maid. The queen gave me complete control over Castle Velis while she wasn\'t around.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1:  … Why?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Nataleigh:  You\'d have to ask her. I was in neither the position nor the mood to argue. Can you imagine how it feels to be a servant one day, a master the next?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1:  No…', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Suki1:  (Just something very close.)', 'talking'=>false,'proc'=>nil}\
		],\
		[\
			{'text'=>'Suki1:  How did a girl like you end up working as a maid?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Nataleigh:  What do you mean “a girl like me?!”', 'talking'=>true,'proc'=>method(:face_angry)},\
			{'text'=>'Suki1:  I didn\'t mean anything by it! I just meant… you don\'t really seem like the subservient type.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Nataleigh:  Oh, I can be plenty subservient…', 'talking'=>true,'proc'=>method(:face_shy)},\
			{'text'=>'Suki1:  There really are two sides to you, aren\'t there?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Nataleigh:  There are two sides to everyone. I just don\'t hide either of mine.', 'talking'=>true,'proc'=>nil}\
		],\
		[\
			{'text'=>'Nataleigh:  So, I\'ve been tied up for a while now. Let me out of this so you can have your turn!', 'talking'=>true,'proc'=>method(:face_happy)},\
			{'text'=>'Suki1:  You want to tie me up?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Nataleigh:  Of course! Don\'t worry, I\'ll treat you really nicely. Most of the time.', 'talking'=>true,'proc'=>method(:face_happy)},\
			{'text'=>'Suki1:  How do I know you wouldn\'t just escape and leave me here?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Nataleigh:  You don\'t! That\'s part of the thrill! Untie me already!', 'talking'=>true,'proc'=>method(:face_happy)},\
			{'text'=>'Suki1:  I\'m going to have to pass on that for now.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Suki1:  (Even if she didn\'t leave me here like that, the look in her eyes scares me.)', 'talking'=>false,'proc'=>nil}\
		],\
		[\
			{'text'=>'Nataleigh:  When I get out of this place, I\'m taking you back to Castle Velis with me.', 'talking'=>true,'proc'=>method(:face_happy)},\
			{'text'=>'Nataleigh:  I\'ll make you one of the servants. It\'s a hard life, but it has its rewards.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1:  I think I\'ll pass.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Nataleigh:  I think you won\'t have a choice.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Nataleigh:  It won\'t be easy, cleaning the castle while tied up and gagged, but I\'m sure you\'ll find a way. You\'re a resourceful girl.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1:  In that case, I\'ll just have to make sure you never get out.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Nataleigh:  Try as hard as you wish. One day, you will be mine.', 'talking'=>true,'proc'=>nil}\
		]\
	],\
	'charm' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  Hold still so I can look at you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Hey! W-why are you looking so closely?!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  I can\'t believe such a cute girl could be so mean.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Is that a compliment or not?!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  You even look pretty when you\'re sad… but you\'re prettier when you smile.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  As if you\'re going to see one of those.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1:  I\'m glad you chose to be a maid. The outfit really suits you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Um… thanks…', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  I really do think you\'re pretty.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  I know you don\'t mean that!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  Hold still so I can look at you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Um, okay…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  I can\'t believe such a cute girl could be so mean.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Heh… looks can be deceiving.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Nataleigh:  You\'re a good example.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1:  Do you mind if I come a little closer?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  I suppose that\'s okay.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  You even look pretty when you\'re sad… but you\'re prettier when you smile.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Why are you being so nice?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1:  Why not? It\'s not as if I don\'t like you…', 'talking'=>false,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1:  I\'m glad you chose to be a maid. The outfit really suits you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  You really think so?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1:  Really.', 'talking'=>false,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  I really do think you\'re pretty.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Hehe… if you say so…', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  You\'re adorable when you blush like that.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  W-what?!', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  Your hair is so long and pretty… you must take really good care of it.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  T-that\'s going to be a little hard with my arms tied, don\'t you think?', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1:  You really are a lot of fun to play with.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  I\'m glad you think so.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  Maybe I should treat you more nicely. I miss that smile of yours.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  You do?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1:  Of course.', 'talking'=>false,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1:  Don\'t be scared. No matter what happens, I care about you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  That\'s… reassuring.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  Ohh… you\'re really cute when you\'re angry.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  S-stop trying to get back on my good side!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  You\'re adorable when you blush like that.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  You\'re just making it worse!', 'talking'=>true,'proc'=>method(:face_shy)},\
				{'text'=>'Suki1:  I know…', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  Your hair is so long and pretty… you must take really good care of it.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  A good maid must mind her appearance.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1:  You really are a lot of fun to play with.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  I\'m happy we\'re both having fun.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  Maybe I should treat you more nicely. I miss that smile of yours.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Well… you don\'t have to…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  Ohh… you\'re really cute when you\'re angry.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  You\'re not making it easy to be mad at you!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'insult' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  Now that I think about it, you\'d be a lot more plain-looking without the dress.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  I know you\'re… you\'re just being cruel.', 'talking'=>true,'proc'=>method(:face_afraid)},\
				{'text'=>'Suki1:  (You don\'t sound so sure…)', 'talking'=>false,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  You\'re not as good at tying people up as you think you are.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Ugh… let me have a turn and we\'ll see if you still say that!  ', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  You acted like you were in charge in the castle, but I don\'t think anyone really respected you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  W-what would you know?!', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'Suki1:  (I think that got to her…)', 'talking'=>false,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1:  I\'m pretty new to tying people up. You really can\'t even get out of this?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Just give me time, amateur…', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  Cute and kinky… it\'s a pity you have such a mean, bossy nature.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  You\'re not exactly helping!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  Now that I think about it, you\'d be a lot more plain-looking without the dress.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Hmph! Y-you\'d know all about plain-looking!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  You\'re not as good at tying people up as you think you are.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  I\'m better than you! Someday I\'ll prove it!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1:  I don\'t understand why anybody would put you in charge of a whole castle. You obviously had no idea what you were doing…', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  You acted like you were in charge in the castle, but I don\'t think anyone really respected you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  You wouldn\'t have any idea!', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1:  I\'m pretty new to tying people up. You really can\'t even get out of this?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Ughh…', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  Cute and kinky… it\'s a pity you have such a mean, bossy nature.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  You\'re not very nice yourself, missy!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  You really messed up. Nobody will ever put you in charge of anything again.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Ugh…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  You never earned your authority, huh? It was given to you and you weren\'t smart enough to handle it, huh?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  S-shut up!', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1:  If you weren\'t so bossy and loud, do you think anyone would even notice you?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  That doesn\'t matter to me!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1:  (It sounds like it does…)', 'talking'=>false,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  Do you think the castle guards really respected you? Why would they?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  …', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1:  Wow. You can\'t tie people up properly, you can\'t escape on your own… just why are you so sure of yourself?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  You have a nasty tongue.', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  You\'re not in charge anymore. You can\'t do a thing by yourself.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  You just wait! When I get out of this, I\'ll show you what I\'m capable of!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  You really messed up. Nobody will ever put you in charge of anything again.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  I… I know…', 'talking'=>true,'proc'=>method(:face_sad)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  You never earned your authority, huh? It was given to you and you weren\'t smart enough to handle it, huh?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Who do you think you are?!', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1:  If you weren\'t so bossy and loud, do you think anyone\'d even notice you?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  W-where\'d that come from? I thought you were being nice!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  Do you think the castle guards really respected you? Why would they?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Because I… they… ugh…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  You\'re not in charge anymore. You can\'t do a thing by yourself.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Grrr! I know you\'re not as tough as you pretend, either!  ', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'threaten' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  How would you like to spend the next week blindfolded?', 'talking'=>false,'anomaly'=>true,'proc'=>nil},\
				{'text'=>'Nataleigh:  That\'s… not necessary…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  I could leave you tied up like this for a very long time…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Don\'t you think that\'s… too much?', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  I can make this a lot tighter, you know.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Must you…?', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1:  Why are you so scared? Do you think I\'m going to sell you?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  …', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1:  I\'m thinking about it.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  No! Don\'t!', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  This is nothing compared to what I could do to you…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  I can take whatever you\'ve got!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  How would you like to spend the next week blindfolded?', 'talking'=>false,'anomaly'=>true,'proc'=>nil},\
				{'text'=>'Nataleigh:  A week is a little too long…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  I could leave you tied up like this for a very long time…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  You won\'t, right?', 'talking'=>true,'proc'=>method(:face_neutral)},\
				{'text'=>'Nataleigh:  …right?', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1:  You\'re smiling… you have no idea what I\'m planning, do you?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  I don\'t like the sound of that…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  I can make this a lot tighter, you know.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  It\'s plenty tight already!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1:  Why are you so scared? Do you think I\'m going to sell you?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  W-why would you bring that up?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  This is nothing compared to what I could do to you…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  You don\'t scare me!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  I\'m thinking about putting you to use as a servant.  ', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Suki1:  You could wander around the whole guild in front of everybody, in your cute maid outfit…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  You can\'t be serious!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  I think Leroy wanted to get to know you better. Should I let him in here?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Eww! No!', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1:  Maybe this cell is a little nice for you. We have a much smaller, darker one on the lowest level…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  That\'s going a little far!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  It\'d be fun to just leave you here blindfolded, gagged, your ears blocked up…', 'talking'=>false,'anomaly'=>true,'proc'=>nil},\
				{'text'=>'Nataleigh:  That\'s a little mean, don\'t you think?', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1:  You do know that I\'m going easy on you, right?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Suki1:  If you keep squirming around like that, I\'ll assume you want me  to stop playing around.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  I\'m tempted… but I\'m getting a bad feeling about this.', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  You need to learn who\'s in charge here. A collar and leash should suffice.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  What?! Oh no you don\'t!  ', 'talking'=>true,'proc'=>method(:face_angry)}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  I\'m thinking about putting you to use as a servant.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Suki1:  You could wander around the whole guild in front of everybody, in  your cute maid outfit…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  You aren\'t serious… right? Please don\'t be serious…', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  I think Leroy wanted to get to know you better. Should I let him in here?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  L-let\'s just keep this between you and me, okay?', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1:  Maybe this cell is a little nice for you. We have a much smaller, darker one on the lowest level…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  What have I done to deserve that?', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  It\'d be fun to just leave you here blindfolded, gagged, your ears blocked up…', 'talking'=>false,'anomaly'=>true,'proc'=>nil},\
				{'text'=>'Nataleigh:  I don\'t want to try that…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  You need to learn who\'s in charge here. A collar and leash should suffice.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Oh, you\'d enjoy that, wouldn\'t you?!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'slap' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  Bad girl!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Aaah…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  Bad girl!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  S-stop…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  Bad girl!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Y-you can stop now…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1:  Bad girl!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  A-ahh…', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  Bad girl!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Ngh! Stop it!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  Bad girl!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Nnnh!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  Bad girl!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Oww!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1:  Bad girl!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Ugh…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  Bad girl!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Ah! Owww…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1:  Bad girl!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  D-don\'t…', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  Bad girl!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Ahh! Cut it out!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  Bad girl!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  *gasp*', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  Bad girl!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Ahh…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1:  Bad girl!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Ahh… hehe~', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  Bad girl!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Nngh…  ', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1:  Bad girl!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Ahh…  ', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  Bad girl!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Aaah! You… I\'ll show you how to hit a girl!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:Bad  girl!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  O-ohhh~', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  Bad girl!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Oww! Aah…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1:  Bad girl!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Aah… you don\'t have to stop…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  Bad girl!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Nnnh… not bad…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  Bad girl!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  H-hey…', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'tickle' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  Here we go~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Hehe - no! Stop it- ahahahaha!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  Here we go~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  A-hahahaaa! Hehehehe!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  Here we go~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  No! G-get b- hahahaha!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1:  Here we go~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  What are you- ah! Hehehehe!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  Here we go~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  No! Get - hehehe - get off me!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  Here we go~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Hehe - no! Stop it- ahahahaha!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  Here we go~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  A-hahahaaa! Hehehehe!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1:  Here we go~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Hehehe! Ahahaha!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  Here we go~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  No! G-get b- hahahaha!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1:  Here we go~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  What are you- ah! Hehehehe!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  Here we go~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  No! Get - hehehe - get off me!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  Here we go~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Hehehehehe *gasp* hahahhahahahaha!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  Here we go~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Wh-wha- ahahaha!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1:  Here we go~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Hahahahaha!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Ahahaha!!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  Here we go~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  No! No - hehehehehehe! No!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1:  Here we go~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  S-hahaha-s-stop!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  Here we go~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Ahh! No- hehehahahaaaa!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  Here we go~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Hehehehehe *gasp* hahahhahahahaha!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  Here we go~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Wh-wha- ahahaha!', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1:  Here we go~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Hahahahaha!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Ahahaha!!', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  Here we go~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  No! No - hehehehehehe! No!', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  Here we go~', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Ahh! No- hehehahahaaaa!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'kiss' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Wha-  mmmmmpphh!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Blegh… don\'t try that again!', 'talking'=>true,'proc'=>method(:face_annoyed)}\
			],\
			'happiness' =>\
			[\
				{'text'=>'n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  *gasp*  Y-you…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  U-ugh… you have no right…', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Mmmph! Stop it! Don\'t you touch me!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Mmmm?!', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Mmm… I don\'t…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Ahh… mmmm…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  That was nice, but… you shouldn\'t kiss a girl without her permission.', 'talking'=>false,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Mmm…  you\'re being nice now?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  I\'m… mmmph!  ', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Nataleigh:  I\'m not in the mood for this!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Aah… mmm…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Hehe… feeling frisky, eh?', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Mmm…  you\'re good…', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Mmm… are you trying to cheer me up?', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Mmm… well, if you\'re in the mood now, okay…', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  H-hey… mmmph?!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Mmmm~', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Mmm… hehe…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Mmm… didn\'t think a girl as young as you would be such a good kisser…', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Mmm… If you\'re trying to cheer me up, it\'s working.', 'talking'=>true,'proc'=>method(:face_happy)}\
			],\
			'fear' =>\
			[\
				{'text'=>'n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  Mmm…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Mmm… okay, maybe I\'ll forgive you if you keep that up…', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'ungag' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  Let me take this away…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Aah… are you trying to humiliate me?', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  Let me take this away…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Ahh… you\'re awful…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  Let me take this away…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Well, aren\'t you nice…?', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1:  Let me take this away…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  What are you going to do…?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  Let me take this away…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  I hope you weren\'t expecting any thanks.', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  Let me take this away…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Aah… better…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  Let me take this away…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Aah…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1:  Let me take this away…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Thank you.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  Let me take this away…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Ugh… okay…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1:  Let me take this away…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Um… thank you…', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  Let me take this away…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Whatever…', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  Let me take this away…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Well, okay…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  Let me take this away…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Going easy on me?', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1:  Let me take this away…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Haah… okay…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  Let me take this away…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  I can\'t tell if you\'re being nice or if you have something else in mind…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1:  Let me take this away…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  O-okay…', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  Let me take this away…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Hmph.', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  Let me take this away…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Thanks… not that I minded…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  Let me take this away…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  I suppose a break would be nice, but…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1:  Let me take this away…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  You didn\'t have to…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  Let me take this away…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  It wasn\'t so bad.', 'talking'=>true,'proc'=>method(:face_shy)}\
			],\
			'fear' =>\
			[\
				{'text'=>'n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  Let me take this away…', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  I\'m still mad at you. Are you sure you want to do that?', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'blindfold_on' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  Hold still so I can put this on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Ohhh…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  Hold still so I can put this on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Ugh… must you?', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  Hold still so I can put this on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  No…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1:  Hold still so I can put this on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Y-yes…', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  Hold still so I can put this on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  What? No! Take it off!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  Hold still so I can put this on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Um… what are you doing?', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  Hold still so I can put this on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Is this necessary?', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1:  Hold still so I can put this on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  What are you playing at?', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  Hold still so I can put this on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Please don\'t…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1:  Hold still so I can put this on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  N-no, I don\'t want that!', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  Hold still so I can put this on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Hey! What do you think you\'re doing?!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  Hold still so I can put this on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  What do you have in mind?', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  Hold still so I can put this on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Hmm…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1:  Hold still so I can put this on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Oh, you\'re getting mean, hmm?', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  Hold still so I can put this on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  I suppose you\'re not asking permission.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1:  Hold still so I can put this on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  I can\'t even see what\'s coming like this…', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  Hold still so I can put this on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Heyyy!', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  Hold still so I can put this on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  You… you want me to be shut in the dark, huh?', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  Hold still so I can put this on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  I like where this is going…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1:  Hold still so I can put this on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  You\'re blindfolding me? Okay…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  Hold still so I can put this on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  If you insist…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  Hold still so I can put this on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Oh, you think this is funny?', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	],\
	'blindfold_off' =>\
	[\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  That\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Ahh…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  That\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Ngh… thanks, I guess.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  That\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Treating me like a toy…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1:  That\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Ahh…', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  That\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  I\'ll pay you back for that one day.', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  That\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Ah… you can be very cruel.', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  That\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Thank you.', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1:  That\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  I… appreciate it. I suppose.', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  That\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Thanks…', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1:  That\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  W-what\'re you going to do?', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  That\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  I hope you don\'t think this is generous.', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  That\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  T-thanks…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  That\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Oh? Already?', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1:  That\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  If you say so…', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  That\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Playing the good girl now?', 'talking'=>true,'proc'=>method(:face_angry)}\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1:  That\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  I\'m still a little nervous here…', 'talking'=>true,'proc'=>method(:face_afraid)}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  That\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  The nice girl act doesn\'t suit you.', 'talking'=>true,'proc'=>nil}\
			]\
		},\
		{\
			'shyness' =>\
			[\
				{'text'=>'Suki1:  That\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  That wasn\'t so bad…', 'talking'=>true,'proc'=>nil}\
			],\
			'neutral' =>\
			[\
				{'text'=>'Suki1:  That\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  If it pleases you…', 'talking'=>true,'proc'=>nil}\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1:  That\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  So soon?', 'talking'=>true,'proc'=>nil}\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1:  That\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Well, that\'s a positive step.', 'talking'=>true,'proc'=>nil}\
			],\
			'fear' =>\
			[\
				{'text'=>'n/a', 'talking'=>true,'proc'=>nil}\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1:  That\'s long enough for now.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Nataleigh:  Don\'t think this makes us okay!', 'talking'=>true,'proc'=>nil}\
			]\
		}\
	]\
};
		
	end
end
$privateCellDamsels['maid'] = PrivateCellDamselMaid.new
