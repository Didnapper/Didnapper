#--------------------------------------------------------------------------
# Untouchable Actor States
# by Kendrian
#--------------------------------------------------------------------------


module Untouchable
  NOTOUCH = 22 #State ID 1
  IGNORE = 24 #State ID 2
  IGNORE2 = 39 #State ID 3
end

#--------------------------------------------------------------------------
# * Random Selection of Target Actor
# hp0 : limited to actors with 0 HP
#--------------------------------------------------------------------------

class Game_Party
  include Untouchable
  
  def random_target_actor(hp0 = false)
  # Initialize roulette
  roulette = []
  # Loop
 for actor in @actors
 # If it fits the conditions
 if (not hp0 and actor.exist?) or (hp0 and actor.hp0?)
  next if actor.state?(NOTOUCH) or actor.state?(IGNORE) or actor.state?(IGNORE2) #This would be all you need to edit.
# Get actor class [position]
position = $data_classes[actor.class_id].position
# Front guard: n = 4; Mid guard: n = 3; Rear guard: n = 2
n = 4 - position
# Add actor to roulette n times
n.times do
roulette.push(actor)
  end
 end
end
# If roulette size is 0
if roulette.size == 0
 return nil
end
# Spin the roulette, choose an actor
return roulette[rand(roulette.size)]
 end
end
