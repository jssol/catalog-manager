require_relative './app'

def display_book_console(app)
  app.menu = 'book'
  puts 'The book console is not yet implemented'
  main_menu(app)
end

def display_music_console(app)
  app.menu = 'musicalbum'
  puts 'The musicalbum console is not yet implemented'
  main_menu(app)
end

def display_game_console(app)
  app.menu = 'game'
end

def main_menu(app)
  app.menu = 'main'
end

def add_author_to_game(app); end
def display_authors; end
def add_game(app)
  print 'Publish date(YY-MM-DD): '
  date = gets.chomp
  print 'Muliplayer[Y/N]:'
  multiplayer_value = gets.chomp.downcase
  multiplayer = true if multiplayer_value == 'y'
  multiplayer = false if multiplayer_value
  print 'last played(YY-MM-DD): '
  last_played = gets.chomp
  app.add_game(date, multiplayer, last_played)
  puts ''
  puts 'game created successfully!'
end

def display_games(app)
  if app.game_list.empty?
    puts 'No games available!'
    puts ''
    return
  end
  app.display_games
  puts ''
end

def main_menu_actions(app, decision)
  puts 'Please choose one of the options on the list' unless '1234'.include?(decision)
  decision == '4' && exit_app
  methods = [
    method(:display_book_console), method(:display_music_console), method(:display_game_console)
  ]
  '123'.include?(decision) && methods[decision.to_i - 1].call(app)
end

def game_menu_actions(app, decision)
  puts 'Please choose one of the options on the list' unless '123456'.include?(decision)
  decision == '6' && exit_app
  methods = [
    method(:add_game), method(:add_author_to_game), method(:display_games), method(:display_authors), method(:main_menu)
  ]
  '12345'.include?(decision) && methods[decision.to_i - 1].call(app)
end

def exit_app
  puts 'Thank you for using this app!'
  exit
end

def menu_type(app, decision)
  case app.menu
  when 'main'
    main_menu_actions(app, decision)
  when 'game'
    game_menu_actions(app, decision)
  else
    puts 'Consider adding items to your catalog!'
    exit_app
  end
end

def take_action(app)
  print '--> '
  decision = gets.chomp
  puts ''
  menu_type(app, decision)
end

def main
  app = App.new
  loop do
    case app.menu
    when 'main'
      app.display_main_options
    when 'game'
      app.display_game_options
    end
    take_action(app)
  end
end

main
