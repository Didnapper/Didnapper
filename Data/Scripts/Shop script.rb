=begin
#==============================================================================
# Improved Shop
# By gerkrt/gerrtunk
# Version: 2.0
# License: GPL, credits
#==============================================================================
 
This script add a lost feature from old rpgmakers: the option to select if you
wanted to buy, sell or both.
 
Also adds the option of modifing the price based in %. Buy and sell discount are
separated, so you can make any combination.
 
In 2.0, you can define any currency to use for shop(exp, gold, variable...) and
add items that if you cant add to your inventory and that modifiy a switch,
variable or call a common event.
 
Using this feature you can create easily any set of shops that tells skills or sells
specialized things, or whatever you need, with autocalled common events and
custom currencys, and some extra features.
 
-------FULL FEATURES-------------
 
Classic feature: the option to select if you wanted to buy, sell or both.
Prices modifications for selling and buying
 
Shops interfaces: You can make any number of different shops interface and
a default one, and then changue all values for they:
  -Gold type by total exp, gold or variable.
  -Gold name.
  -Customizte the used commands buy, sell, exit and his names.
  -Option to not show numbers or select item number
  -Option to exit when a buy is done
  -Windowskin
  -Title/Introduction
  
Special things: These items are special exceptions, where you can define 
some unique behaviors:
  -Actor & class buy restrictions
  -Active switch, modifiy variable or call common evenet when buyed
  -Switch that define if can buy or not a thing and other for things that when
    adquired cant be used more.
  
--------DISCOUNTS, TYPE AND GOLD TYPE---------
 
Before calling a shop, call this script&#058;
 
$game_temp.type = 0
$game_temp.buy_discount = 1.2
$game_temp.sell_discount = 0.8
$game_temp.gold_type = :gold
 
These is a call example.
$game_temp.type : When 2 player can only sell.  When 1 player can only buy. When 0
can do both. Note that this ONLY works with default interface or the interfaces
that have the 3 commands.
$game_temp.buy_discount : When you buy items the price is multiplied with this number.
$game_temp.sell_discount : When you sell items the price is multiplied with this number.
 
Note that 0.2 , the . is like a ,.
 
After the sop call, these values are restored to default ones. This means that
you can call a shop wiyhout adding the script call and that it will use:
 
Type = Buy & Sell
Buy & Sell discounts = 1
 
As a final option, you can put the discount or type using the values of 
a event variable calling this script&#058;
 
v = $game_variables[1]
$game_temp.sell_discount = v
 
or whatever type, buy, etc. This way its settled the value of the var 1 to that
 
--------CUSTOM SHOPS---------
The main idea of these options is that you can create or configurate the normal
shop to do some special things, for example:
 
-A travel shop that when you exit, you travel automatically. You have the code 
in the configuration already. Just call a shop with items 5,6,7,8 and changuing
the interface to :travel
 
 
-----INTERFACES------
A shop interface defines some basic things used in some shop. For example, the
currency type used, the vocabulary of the commands, etc. In this way, you can use
a different interface for each thing.
 
To add a interface paste the code each time:
    :travel => {
      :gold_type => [:var, 6],
      :gold_word => 'Potatos',
      :commands_used => [[:buy, 'Travel'], [:exit, 'Exit']],
      :dont_show_number => true, 
      :exit_when_buy => false,     
      :windowskin => 'greenieskin', 
      :title => 'Travel merchant: Where you want to go?'
    },
 
Where the :travel is a unique code used each time, and just respect the sintax
with the , {}, etc.
 
gold type: The currency used. Can be :gold, normal gold, :exp, will sum all party
actors exp and use it as his gold, and :var. var means that the gold value is 
setted using a event variable you control, so, you can create any custom gold. 
 
Note that for variables the syntax is different: [:var, 6], where 6 is the variable
id.
 
gold word: The word used in the money window of the shop.
 
