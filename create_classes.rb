require_relative './book'
require_relative './author'
require_relative './music_album'
require_relative './genre'
require_relative './label'
require_relative './game'
require_relative './file_manager'

class CreateClasses
  attr_reader :item_list, :label_list, :genre_list, :author_list
  attr_accessor :menu

  def initialize
    @menu = 'main'
    @file_manager = FileManager.new
    @item_list = { book: [], musicalbum: [], game: [] }
    @label_list = { book: [], musicalbum: [], game: [] }
    @genre_list = { book: [], musicalbum: [], game: [] }
    @author_list = { book: [], musicalbum: [], game: [] }
    read_files
  end

  def save_files
    @file_manager.write_musics('./data/music_list.json', @item_list[:musicalbum])
    @file_manager.save_file('./data/label_list.json', @label_list)
    @file_manager.save_file('./data/genre_list.json', @genre_list)
    @file_manager.save_file('./data/author_list.json', @author_list)
  end

  def read_files
    @file_manager.read_musics(method(:add_music))
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
    @item_list[:game] << game
  end

  def add_label(item, title, color)
    label = Label.new(title, color)
    label.add_item(item)
    @label_list[@menu.to_s.to_sym] << { ref: label, title: label.title, color: label.color }
  end

  def create_new_label(item, label_decision)
    puts ''
    if label_decision.downcase == 'new'
      print 'Enter the label title: '
      title = gets.chomp
      print 'Enter the label color: '
      color = gets.chomp
      add_label(item, title, color)
    elsif label_decision.to_i.is_a? Integer
      label_index = label_decision.to_i - 1
      label = @label_list[@menu.to_s.to_sym][label_index][:ref]
      label.add_item(item)
    else
      puts ''
      puts 'Invalid input! Try again!'
      create_new_label(app, item, label_decision)
    end
    puts ''
  end

  def add_genre(item, name)
    genre = Genre.new(name)
    genre.add_item(item)
    @genre_list[@menu.to_s.to_sym] << { ref: genre, title: genre.name }
  end

  def create_new_genre(item, genre_decision)
    genre_decision = genre_decision.downcase.strip
    !item.genre.nil? && (
      puts 'This item already has a genre'
      return
    )
    if genre_decision == 'new'
      print 'Enter the genre: '
      title = gets.chomp
      add_genre(item, title)
    elsif genre_decision.to_i.is_a?(Integer)
      genre_index = genre_decision.to_i - 1
      genre = @genre_list[@menu.to_s.to_sym][genre_index][:ref]
      genre.add_item(item)
    else
      puts "\n\nInvalid input! Try again!"
      create_new_genre(item, genre_decision)
    end
    puts 'The genre has been added successfully!'
  end

  def add_author(item, first_name, last_name)
    author = Author.new(first_name, last_name)
    author.add_item(item)
    @author_list[@menu.to_s.to_sym] << { ref: author, first_name: author.first_name, last_name: author.last_name }
  end

  def create_new_author(item, author_decision)
    !item.author.nil? && (
      puts 'this item already have an author'
      return
    )
    if author_decision.downcase == 'new'
      print 'First name: '
      first_name = gets.chomp
      print 'Last name: '
      last_name = gets.chomp
      add_author(item, first_name, last_name)
    elsif author_decision.to_i.is_a? Integer
      author_index = author_decision.to_i - 1
      author = @author_list[@menu.to_s.to_sym][author_index][:ref]
      author.add_item(item)
    else
      puts 'Invaild input!.'
      create_new_author(item, author_decision)
    end
    puts 'Author added!'
  end
end
