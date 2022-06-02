require_relative './book'
require_relative './author'
require_relative './music_album'
require_relative './genre'
require_relative './label'
require_relative './game'
require_relative './utils'

class App
  attr_reader :item_list, :label_list, :genre_list ,:author_list
  attr_accessor :menu

  def initialize
    @menu = 'main'
    @item_list = {
       book:[],
       musicalbum:[],
       game: []
    }
    # @book_list = []
    # @music_list = []
    # @game_list = []
    @label_list = {
      book: [],
      musicalbum: [],
      game: []
    }
    @genre_list = {
      book: [],
      musicalbum: [],
      game: []
    }
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

  def display_book_options
    puts 'Books catalog'
    puts ''
    puts 'Choose an option on the list:'
    puts '-----------------------------'
    puts ''
    puts ['1 - Add a book', '2 - Add a label', '3 - Add a genre', '4 - Add an author', 
          '5 - List books', '6 - List labels', '7 - List genres', '8 - List authors',
          '9 - Go to main menu','10 - Save and exit']

    puts ''
  end

  def display_music_options
    puts 'Music catalog'
    puts ''
    puts 'Choose an option on the list:'
    puts '-----------------------------'
    puts ''
    puts ['1 - Add a music album', '2 - Add a label', '3 - Add a genre', '4 - Add an author', 
          '5 - List music albums', '6 - List labels',  '7 - List genres', '8 - List authors',
          '9 - Go to main menu','10 - Save and exit']
    puts ''
  end

  def display_game_options
    puts 'Game catalog'
    puts ''
    puts 'Choose an option on the list:'
    puts '-----------------------------'
    puts ''
    puts ['1 - Add a game', '2 - Add a label', '3 - Add a genre', '4 - Add an author', 
          '5 - List games', '6 - List labels',  '7 - List genres', '8 - List authors',
          '9 - Go to main menu','10 - Save and exit']
    puts ''
  end

  def add_book(date, publisher, cover_state)
    book = Book.new(date, publisher, cover_state)
    @item_list[:book] << book
  end

  def add_music(name, publish_date, on_spotify)
    music = MusicAlbum.new(name, publish_date, on_spotify)
    @item_list[:musicalbum] << music
  end

  def add_game(date, multiplayer, last_played)
    game = Game.new(date, multiplayer, last_played)
    @@item_list[:game] << game
  end

  def add_label(item, title, color)
    label = Label.new(title, color)
    label.add_item(item)
    @label_list[@menu.to_s.to_sym] << { ref: label, title: label.title, color: label.color }
  end

  def add_genre(item, name)
    genre = Genre.new(name)
    genre.add_item(item)
    @genre_list[@menu.to_s.to_sym] << { ref: genre, title: genre.name }
  end

  def add_author(item, first_name, last_name)
    author = Author.new(first_name, last_name)
    author.add_item(item)
    @author_list[@menu.to_s.to_sym] << { ref: author, first_name: author.first_name, last_name: author.last_name }
  end

  def display_books
   @item_list[:book].each_with_index do |book, index|
      puts "#{index + 1} - Publisher: #{book.publisher}, Cover state: #{book.cover_state}"
    end
  end

  def display_musics
    @item_list[:musicalbum].each_with_index do |music, index|
      puts "#{index + 1}) music album details:"
      puts "Music Album: #{music.name}"
      puts "On spotify: #{music.on_spotify}"
      puts
    end
  end

  def display_games
    @item_list[:game].each_with_index do |game, i|
      multiplayer_value = game.multiplayer
      multiplayer = 'yes' if multiplayer_value
      multiplayer = 'no' unless multiplayer_value
      print "\n#{i + 1} - Publish date: #{game.publish_date}, Multiplayer: #{multiplayer.capitalize}, "
      print "Last played: #{game.last_played_at}"
    end
  end

  def display_labels
    puts ' Id |       Title       |       Color       '
    puts '---------------------------------------'
    @label_list[@menu.to_s.to_sym].each_with_index do |label, index|
      puts "  #{index + 1} |       #{label[:title]}       |     #{label[:color]}         "
      puts '---------------------------------------'
    end
  end

  def display_genres
    puts ' Id |       Title       '
    puts '---------------------------------------'
    @genre_list[@menu.to_s.to_sym].each_with_index do |genre, index|
      puts "  #{index + 1} |       #{genre[:title]}   "
      puts '------------------------------------------'
    end
  end

  def display_authors
    puts '       first name       |       last name       '
    puts '--------------------------------------------'
    @author_list[@menu.to_s.to_sym].each_with_index do |author, i|
      puts "  #{i + 1} |       #{author[:first_name]}       |       #{author[:last_name]}       "
      puts '------------------------------------------'
    end
  end
end
