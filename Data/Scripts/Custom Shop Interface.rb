#========================================================================
# Leon's Shopping System
#-------------------------------------------------------------------------------
# 3/10/2007
# v. 1.0
#-------------------------------------------------------------------------------
# Instructions:
# Place above main, and below the other default scripts.
# (Yes, that is all of the instructions)
#
# Features:
# Replaces the default shop system.
#
#===============================================================================


#===============================================================================
# Window_Shop_Info
#===============================================================================
class Window_Shop_Info < Window_Base
def initialize
super(160, 0, 480, 64)
self.contents = Bitmap.new(width - 32, height - 32)
refresh
end

def refresh(selection = 0)
self.contents.clear
if selection == 0
self.contents.draw_text(0, 0, 448, 32, "Buy, sell, or leave?", 1)
else
self.contents.draw_text(0, 0, 448, 32, "Press 'Z' for character compatabilitiy.", 1)
end
end
end
#===============================================================================
# END Window_Shop_Info
#===============================================================================


#===============================================================================
# Window_Shop_Option
#===============================================================================
class Window_Shop_Option < Window_Selectable
def initialize
super(0, 0, 160, 128)
@option = ["Buy", "Sell", "Leave"]
@item_max = @option.size
self.contents = Bitmap.new(width - 32, height - 32)
self.index = 0
self.active = true
refresh
end

def refresh
self.contents.clear
for i in 0...@option.size
y = i * 32
self.contents.draw_text(0, y, 128, 32, @option[i], 1)
end
end
end
#===============================================================================
# END Window_Shop_Option
#===============================================================================


#===============================================================================
# Window_Shop_Gold
#===============================================================================
class Window_Shop_Gold < Window_Base
def initialize
super(0, 128, 160, 64)
self.contents = Bitmap.new(width - 32, height - 32)
refresh
end

def refresh
self.contents.clear
self.contents.font.color = system_color
self.contents.draw_text(0, 0, 60, 32, $data_system.words.gold + ":")
self.contents.font.color = normal_color
self.contents.draw_text(0, 0, 128, 32, $game_party.gold.to_s, 2)
end
end
#===============================================================================
# END Window_Shop_Gold
#===============================================================================


#===============================================================================
# Window_Shop_Own
#===============================================================================
class Window_Shop_Own < Window_Base
def initialize
super(0, 192, 160, 64)
self.contents = Bitmap.new(width - 32, height - 32)
item = nil
refresh(item)
end

def refresh(item)
self.contents.clear
self.contents.font.color = system_color
self.contents.draw_text(0, 0, 48, 32, "Own:")
if item == nil
return
end
self.contents.font.color = normal_color
case item
when RPG::Item
number = $game_party.item_number(item.id)
when RPG::Weapon
number = $game_party.weapon_number(item.id)
when RPG::Armor
number = $game_party.armor_number(item.id)
end
self.contents.draw_text(0, 0, 128, 32, number.to_s, 2)
end
end
#===============================================================================
# END Window_Shop_Own
#===============================================================================


#===============================================================================
# Window_Shop_List
#===============================================================================
class Window_Shop_List < Window_Selectable
def initialize(shop_goods)
super(160, 64, 480, 192)
self.contents = Bitmap.new(width - 32, height - 32)
self.active = false
self.index = 0
self.visible = false
@shop_goods = shop_goods
@sell = false
end

def item
if @data != nil
return @data[index]
end
end

def refresh
@sell = false
@option_index = nil
if self.contents != nil
self.contents.dispose
self.contents = nil
end
@data = []
for goods_item in @shop_goods
case goods_item[0]
when 0
item = $data_items[goods_item[1]]
when 1
item = $data_weapons[goods_item[1]]
when 2
item = $data_armors[goods_item[1]]
end
if item != nil
@data.push(item)
end
end
@item_max = @data.size
if @item_max > 0
self.contents = Bitmap.new(width - 32, row_max * 32)
for i in 0...@item_max
draw_item(i)
end
end
end