commands used: Using this you can customitze a shop to be what you want. What you
do here is define the commands of the shop and the name thats drawn in the game. 
The posibles commands codes to configure are :buy, :sell, :exit.  
Then what you have to do is to add any of the three to the list, thats limited
in the []:
  [[:code, 'name'], [:code2, 'name2'], [:code3, 'name3'], ]
 
 
dont_show_number: Use this if you dont want to show or select the item number and
it will buy automatically 1. It cant be used when selling.
 
:exit_when_buy: This make than when you buy the first item, the shop automatically
closes, so, you can only buy or active a single thing.
 
windowskin : special windowskin used for all the windows
 
title  : text used for the description or introduction of a shop
 
To call a interface just use this call script&#058;
$game_temp.shop_interface = :travel 
Where travel is the interface name you write, that have to be new each time.
After the shop call, interface selection is reseted to default.
 
Note that exist a default interface. This is called always when no explicit interface
has been declared.
 
Finally you can desactive any option making they => false
 
-----SPECIAL THINGS----
Special things are items that are a exception from normal ones, that will work like
always. You have to use special things in order to create for example a skill learn
shop where each of his items call a common event and that event have a 'learn X skill'
in it.
 
Note althought that exist A LOT of options that you can use to create your custom.  
 
Finally, you can use special things only with buy options.
 
shops:
    # South Amband
    5 => {
      # variable di, valor
      :variable => [2,10],
      :switch => 1,
      :switch_can_buy => 5,
      :common_event => 1,
      :switch_adquired => nil, 
      :can_be_adquired_by_class => false,
      :can_be_adquired_by_actor => [1],
      },
      
variable: this makes that when you buy that item, the variable X its added the Z
value, where: [X,Z],
 
switch: active switch of id 1 when buyed
 
switch_can_buy: the switch that have to be active to can buy the item
 
common_event: common event id called when buy. Using this you can call a script
call in it or whatever you want!
 
switch_adquired: when this switch is active, the thing cant be buyed more. Use it
for things that you want to buy only 1 time.
 
can_be_adquired_by_class: List of classes that can buy this item. Note that 
it will search for a all the party actors. [id1, id2, id3]
 
can_be_adquired_by_actor: List of actors that can buy this item. Note that 
it will search for a all the party actors. [id1, id2, id3]
 
Desactivating that options: Put they to  => false. Then they wont do a thing.
 
The syntax to add more things is:
 
    # New comment
    23 => {
      # variable di, valor
      :variable => [2,10],
      :switch => 1,
      :switch_can_buy => 5,
      :common_event => 1,
 
      :switch_adquired => nil, 
      :can_be_adquired_by_class => false,
      :can_be_adquired_by_actor => [1],
      },
 
Where the 23 is the item id you want to use as a special thing, and the 
# New comment the textthat you can modify to organitze the configuration(just dont
erase the #!). 
 
Each time copy paste this, using a , as a separator and mantaining the starting
and final {] of the general and each thing config.
 
 
=end
 
=begin
 
module Wep
  
  # Custom interfaces
  Shop_interfaces = {
    :travel => {
      :gold_type => [:var, 6],
      :gold_word => 'Potatos',
      :commands_used => [[:buy, 'Travel'], [:exit, 'Exit']],
      :dont_show_number => true, 
      :exit_when_buy => true,
      :windowskin => false, 
      :title => 'Travel merchant: Where you want to go?'
    },
    
     # Its called when no interface specified. Traditional one.
    :default => {
      :gold_type => :gold,
      :gold_word => 'Gold',
      :commands_used => [[:buy, 'Buy'], [:sell, 'Sell'], [:exit, 'Exit']],
      :dont_show_number => false,
      :exit_when_buy => false,
      :windowskin => false,
      :title => false
    
   }
   
  }
  
  # Things to use
  Things = {
 
    # South Amband
    5 => {
 
      :variable => [2,10],
      :switch => 1,
      :switch_can_buy => 5,
      :common_event => 1,
      :switch_adquired => false, 
      :can_be_adquired_by_class => false,
      :can_be_adquired_by_actor => [1],
      },
      
    # Fantastica  
    6 => {
      :variable => [2,10],
      :switch => 1,
      :switch_can_buy => 5,
      :common_event => 1,
      :switch_adquired => false, 
      :can_be_adquired_by_class => [1],
      :can_be_adquired_by_actor => [1],
      },
      
    # Ridinia
    7 => {
      :variable => [2,10],
      :switch => 1,
      :switch_can_buy => 5,
      :common_event => 1,
      :switch_adquired => false,
      :can_be_adquired_by_class => [1],
      :can_be_adquired_by_actor => [1],
      },
      
    # Wepcondia
    8 => {
      :variable => [2,10],
      :switch => 1,
      :switch_can_buy => 5,
      :common_event => 1,
      :switch_adquired => false,
      :can_be_adquired_by_class => [1],
      :can_be_adquired_by_actor => [1],
      },
    }
    
