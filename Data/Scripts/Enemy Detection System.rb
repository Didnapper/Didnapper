#--------------------------------------------------------------------------
# Enemy Detection System
# by Gubid - 8/12/07
# v 1.2.2 Updated 10/2/07
#--------------------------------------------------------------------------
#Description:
#This system allows events that are named something including "ENEMY" then
#that event will be told to approach Game_Player, until Game_Player has gotten
#a specified distance away. At that time event will return to its original
#position if desired. If you happen to get close enough to the returning event
#it will begin to follow you again.
#
#Thanks to Near Fantasia for supplying the slightly modified path finding script.
#--------------------------------------------------------------------------
#if there are any questions as to the use of this script or
#modifications/additions/etc, please post it to the thread on CreationAyslum.net
#--------------------------------------------------------------------------

#--------------------------------------------------------------------------
#Update_Detect - How to Stop Detection if desired
#--------------------------------------------------------------------------
#1. Within a event, add a SCRIPT (3rd page)
#2. type "update_detect(EVENT_ID, TRUE/FALSE)" -Note: it defaults to false

#--------------------------------------------------------------------------
#RETURN TO POSITION
#--------------------------------------------------------------------------
#Use this to determine if you would like the event to return to its original
#position or not.
#--------------------------------------------------------------------------
RETURN_TO_POSITION = false

#--------------------------------------------------------------------------
#CHASE_SPEED and ENABLE_SPEED_CHANGE
#--------------------------------------------------------------------------
#Use this to set the speed in which enemies will approach after spotting you
#and whether or not their speed will change.
#--------------------------------------------------------------------------
CHASE_SPEED = 3
ENABLE_SPEED_CHANGE = true

#--------------------------------------------------------------------------
#VIEW_RANGE
#--------------------------------------------------------------------------
#Use this to set the distance in which you must be in order to start the detection
#process, or escape to stop.
#--------------------------------------------------------------------------
VIEW_RANGE = 3

#--------------------------------------------------------------------------
#ESCAPE_RANGE
#--------------------------------------------------------------------------
#Use this to set the distance in which you must escape to stop the detection process
#--------------------------------------------------------------------------
ESCAPE_RANGE = 6

#--------------------------------------------------------------------------
#Other Notes
#--------------------------------------------------------------------------
#If the event has a custom move route, they will resume that route when finished
#chasing you, but if you dont set RETURN_TO_POSITION, then they will resume
#their custom route at the location they stopped chasing you.

class Game_Map
#--------------------------------------------------------------------------
# * Frame Update
#--------------------------------------------------------------------------
alias en_detect_gm_update update
def update
en_detect_gm_update

# Update map event
for event in @events.values
if !event.name.include?("enemy")
next
else
if event.character_name != ""
if event.stop_detect?
next
end
if check_distance(event.id) == true
if event.exclamation == false
event.old_type = event.move_type
event.move_type = 2
if ENABLE_SPEED_CHANGE
event.old_speed = event.move_speed
event.move_speed = CHASE_SPEED
end
event.exclamation = true
event.animation_id = 98 #98 happens to be the exclamation animation
event.f_route.clear
end
else
if event.exclamation == true
event.exclamation = false
if RETURN_TO_POSITION == true
if event.x != @map.events[event.id].x or event.y != @map.events[event.id].y
route = get_route(event, @map.events[event.id].x, @map.events[event.id].y)
event.run_route(route)
end
else
event.restore_route
end
end
end
end
end
end
end

def check_distance(id = nil)
unless id == nil
event = $game_map.events[id]
range = ($game_player.x - event.x).abs + ($game_player.y - event.y).abs

if range <= VIEW_RANGE and range > 0
return true
elsif range <= ESCAPE_RANGE and range > 0 and event.exclamation
return true
end
end
end

def get_route(event, x=0, y=0)
target_x = x
target_y = y
max = (target_x - event.x).abs + (target_y - event.y).abs + 5
position = [[event.x, event.y]]
route = [[]]
more_step = [0]
for i in more_step
x = position[i][0]
y = position[i][1]
if !position.include?([x, y + 1]) and event.passable?(x, y, 2)
position.push([x, y + 1])
route.push(route[i] + [2])
if route[i].size + 1 < max
more_step.push(route.index(route[i] + [2]))
end
end

if !position.include?([x - 1, y]) and event.passable?(x, y, 4)
position.push([x - 1, y])
route.push(route[i] + [4])
if route[i].size + 1 < max
more_step.push(route.index(route[i] + [4]))
end
end

if !position.include?([x + 1, y]) and event.passable?(x, y, 6)
position.push([x + 1, y])
route.push(route[i] + [6])
if route[i].size + 1 < max
more_step.push(route.index(route[i] + [6]))
end
end

if !position.include?([x, y - 1]) and event.passable?(x, y, 8)
position.push([x, y - 1])
route.push(route[i] + [8])
if route[i].size + 1 < max
more_step.push(route.index(route[i] + [8]))
end
end
end
if position.index([target_x, target_y]) == false
return [2]
else
return route[position.index([target_x, target_y])]
end
end
end


class Game_Event
attr_accessor :move_type
attr_accessor :move_speed
attr_accessor :old_speed
attr_accessor :exclamation
attr_accessor :old_type
attr_accessor :stop_trigger
attr_reader :f_route

def initialize(map_id, event)
super()
@map_id = map_id
@event = event
@id = @event.id
@erased = false
@starting = false
@through = true
@name = @event.name
@exclamation = false
@f_route = []
@step = 0
@old_type = @move_type
@old_move_route = @move_route
@old_speed = @move_speed
@stop_trigger = false
moveto(@event.x, @event.y)
refresh
end

def stop_detect?
return @stop_trigger
end

def restore_route
@move_type = @old_type
@move_route_index = @original_move_route_index
@move_speed = @old_speed
refresh
return
end

def name
return @name
end

alias en_det_update update
def update
if @f_route.size > 0
run_path unless self.moving?
if @f_route.size == 0
restore_route
end
end
en_det_update
end

def run_route(route)
@f_route = route
@step = 0
end

def run_path
if @f_route.size > 0
if @f_route[@step] == nil
@f_route = []
end
action = @f_route[@step]
@step += 1
case action
when 2
self.move_down
when 4
self.move_left
when 6
self.move_right
when 8
self.move_up
end
end
end
end

class Interpreter
def update_detect(id, set = false)
$game_map.events[id].stop_trigger = set
end

def spotted?
is_true = 0
for event in $game_map.events.values
if event.exclamation
is_true += 1
end
end
if is_true > 0
return true
else
return false
end
end

def change_switch(id = 0, value = false, type = 0, switch = "A")
if id > 0
if type == 0 #for use of main switches
#id is switch_id and value should set to true or false
$game_switches[id] = value
elsif type == 1 #For use of self switches
#id is event.id and switch is the desired selfswitch. It must be text!
#value is true or false
key = [$game_map.map_id, id, switch]
# Updates self switch
$game_self_switches[key] = value
end
# Refresh map
$game_map.need_refresh = true
return true
end
end
end