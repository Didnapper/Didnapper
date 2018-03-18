#============================================================
# ? [XP] ? Call Event ?
# * Missing features from RM2K
#------------------------------------------------------------
# ? by Woratana [woratana@hotmail.com]
# ? Thaiware RPG Maker Community
# ? Released Date: 04/05/2008
#------------------------------------------------------------
=begin
  
+[How to use: Version 2]+
=========================================================================
>> Call event from other map by call script:
  
callev(event id, page you want, map ID)
------------------------------------------------------------------------
e.g. callev(5,2,1)
^ to call event commands list from 'page 2' of 'event ID 5' in Map ID '1'
------------------------------------------------------------------------
>> Call event in current map by call script:
  
callev(event id, page you want)
------------------------------------------------------------------------
>> If you want to call event in current page that it's running,
set 'page you want' to 0
------------------------------------------------------------------------
*Note: You CANNOT call erased event!
========================================================================
=end
#------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------------
# วิธีใช้
# คำสั่ง call script ว่า
# callev(ID อีเว้นท์, หน้า, ID แมพ)
# หรือ
# callev(ID อีเว้นท์, หน้า) #ในกรณีเรียกอีเว้นท์จากแมพเดียวกัน
#
# ถ้าเกิดต้องการให้เรียกจากหน้าปัจจุบันของอีเว้นท์นั้น ๆ
# (กรณีอีเว้นท์นั้นมีหลายหน้า และแตกต่างกันไปตามเงื่อนไข)ก็แค่ใส่ 0 เข้าไปใน หน้า ครับ
#-------------------------------------------------------------------------------------------------------------------
# Make variable 'event' readable from outside
class Game_Event; attr_reader :event; end
class Interpreter
  def callev(evid = 0,page = 0, id_map = $game_map.map_id)
    return if evid == 0
    if id_map != $game_map.map_id
      # Load new map data if event is not from current map
      dest_map = load_data(sprintf("Data/Map%03d.rxdata", id_map))
      if page == 0
        # Get first page if user didn't set page
        inter_event = dest_map.events[evid].pages[0]
      else
        inter_event = dest_map.events[evid].pages[page - 1]
      end
    else
      # Use $game_map if event is in current map
      if page == 0
        inter_event = $game_map.events[evid]
      else
        inter_event = $game_map.events[evid].event.pages[page - 1]
      end
    end
    # Add new child_interpreter to run commands
    @child_interpreter = Interpreter.new(@depth + 1)
    # Add commands from target event
    @child_interpreter.setup(inter_event.list, @event_id)
  end
end