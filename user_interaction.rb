require_relative './create_classes'
require_relative './display'
class UserInteraction
  attr_reader :create_classes

  def initialize
    @create_classes = CreateClasses.new
    @display = Display.new
  end

  def add_book
    print 'Date: '
    date = gets.chomp
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover state: '
    cover_state = gets.chomp
    @create_classes.add_book(date, publisher, cover_state)
    puts ''
    puts 'Book created successfully!'
  end

  def add_music
    print 'Music Album: '
    name = gets.chomp
    publish_date = Utils.get_valid_date('Publish date')
    on_spotify = Utils.validate_boolean
    @create_classes.add_music(name, publish_date, on_spotify)
    puts ''
    puts 'Music Album created successfully!'
  end

  def add_game
    print 'Publish date(YY-MM-DD): '
    date = gets.chomp
    print 'Muliplayer[Y/N]:'
    multiplayer_value = gets.chomp.downcase
    multiplayer = true if multiplayer_value == 'y'
    multiplayer = false if multiplayer_value == 'n'
    print 'last played(YY-MM-DD): '
    last_played_at = gets.chomp
    @create_classes.add_game(date, multiplayer, last_played_at)
    puts ''
    puts 'game created successfully!'
  end

  def add_label
    menu = @create_classes.menu
    item_list = @create_classes.item_list[menu.to_s.to_sym]
    if item_list.empty?
      puts 'The are no available items to be labelled!'
      puts ''
      return
    end
    @display.choose_item_to_label_prompt
    @display.display_decision[menu.to_s.to_sym].call(item_list)
    print '--> '
    item_index = gets.chomp.to_i - 1
    item = item_list[item_index]
    @display.choose_label_prompt
    label_list = @create_classes.label_list[menu.to_s.to_sym]
    @display.display_labels(label_list)
    print '--> '
    label_decision = gets.chomp
    @create_classes.create_new_label(item, label_decision)
  end

  def add_genre
    menu = @create_classes.menu
    item_list = @create_classes.item_list[menu.to_s.to_sym]
    if item_list.empty?
      puts 'The are no available items to add Genre type!'
      puts ''
      return
    end
    @display.choose_item_to_genre_prompt
    @display.display_decision[menu.to_s.to_sym].call(item_list)
    print '--> '
    item_index = gets.chomp.to_i - 1
    item = item_list[item_index]
    @display.choose_genre_prompt
    genre_list = @create_classes.genre_list[menu.to_s.to_sym]
    @display.display_genres(genre_list)
    print '--> '
    genre_decision = gets.chomp
    @create_classes.create_new_genre(item, genre_decision)
  end

  def add_author
    menu = @create_classes.menu
    item_list = @create_classes.item_list[menu.to_s.to_sym]
    if item_list.empty?
      puts 'The are no available items to insert an author!!'
      puts ''
      return
    end
    @display.choose_item_to_set_author
    @display.display_decision[menu.to_s.to_sym].call(item_list)
    print '--> '
    item_index = gets.chomp.to_i - 1
    item = item_list[item_index]
    @display.choose_author_prompt
    author_list = @create_classes.author_list[menu.to_s.to_sym]
    @display.display_authors(author_list)
    print '--> '
    author_decision = gets.chomp
    @create_classes.create_new_author(item, author_decision)
  end
end