def refresh_sell(option_index)
@sell = true
@option_index = option_index
if self.contents != nil
self.contents.dispose
self.contents = nil
end
@data = []
for i in 1...$data_items.size
if $game_party.item_number(i) > 0
@data.push($data_items[i])
end
end
for i in 1...$data_weapons.size
if $game_party.weapon_number(i) > 0
@data.push($data_weapons[i])
end
end
for i in 1...$data_armors.size
if $game_party.armor_number(i) > 0
@data.push($data_armors[i])
end
end
@item_max = @data.size
if @item_max > 0
self.contents = Bitmap.new(width - 32, row_max * 32)
for i in 0...@item_max
draw_item(i)
end
end
end

def draw_item(index)
item = @data[index]
case item
when RPG::Item
number = $game_party.item_number(item.id)
when RPG::Weapon
number = $game_party.weapon_number(item.id)
when RPG::Armor
number = $game_party.armor_number(item.id)
end
if @option_index == nil
if item.price <= $game_party.gold and number < 99
self.contents.font.color = normal_color
else
self.contents.font.color = disabled_color
end
else
self.contents.font.color = normal_color
end
x = 4
y = index * 32
if item.price == 0
self.contents.font.color = disabled_color
else
self.contents.font.color = normal_color
end
if @sell == false
if item.price < $game_party.gold and number < 99
self.contents.font.color = normal_color
else
self.contents.font.color = disabled_color
end
end
rect = Rect.new(x, y, self.width - 32, 32)
self.contents.fill_rect(rect, Color.new(0, 0, 0, 0))
bitmap = RPG::Cache.icon(item.icon_name)
opacity = self.contents.font.color == normal_color ? 255 : 128
self.contents.blt(x, y + 4, bitmap, Rect.new(0, 0, 24, 24), opacity)
self.contents.draw_text(x + 28, y, 212, 32, item.name, 0)
if @option_index == nil
self.contents.draw_text(x + 350, y, 88, 32, item.price.to_s, 2)
else
item_price = (item.price / 2).round
self.contents.draw_text(x + 350, y, 88, 32, item_price.to_s, 2)
end
end
end
#===============================================================================
# END Window_Shop_List
#===============================================================================


#===============================================================================
# Window_Shop_Description_Item
#===============================================================================
class Window_Shop_Description_Item < Window_Base
def initialize
super(90, 256, 460, 192)
self.contents = Bitmap.new(width - 32, height - 32)
self.visible = false
item = nil
refresh(item)
end

def refresh(item)
self.contents.clear
if item == nil
return
end
bitmap = RPG::Cache.icon(item.icon_name)
opacity = self.contents.font.color == normal_color ? 255 : 128
self.contents.blt(0, 4, bitmap, Rect.new(0, 0, 24, 24), opacity)
self.contents.draw_text(28, 0, 120, 32, item.name)
self.contents.draw_text(0, 32, 428, 32, item.description)
self.contents.font.color = system_color
self.contents.draw_text(0, 64, 120, 32, "Range:")
self.contents.draw_text(0, 96, 140, 32, "% HP Recovered:")
self.contents.draw_text(0, 128, 140, 32, "% SP Recovered:")
self.contents.draw_text(230, 96, 120, 32, "HP Recovered:")
self.contents.draw_text(230, 128, 120, 32, "SP Recovered:")
self.contents.font.color = normal_color
self.contents.draw_text(150, 96, 90, 32, item.recover_hp_rate.to_s)
self.contents.draw_text(150, 128, 90, 32, item.recover_sp_rate.to_s)
self.contents.draw_text(360, 96, 90, 32, item.recover_hp.to_s)
self.contents.draw_text(360, 128, 90, 32, item.recover_sp.to_s)
case item.scope
when 0
self.contents.draw_text(70, 64, 120, 32, "None")
when 1
self.contents.draw_text(70, 64, 120, 32, "One Enemy")
when 2
self.contents.draw_text(70, 64, 120, 32, "All Enemies")
when 3
self.contents.draw_text(70, 64, 120, 32, "One Ally")
when 4
self.contents.draw_text(70, 64, 120, 32, "All Allies")
when 5
self.contents.draw_text(70, 64, 120, 32, "One Dead Ally")
when 6
self.contents.draw_text(70, 64, 120, 32, "All Dead Allies")
when 7
self.contents.draw_text(70, 64, 120, 32, "User")
end
end
end
#===============================================================================
# END Window_Shop_Description_Item
#===============================================================================


