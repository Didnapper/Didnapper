#need to try inserting text event into stack
#[image number, name, origin,appointment method?(0 for direct),x,y,zoomx,zoomy,opacity,blend_type]

class PrivateCellDamselMarcia < PrivateCellDamsel
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
    @tag = 'marcia'
		super()
		#personality
		@emotions['fear'] = [3,0]
		@emotions['shyness'] = [3,0]
		@emotions['anger'] = [8,0]
		@emotions['happiness'] = [5,0]
		@emotions['sadness'] = [1,0]
    #currently unused
    @homophilia = 4
		@masochism = 3
		
		
		@disposition = 1
		@disposition_index = 664
		@disposition_min = 1
		
		#bases
#		list = {'back' => [30,'PCMarciaBase',0,0,0,0,100,100,255,0]}
#		@images['base'] = list
    list = {'outfitdefault' => [30,'PCMarciaBase',0,0,0,0,100,100,255,0],'outfit1'=> [30,'PCMarciaBaseBikini',0,0,0,0,100,100,255,0]}
 		@images['base'] = list
		
		#brows
		list = {'annoy1' => [32,'PCMarcia_browannoy1',0,0,0,0,100,100,255,0],'annoy2'=> [32,'PCMarcia_browannoy2',0,0,0,0,100,100,255,0], 'normal' => [32,'PCMarcia_brownormal',0,0,0,0,100,100,255,0]}
		list = list.merge({'tickle' => [32,'PCMarcia_browtickle',0,0,0,0,100,100,255,0],'worry' => [32,'PCMarcia_browtickle',0,0,0,0,100,100,255,0]})
		@images['brow'] = list
		
		#mouths and gags
		list = {'annoy1' => [34,'PCMarcia_mouthannoy1',0,0,0,0,100,100,255,0],'annoy2'=> [34,'PCMarcia_mouthannoy2',0,0,0,0,100,100,255,0], 'neutral' => [34,'PCMarcia_mouthneutral',0,0,0,0,100,100,255,0]}
		list = list.merge({'tickle' => [34,'PCMarcia_mouthtickle',0,0,0,0,100,100,255,0],'smile' => [34,'PCMarcia_mouthsmile',0,0,0,0,100,100,255,0]})
		list = list.merge({'ball' => [34,'PCMarcia_gagball',0,0,0,0,100,100,255,0],'bit' => [34,'PCMarcia_gagbit',0,0,0,0,100,100,255,0],'cleave' => [34,'PCMarcia_gagcleave',0,0,0,0,100,100,255,0]})
		list = list.merge({'cloth' => [34,'PCMarcia_gagOTM',0,0,0,0,100,100,255,0],'knot' => [34,'PCMarcia_gagknot',0,0,0,0,100,100,255,0],'otn' => [34,'PCMarcia_gagOTN',0,0,0,0,100,100,255,0]})
    list = list.merge({'sgag1' => [34,'PCMarcia_gagstuffedOTN',0,0,0,0,100,100,255,0],'sgag2' => [34,'PCMarcia_gagOTNcleave',0,0,0,0,100,100,255,0],'sgag3' => [34,'PCMarcia_gagtape',0,0,0,0,100,100,255,0]})
    @images['mouth'] = list
		
		#eyes and blindfold
		list = {'blindfold' => [36,'PCMarciaBlindfold',0,0,0,0,100,100,255,0],'blink' => [33,'PCMarcia_eyeclosed',0,0,0,0,100,100,255,0]}
		list = list.merge({'normal1' => [33,'PCMarcia_eyenormal',0,0,0,0,100,100,255,0],'normal2' => [33,'PCMarcia_eyenormal',0,0,0,0,100,100,255,0]})
		list = list.merge({'right' => [33,'PCMarcia_eyenormal',0,0,0,0,100,100,255,0],'left' => [33,'PCMarcia_eyeleft',0,0,0,0,100,100,255,0]})
		list = list.merge({'tickle' => [33,'PCMarcia_eyehappy',0,0,0,0,100,100,255,0],'happy' => [33,'PCMarcia_eyehappy',0,0,0,0,100,100,255,0]})
		@images['eyes'] = list
		
    @images['accessories'] = {}
    list = {'acc1' => [31,'PCMarcia_acc1',0,0,0,0,100,100,255,0],'acc2'=>[37,'PCMarcia_acc2',0,0,0,0,100,100,255,0]}
    @images['accessories']['outfit1'] = list
    
		#misc
		list = {'blush1' => [31,'PCMarcia_blush1',0,0,0,0,100,100,255,0],'blush2' => [31,'PCMarcia_blush1',0,0,0,0,100,100,255,0],'tears' => [35,'PCMarcia_tears',0,0,0,0,100,100,255,0]}
		@images['misc'] = list

		
		testIntro = [{'text'=>"This is line 1","proc"=>nil},{'text'=>"This is line 2","proc"=>nil}]
		
		#"speak" dialogue
