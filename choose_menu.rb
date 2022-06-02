class ChooseMenu
  attr_reader :decision

  def initialize
    @decision = nil
  end

  def menu_type
    menu = 'book' if @decision == 1
    menu = 'musicalbum' if @decision == 2
    menu = 'game' if @decision == 3
    menu
  end

  def exit_app
    puts 'Thank you for using this app!'
    exit
  end

  def take_action
    print '--> '
    @decision = gets.chomp.to_i
    puts ''
    menu_type
  end
end
