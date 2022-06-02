require_relative './display'
require_relative './craete_classes'

class App
  attr_reader :create_classes

  def initialize
    @create_classes = CreateClasses.new
  end

  def add_book(date, publisher, cover_state)
    @create_classes.add_book(date, publisher, cover_state)
  end

  def add_music(name, publish_date, on_spotify)
    @create_classes.add_music(name, publish_date, on_spotify)
  end

  def add_game(date, multiplayer, last_played)
    @create_classes.add_game(date, multiplayer, last_played)
  end

  def add_label(item, title, color)
    create_classes.add_label(item, title, color)
  end

  def add_genre(item, name)
    create_classes.add_genre(item, name)
  end

  def add_author(item, first_name, last_name)
    create_classes.add_author(item, first_name, last_name)
  end

  def display_main_options
    Display.new.display_main_options
  end

  def display_book_options
    Display.new.display_book_options
  end

  def display_music_options
    Display.new.display_music_options
  end

  def display_game_options
    Display.new.display_game_options
  end

  def display_books
     Display.new.display_books(@item_list[:book])
    end
  end

  def display_musics
    Display.new.display_books(@item_list[:musicalbum])
  end

  def display_games
    Display.new.display_books(@item_list[:game])
  end

  def display_labels
    Display.new.display_books(@label_list[@menu.to_s.to_sym])
  end

  def display_genres
     Display.new.display_books(@genre_list[@menu.to_s.to_sym])
  end

  def display_authors
    Display.new.display_books(@author_list[@menu.to_s.to_sym])
  end
end