end
 
 
#==============================================================================
# ** Window_ShopBuy
#------------------------------------------------------------------------------
#  This window displays buyable goods on the shop screen.
#==============================================================================
 
class Window_ShopBuy < Window_Selectable
  
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
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
        # Only push the ones that arent adquired and if item
        if item.is_a? RPG::Item and Wep::Things[item.id] != nil and
          Wep::Things[item.id][:switch_adquired] != false and
            $game_switches[Wep::Things[item.id][:switch_adquired]]
        
        # Or if the switch to buy isnt active 
        elsif item.is_a? RPG::Item and Wep::Things[item.id] != nil and
          Wep::Things[item.id][:switch_can_buy] != false and not
            $game_switches[Wep::Things[item.id][:switch_can_buy]]
        
        else
          @data.push(item)
        end
      end
    end
    
    # If item count is not 0, make a bit map and draw all items
    @item_max = @data.size
    if @item_max > 0
      self.contents = Bitmap.new(width - 32, row_max * 32)
      for i in 0...@item_max
        draw_item(i)
      end
    end
  end
  
  #--------------------------------------------------------------------------
  # * Draw Item
  #     index : item number
  #--------------------------------------------------------------------------
  def draw_item(index)
    item = @data[index]
    # Get items in possession
    case item
    when RPG::Item
      number = $game_party.item_number(item.id)
    when RPG::Weapon
      number = $game_party.weapon_number(item.id)
    when RPG::Armor
      number = $game_party.armor_number(item.id)
    end
    # If price is less than money in possession, and amount in possession is
    # not 99, then set to normal text color. Otherwise set to disabled color
    if item.price * $game_temp.buy_discount  <= $game_party.shop_gold and number < 99
      self.contents.font.color = normal_color
    else
      self.contents.font.color = disabled_color
    end
    
    
    rebajado = item.price * $game_temp.buy_discount
    rebajado = rebajado.to_i
    
 
    x = 4
    y = index * 32
    rect = Rect.new(x, y, self.width - 32, 32)
    self.contents.fill_rect(rect, Color.new(0, 0, 0, 0))
    bitmap = RPG::Cache.icon(item.icon_name)
    opacity = self.contents.font.color == normal_color ? 255 : 128
    self.contents.blt(x, y + 4, bitmap, Rect.new(0, 0, 24, 24), opacity)
    self.contents.draw_text(x + 28, y, 212, 32, item.name, 0)
   
 
    # When dont show numbers, number more to the right
    if $game_temp.act_shop_interface[:dont_show_number] 
      self.contents.draw_text(x + 480, y, 88, 32, rebajado.to_s, 2)
    else
      self.contents.draw_text(x + 240, y, 88, 32, rebajado.to_s, 2)
    end
    
  end
end
 
 
 
#==============================================================================
# ** Window_ShopCommand
#------------------------------------------------------------------------------
#  This window is used to choose your business on the shop screen.
#==============================================================================
 