#===============================================================================
# Window_Shop_Description_Equipment
#===============================================================================
class Window_Shop_Description_Equipment < Window_Base
def initialize
super(0, 256, 640, 224)
self.contents = Bitmap.new(width - 32, height - 32)
self.visible = false
item = nil
refresh(item)
end

def refresh(item)
self.contents.clear
if item == nil
return
end
bitmap = RPG::Cache.icon(item.icon_name)
opacity = self.contents.font.color == normal_color ? 255 : 128
self.contents.blt(0, 4, bitmap, Rect.new(0, 0, 24, 24), opacity)
self.contents.draw_text(28, 0, 120, 32, item.name)
self.contents.draw_text(0, 32, 460, 32, item.description)
self.contents.font.color = system_color
if item.is_a?(RPG::Weapon)
self.contents.draw_text(0, 64, 75, 32, "Attack:")
self.contents.draw_text(0, 96, 120, 32, "Phys. Def:")
self.contents.draw_text(0, 128, 120, 32, "Mag. Def:")
self.contents.draw_text(165, 64, 120, 32, "Str:")
self.contents.draw_text(165, 96, 120, 32, "Dex:")
self.contents.draw_text(165, 128, 120, 32, "Agi:")
self.contents.draw_text(165, 160, 120, 32, "Int:")
self.contents.draw_text(290, 64, 120, 32, "Elements:")
self.contents.draw_text(470, 64, 120, 32, "Inflicts:")
else
self.contents.draw_text(0, 64, 120, 32, "Phys. Def:")
self.contents.draw_text(0, 96, 120, 32, "Mag. Def:")
self.contents.draw_text(0, 128, 120, 32, "Evade:")
self.contents.draw_text(0, 160, 120, 32, "Auto:")
self.contents.draw_text(165, 64, 120, 32, "Str:")
self.contents.draw_text(165, 96, 120, 32, "Dex:")
self.contents.draw_text(165, 128, 120, 32, "Agi:")
self.contents.draw_text(165, 160, 120, 32, "Int:")
self.contents.draw_text(370, 64, 120, 32, "Guards Against:")
end
self.contents.font.color = normal_color
if item.is_a?(RPG::Weapon)
self.contents.draw_text(60, 64, 75, 32, item.atk.to_s)
self.contents.draw_text(90, 96, 75, 32, item.pdef.to_s)
self.contents.draw_text(90, 128, 75, 32, item.mdef.to_s)
self.contents.draw_text(195, 64, 50, 32, item.str_plus.to_s, 2)
self.contents.draw_text(195, 96, 50, 32, item.dex_plus.to_s, 2)
self.contents.draw_text(195, 128, 50, 32, item.agi_plus.to_s, 2)
self.contents.draw_text(195, 160, 50, 32, item.int_plus.to_s, 2)
self.contents.font.size = 14
for i in 0...item.element_set.size
x = 265 + i % 2 * 75
y = 80 + i / 2 * 14
self.contents.draw_text(x, y, 120, 32, $data_system.elements[item.element_set[i]])
end
for i in 0...item.plus_state_set.size
x = 445 + i % 2 * 75
y = 80 + i / 2 * 14
self.contents.draw_text(x, y, 120, 32, $data_states[item.plus_state_set[i]].name)
end
else
self.contents.draw_text(90, 64, 75, 32, item.pdef.to_s)
self.contents.draw_text(90, 96, 75, 32, item.mdef.to_s)
self.contents.draw_text(60, 128, 75, 32, item.eva.to_s)
if $data_states[item.auto_state_id] != nil
self.contents.draw_text(55, 160, 75, 32, $data_states[item.auto_state_id].name)
end
self.contents.draw_text(195, 64, 50, 32, item.str_plus.to_s, 2)
self.contents.draw_text(195, 96, 50, 32, item.dex_plus.to_s, 2)
self.contents.draw_text(195, 128, 50, 32, item.agi_plus.to_s, 2)
self.contents.draw_text(195, 160, 50, 32, item.int_plus.to_s, 2)
self.contents.font.size = 14
@defense = []
for i in 0...item.guard_element_set.size
@defense.push($data_system.elements[item.guard_element_set[i]])
end
for i in 0...item.guard_state_set.size
@defense.push($data_states[item.guard_state_set[i]].name)
end
for i in 0...@defense.size
x = 265 + i % 4 * 80
y = 80 + i / 4 * 14
self.contents.draw_text(x + 15, y, 85, 32, @defense[i])
end
end
self.contents.font.size = 22
end
end
#===============================================================================
# END Window_Shop_Description_Equipment
#===============================================================================


