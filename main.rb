require_relative './app'

def display_book_console(app)
  app.menu = 'book'
end

def display_music_console(app)
  app.menu = 'musicalbum'
  puts 'The musicalbum console is not yet implemented'
  main_menu(app)
end

def display_game_console(app)
  app.menu = 'game'
  puts 'The game console is not yet implemented'
  main_menu(app)
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

def add_label_to_book(app)
  if app.book_list.empty?
    puts 'The are no available books to be labelled!'
    puts ''
    return
  end
  puts 'Choose the book to label by number:'
  puts '-----------------------------------'
  puts ''
  app.display_books
  puts ''
  print '--> '
  book_index = gets.chomp.to_i - 1
  book = app.book_list[book_index]
  puts ''
  print 'Enter the label title: '
  title = gets.chomp
  print 'Enter the label color: '
  color = gets.chomp
  app.add_label(book, title, color)
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

def book_menu_actions(app, decision)
  puts 'Please choose one of the options on the list' unless '123456'.include?(decision)
  decision == '6' && exit_app
  methods = [
    method(:add_book), method(:add_label_to_book), method(:display_books), method(:display_labels), method(:main_menu)
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
  when 'book'
    book_menu_actions(app, decision)
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
    when 'book'
      app.display_book_options
    end
    take_action(app)
  end
end

main