class Window_ShopCommand < Window_Selectable
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    super(0, 64, 480, 64)
    self.contents = Bitmap.new(width - 32, height - 32)
    
    @column_max = 3
    #Excepciones de tipo
    cums = Wep::Shop_interfaces[$game_temp.shop_interface][:commands_used]
 
    # Make custom commmands
    @commands = []
    for cu in cums
      @commands.push cu[1]
    end
    
    @item_max = @commands.size
    
    refresh
    self.index = 0
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    self.contents.clear
    for i in 0...@item_max
      draw_item(i)
    end
  end
  #--------------------------------------------------------------------------
  # * Draw Item
  #     index : item number
  #--------------------------------------------------------------------------
  def draw_item(index)
    x = 4 + index * 160
      #Excepciones de tipo
    case $game_temp.type
      when 1
        #Canvio de color de fuente y retorno de la misma
        if index == 1
          self.contents.font.color = disabled_color
        end
       
        if index == 2
          self.contents.font.color = normal_color
        end
         
       
      when 2
        #Canvio de color de fuente y retorno de la misma
        if index == 0
          self.contents.font.color = disabled_color
        end
        if index == 1...2
          self.contents.font.color = normal_color
        end
    end
   #p @commands, index
    self.contents.draw_text(x, 0, 128, 32, @commands[index])
  end
end
 
 
 