#===============================================================================
# Window_Shop_Actors
#===============================================================================
class Window_Shop_Actors < Window_Base
def initialize
super(84, 32, 472, 416)
self.contents = Bitmap.new(width - 32, height - 32)
self.visible = false
self.active = false
self.z += 100
item = nil
refresh(item)
end

def refresh(item)
self.contents.clear
if item == nil
return
end
for i in 0...$game_party.actors.size
x = i%2 * 236
y = i/2 * 192
draw_actor_graphic($game_party.actors[i], x + 16, y + 48)
draw_actor_name($game_party.actors[i], x + 48, y + 8)
pdef1 = item.pdef
mdef1 = item.mdef
str1 = item.str_plus
dex1 = item.dex_plus
agi1 = item.agi_plus
int1 = item.int_plus
atk2 = 0
eva2 = 0
pdef2 = 0
mdef2 = 0
str2 = 0
dex2 = 0
agi2 = 0
int2 = 0
if item.is_a?(RPG::Weapon)
if $data_weapons[$game_party.actors[i].weapon_id] != nil
atk1 = item.atk
atk2 = $data_weapons[$game_party.actors[i].weapon_id].atk
pdef2 = $data_weapons[$game_party.actors[i].weapon_id].pdef
mdef2 = $data_weapons[$game_party.actors[i].weapon_id].mdef
str2 = $data_weapons[$game_party.actors[i].weapon_id].str_plus
dex2 = $data_weapons[$game_party.actors[i].weapon_id].dex_plus
agi2 = $data_weapons[$game_party.actors[i].weapon_id].agi_plus
int2 = $data_weapons[$game_party.actors[i].weapon_id].int_plus
end
else
eva1 = item.eva
case item.kind
when 0
if $data_armors[$game_party.actors[i].armor1_id] != nil
eva2 = $data_armors[$game_party.actors[i].armor1_id].eva
pdef2 = $data_armors[$game_party.actors[i].armor1_id].pdef
mdef2 = $data_armors[$game_party.actors[i].armor1_id].mdef
str2 = $data_armors[$game_party.actors[i].armor1_id].str_plus
dex2 = $data_armors[$game_party.actors[i].armor1_id].dex_plus
agi2 = $data_armors[$game_party.actors[i].armor1_id].agi_plus
int2 = $data_armors[$game_party.actors[i].armor1_id].int_plus
end
when 1
if $data_armors[$game_party.actors[i].armor2_id] != nil
eva2 = $data_armors[$game_party.actors[i].armor2_id].eva
pdef2 = $data_armors[$game_party.actors[i].armor2_id].pdef
mdef2 = $data_armors[$game_party.actors[i].armor2_id].mdef
str2 = $data_armors[$game_party.actors[i].armor2_id].str_plus
dex2 = $data_armors[$game_party.actors[i].armor2_id].dex_plus
agi2 = $data_armors[$game_party.actors[i].armor2_id].agi_plus
int2 = $data_armors[$game_party.actors[i].armor2_id].int_plus
end
when 2
if $data_armors[$game_party.actors[i].armor3_id] != nil
eva2 = $data_armors[$game_party.actors[i].armor3_id].eva
pdef2 = $data_armors[$game_party.actors[i].armor3_id].pdef
mdef2 = $data_armors[$game_party.actors[i].armor3_id].mdef
str2 = $data_armors[$game_party.actors[i].armor3_id].str_plus
dex2 = $data_armors[$game_party.actors[i].armor3_id].dex_plus
agi2 = $data_armors[$game_party.actors[i].armor3_id].agi_plus
int2 = $data_armors[$game_party.actors[i].armor3_id].int_plus
end
when 3
if $data_armors[$game_party.actors[i].armor4_id] != nil
eva2 = $data_armors[$game_party.actors[i].armor4_id].eva
pdef2 = $data_armors[$game_party.actors[i].armor4_id].pdef
mdef2 = $data_armors[$game_party.actors[i].armor4_id].mdef
str2 = $data_armors[$game_party.actors[i].armor4_id].str_plus
dex2 = $data_armors[$game_party.actors[i].armor4_id].dex_plus
agi2 = $data_armors[$game_party.actors[i].armor4_id].agi_plus
int2 = $data_armors[$game_party.actors[i].armor4_id].int_plus
end
end
end
color1 = Color.new(25, 210, 25, 255)
color2 = Color.new(210, 25, 25, 255)
if $game_party.actors[i].equippable?(item)
self.contents.font.color = normal_color
# PDEF
if (pdef1 - pdef2) > 0
self.contents.font.color = color1
elsif (pdef1 - pdef2) < 0
self.contents.font.color = color2
else
self.contents.font.color = normal_color
end
self.contents.draw_text(x + 25, y + 80, 70, 32, (pdef1 - pdef2).to_s, 2)
# MDEF
if (mdef1 - mdef2) > 0
self.contents.font.color = color1
elsif (mdef1 - mdef2) < 0
self.contents.font.color = color2
else
self.contents.font.color = normal_color
end
self.contents.draw_text(x + 25, y + 112, 70, 32, (mdef1 - mdef2).to_s, 2)
# STR
if (str1 - str2) > 0
self.contents.font.color = color1
elsif (str1 - str2) < 0
self.contents.font.color = color2
else
self.contents.font.color = normal_color
end
self.contents.draw_text(x + 125, y + 48, 70, 32, (str1 - str2).to_s, 2)
# DEX
if (dex1 - dex2) > 0
self.contents.font.color = color1
elsif (dex1 - dex2) < 0
self.contents.font.color = color2
else
self.contents.font.color = normal_color
end
self.contents.draw_text(x + 125, y + 80, 70, 32, (dex1 - dex2).to_s, 2)
# AGI
if (agi1 - agi2) > 0
self.contents.font.color = color1
elsif (agi1 - agi2) < 0
self.contents.font.color = color2
else
self.contents.font.color = normal_color
end
self.contents.draw_text(x + 125, y + 112, 70, 32, (agi1 - agi2).to_s, 2)
# INT
if (int1 - int2) > 0
self.contents.font.color = color1
elsif (int1 - int2) < 0
self.contents.font.color = color2
else
self.contents.font.color = normal_color
end
self.contents.draw_text(x + 125, y + 144, 70, 32, (int1 - int2).to_s, 2)
if item.is_a?(RPG::Weapon)
self.contents.font.color = system_color
self.contents.draw_text(x, y + 48, 80, 32, "Atk:")
self.contents.draw_text(x, y + 80, 80, 32, "Pdef:")
self.contents.draw_text(x, y + 112, 80, 32, "Mdef:")
self.contents.draw_text(x + 110, y + 48, 80, 32, "Str:")
self.contents.draw_text(x + 110, y + 80, 80, 32, "Dex:")
self.contents.draw_text(x + 110, y + 112, 80, 32, "Agi:")
self.contents.draw_text(x + 110, y + 144, 80, 32, "Int:")
self.contents.font.color = normal_color
# ATTACK
if (atk1 - atk2) > 0
self.contents.font.color = color1
elsif (atk1 - atk2) < 0
self.contents.font.color = color2
else
self.contents.font.color = normal_color
end
self.contents.draw_text(x + 25, y + 48, 70, 32, (atk1 - atk2).to_s, 2)
# ELSE if armor...
else
self.contents.font.color = system_color
self.contents.draw_text(x, y + 48, 80, 32, "Eva:")
self.contents.draw_text(x, y + 80, 80, 32, "Pdef:")
self.contents.draw_text(x, y + 112, 80, 32, "Mdef:")
self.contents.draw_text(x + 110, y + 48, 80, 32, "Str:")
self.contents.draw_text(x + 110, y + 80, 80, 32, "Dex:")
self.contents.draw_text(x + 110, y + 112, 80, 32, "Agi:")
self.contents.draw_text(x + 110, y + 144, 80, 32, "Int:")
self.contents.font.color = normal_color
if (eva1 - eva2) > 0
self.contents.font.color = color1
elsif (eva1 - eva2) < 0
self.contents.font.color = color2
else
self.contents.font.color = normal_color
end
self.contents.draw_text(x + 25, y + 48, 70, 32, (eva1 - eva2).to_s, 2)
end
else
self.contents.font.color = disabled_color
self.contents.draw_text(x + 10, y + 80, 120, 32, "Cannot Equip")
self.contents.font.color = normal_color
end
end
end
end
#===============================================================================
# END Window_Shop_Actors
#===============================================================================


