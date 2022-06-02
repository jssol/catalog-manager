require_relative './display'
require_relative './user_interaction'
require_relative './choose_menu'

class App
  attr_reader :create_classes

  def initialize
    @user_interaction = UserInteraction.new
    @create_classes = @user_interaction.create_classes
  end

  def main_menu_actions
    decision = take_action
    puts 'Please choose one of the options on the list' unless (1..4).include?(decision)
    decision == 4 && exit_app
    @create_classes.menu = 'book' if decision == 1
    @create_classes.menu = 'musicalbum' if decision == 2
    @create_classes.menu = 'game' if decision == 3
  end

  def book_menu_actions
    decision = take_action
    puts 'Please choose one of the options on the list' unless (1..10).include?(decision)
    decision == 10 && exit_app
    methods = [
      method(:add_book), method(:add_label), method(:add_genre), method(:add_author),
      method(:display_books), method(:display_labels), method(:display_genres), method(:display_authors),
      method(:main_menu)
    ]
    (1..9).include?(decision) && methods[decision - 1].call
  end

  def music_menu_actions
    decision = take_action
    puts 'Please choose one of the options on the list' unless (1..10).include?(decision)
    decision == 10 && exit_app
    methods = [
      method(:add_music), method(:add_label), method(:add_genre), method(:add_author),
      method(:display_musics), method(:display_labels), method(:display_genres), method(:display_authors),
      method(:main_menu)
    ]
    (1..9).include?(decision) && methods[decision - 1].call
  end

  def game_menu_actions
    decision = take_action
    puts 'Please choose one of the options on the list' unless (1..10).include?(decision)
    decision == 10 && exit_app
    methods = [
      method(:add_game), method(:add_label), method(:add_genre), method(:add_author),
      method(:display_games), method(:display_labels), method(:display_genres), method(:display_authors),
      method(:main_menu)
    ]
    (1..9).include?(decision) && methods[decision - 1].call
  end

  def main_menu
    @create_classes.menu = 'main'
  end

  def exit_app
    puts 'Thank you for using this app!'
    @create_classes.save_files
    exit
  end

  def take_action
    print '--> '
    decision = gets.chomp.to_i
    puts ''
    decision
  end

  def run
    case @create_classes.menu
    when 'main'
      display_main_options
      main_menu_actions
    when 'book'
      display_book_options
      book_menu_actions
    when 'musicalbum'
      display_music_options
      music_menu_actions
    when 'game'
      display_game_options
      game_menu_actions
    else
      puts 'invalid input'
    end
  end

  def add_book
    @user_interaction.add_book
  end

  def add_music
    @user_interaction.add_music
  end

  def add_game
    @user_interaction.add_game
  end

  def add_label
    @user_interaction.add_label
  end

  def add_genre
    @user_interaction.add_genre
  end

  def add_author
    @user_interaction.add_author
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
    Display.new.display_books(@create_classes.item_list[:book])
  end

  def display_musics
    Display.new.display_musics(@create_classes.item_list[:musicalbum])
  end

  def display_games
    Display.new.display_games(@create_classes.item_list[:game])
  end

  def display_labels
    Display.new.display_labels(@create_classes.label_list[@create_classes.menu.to_s.to_sym])
  end

  def display_genres
    Display.new.display_genres(@create_classes.genre_list[@create_classes.menu.to_s.to_sym])
  end

  def display_authors
    Display.new.display_authors(@create_classes.author_list[@create_classes.menu.to_s.to_sym])
  end
end
