#==============================================================================
# ** Scene_Item
#------------------------------------------------------------------------------
#  This class performs item screen processing.
#==============================================================================

class Scene_Options
  #--------------------------------------------------------------------------
  # * Main Processing
  #--------------------------------------------------------------------------
  def main
    # Make help window, option window
    @help_window = Window_Help.new
    @options_window = Window_Options.new
    # Associate help window
    @options_window.help_window = @help_window
    # Make target window (set to invisible / inactive)
    @target_window = Window_Target.new
    @target_window.visible = false
    @target_window.active = false
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
    @options_window.dispose
    @target_window.dispose
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    # Update windows
    @help_window.update
    @options_window.update
    @target_window.update
    # If option window is active: call update_options
    if @options_window.active
      update_options
      return
    end
    # If target window is active: call update_target
    if @target_window.active
      update_target
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (when option window is active)
  #--------------------------------------------------------------------------
  def update_options
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Switch to menu screen
      $scene = Scene_Menu.new(5)
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Get currently selected data on the option window
      @item = @options_window.item
      # Branch by command window cursor position
      case @options_window.index
      when 0  # Tutorial text
        if $game_switches[125] == true
          $game_switches[125] = false
        else
          $game_switches[125] = true
        end
      when 1  # Game difficulty
        if $game_variables[160] >= 1
          $game_variables[160] = 0
        else
          $game_variables[160] + 1
        end
      else
        $game_system.se_play($data_system.cancel_se)
      end
# If not a use item
#      unless @item.is_a?(RPG::Item)
        # Play buzzer SE
#        $game_system.se_play($data_system.buzzer_se)
#        return
#      end
      # If it can't be used
#      unless $game_party.item_can_use?(@item.id)
        # Play buzzer SE
#        $game_system.se_play($data_system.buzzer_se)
#        return
#      end
      # Play decision SE
      $game_system.se_play($data_system.decision_se)
      # If effect scope is an ally
=begin      if @item.scope >= 3
        # Activate target window
        @options_window.active = false
        @target_window.x = (@options_window.index + 1) % 2 * 304
        @target_window.visible = true
        @target_window.active = true
        # Set cursor position to effect scope (single / all)
        if @item.scope == 4 || @item.scope == 6
          @target_window.index = -1
        else
          @target_window.index = 0
        end
      # If effect scope is other than an ally
      else
        # If command event ID is valid
        if @item.common_event_id > 0
          # Command event call reservation
          $game_temp.common_event_id = @item.common_event_id
          # Play item use SE
          $game_system.se_play(@item.menu_se)
          # If consumable
          if @item.consumable
            # Decrease used items by 1
            $game_party.lose_item(@item.id, 1)
            # Draw item window item
            @options_window.draw_item(@options_window.index)
          end
          # Switch to map screen
          $scene = Scene_Map.new
          return
        end
=end      end
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (when target window is active)
  #--------------------------------------------------------------------------
  def update_target
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # If unable to use because items ran out
      unless $game_party.item_can_use?(@item.id)
        # Remake item window contents
        @options_window.refresh
      end
      # Erase target window
      @options_window.active = true
      @target_window.visible = false
      @target_window.active = false
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # If items are used up
      if $game_party.item_number(@item.id) == 0
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      # If target is all
      if @target_window.index == -1
        # Apply item effects to entire party
        used = false
        for i in $game_party.actors
          used |= i.item_effect(@item)
        end
      end
      # If single target
      if @target_window.index >= 0
        # Apply item use effects to target actor
        target = $game_party.actors[@target_window.index]
        used = target.item_effect(@item)
      end
      # If an item was used
      if used
        # Play item use SE
        $game_system.se_play(@item.menu_se)
        # If consumable
        if @item.consumable
          # Decrease used items by 1
          $game_party.lose_item(@item.id, 1)
          # Redraw item window item
          @options_window.draw_item(@options_window.index)
        end
        # Remake target window contents
        @target_window.refresh
        # If all party members are dead
        if $game_party.all_dead?
          # Switch to game over screen
          $scene = Scene_Gameover.new
          return
        end
        # If common event ID is valid
        if @item.common_event_id > 0
          # Common event call reservation
          $game_temp.common_event_id = @item.common_event_id
          # Switch to map screen
          $scene = Scene_Map.new
          return
        end
      end
      # If item wasn't used
      unless used
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
      end
      return
    end
  end
end