#===============================================================================
# Window_Shop_Amount
#===============================================================================
class Window_Shop_Amount < Window_Selectable

attr_accessor :amount

def initialize
super(80, 208, 480, 96)
@item_max = 1
self.contents = Bitmap.new(width - 32, height - 32)
self.visible = false
self.z += 100
@amount = 1
item = $data_items[1]
option_index = 0
refresh(item, option_index)
end

def refresh(item, option_index)
self.contents.clear
if item == nil
return
end
if option_index == nil
return
end
if option_index == 0
self.contents.font.color = system_color
self.contents.draw_text(0, 0, 200, 32, "How many?")
self.contents.font.color = normal_color
if $game_party.gold < (@amount * item.price)
self.contents.font.color = disabled_color
end
bitmap = RPG::Cache.icon(item.icon_name)
opacity = self.contents.font.color == normal_color ? 255 : 128
self.contents.blt(0, 36, bitmap, Rect.new(0, 0, 24, 24), opacity)
self.contents.draw_text(28, 32, 120, 32, item.name)
self.contents.draw_text(335, 32, 10, 32, "x")
self.contents.draw_text(280, 32, 30, 32, @amount.to_s, 2)
self.cursor_rect.set(284, 32, 32, 32)
self.contents.draw_text(370, 32, 70, 32, (@amount * item.price).to_s, 2)
else
self.contents.font.color = system_color
self.contents.draw_text(0, 0, 200, 32, "How many?")
self.contents.font.color = normal_color
bitmap = RPG::Cache.icon(item.icon_name)
opacity = self.contents.font.color == normal_color ? 255 : 128
self.contents.blt(0, 36, bitmap, Rect.new(0, 0, 24, 24), opacity)
self.contents.draw_text(28, 32, 120, 32, item.name)
self.contents.draw_text(335, 32, 10, 32, "x")
self.contents.draw_text(280, 32, 30, 32, @amount.to_s, 2)
self.cursor_rect.set(284, 32, 32, 32)
self.contents.draw_text(370, 32, 70, 32, (@amount * (item.price / 2)).to_s, 2)
end
end
end
#===============================================================================
# END Window_Shop_Amount
#===============================================================================


