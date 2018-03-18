#===============================================================================
# Skill Shop
# Author: Game_guy
# Date: June 7th, 2009
# Version: 1.8
#===============================================================================
# 
# Intro:
# What this script does is act as a shop but sells skills instead.
# 
# Instructions:
# 1: First how do you want it setup? Theres two ways
#    1: -Any person can learn any skill 
#    or
#    2: -Classes learn different skills then other classes
# 
#    Go down to UseClasses and set it to false for 1: or true for 2:

# 2: Ok now that thats over lets move onto price. Go down to CONFIG PRICE and follow
#    the instructions there.
#   
# 3: Skip this step if you set UseClasses to false. 
#    Go to CONFIG CLASS SKILLS and follow the instructions there.
#    
# 4: Ok so everythings setup now. Time to actually find out how to open the 
#    skillshop right? You use this line
#    $scene = SkillShop.new([skill id's go here])
#    example
#    $scene = SkillShop.new([1, 2]) will make a shop with the skills
#    Heal and Great Heal
#
# 5: Ok the script now is able to make it where only skills are learnable at
#    certain levels. Go to CONFIG LEVEL and follow instructions there.
#===============================================================================
module GameGuy
  #==========================
  # BEGIN CONFIG
  #==========================
  UseClasses = true # if false anyone can learn any skill
                     # if true only classes can learn the defined skills
end
module RPG
  class Skill
    def price
      case id
      #==========================
      # CONFIG PRICE
      #==========================
      # use 
      # when skill_id then return price
      when 1 then return 100 # Heal
      when 2 then return 250 # Greater Heal
      when 3 then return 500 # Mass Heal
      when 4 then return 300 # Remedy
      when 39 then return 300 # Confuse
      when 57 then return 75 # Cross Cut
      when 58 then return 200 # Faint Attack
      when 69 then return 250 # Poison Edge
      when 81 then return 400 # Chloroform
      when 83 then return 300 # Subdue & Secure
      when 84 then return 500 # Subduction Strike
      when 82 then return 50 # Subdue
      when 87 then return 400 # Ragequit
      when 103 then return 350 # Chest Punch
      when 130 then return 750 # Self Bondage
      when 133 then return 100 # Charm
      when 134 then return 150 # Secure Ropes
      when 141 then return 150 # Taunt
      when 150 then return 400 # Absorb SP
      when 156 then return 300 # Rally
      when 173 then return 250 # Dispell
      when 174 then return 350 # Greater Dispell
      when 175 then return 300 # Mass Haste
      when 205 then return 175 # Rope Collector (Passive)
      end
      return 100
    end
    def llevel
      case id
      #==========================
      # CONFIG LEVEL
      #==========================
      # use
      # when skill_id then return level
      when 1 then return 5
      when 2 then return 10
      when 3 then return 15
      when 57 then return 2
      when 81 then return 8
      when 84 then return 10
      when 87 then return 3
      when 174 then return 10
      end
      return 1
    end
  end
  class Class
    def learnskills
      case id
      #==========================
      # CONFIG CLASS SKILLS
      #==========================
      # use
      # when class_id then return [skill id's here]
      # 2=Kidnapper, 3= Adv.Kidnapper, 4=Thief, 8=Mage 11=Lancer
      when 2 then return [69, 81, 83, 84, 87, 103, 130, 133, 134, 205]
      when 4 then return [69, 87, 103, 130, 133, 134, 175]
      when 8 then return [1, 2, 3, 4, 39, 150, 156, 173, 174, 175]
      when 11 then return [87, 103, 130, 134, 141]
      end
      return []
    end
  #==========================
  # END CONFIG
  #==========================
  end
end

class Window_SkillCommand < Window_Selectable
  def initialize
    super(0, 64, 480, 64)
    self.contents = Bitmap.new(width - 32, height - 32)
    @item_max = 2
    @column_max = 2
    @commands = ["Learn", "Exit"]
    refresh
    self.index = 0
  end
  def refresh
    self.contents.clear
    for i in 0...@item_max
      draw_item(i)
    end
  end
  def draw_item(index)
    x = 4 + index * 240
    self.contents.draw_text(x, 0, 128, 32, @commands[index])
  end
end

class Window_SkillBuy < Window_Selectable
  def initialize(shop_goods)
    super(0, 128, 368, 352)
    @skill_shop_goods = shop_goods
    self.active = false
    refresh
    self.index = 0
  end
  def skill
    return @data[self.index]
  end
  def refresh
    if self.contents != nil
      self.contents.dispose
      self.contents = nil
    end
    @data = []
    for i in 0...@skill_shop_goods.size
      skill = $data_skills[@skill_shop_goods[i]]
      if skill != nil
        @data.push(skill)
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
    skill = @data[index]
    price = skill.price
    enabled = (price <= $game_party.gold)
    if enabled
      self.contents.font.color = normal_color
    else
      self.contents.font.color = disabled_color
    end
    x = 4
    y = index * 32
    rect = Rect.new(x, y, self.width - 32, 32)
    self.contents.fill_rect(rect, Color.new(0, 0, 0, 0))
    bitmap = RPG::Cache.icon(skill.icon_name)
    opacity = self.contents.font.color == normal_color ? 255 : 128
    self.contents.blt(x, y + 4, bitmap, Rect.new(0, 0, 24, 24), opacity)
    self.contents.draw_text(x + 28, y, 212, 32, skill.name, 0)
    self.contents.draw_text(x + 240, y, 88, 32, price.to_s, 2)
  end
  def update_help
    @help_window.set_text(skill == nil ? "" : skill.description)
  end
