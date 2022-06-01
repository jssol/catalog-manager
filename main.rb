require_relative './app'
require_relative './utils'

def display_book_console(app)
  app.menu = 'book'
end

def display_music_console(app)
  app.menu = 'music'
end

def display_game_console(app)
  app.menu = 'game'
  puts 'game_console'
end

def add_music(app)
  print 'Music Album: '
  name = gets.chomp
  publish_date = Utils.get_valid_date('Publish date')
  on_spotify = Utils.validate_boolean
  app.add_music(name, publish_date, on_spotify)
  puts ''
  puts 'Music Album created successfully!'
  puts ''
end

def choose_music_to_genre_prompt
  puts 'Choose the Music to Genre by number:'
  puts '-----------------------------------'
  puts ''
end

def choose_genre_prompt
  puts ''
  puts 'Choose from the list or create a new Genre:'
  puts '-------------------------------------------'
  puts 'Type an Id to choose or "New" to create a Genre'
  puts ''
end

def add_genre_to_music(app)
  if app.music_list.empty?
    puts 'The are no available Muscis to add Genre type!'
    puts ''
    return
  end
  choose_music_to_genre_prompt
  display_musics(app)
  print '--> '
  music_index = gets.chomp.to_i - 1
  music = app.music_list[music_index]
  choose_genre_prompt
  display_genres(app)
  print '--> '
  genre_decision = gets.chomp
  create_new_genre(app, music, genre_decision)
end

def create_new_genre(app, music, genre_decision)
  puts ''
  if genre_decision.downcase == 'new'
    print 'Enter the Genre type: '
    title = gets.chomp
    app.add_genre(music, title)
  elsif genre_decision.to_i.is_a? Integer
    genre_index = genre_decision.to_i - 1
    genre = app.genre_list[:music][genre_index]
    genre_title = genre[:title]
    app.add_genre(genre, genre_title)
  else
    display_music_console(app)
  end
  puts ''
end

def display_musics(app)
  if app.music_list.empty?
    puts 'No Music Albums available!'
    puts ''
    return
  end
  app.display_musics
  puts ''
end

def display_genres(app)
  if app.genre_list[app.menu.to_s.to_sym].empty?
    puts 'No labels available!'
    puts ''
    return
  end
  app.display_genres
  puts ''
end

def main_menu(app)
  app.menu = 'main'
end

def main_menu_actions(app, decision)
  puts 'Please choose one of the options on the list' unless '1234'.include?(decision)
  decision == '4' && exit_app
  methods = [
    method(:display_book_console), method(:display_music_console), method(:display_game_console)
  ]
  '123'.include?(decision) && methods[decision.to_i - 1].call(app)
end

def music_menu_actions(app, decision)
  puts 'Please choose one of the options on the list' unless '123456'.include?(decision)
  decision == '6' && exit_app
  methods = [
    method(:add_music), method(:add_genre_to_music), method(:display_musics), method(:display_genres), method(:main_menu)
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
  when 'music'
    music_menu_actions(app, decision)
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
    when 'music'
      app.display_music_options
    end
    take_action(app)
  end
end

main