#===============================================================================
# Scene_Shop
#===============================================================================
class Scene_Shop
def main
@counter = 0
@info_window = Window_Shop_Info.new
@option_window = Window_Shop_Option.new
@gold_window = Window_Shop_Gold.new
@own_window = Window_Shop_Own.new
@list_window = Window_Shop_List.new($game_temp.shop_goods)
@desc_item_window = Window_Shop_Description_Item.new
@desc_equip_window = Window_Shop_Description_Equipment.new
@actor_window = Window_Shop_Actors.new
@amount_window = Window_Shop_Amount.new

Graphics.transition
loop do
Graphics.update
Input.update
update
if $scene != self
break
end
end
Graphics.freeze

@info_window.dispose
@option_window.dispose
@gold_window.dispose
@own_window.dispose
@list_window.dispose
@desc_item_window.dispose
@desc_equip_window.dispose
@actor_window.dispose
@amount_window.dispose
end

def update
@info_window.update
@option_window.update
@gold_window.update
@own_window.update
@list_window.update
@desc_item_window.update
@desc_equip_window.update
@actor_window.update
@amount_window.update

if @option_window.active
update_option
return
end

if @list_window.active
update_list
return
end

if @actor_window.visible
update_actors
return
end

if @amount_window.active and @option_window.index == 0
update_amount
return
end

if @amount_window.active and @option_window.index == 1
update_sell
return
end
end

def update_option
@info_window.refresh(0)
if Input.trigger?(Input::B)
$game_system.se_play($data_system.cancel_se)
$scene = Scene_Map.new
return
end
if Input.trigger?(Input::C)
case @option_window.index
when 0
$game_system.se_play($data_system.decision_se)
@list_window.refresh
@option_window.active = false
@list_window.visible = true
@list_window.active = true
@list_window.index = 0
when 1
$game_system.se_play($data_system.decision_se)
@list_window.refresh_sell(@option_window.index)
@option_window.active = false
@list_window.visible = true
@list_window.active = true
@list_window.index = 0
when 2
$game_system.se_play($data_system.cancel_se)
$scene = Scene_Map.new
return
end
end
end

