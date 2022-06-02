require_relative './app'
require_relative './utils'

def display_book_console(app)
  app.menu = 'book'
end

def display_music_console(app)
  app.menu = 'musicalbum'
end

def display_game_console(app)
  app.menu = 'game'
end

def main_menu(app)
  app.menu = 'main'
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

def add_genre(app)
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
    genre = app.genre_list[app.menu.to_s.to_sym][genre_index][:ref]
    genre.add_item(music)
  else
    puts 'invalid input!'
    create_new_genre(app, music, genre_decision)
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

def choose_game_to_set_author
  puts 'Choose the game to set an author by number:'
  puts '-----------------------------------'
  puts ''
end

def add_book(app)
  print 'Date: '
  date = gets.chomp
  print 'Publisher: '
  publisher = gets.chomp
  print 'Cover state: '
  cover_state = gets.chomp
  app.add_book(date, publisher, cover_state)
  puts ''
  puts 'Book created successfully!'
end

def choose_book_to_label_prompt
  puts 'Choose the book to label by number:'
  puts '-----------------------------------'
  puts ''
end

def choose_author_prompt
  puts ''
  puts 'Choose from the list or create a new author:'
  puts '-------------------------------------------'
  puts 'Type an number of the list to choose or "New" to create an author'
  puts ''
end

def add_author(app)
  if app.game_list.empty?
    puts 'The are no available games to insert an author!!'
    puts ''
    return
  end
  choose_game_to_set_author
  display_games(app)
  print '--> '
  game_index = gets.chomp.to_i - 1
  game = app.game_list[game_index]
  choose_author_prompt
  display_authors(app)
  print '--> '
  author_decision = gets.chomp
  create_new_author(app, game, author_decision)
end

def create_new_author(app, game, author_decision)
  !game.author.nil? && (
    puts 'this item already have an author'
    return
  )
  if author_decision.downcase == 'new'
    print 'First name: '
    first_name = gets.chomp
    print 'Last name: '
    last_name = gets.chomp
    app.add_author(game, first_name, last_name)
  elsif author_decision.to_i.is_a? Integer
    author_index = author_decision.to_i - 1
    author = app.author_list[app.menu.to_s.to_sym][author_index][:ref]
    author.add_item(game)
  else
    puts 'Invaild input!.'
    create_new_author(app, game, author_decision)
  end
  puts 'Author added!'
end

def display_authors(app)
  if app.author_list[app.menu.to_s.to_sym].empty?
    puts 'No authors available!'
    puts ''
    return
  end
  app.display_authors
  puts ''
end

def add_game(app)
  print 'Publish date(YY-MM-DD): '
  date = gets.chomp
  print 'Muliplayer[Y/N]:'
  multiplayer_value = gets.chomp.downcase
  multiplayer = true if multiplayer_value == 'y'
  multiplayer = false if multiplayer_value == 'n'
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

def choose_label_prompt
  puts ''
  puts 'Choose from the list or create a new label:'
  puts '-------------------------------------------'
  puts 'Type an Id to choose or "New" to create a label'
  puts ''
end

def add_label(app)
  if app.book_list.empty?
    puts 'The are no available books to be labelled!'
    puts ''
    return
  end
  choose_book_to_label_prompt
  display_books(app)
  print '--> '
  book_index = gets.chomp.to_i - 1
  book = app.book_list[book_index]
  choose_label_prompt
  display_labels(app)
  print '--> '
  label_decision = gets.chomp
  create_new_label(app, book, label_decision)
end

def create_new_label(app, book, label_decision)
  puts ''
  if label_decision.downcase == 'new'
    print 'Enter the label title: '
    title = gets.chomp
    print 'Enter the label color: '
    color = gets.chomp
    app.add_label(book, title, color)
  elsif label_decision.to_i.is_a? Integer
    label_index = label_decision.to_i - 1
    label = app.label_list[app.menu.to_s.to_sym][label_index][:ref]
    label.add_item(book)
  else
    puts ''
    puts 'Invalid input! Try again!'
    create_new_label(app, book, label_decision)
  end
  puts ''
end

def display_books(app)
  if app.book_list.empty?
    puts 'No books available!'
    puts ''
    return
  end
  app.display_books
  puts ''
end

def display_labels(app)
  if app.label_list[app.menu.to_s.to_sym].empty?
    puts 'No labels available!'
    puts ''
    return
  end
  app.display_labels
  puts ''
end

def main_menu_actions(app, decision)
  puts 'Please choose one of the options on the list' unless (1..4).include?(decision)
  decision == 4 && exit_app
  methods = [
    method(:display_book_console), method(:display_music_console), method(:display_game_console)
  ]
  (1..3).include?(decision) && methods[decision - 1].call(app)
end

def book_menu_actions(app, decision)
  puts 'Please choose one of the options on the list' unless (1..10).include?(decision)
  decision == 10 && exit_app
  methods = [
    method(:add_book), method(:add_label), method(:add_genre), method(:add_author) 
    method(:display_books), method(:display_labels), method(:display_genres), method(:display_authors),
    method(:main_menu)
  ]
  (1..9).include?(decision) && methods[decision - 1].call(app)
end

def music_menu_actions(app, decision)
  puts 'Please choose one of the options on the list' unless (1..10).include?(decision)
  decision == 10 && exit_app
  methods = [
    method(:add_music), method(:add_label), method(:add_genre), method(:add_author) 
    method(:display_musics), method(:display_labels), method(:display_genres), method(:display_authors),
    method(:main_menu)
  ]
  (1..9).include?(decision) && methods[decision - 1].call(app)
end

def game_menu_actions(app, decision)
  puts 'Please choose one of the options on the list' unless (1..10).include?(decision)
  decision == 10 && exit_app
  methods = [
    method(:add_game), method(:add_label), method(:add_genre), method(:add_author) 
    method(:display_games), method(:display_labels), method(:display_genres), method(:display_authors),
    method(:main_menu)
  ]  
  (1..9).include?(decision) && methods[decision - 1].call(app)
end

def exit_app
  puts 'Thank you for using this app!'
  exit
end

def menu_type(app, decision)
  case app.menu
  when 'main'
    main_menu_actions(app, decision)
  when 'book'
    book_menu_actions(app, decision)
  when 'musicalbum'
    music_menu_actions(app, decision)
  when 'game'
    game_menu_actions(app, decision)
  else
    puts 'Consider adding items to your catalog!'
    exit_app
  end
end

def take_action(app)
  print '--> '
  decision = gets.chomp.to_i
  puts ''
  menu_type(app, decision)
end

def main
  app = App.new
  loop do
    case app.menu
    when 'main'
      app.display_main_options
    when 'musicalbum'
      app.display_music_options
    when 'game'
      app.display_game_options
    when 'book'
      app.display_book_options
    end
    take_action(app)
  end
end

main
