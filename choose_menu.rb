
class ChooseMenu
  def initialize
  	@decision = nil
  end


  def menu_type
   case @decision
    when 1
      book_menu_actions(app, decision)
    when 2
      music_menu_actions(app, decision)
    when 3
      game_menu_actions(app, decision)
    when 4 
      puts 'Consider adding items to your catalog!'
      exit_app
    else
      puts 'invalid input!'
      menu_type
  end
end

  def take_action
   print '--> '
   @decision = gets.chomp.to_i
   puts ''
   menu_type
  end
end	