def update_list
@info_window.refresh(1)
@item = @list_window.item
if @counter != 1
if @item.is_a?(RPG::Item)
@desc_item_window.refresh(@item)
@counter = 1
else
@desc_equip_window.refresh(@item)
@counter = 1
end
end
@own_window.refresh(@list_window.item)
if Input.trigger?(Input::UP) or Input.trigger?(Input::DOWN) or Input.repeat?(Input::UP) or Input.repeat?(Input::DOWN)
@counter = 0
end
if @item.is_a?(RPG::Item)
if @counter != 1
@desc_item_window.refresh(@item)
@counter = 1
end
@desc_item_window.visible = true
@desc_equip_window.visible = false
else
if @counter != 1
@desc_equip_window.refresh(@item)
@counter = 1
end
@desc_item_window.visible = false
@desc_equip_window.visible = true
end
if Input.trigger?(Input::B)
@counter = 0
$game_system.se_play($data_system.cancel_se)
@desc_item_window.visible = false
@desc_equip_window.visible = false
@desc_item_window.refresh(nil)
@desc_equip_window.refresh(nil)
@option_window.active = true
@list_window.visible = false
@list_window.active = false
@own_window.refresh(nil)
return
end
if Input.trigger?(Input::A)
unless @item.is_a?(RPG::Item)
$game_system.se_play($data_system.decision_se)
@actor_window.refresh(@item)
@actor_window.visible = true
@list_window.active = false
return
else
$game_system.se_play($data_system.buzzer_se)
end
end
if Input.trigger?(Input::C)
if @item == nil or @item.id == 0 or @item.price == 0
$game_system.se_play($data_system.buzzer_se)
return
end
if @option_window.index == 0
case @item
when RPG::Item
if $game_party.item_number(@item.id) >= 99
$game_system.se_play($data_system.buzzer_se)
return
end
when RPG::Weapon
if $game_party.weapon_number(@item.id) >= 99
$game_system.se_play($data_system.buzzer_se)
return
end
when RPG::Armor
if $game_party.armor_number(@item.id) >= 99
$game_system.se_play($data_system.buzzer_se)
return
end
end
end
$game_system.se_play($data_system.decision_se)
@amount_window.visible = true
@amount_window.active = true
@list_window.active = false
return
end
end

def update_actors
if Input.trigger?(Input::B)
$game_system.se_play($data_system.cancel_se)
@actor_window.visible = false
@list_window.active = true
end
end

def update_amount
@amount_window.refresh(@item, @option_window.index)
if Input.trigger?(Input::B)
$game_system.se_play($data_system.cancel_se)
@amount_window.amount = 1
@amount_window.visible = false
@amount_window.active = false
@list_window.active = true
return
end
if Input.trigger?(Input::C)
if $game_party.gold >= (@amount_window.amount * @item.price)
$game_system.se_play($data_system.decision_se)
$game_party.lose_gold(@amount_window.amount * @item.price)
case @item
when RPG::Item
$game_party.gain_item(@item.id, @amount_window.amount)
when RPG::Weapon
$game_party.gain_weapon(@item.id, @amount_window.amount)
when RPG::Armor
$game_party.gain_armor(@item.id, @amount_window.amount)
end
@gold_window.refresh
@amount_window.amount = 1
@amount_window.visible = false
@amount_window.active = false
@list_window.active = true
@list_window.refresh
return
else
$game_system.se_play($data_system.buzzer_se)
end
end
if Input.trigger?(Input::LEFT)
$game_system.se_play($data_system.cursor_se)
@amount_window.amount -= 1
if @amount_window.amount == 0
@amount_window.amount = 1
end
return
end
if Input.trigger?(Input::RIGHT)
$game_system.se_play($data_system.cursor_se)
@amount_window.amount += 1
case @item
when RPG::Item
if ($game_party.item_number(@item.id) + @amount_window.amount) > 99
@amount_window.amount = (99 - $game_party.item_number(@item.id))
end
when RPG::Weapon
if ($game_party.weapon_number(@item.id) + @amount_window.amount) > 99
@amount_window.amount = (99 - $game_party.weapon_number(@item.id))
end
when RPG::Armor
if ($game_party.armor_number(@item.id) + @amount_window.amount) > 99
@amount_window.amount = (99 - $game_party.armor_number(@item.id))
end
end
return
end
if Input.trigger?(Input::UP)
$game_system.se_play($data_system.cursor_se)
@amount_window.amount += 10
case @item
when RPG::Item
if ($game_party.item_number(@item.id) + @amount_window.amount) > 99
@amount_window.amount = (99 - $game_party.item_number(@item.id))
end
when RPG::Weapon
if ($game_party.weapon_number(@item.id) + @amount_window.amount) > 99
@amount_window.amount = (99 - $game_party.weapon_number(@item.id))
end
when RPG::Armor
if ($game_party.armor_number(@item.id) + @amount_window.amount) > 99
@amount_window.amount = (99 - $game_party.armor_number(@item.id))
end
end
return
end
if Input.trigger?(Input::DOWN)
$game_system.se_play($data_system.cursor_se)
@amount_window.amount -= 10
if @amount_window.amount < 1
@amount_window.amount = 1
end
return
end
end