end

class Window_SkillStatus2 < Window_Selectable
  def initialize
    super(368, 128, 272, 352)
    self.contents = Bitmap.new(width - 32, height - 32)
    refresh
    self.z = 200
    self.active = false
    self.index = -1
  end
  def refresh
    self.contents.clear
    @item_max = $game_party.actors.size
    for i in 0...$game_party.actors.size
      x = 64
      y = i * 80
      actor = $game_party.actors[i]
      classs = $data_classes[$game_actors[actor.id].class_id]
      draw_actor_graphic(actor, x - 40, y + 60)
      draw_actor_name(actor, x - 10, y + 10)
      if actor.skill_learn?($thing.id)
        self.contents.font.color = crisis_color
        $text = "Acquired"
      elsif GameGuy::UseClasses
        if classs.learnskills.include?($thing.id) && $thing.llevel <= actor.level
          self.contents.font.color = normal_color
          $text = "Able"
        elsif classs.learnskills.include?($thing.id) && $thing.llevel > actor.level
          self.contents.font.color = disabled_color
          $text = "Able At Level " + $thing.llevel.to_s
        else
          self.contents.font.color = disabled_color
          $text = "Unable"
        end
      else
        if actor.level >= $thing.llevel
          self.contents.font.color = normal_color
          $text = "Able"
        else
          self.contents.font.color = disabled_color
          $text = "Able At Level " + $thing.llevel.to_s
        end
      end
      self.contents.draw_text(x - 10, y + 40, 200, 32, $text)
    end
  end
  def update_cursor_rect
    if @index < 0
      self.cursor_rect.empty
    else
      self.cursor_rect.set(0, @index * 80, self.width - 32, 80)
    end
  end
end

class SkillShop
  def initialize(skills)
    @skills = skills
  end
  def main
    @command = Window_SkillCommand.new
    @help_window = Window_Help.new
    @skillbuy = Window_SkillBuy.new(@skills)
    @skillbuy.active = false
    @skillbuy.help_window = @help_window
    $thing = @skillbuy.skill
    @status = Window_SkillStatus2.new
    #@status.visible = false
    @gold = Window_Gold.new
    @gold.x = 480
    @gold.y = 64
    
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
    @gold.dispose
    @skillbuy.dispose
    @help_window.dispose
    @command.dispose
    @status.dispose
  end
  def update
    @gold.update
    @status.update
    @gold.refresh
    @command.update
    @skillbuy.update
    @help_window.update
    $thing = @skillbuy.skill
    @status.refresh
    if @command.active
      update_command
      return
    end
    
    if @status.active
      update_status
      return
    end
    
    if @skillbuy.active
      update_buy
      return
    end
  end
  
  def update_buy
    if Input.trigger?(Input::B)
      $game_system.se_play($data_system.cancel_se)
      @skillbuy.active = false
      @command.active = true
      return
    end
    if Input.trigger?(Input::C)
      $game_system.se_play($data_system.decision_se)
      @skillbuy.active = false
      @status.active = true
      @status.visible = true
      @status.index = 0 if @status.index == -1
    end
  end
  
  def update_command
    if Input.trigger?(Input::B)
      $game_system.se_play($data_system.cancel_se)
      $scene = Scene_Map.new
      return
    end
    if Input.trigger?(Input::C)
      $game_system.se_play($data_system.decision_se)
      case @command.index
      when 0
        @command.active = false
        @skillbuy.active = true
      when 1
        $game_system.se_play($data_system.cancel_se)
        $scene = Scene_Map.new
      end
      return
    end
  end
  
  def update_status
    if Input.trigger?(Input::B)
      @status.active = false
      @skillbuy.active = true
      return
    end
    if Input.trigger?(Input::C)
      price = @skillbuy.skill.price
      @actort = $game_party.actors[@status.index]
      enabled = (price <= $game_party.gold)
      
      if enabled
        if @actort.skill_learn?(@skillbuy.skill.id)
          $game_system.se_play($data_system.buzzer_se)
          return
        end
        if GameGuy::UseClasses
          if $data_classes[@actort.class_id].learnskills.include?(@skillbuy.skill.id) && @actort.level >= @skillbuy.skill.llevel
            @actort.learn_skill(@skillbuy.skill.id)
            $game_party.lose_gold(@skillbuy.skill.price)
            $game_system.se_play($data_system.decision_se)
            @skillbuy.active = true
            @status.active = false
            @status.refresh
            return
          else
            $game_system.se_play($data_system.buzzer_se)
            return
          end
        else
          if @actort.level >= @skillbuy.skill.llevel
            @actort.learn_skill(@skillbuy.skill.id)
            $game_party.lose_gold(@skillbuy.skill.price)
            $game_system.se_play($data_system.decision_se)
            @skillbuy.active = true
            @status.active = false
            @status.refresh
          else
            $game_system.se_play($data_system.buzzer_se)
            return
          end
          return
        end
        
      else
        $game_system.se_play($data_system.buzzer_se)
        return
      end
    end
  end

end
