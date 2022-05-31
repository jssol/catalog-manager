require_relative './app'

def display_book_console(app)
  puts 'book_console'
end

def display_music_console(app)
  puts 'music_console'
end

def display_game_console(app)
  puts 'game_console'
end

def exit_app
  puts 'Thank you for using this app!'
  exit
end

def take_action(app)
  print '--> '
  decision = gets.chomp
  puts ''
  puts 'Please choose one of the options on the list' unless '1234'.include?(decision)
  decision == '4' && exit_app
  methods = [
    method(:display_book_console), method(:display_music_console), method(:display_game_console)
  ]
  '123'.include?(decision) && methods[decision.to_i - 1].call(app)
end

def main
  app = App.new
  loop do
    app.run
    take_action(app)
  end
end

main