def update_sell
@amount_window.refresh(@item, @option_window.index)
if Input.trigger?(Input::B)
$game_system.se_play($data_system.cancel_se)
@amount_window.amount = 1
@amount_window.visible = false
@amount_window.active = false
@list_window.active = true
return
end
if Input.trigger?(Input::C)
if @item.price == 0
$game_system.se_play($data_system.buzzer_se)
return
end
$game_system.se_play($data_system.decision_se)
case @item
when RPG::Item
$game_party.gain_gold(@amount_window.amount * (@item.price / 2))
$game_party.lose_item(@item.id, @amount_window.amount)
when RPG::Weapon
$game_party.gain_gold(@amount_window.amount * (@item.price / 2))
$game_party.lose_weapon(@item.id, @amount_window.amount)
when RPG::Armor
$game_party.gain_gold(@amount_window.amount * (@item.price / 2))
$game_party.lose_armor(@item.id, @amount_window.amount)
end
@gold_window.refresh
@amount_window.amount = 1
@amount_window.visible = false
@amount_window.active = false
@list_window.active = true
@list_window.refresh_sell(@option_window.index)
@desc_equip_window.refresh(nil)
@desc_item_window.refresh(nil)
end
if Input.trigger?(Input::LEFT)
$game_system.se_play($data_system.cursor_se)
@amount_window.amount -= 1
if @amount_window.amount < 1
@amount_window.amount = 1
end
end
if Input.trigger?(Input::RIGHT)
$game_system.se_play($data_system.cursor_se)
case @item
when RPG::Item
@amount_window.amount += 1
if @amount_window.amount > $game_party.item_number(@item.id)
@amount_window.amount = $game_party.item_number(@item.id)
end
when RPG::Weapon
@amount_window.amount += 1
if @amount_window.amount > $game_party.weapon_number(@item.id)
@amount_window.amount = $game_party.weapon_number(@item.id)
end
when RPG::Armor
@amount_window.amount += 1
if @amount_window.amount > $game_party.armor_number(@item.id)
@amount_window.amount = $game_party.armor_number(@item.id)
end
end
end
if Input.trigger?(Input::UP)
$game_system.se_play($data_system.cursor_se)
case @item
when RPG::Item
@amount_window.amount += 10
if @amount_window.amount > $game_party.item_number(@item.id)
@amount_window.amount = $game_party.item_number(@item.id)
end
when RPG::Weapon
@amount_window.amount += 10
if @amount_window.amount > $game_party.weapon_number(@item.id)
@amount_window.amount = $game_party.weapon_number(@item.id)
end
when RPG::Armor
@amount_window.amount += 10
if @amount_window.amount > $game_party.armor_number(@item.id)
@amount_window.amount = $game_party.armor_number(@item.id)
end
end
end
if Input.trigger?(Input::DOWN)
$game_system.se_play($data_system.cursor_se)
@amount_window.amount -= 10
if @amount_window.amount < 1
@amount_window.amount = 1
end
end
end

end