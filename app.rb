require_relative './game'
require_relative './author'
# app class
class App
  attr_reader :game_list, :author_list
  attr_accessor :menu

  def initialize
    @menu = 'main'
    @game_list = []
    @author_list = {
      book: [],
      musicalbum: [],
      game: []
    }
  end

  def display_main_options
    puts ''
    puts 'Welcome to your catalog manager!'
    puts ''
    puts 'Choose an option on the list:'
    puts '-----------------------------'
    puts ''
    puts ['1 - Books', '2 - Music albums', '3 - Games', '4 - Save and exit']
    puts ''
  end

  def display_game_options
    puts ''
    puts 'Choose an option on the list:'
    puts '-----------------------------'
    puts ''
    puts ['1 - Add a game', '2 - Add a author', '3 - List games', '4 - List authors', '5 - Go to main menu',
          '6 - Save and exit']
    puts ''
  end

  def add_author(item, first_name, last_name)
    author = Author.new(first_name, last_name)
    author.add_item(item)
    @author_list[@menu.to_s.to_sym] << { ref: author, first_name: author.first_name, last_name: author.last_name }
  end

  def display_authors
    return if @menu == 'main'

    puts '       first name       |       last name       '
    puts '--------------------------------------------'
    @author_list[@menu.to_s.to_sym].each_with_index do |author, i|
      puts "  #{i + 1} |       #{author[:first_name]}       |       #{author[:last_name]}       "
      puts '------------------------------------------'
    end
  end

  def add_game(date, multiplayer, last_played)
    game = Game.new(date, multiplayer, last_played)
    @game_list << game
  end

  def display_games
    @game_list.each_with_index do |game, i|
      multiplayer_value = game.multiplayer
      multiplayer = 'yes' if multiplayer_value
      multiplayer = 'no' unless multiplayer_value
      print "\n#{i + 1} - Publish date: #{game.publish_date}, Multiplayer: #{multiplayer.capitalize}, "
      print "Last played: #{game.last_played_at}"
    end
  end
end
