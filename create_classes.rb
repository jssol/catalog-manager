require_relative './book'
require_relative './author'
require_relative './music_album'
require_relative './genre'
require_relative './label'
require_relative './game'

class CreateClasses
  attr_reader :item_list, :label_list, :genre_list, :author_list
  attr_accessor :menu

  def initialize
    @menu = 'main'
    @item_list = { book: [], musicalbum: [], game: [] }
    @label_list = { book: [], musicalbum: [], game: [] }
    @genre_list = { book: [], musicalbum: [], game: [] }
    @author_list = { book: [], musicalbum: [], game: [] }
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

end	