@dialogue =\
{\
	'speak' =>\
	[\
		[\
			{'text'=>'Marcia: What did you do with the rest of my troops? Are they locked up in cells like this one?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: The mercenaries are currently holding them hostage as a measure against the next waves,', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Suki1: To keep the kingdom from counterattacking.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Suki1: As long as the mercenaries are left alone those girls won\'t be sold into slavery.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Suki1: I\'m told they\'ll be treated well as long as they behave.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Marcia: Is that the truth?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: It is.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Marcia: ...', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Suki1: Feel better now?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Marcia: Shut up! You could never know the responsibilities of being a commander!', 'talking'=>true,'proc'=>method(:face_angry)},\
			{'text'=>'Suki1: Maybe, but now it\'s your turn for answers. Why did Cherisa choose you for this mission?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Marcia: What? I-I don\'t know. She did personally visit me though.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Marcia: She told me that I had the honor and courage necessary to lead her forces.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Marcia: The position meant leaving everything behind in Velis but it was worth it if I could truly please my Queen... But I failed her....', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: I\'m sorry... I didn\'t mean to-', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Marcia: No, I don\'t want pity. It was a fair battle and you have been graceful in victory.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Marcia: I suppose I can accept being captive to someone like you.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: Thanks.', 'talking'=>false,'proc'=>nil},\
		],\
		[\
			{'text'=>'Marcia: What do you want, kidnapper.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: Nice to see you too. Listen, I have some questions, about Cherisa, and your orders.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Marcia: That\'s Queen Cherisa to you!', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: Yes, quite. Queen Cherisa... So what exactly were you ordered to do?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Marcia: Humph!  As if I\'d explain myself to a rabble rouser like you.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: If you\'d prefer not to talk we have an extensive gag collection. I could make it so you never say anything other than “Mmmph” again.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Marcia: ...', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Suki1: Will it really hurt to tell, what could you possibly have to lose? Besides, we should do something to pass the time.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Marcia: Humph! You already know what we were doing.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Marcia: We were to seal off the town and take complete control of the area and everyone there for the kingdom.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: Why? For what purpose? What is Cherisa planning?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Marcia: Hehe, listen kidnapper, I\'m a solider, I take orders and I give orders.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Marcia: I don\'t question them and I don\'t expect to be  questioned. What Queen Cherisa is planning is for her to know and me to like.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Marcia: That\'s called loyalty, something your kind doesn\'t understand.', 'talking'=>true,'proc'=>nil},\
		],\
		[\
			{'text'=>'Suki1: That can\'t be all, you know. At least answer me this, what... What kind of Queen is Cherisa?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Marcia: What sort of question is that, the Queen is perfect in every way, every decision she makes is-', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: No, don\'t give me that army crap. Is she a just ruler? Do the people like her, how\'s the economy doing, is crime up or down?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Marcia: Rest assured, kidnapper, the kingdom is doing better than ever, and soon Cherisa will turn her attention to the last few pests like you.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Marcia: And then you\'ll be the one struggling to answer my questions through a thick gag.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: Forget it, I\'d have an easier time getting blood out of a stone than getting a truthful response from a trained lapdog like you.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Marcia: Just remember, one day Queen Cherisa will rescue me. And when that day comes I\'ll drag you filthy mongrels behind me in muzzles and chains.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Marcia: I\'ll have you digging latrines until the best of your days are spent! Then you\'ll understand what it means to be loyal.', 'talking'=>true,'proc'=>nil},\
		],\
		[\
			{'text'=>'Suki1: So you\'re head of an all female army, what\'s that all about? Trying to tell us something?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Marcia: Humph, I think you of all people must know the superiority of female troops.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Marcia: They\'re fast and agile, men hold back when fighting them, plus no-one ties a knot quite like a woman.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: Well, your right about the knots, I\'ll give you that; but there has to be more to this than just simple practicality.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Marcia: Why don\'t you ask Cherisa herself - oh wait, kidnapping scum don\'t get audiences with the Queen, do they?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: Hehe, who knows, maybe I will get to see her. In fact, maybe you\'ll be seeing her sooner than you think.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Marcia: Y-Your not thinking of... Oh, don\'t you dare! Hmmph! These damn ropes! I swear if I wasn\'t tied up! ', 'talking'=>true,'proc'=>nil},\
		],\
		[\
			{'text'=>'Marcia: I must say I find your little fort laughable. It\'s amazing you can accomplish anything here.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: I crushed you, though,  didn\'t I?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Marcia: Hump, luck! Listen, if you hand yourself in, I promise I\'ll throw in a good word with Cherisa. It\'s your only chance.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: No thanks, I\'ve seen how you treat your subordinates, never mind your prisoners.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Marcia: Oh, you\'re referring to that Mercenary.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: Athena, yes. You know, she\'s working with me now.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Marcia: That doesn\'t surprise me in the least, a girl like that. No respect or loyalty.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: You tied her up and locked her away.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Marcia: You think I imprisoned her lightly? I was in an entrenched position running out of coin and she was a mercenary.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Marcia: What was I to do, depend on her loyalty?', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: You could have given her a choice.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Marcia: I would have freed her once the resistance was finished. My conscience is clear.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: ...', 'talking'=>false,'proc'=>nil},\
		],\
		[\
			{'text'=>'Marcia: Ugh...', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Suki1: What is it?', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Marcia: I can\'t believe I was captured by people of such... Limited means.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: Hey, watch that pride, that\'s what got you in this situation in the first place.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Marcia: Humph! I\'d rather be prideful in defeat than honorless in victory.', 'talking'=>true,'proc'=>nil},\
			{'text'=>'Suki1: Ohh? Well, forgive me if I refrain from taking advice from the loser of our little spat.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Suki1: Speaking of shortcomings, it was really foolish of you to lock your best mercenary away.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Marcia: Grrr...', 'talking'=>false,'proc'=>method(:face_angry)},\
			{'text'=>'Suki1: You should apologize. That would make things smoother for everybody.', 'talking'=>false,'proc'=>nil},\
			{'text'=>'Marcia: Never...', 'talking'=>true,'proc'=>nil},\
		]\
	],\
	'charm' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Your armor is very pretty.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I am more concerned with its practicality, thank you.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: And yet, you clearly care about its beauty, as well.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: It is important that I look dignified at all times.', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I have to say I\'m-', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Shut up.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: What?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: The last thing I wish to hear is faint praise from a criminal.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: I was just trying to be nice...', 'talking'=>false,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: You know you look so much younger when you smile.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: ... Don\'t condescend to me.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: What!? I\'m not, I\'m trying to-', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: You honestly think I\'d accept any compliment you\'d give?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: ...', 'talking'=>false,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I don\'t think you have to worry about this little set back. After all someone of your reputation-', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Do you have any idea what you\'ve done to my reputation?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: N-No...?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: You ruined it. Now go to hell. You and the rest of the vermin that inhabit this nest.', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Please don\'t worry, Marcia. I\'d never think to harm someone as lovely as you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Who do you think you\'re dealing with?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: I— What?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Do you think I am afraid? That I\'ll crack and beg for special treatment in exchange for the Kingdom\'s secrets?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: No! That\'s not what I was-', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I\'ll never break! You can tell your masters that!', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I think you might just have been the toughest opponent I\'ve faced. Do you think maybe-', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Are you asking me to betray my Queen!?', 'talking'=>true,'proc'=>method(:face_angry)},\
				{'text'=>'Suki1: H-Hold on, I\'m just wanting to know if-', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: If I wasn\'t trussed and helpless I\'d slay you on the spot for this attempt!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: (Sigh, why can\'t we ever just talk...)', 'talking'=>false,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Your armor is very pretty.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: A leader must remain dignified.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: I suppose that\'s one thing you\'re good at.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I believe I am much better than you at it, yes.', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I have to say I\'ve been quite impressed with you. You\'ve been dealing with this quite well, all things considered.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: What kind of compliment is that?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Well... I\'m just saying that-', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: You\'re saying I\'m a graceful loser. Got it. Now leave me alone.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: ...You\'re not acting very graceful right now...', 'talking'=>false,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: You know you look so much younger when you smile.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: ...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Suki1: What? Is something wrong?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I will be sure to refrain from that from now on. I don\'t wish to give someone like you the wrong impression.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Someone like me? Hold on, what\'s that supposed to mean?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: ...', 'talking'=>false,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I don\'t think you have to worry about this little set back.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Suki1: After all someone of your reputation will be just fine when we\'ve settle all of this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Don\'t be foolish. The Captain that loses her soldiers to slavery will not be remembered fondly.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: W-well, when you put it that way it-yeah it sounds bad but-', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: ...', 'talking'=>false,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Please don\'t worry, Marcia. I\'d never think to harm someone as lovely as you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Why would you say that?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Because it\'s true, you are-', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I don\'t want special treatment. All I want is the safety of my army.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Marcia: I\'d take every strike, every broken bone if it purchased their safety. To be given such an offer, is an unbearable insult.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: They won\'t hurt them you know...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I don\'t...', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: ...', 'talking'=>false,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I think you might just have been the toughest opponent I\'ve faced.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Suki1: Do you think maybe when this is over you\'d like to travel with us?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: What are you babbling about?', 'talking'=>true,'proc'=>method(:face_annoyed)},\
				{'text'=>'Suki1: I just—I\'ve been thinking, I kind of like it on the road... And I might like company.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Don\'t be stupid.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: ...', 'talking'=>false,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Your armor is very pretty.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: As long as it protects me, I am pleased.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: And yet, you clearly care about its beauty, as well. You take good care of it.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: A Captain must always keep her appearance in mind.', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I have to say I\'m been quite impressed with you. You\'ve been dealing with this quite well, all things considered.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: To be composed is one of the essential aspects of a Captain.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: And it shows.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Perhaps... But do not think something as simple as flattery will get you anywhere with me.', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: You know, you look so much younger when you smile.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: ... I\'ve had a lot of stress in my life.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Well... I guess think of this like a vacation?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: ...', 'talking'=>false,'proc'=>method(:face_angry)},\
				{'text'=>'Suki1: Not so much, huh?', 'talking'=>false,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I don\'t think you have to worry about this little set back.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Suki1: After all someone of your reputation will be just fine when we\'ve  settled all this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Someone of my reputation? My reputation is shattered...', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: It doesn\'t sound like it bothers you too much, I mean-you\'re not on the ground bawling or anything...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: ...No, I\'m not. In that sense I suppose you\'re correct.', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Please don\'t worry, Marcia. I\'d never think to harm someone as lovely as you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Your flirtations, whilst appreciated, are inappropriate and, to be frank, vile.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Vile?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Do you think I\'d accept my safety over my friends\'? I know you meant well, but please don\'t say that again.', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I think you might just have been the toughest opponent I\'ve faced. Do you think maybe when this is over you\'d like to travel with us.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Perhaps-', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: That\'s grea-', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Let me finish. Perhaps if our lives had lead us down different paths... That would have been acceptable.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Marcia: But we are not friends. Always remember that.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: ...', 'talking'=>false,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Your armor is very pretty.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: A Captain must always keep her appearance in mind.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Well, you certainly do.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: ...I appreciate that, Suki1.', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I have to say I\' quite impressed with you. You\'ve been dealing with this quite well, all things considered.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I try... But it\'s hard. Not knowing...', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: I know... Not knowing is the worst... And I want you to understand, I will never allow anything bad to happen to you or your family.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Suki1: Once this is done, I\'ll bring them all back to you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I... Thank you, Suki1.', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: You know you look so much younger when you smile.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I... I try not to.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Why?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: It is not the place of a soldier to be happy. We are to always be mindful of our place in history,', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Marcia: What we must sacrifice to protect the future.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: But you\'re your own person. I\'d hate for you to be miserable on principle.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: It is not my place to want to be happy.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: For me, at least. right here, right now, can you at least try?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I... I suppose I can.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: I\'m glad.', 'talking'=>false,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Sukii1: I don\'t think you have to worry about this little set back.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Sukii1: After all, someone of your reputation will be just fine when we\'ve settled all this.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I\'ve never cared about my reputation, not really.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: I get that. Just know that once this is done, I\'ll do everything in my power to fix it.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Why would you do that?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Because you deserve it, you and your soldiers.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Suki1: I\'ll do everything I can to make sure everyone knows that you were a great and noble band, worthy of remembrance.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: ... Heh. I didn\'t expect you of all people to say that. But... I won\'t say no. You really are an interesting girl.', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: Please don\'t worry, Marcia. I\'d never think to harm someone as lovely as you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: In another life, that might have brought me comfort but-', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: I won\'t harm them either, and I won\'t let anyone try.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Huh?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: You are beautiful, but more than that you are kind, caring.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Suki1: I\'ll make sure that nothing bad comes to your company. After all, I don\'t want to see your lovely face framed with tears.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I... By the Queen, you really are corny. But... Thank you, Suki1.', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Are- are you blushing? Oh! That was so cute!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: P-please, it is not dignified for me to be like this, don\'t-', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Dignity? Marcia, I respect you more than others. But you\'re human too. You get to have emotions.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Suki1: Being embarrassed... Yeah, it\'s funny, but I\'d never dream to think less of you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I-I... I\'m glad to have been in your company, Suki1. And I will remember it to the day I regain my freedom.', 'talking'=>true,'proc'=>nil},\
			]\
		},\
	],\
	'insult' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Your gigantic breasts are the only worthwhile part of you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Everything about me is still more worthwhile than you.', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You\'re such a failure. You couldn\'t even keep your soldiers safe.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: DAMN YOU!!!', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: What a stupid decision to fight in a dress. Or did you want to be a fancy failure?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: If I were free I\'d smash you to pieces!', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I can\'t believe you locked Athena away. The enemy of my enemy... Did you just want to lose?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I wish I never hired that damn turncoat!', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: So much for fair renown. I bet in a month no one will even remember your name.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Give me five minutes with my axe and no one will want to remember what you looked like in your last moments.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: (...dark....)', 'talking'=>false,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: They\'re never coming back for you. Your nothing but dead weight, left behind at a moment\'s notice.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: ... Enough. Just let me rot away in peace.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: (I think I may have overdone it.)', 'talking'=>false,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: You really were out of your league. You should have stayed in Velis. At least there you could have pretended you made a difference.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: How could I have let it end this way?', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You\'re such a failure. You couldn\'t even keep your soldiers safe.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I did everything I could.', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: What a stupid decision to fight in a dress. Or did you want to be a fancy failure?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: It was a gift from my father!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: And he wore it?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: No! Sh-Shut up!', 'talking'=>true,'proc'=>method(:face_shy)},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I can\'t believe you locked Athena away. The enemy of my enemy... Did you just want to lose?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I\'ll lock you both in cages once I get free!', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: So much for fair renown. I bet in one month no one will even remember you name.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: The name was never important. It was the deeds behind it that mattered.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: I guess you\'re right. It\'s more important that people remembered you accomplished zilch.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: ...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Suki1  (Looks like that hurt a bit...)', 'talking'=>false,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: They\'re never coming back for you. Your nothing but dead weight, left behind at a moment\'s notice.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I swear I\'m going to drag you back to the palace in chains, even if it\'s the last thing I do!', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: You really were out of your league. You should have stayed in Velis. At least there you could have pretended you made a  difference.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: One day I\'ll escape!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Do you honestly believe that?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I—I have to...', 'talking'=>true,'proc'=>method(:face_afraid)},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You\'re such a failure. You couldn\'t even keep your soldiers safe.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Maybe... Maybe you\'re right.', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: What a stupid decision to fight in a dress. Or did you want to be a fancy failure?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: My axe failed me, not my dress...', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I can\'t believe you locked Athena away. The enemy of my enemy... Did you just want to lose?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: (Athena... How could you?)', 'talking'=>false,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: So much for fair renown. I bet in one month no one will even remember your name.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I don\'t care about that. I never did...', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: They\'re never coming back for you. Your nothing but dead weight, left behind at a moment\'s notice.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Marcia: (Who could blame them...)', 'talking'=>false,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: You really were out of your league. You should have stayed in Velis. At least there you could have pretended you made a difference.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Too cruel.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Marcia: (One day I will make a difference, I swear it!)', 'talking'=>false,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: You\'re such a failure. You couldn\'t even keep your soldiers safe.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Harsh words... But I need to accept what happened....', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: What a stupid decision to fight in a dress. Or did you want to be a fancy failure.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: There were a lot of things I\'d do differently... But the dress had nothing to do with my defeat.', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I can\'t believe you locked Athena away. The enemy of my enemy... Did you just want to lose?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: (I was a fool... I did this to myself...)', 'talking'=>false,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: So much for fair renown. I bet in one month no one will even remember your name.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: It\'s what I deserve. All I care about now is the fate of my subordinates. Their lives mean more than a single legacy ever could.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: (Well said...)', 'talking'=>false,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: They\'re never coming back for you. You\'re nothing but dead weight, left behind at a moment\'s notice.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Marcia: (Maybe it\'s better this way. Who needs a failure in their ranks?)', 'talking'=>false,'proc'=>nil},\
			]\
		},\
	],\
	'threaten' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: I have an idea, Velis Manor needs a new maid. Maybe you fill the vacancy.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Urggg... (Not a maid, Please. Anything but that.)', 'talking'=>false,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I\'m going to sell you off to Gheb. He\'ll like you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Who the hell is Gheb?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Oh that\'s right, never mind...', 'talking'=>false,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Keep acting out and I\'m going to give you to the Mages. Maybe they\'ll turn you into a toad.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Sounds good to me.', 'talking'=>true,'proc'=>method(:face_happy)},\
				{'text'=>'Suki1: Wait, really? Why? (Oh that\'s right, nobles go to that school... Bad idea)', 'talking'=>false,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I\'m never going to sell you. You\'re going to stay here with me forever!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: This can\'t be how it ends...', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: If you don\'t start behaving I\'m going to sell you to the pirates!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Those brigands! You wouldn\'t dare!', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I\'m tired of you. I hear there\'s two factions battling it out in Jyoga. I can sell you as a meat shield.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Why not go there yourself and drop dead!', 'talking'=>true,'proc'=>method(:face_angry)},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: I have an idea. Velis Manor needs a new maid. Maybe you can fill the vacancy.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I\'ll get justice one day!', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I bet the Sand Storm Guild would buy you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I\'d rather not be sold...', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Then be good for me, okay?', 'talking'=>false,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Keep acting out and I\'m going to give you to the Mages. Maybe they\'ll hypnotize you into submission.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: You don\'t scare me!', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I\'m never going to sell you. You\'re going to stay here with me forever!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: (One day I\'ll be free... I hope...)', 'talking'=>false,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: If you don\'t start behaving I\'m going to sell you to the pirates!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Which pirates?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: What?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Which pirates sre you referring to?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: What does it matter? They\'ll all treat you the same anyway.', 'talking'=>false,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I\'m tired of you. I hear there\'s some settler\'s in Jyoga who need cheap labor.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I\'d rather wear a yoke around my neck than tolerate you a second more!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Hm... I think that could be arranged.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: ...', 'talking'=>true,'proc'=>method(:face_afraid)},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: I have an idea. Velis Manor needs a new maid. Maybe you can fill the vacancy.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Please... I don\'t think I can do that kind of work...', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: I learned how to be a kidnapper... I\'m sure you\'ll do fine.', 'talking'=>false,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I\'m going to sell you off to the Sand Storm Guild.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Will they treat me well?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Probably not...', 'talking'=>false,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Keep acting out and I\'m going to give you to the Mages. Maybe they\'ll use you as a training dummy.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Too cruel...', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I\'m never going to sell you. You\'re going to stay here with me forever!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: You\'d like that, wouldn\'t you!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Of course, that\'s pretty much why I said that.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Oh...(I feel stupid)', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: If you don\'t start behaving I\'m going to sell you to the pirates!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: How?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: What do you mean how?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Do you actually know any pirates?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: I don\'t think you want to find out.', 'talking'=>false,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I wonder if the natives in Jyoga would buy you... I\'m sure they\'d appreciate a human shield.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I don\'t think that\'s all they\'d do to me...', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Better be a good girl, then.', 'talking'=>false,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: I have an idea. Velis Manor needs a new maid. Maybe you can fill the vacancy.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: P-please don\'t.', 'talking'=>true,'proc'=>method(:face_afraid)},\
				{'text'=>'Suki1: Oh, but you don\'t have a choice, you\'ll-', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I—I\'d much rather be your maid.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: I....(Heavy breathing)', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: A-are you okay?', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I\'m going to sell you to Kirya!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Kirya... Not that infamous slaver, you fiend!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Relax, I could never give up my pretty Captain!', 'talking'=>false,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Keep acting out and I\'m going to give you to the Mages. Maybe you\'ll get lucky and Lady Hyranda will take pity on you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: (That\'s pretty much what I\'m counting on...)', 'talking'=>false,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: I\'m never going to sell you. You\'re going to stay here with me forever!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I\'ll never give in! (Oh well. I could think of worse fates. Hopefully she\'ll treat me well...)', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: If you don\'t start behaving I\'m going to sell you to the pirates!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Wh-', 'talking'=>true,'anomaly'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Don\'t! Don\'t start questioning me with your facts!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Relax, I was just ribbing you. It\'s all in good fun.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: I feel like such a failure of a villain...', 'talking'=>false,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: I\'m tired of you. I hear the situation in Jyoga has only gotten worse. Maybe I can sell you as a peace offering.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I am quite the prize.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: (Oh don\'t I know it.)', 'talking'=>false,'proc'=>nil},\
			]\
		},\
	],\
	'slap' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Buck up!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: You need to learn how to treat a woman.', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Hold still!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I can\'t believe I lost to this...', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Slap!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Stop playing these kids games...', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Take this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I hate you...', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I\'m in charge!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: The wheel never stops turning...', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: This\'ll teach you!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: You\'re a pathetic weakling.', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Buck up!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I could slap you harder using only my boobs.', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Hold still!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Do you even lift?', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Slap Attack!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Missed...', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Take This!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: ...', 'talking'=>false,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I\'m in charge!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Okay, just stop hitting me...', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: This\'ll teach you!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Oh, what a nice breeze...', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Buck up!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I think you need help...', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Hold still!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Come back when you\'ve leveled up...', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Double Slap attack!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: It wasn\'t very effective...', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Take This!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Leave me alone...', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I\'m in charge!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Whatever makes you sleep at night.', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: This\'ll teach you!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Your attacks are like the buzzing of flies... Annoying but not concerning.', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Buck up!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Sometimes I wish I had more confidence...', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Hold still!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I don\'t want to sound judgmental, but... I did train with some of the greatest warriors in the land...', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Marcia: your attacks... They just don\'t measure up.', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Critical Slap attack!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: *Faints*', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: ah, not really...', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Take this!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Is this, like, reverse psychology?', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I\'m in charge!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Yes... Mistress...', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Wait, WHAT!?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Nothing...', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: This\'ll teach you!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Keep trying...', 'talking'=>true,'proc'=>nil},\
			]\
		},\
	],\
	'tickle' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Let\'s see what\'s hiding under that mask!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I\'ll never give in!', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Tickle Tickle!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Get away from me!', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I\'m gonna tickle you!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Don\'t! Not there!', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Cheer up!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Get your hands off me!', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: This\'ll perk you up!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: What are you doing!', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Enough with the angry eyes!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I\'ll kill you!', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Let\'s see what\'s hiding under that mask!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Let me have my dignity!', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Tickle Tickle!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Stop!', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I\'m gonna tickle you!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: It\'s not dignified!', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Cheer up!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Leave me alone!', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: This\'ll perk you up!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Enough!', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Enough with the angry eyes.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Don\'t. You. Dare.', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Let\'s see what\'s hiding under that mask!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: No, you can\'t do thiheehehehehehahhahaha!', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Tickle Tickle!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Hehe... No!', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I\'m gonna tickle you!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Heheheheh!', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Cheer up!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Nothing you dohoohoohah... Argh, enough!', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: This\'ll perk you up!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Gah! I won\'t hehe let heehee you... AHAHA!', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Enough with the angry eyes!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: D-Damn you! I\'ll hav-haveheahaha.', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Let\'s see what\'s hiding under that mask!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Heheheehe!', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: Tickle Tickle!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Hahahaha!', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I\'m gonna tickle you!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: AHAHAHAHAHAA!', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Cheer up!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: HAHAHAHAHAHA! NoooOO!! STOpHAHAHAHA!!!', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: This\'ll perk you up.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: OHAAhAHAaa!', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Enough with the angry eyes!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: HAHAHAHAHAAAAHAHA!', 'talking'=>true,'proc'=>nil},\
			]\
		},\
	],\
	'kiss' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1  (Caress)', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Get away from me!', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: (Kiss)', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: ...', 'talking'=>false,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: (Smooch)', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Why did you do that?', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: (Peck)', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: So this is what I\'ve been reduced too?', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: (Nibble)', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Get off of me you filthy pervert!', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: (Snog)', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: No! Don\'t!', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1  (Caress)', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: ...why?', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: (Kiss)', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: ...', 'talking'=>false,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: (Smooch)', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Who do you think you are?', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: (Peck)', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Is this how my story ends?', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: (Nibble)', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Stop it!', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: (Snog)', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: You think I\'ll let this go unpunished!?', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1  (Caress)', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Oh...', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: (Kiss)', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Mmmm...', 'talking'=>false,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: (Smooch)', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I\'m not sure that\'s helping...', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1  (Peck)', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Why...?', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: (Nibble)', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Hm... That makes me feel... strange...', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: (Snog)', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Humph...', 'talking'=>false,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1  (Caress)', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: T-thank you.', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: (Kiss)', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Just a little longer...', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: (Smooch)', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I am yours now.', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1  (Peck)', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I\'m... Happy?', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: (Nibble)', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Please... Again.', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1  (Snog)', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I can think of worse ways to spend the day.', 'talking'=>true,'proc'=>nil},\
			]\
		},\
	],\
	'ungag' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: You\'re much cuter like that.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I don\'t think it\'s proper to gag a woman.', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I guess I\'ll ungag you now...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Bleh! Don\'t do that again!', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I guess you\'ve learned your lesson.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Who do you think you are to silence me?', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: ...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Why won\'t you let me speak?', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: See how peaceful things can be?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Will you just let me talk?', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Silence is golden.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I can\'t wait until it\'s my turn to muzzle you like the dog you are.', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: You\'re much cuter like that.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: What would people think if they saw?', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I guess I\'ll ungag you now...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I hate that taste...', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I guess you learned your lesson.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I will not be tamed like some animal.', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: ...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I have a voice you know. Let me use it.', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: See how peaceful things can be?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Don\'t silence me again.', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Silence is golden.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I won\'t be silenced forever.', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: You\'re much cuter like that.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: How can you be so comfortable with this?', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I guess I\'ll ungag you now...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: It felt stuffy...', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I guess you learned your lesson.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: You\'re thinking of gagging me again, aren\'t you?', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: ...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: We can have a dialogue, just give me a chance.', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: See how peaceful things can be?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: At least warn me first.', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Silence is golden.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Just let me have my say.', 'talking'=>true,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: You\'re much cuter like that.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Well... I guess no one\'s watching...', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I guess I\'ll ungag you now...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I think... I think I\'m starting to like it...', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: I guess you learned your lesson.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: You can put it back in if you want.', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: ...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I\'ll be nice and quiet, unless you want to make sure.', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: See how peaceful things can be?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Whatever you want, I\'ll accept it.', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Silence is golden.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: If I spoke out of turn... I\'m sorry.', 'talking'=>true,'proc'=>nil},\
			]\
		},\
	],\
	'blindfold_on' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Do you trust me?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Not one bit.', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Marcia: Take it off!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: When I feel like it.', 'talking'=>false,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Here, a gift from me to you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Get this off of me!', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Don\'t give me that look...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Do as you wish...', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I think you need time to think.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Remove this now!', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Lights out!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: GRRRR!', 'talking'=>false,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Do you trust me?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Honestly, no.', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Marcia: Take it off!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: When I feel like it.', 'talking'=>false,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Here, a gift from me to you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I don\'t want this!', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Don\'t give me that look...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Have your fun.', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I think you need time to think.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I\'ve had enough!', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Lights out!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Grrrrr.....', 'talking'=>false,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Do you trust me?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I don\'t want it on.', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Marcia: Take it off.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: When I feel like it.', 'talking'=>false,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Here, a gift from me to you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Stop this, Suki1.', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Don\'t give me that look...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: (Sigh)', 'talking'=>false,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I think you need time to think.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Can you take it off?', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Lights out!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: ...', 'talking'=>false,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Suki1: Do you trust me?', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I-I have a confession... When I was younger I was scared of the dark. B-but as long as you\'re here...', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Suki1: I can take it off if you like.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I suppose I can stay like this a little longer...', 'talking'=>true,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Suki1: Here a gift from me to you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: If this is how you want me....', 'talking'=>true,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Suki1: Don\'t give me that look...', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Just be gentle.', 'talking'=>true,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Suki1: I think you need time to think.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: I-I trust you Suki1.', 'talking'=>true,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Suki1: Light\'s out!', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Just... Don\'t be too rough.', 'talking'=>true,'proc'=>nil},\
			]\
		},\
	],\
	'blindfold_off' =>\
	[\
		{\
			'neutral' =>\
			[\
				{'text'=>'Marcia: Ah- that\'s a little better.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Good, now you can see me playing with you.', 'talking'=>false,'proc'=>nil},\
				{'text'=>'Marcia: Maybe being blindfolded was better...', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Marcia: That\'s better!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: I do love your eyes.', 'talking'=>false,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Marcia: About time!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Impatient.', 'talking'=>false,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Marcia: Took you long enough...', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: ... Ingrate.', 'talking'=>false,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Marcia: FINALLY!', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Keep being that loud and I\'ll bring out another gag.', 'talking'=>false,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Marcia: You\'ll pay for that.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Ready and waiting.', 'talking'=>false,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Marcia: Ah- it\'s better now.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: I\'m glad.', 'talking'=>false,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Marcia: It\'s an improvement.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: I\'ll say.', 'talking'=>false,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Marcia: Good to see again.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Seeing is believing.', 'talking'=>false,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Marcia: I like being able to take in my surroundings...', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Four brick walls, a floor, and a ceiling. Whoop dee doo.', 'talking'=>false,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Marcia: Is this a joke to you!?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: It is pretty funny.', 'talking'=>false,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Marcia: Don\'t think I\'ll forget this...', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: I\'m sure you won\'t forget to remind me.', 'talking'=>false,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Marcia: Thanks.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: You\'re welcome.', 'talking'=>true,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Marcia: Well, thanks at least.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: You\'re welcome, I guess.', 'talking'=>false,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Marcia: I suppose some thanks are in order.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: I suppose I have to say you\'re welcome.', 'talking'=>false,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Marcia: Hmmm... Well it wasn\'t so bad.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Can\'t argue with that.', 'talking'=>false,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Marcia: It wasn\'t funny.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: I respectfully disagree.', 'talking'=>false,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Marcia: Just... Stop okay?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Well... Maybe...', 'talking'=>false,'proc'=>nil},\
			]\
		},\
		{\
			'neutral' =>\
			[\
				{'text'=>'Marcia: I-I\'m... Well...(Blush)', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: hehe...', 'talking'=>false,'proc'=>nil},\
			],\
			'happiness' =>\
			[\
				{'text'=>'Marcia: Let\'s do that again.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Let\'s.', 'talking'=>false,'proc'=>nil},\
			],\
			'sadness' =>\
			[\
				{'text'=>'Marcia: Do you want to surprise me?', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Sure...?', 'talking'=>false,'proc'=>nil},\
			],\
			'fear' =>\
			[\
				{'text'=>'Marcia: Just, give me fair warning next time.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: No promises.', 'talking'=>false,'proc'=>nil},\
			],\
			'anger' =>\
			[\
				{'text'=>'Marcia: I\'ll be good.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Glad to hear it.', 'talking'=>false,'proc'=>nil},\
			],\
			'shyness' =>\
			[\
				{'text'=>'Marcia: Only you can do that to me.', 'talking'=>true,'proc'=>nil},\
				{'text'=>'Suki1: Only me...(Blush)', 'talking'=>false,'proc'=>nil},\
			]\
		},\
	]\
};
	end
end
$privateCellDamsels['marcia'] = PrivateCellDamselMarcia.new
