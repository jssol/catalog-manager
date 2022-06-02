require_relative './display'
require_relative './user_interaction'

class App
  attr_reader :create_classes

  def initialize
    @user_interaction = UserInteraction.new
    @create_classes = @user_interaction.create_classes
    @menu = @create_classes.menu
  end

  def main_menu_actions(decision)
    puts 'Please choose one of the options on the list' unless (1..4).include?(decision)
    decision == 4 && exit_app
    methods = [
      method(:display_book_console), method(:display_music_console), method(:display_game_console)
    ]
    (1..3).include?(decision) && methods[decision - 1].call(app)
  end
  def menu_type(decision)
    @menu = 'book' if decision == 1
    @menu = 'musicalbum' if decision == 2 
    @menu = 'game' if decision == 3
    exit_app if decision == 4
  end  
  def take_action
    print '--> '
    decision = gets.chomp.to_i
    puts ''
    menu_type(decision)
  end

  def run
    take_action 
    case @menu
    when 'main'
      display_main_options
    when 'book'
      display_book_options
    end  
    when 'musicalbum'
      display_music_options
    when 'game'
      display_game_options
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