class Scene_Shop
 
  #--------------------------------------------------------------------------
  # * Main Processing
  #--------------------------------------------------------------------------
  def main
    # Make help window
    @help_window = Window_Help.new
    # Make command window
    @command_window = Window_ShopCommand.new
    # Make gold window
    @gold_window = Window_GoldShop.new
    @gold_window.x = 480
    @gold_window.y = 64
    # Make dummy window
    @dummy_window = Window_Base.new(0, 128, 640, 352)
    # Make buy window
    @buy_window = Window_ShopBuy.new($game_temp.shop_goods)
    @buy_window.active = false
    @buy_window.visible = false
    @buy_window.help_window = @help_window
    # Make sell window
    @sell_window = Window_ShopSell.new
    @sell_window.active = false
    @sell_window.visible = false
    @sell_window.help_window = @help_window
    # Make quantity input window
    @number_window = Window_ShopNumber.new
    @number_window.active = false
    @number_window.visible = false
    # Make status window
    @status_window = Window_ShopStatus.new
    @status_window.visible = false
    # If dont show number
    if Wep::Shop_interfaces[$game_temp.shop_interface][:dont_show_number]
      @number_window.visible = false
      @status_window.visible = false
      @buy_window.width = 640
      @buy_window.z = @status_window.z + 80
    end
    
    # Windoskin
    if Wep::Shop_interfaces[$game_temp.shop_interface][:windowskin]
      @sell_window.windowskin = RPG::Cache.windowskin( Wep::Shop_interfaces[$game_temp.shop_interface][:windowskin])
      @number_window.windowskin = RPG::Cache.windowskin( Wep::Shop_interfaces[$game_temp.shop_interface][:windowskin])
      @status_window.windowskin = RPG::Cache.windowskin( Wep::Shop_interfaces[$game_temp.shop_interface][:windowskin])
      @buy_window.windowskin = RPG::Cache.windowskin( Wep::Shop_interfaces[$game_temp.shop_interface][:windowskin])
      @help_window.windowskin =  RPG::Cache.windowskin( Wep::Shop_interfaces[$game_temp.shop_interface][:windowskin])
      @gold_window.windowskin =  RPG::Cache.windowskin( Wep::Shop_interfaces[$game_temp.shop_interface][:windowskin])
      @command_window.windowskin =  RPG::Cache.windowskin( Wep::Shop_interfaces[$game_temp.shop_interface][:windowskin])
      @dummy_window .windowskin =  RPG::Cache.windowskin( Wep::Shop_interfaces[$game_temp.shop_interface][:windowskin])
    end
   
    # Execute transition
    Graphics.transition
    # Main loop
    loop do
      # Update game screen
      Graphics.update
      # Update input information
      Input.update
      # Frame update
      update
      # Abort loop if screen is changed
      if $scene != self
        break
      end
    end
    # Prepare for transition
    Graphics.freeze
    # Dispose of windows
    @help_window.dispose
    @command_window.dispose
    @gold_window.dispose
    @dummy_window.dispose
    @buy_window.dispose
    @sell_window.dispose
    @number_window.dispose
    @status_window.dispose
  end
  
  #--------------------------------------------------------------------------
  # * Frame Update (when command window is active)
  #--------------------------------------------------------------------------
  def update_command
    # Set title
    if Wep::Shop_interfaces[$game_temp.shop_interface][:title]
      @help_window.set_text (Wep::Shop_interfaces[$game_temp.shop_interface][:title])
    end
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
        # Reset shop variables
        $game_temp.type = 0
        $game_temp.buy_discount = 1
        $game_temp.sell_discount = 1
        $game_temp.shop_interface = :default
      # Switch to map screen
      $scene = Scene_Map.new
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Trasnlate command index as command code used
      case $game_temp.act_shop_interface[:commands_used][@command_window.index][0]
      
        when :buy
          command_buy
        when :sell
          command_sell
        when :exit
          command_exit
        
      return
     end
    end
  end
  
  #--------------------------------------------------------------------------
  # * Command buy: execute command buy
  #--------------------------------------------------------------------------
  def command_buy
        if $game_temp.type== 0 or $game_temp.type== 1
          # Play decision SE
          $game_system.se_play($data_system.decision_se)
          # Change windows to buy mode
          @command_window.active = false
          @dummy_window.visible = false
          @buy_window.active = true
          @buy_window.visible = true
          @buy_window.refresh
          @status_window.visible = true
        else
          $game_system.se_play($data_system.cancel_se)
          return
        end  
  end
      
  #--------------------------------------------------------------------------
  # * Command sell: execute command sell
  #--------------------------------------------------------------------------  
  def command_sell
      if $game_temp.type== 0 or $game_temp.type== 2
        # Play decision SE
        $game_system.se_play($data_system.decision_se)
        # Change windows to sell mode
        @command_window.active = false
        @dummy_window.visible = false
        @sell_window.active = true
        @sell_window.visible = true
        @sell_window.refresh
      else
        $game_system.se_play($data_system.cancel_se)
        return
      end
  end
 
  #--------------------------------------------------------------------------
  # * Command exit: execute command exit
  #--------------------------------------------------------------------------
  def command_exit
        # Play decision SE
        $game_system.se_play($data_system.decision_se)
        # Reset shop variables
        $game_temp.type = 0
        $game_temp.buy_discount = 1
        $game_temp.sell_discount = 1
        $game_temp.shop_interface = :default
        # Switch to map screen
        $scene = Scene_Map.new
  end
      
  #--------------------------------------------------------------------------
  # * Check item class restriction
  #--------------------------------------------------------------------------   
  def item_class_restriction
      # If its special one and cant be purchased by actors or classes
      if Wep::Things[@item.id] != nil
         class_valid = true
 
         if Wep::Things[@item.id][:can_be_adquired_by_class]
           for adq_class in Wep::Things[@item.id][:can_be_adquired_by_class]
             class_valid = false unless $game_party.include_class?(adq_class)
           end
         end
         
         unless class_valid
           # Play buzzer SE
           $game_system.se_play($data_system.buzzer_se)
           return false
         end
         
       end
       return true
  end
  
  #--------------------------------------------------------------------------
  # * Check item actor restriction
  #--------------------------------------------------------------------------     
  def item_actor_restriction
      # If its special one and cant be purchased by actors or classes
      if Wep::Things[@item.id] != nil
         actor_valid = true
         if Wep::Things[@item.id][:can_be_adquired_by_actor]
           for adq_actor in Wep::Things[@item.id][:can_be_adquired_by_actor]
             actor_valid = false unless $game_party.include_actor?(adq_actor)
           end
         end
        
         unless actor_valid
           # Play buzzer SE
           $game_system.se_play($data_system.buzzer_se)
           return false
         end
         
        
      end
       return true
  end
 
  #--------------------------------------------------------------------------
  # * Frame Update (when buy window is active)
  #--------------------------------------------------------------------------
  def update_buy
    # Set status window item
    @status_window.item = @buy_window.item
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Change windows to initial mode
      @command_window.active = true
      @dummy_window.visible = true
      @buy_window.active = false
      @buy_window.visible = false
      @status_window.visible = false
      @status_window.item = nil
      # Erase help text
      @help_window.set_text("")
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Get item
      @item = @buy_window.item
      # If item is invalid, or price is higher than money possessed
      if @item == nil or @item.price > $game_party.shop_gold
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      
      # If dont show number, automatically gain 1 item and skip number
      if Wep::Shop_interfaces[$game_temp.shop_interface][:dont_show_number]
 
        # Buy process only if normal
          unless Wep::Things[@item.id] != nil
            modificado = @item.price * $game_temp.buy_discount
            $game_party.shop_lose_gold(modificado.to_i)
            case @item
              when RPG::Item
                $game_party.gain_item(@item.id, 1)
              when RPG::Weapon
                $game_party.gain_weapon(@item.id, 1)
              when RPG::Armor
                $game_party.gain_armor(@item.id, 1)
              end
              
          # Special items
          else
 
 
            # Check items restrictions
            return unless item_actor_restriction 
            return unless item_class_restriction
             
            modificado = @item.price * $game_temp.buy_discount
            $game_party.shop_lose_gold(modificado.to_i)
            
            # Modifiy var
            if Wep::Things[@item.id][:variable]
              $game_variables[Wep::Things[@item.id][:variable][0]] += Wep::Things[@item.id][:variable][1]
            end
            # Mod sw
            if Wep::Things[@item.id][:switch]
              $game_switches[Wep::Things[@item.id][:switch]] = true
            end
            # Call comm ev
            if Wep::Things[@item.id][:common_event]
              $game_temp.common_event_id = Wep::Things[@item.id][:common_event]
            end
          end
          
          # Refresh each window
          @gold_window.refresh
          @buy_window.refresh
          @status_window.refresh
          # End execution and play se
          # Play decision SE
          $game_system.se_play($data_system.decision_se)
          
          # Or exit if configurated
          if Wep::Shop_interfaces[$game_temp.shop_interface][:exit_when_buy]
            $scene = Scene_Map.new
          end
          return 
      end
      
 
      # Get items in possession count
      case @item
      when RPG::Item
        number = $game_party.item_number(@item.id)
      when RPG::Weapon
        number = $game_party.weapon_number(@item.id)
      when RPG::Armor
        number = $game_party.armor_number(@item.id)
      end
      # If 99 items are already in possession
      if number == 99
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      
      # Play decision SE
      $game_system.se_play($data_system.decision_se)
      # Calculate maximum amount possible to buy
      rebaja = @item.price*$game_temp.buy_discount
      max = @item.price == 0 ? 99 : $game_party.shop_gold / rebaja.to_i
      max = [max, 99 - number].min
      # Change windows to quantity input mode
      @buy_window.active = false
      @buy_window.visible = false
      descuento = @item.price * $game_temp.buy_discount
      @number_window.set(@item, max, descuento.to_i)
      @number_window.active = true
      @number_window.visible = true
    end
  end
  
  #--------------------------------------------------------------------------
  # * Frame Update (when sell window is active)
  #--------------------------------------------------------------------------
  def update_sell
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Change windows to initial mode
      @command_window.active = true
      @dummy_window.visible = true
      @sell_window.active = false
      @sell_window.visible = false
      @status_window.item = nil
      # Erase help text
      @help_window.set_text("")
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Get item
      @item = @sell_window.item
      # Set status window item
      @status_window.item = @item
      # If item is invalid, or item price is 0 (unable to sell)
      if @item == nil or @item.price == 0
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      # Play decision SE
      $game_system.se_play($data_system.decision_se)
      # Get items in possession count
      case @item
      when RPG::Item
        number = $game_party.item_number(@item.id)
      when RPG::Weapon
        number = $game_party.weapon_number(@item.id)
      when RPG::Armor
        number = $game_party.armor_number(@item.id)
      end
      # Maximum quanitity to sell = number of items in possession
      max = number
      # Change windows to quantity input mode
      @sell_window.active = false
      @sell_window.visible = false
      descuento = (@item.price * $game_temp.vend_desc) / 2
      @number_window.set(@item, max, descuento.to_i)
      @number_window.active = true
      @number_window.visible = true
      @status_window.visible = true
    end
  end
  
  #--------------------------------------------------------------------------
  # * Frame Update (when quantity input window is active)
  #--------------------------------------------------------------------------
  def update_number
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Set quantity input window to inactive / invisible
      @number_window.active = false
      @number_window.visible = false
      # Branch by command window cursor position
      case @command_window.index
      when 0  # buy
        # Change windows to buy mode
        @buy_window.active = true
        @buy_window.visible = true
      when 1  # sell
        # Change windows to sell mode
        @sell_window.active = true
        @sell_window.visible = true
        @status_window.visible = false
      end
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Play shop SE
      $game_system.se_play($data_system.shop_se)
      # Set quantity input window to inactive / invisible
      @number_window.active = false
      @number_window.visible = false
      # Branch by command window cursor position
      case @command_window.index
      when 0  # buy
        
        # Buy process only if normal
        unless Wep::Things[@item.id] != nil
          modificado = @number_window.number * @item.price * $game_temp.buy_discount
          $game_party.shop_lose_gold(modificado.to_i)
          case @item
            when RPG::Item
              $game_party.gain_item(@item.id, @number_window.number)
            when RPG::Weapon
              $game_party.gain_weapon(@item.id, @number_window.number)
            when RPG::Armor
              $game_party.gain_armor(@item.id, @number_window.number)
            end
            
        # Special items
        else
     
          # Check items restrictions
          return unless item_actor_restriction 
          return unless item_class_restriction
           
          modificado = @number_window.number * @item.price * $game_temp.buy_discount
          $game_party.shop_lose_gold(modificado.to_i)
          
          # Modifiy var
          if Wep::Things[@item.id][:variable]
            $game_variables[Wep::Things[@item.id][:variable][0]] += Wep::Things[@item.id][:variable][1]
          end
          # Mod sw
          if Wep::Things[@item.id][:switch]
            $game_switches[Wep::Things[@item.id][:switch]] = true
          end
          # Call comm ev
          if Wep::Things[@item.id][:common_event]
            $game_temp.common_event_id = Wep::Things[@item.id][:common_event]
          end
        end
        
        # Refresh each window
        @gold_window.refresh
        @buy_window.refresh
        @status_window.refresh
        # Change windows to buy mode
        @buy_window.active = true
        @buy_window.visible = true
        
        # Or exit if configurated
        if Wep::Shop_interfaces[$game_temp.shop_interface][:exit_when_buy]
          $scene = Scene_Map.new
        end
      when 1  # sell
        # Sell process
        modificado = (@item.price * $game_temp.vend_desc) / 2
        $game_party.shop_gain_gold(@number_window.number * modificado.to_i)
        case @item
        when RPG::Item
          $game_party.lose_item(@item.id, @number_window.number)
        when RPG::Weapon
          $game_party.lose_weapon(@item.id, @number_window.number)
        when RPG::Armor
          $game_party.lose_armor(@item.id, @number_window.number)
        end
        # Refresh each window
        @gold_window.refresh
        @sell_window.refresh
        @status_window.refresh
        # Change windows to sell mode
        @sell_window.active = true
        @sell_window.visible = true
        @status_window.visible = false
      end
      return
    end
  end
 
end
 
  
class Game_Temp
  attr_accessor :type                        # 2: Sell/1: Buy/0: Both
  attr_accessor :buy_discount                # Buy discount +- %
  attr_accessor :sell_discount               # Sell discount +- %
  attr_accessor :shop_interface                  # Sell discount +- %  
  alias gt_init initialize
  def initialize
      gt_init
      @type = 0
      @shop_interface = :default
      @buy_discount = 1
      @sell_discount = 1
  end
  
  # Return shop interface 
  def act_shop_interface
    Wep::Shop_interfaces[$game_temp.shop_interface]
  end
end
 
class Game_Actor
  attr_reader     :actor_id
end
 
class Game_Party
    
  #--------------------------------------------------------------------------
  # * Seeks if at least a actor in the party have the actor id
  #--------------------------------------------------------------------------
    def include_actor?(id)
      f=false
      for a in @actors
        f=true if a.actor_id == id
      end
      f
    end
    
  #--------------------------------------------------------------------------
  # * Seeks if at least a actor in the party have the class id
  #--------------------------------------------------------------------------   
    def include_class?(id)
      f=false
      for a in @actors
        f=true if a.class_id == id
      end
      f
    end
 
  #--------------------------------------------------------------------------
  # * Shop gold
  #     gold method used only in shop
  #--------------------------------------------------------------------------
  def shop_gold
    type = Wep::Shop_interfaces[$game_temp.shop_interface][:gold_type]
    # Normal gold
    if type == :gold
      return @gold
    # Experience
    elsif type == :exp
      v = 0
      @actors.each {|a| v += a.exp}
      return v
    # Event variable
    else 
      return $game_variables[Wep::Shop_interfaces[$game_temp.shop_interface][:gold_type][1]]
    end
  end
  
  #--------------------------------------------------------------------------
  # * Shop Gain Gold (or lose)
  #     n : amount of gold
  #--------------------------------------------------------------------------
  def shop_gain_gold(n)
    type = Wep::Shop_interfaces[$game_temp.shop_interface][:gold_type]
    # Normal gold
    if type == :gold
      @gold = [[@gold + n, 0].max, 9999999].min
      
    # Experience
    elsif type == :exp
      # Divide actor number by n
      ratio = (n/@actors.size).to_i
      # Modify each exp
      @actors.each {|a| a.exp += ratio}
      
    # Event variable
    else
      vid = Wep::Shop_interfaces[$game_temp.shop_interface][:gold_type][1]
      $game_variables[vid] = [[$game_variables[vid] + n, 0].max, 9999999].min
    end
    
    
  end
  
  #--------------------------------------------------------------------------
  # * Shop Lose Gold
  #     n : amount of gold
  #--------------------------------------------------------------------------
  def shop_lose_gold(n)
    # Reverse the numerical value and call it gain_gold
    shop_gain_gold(-n)
  end
  
end
 
 
 
#==============================================================================
# ** Window_GoldShop
#------------------------------------------------------------------------------
#  This window displays amount of gold in shops
#==============================================================================
 
class Window_GoldShop < Window_Base
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    super(0, 0, 160, 64)
    self.contents = Bitmap.new(width - 32, height - 32)
    refresh
  end
  
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    self.contents.clear
      word = Wep::Shop_interfaces[$game_temp.shop_interface][:gold_word].to_s
      cx = contents.text_size(word).width
      self.contents.font.color = normal_color
      self.contents.draw_text(4, 0, 120-cx-2, 32, $game_party.shop_gold.to_s, 2)
      
      self.contents.font.color = system_color
      self.contents.draw_text(124-cx, 0, cx, 32, word, 2)
  
  end
end
 
 
 
module Wep
  Scripts_list = [] unless defined? Scripts_list
  Scripts_list.push ('Improved Shop')
end
=end