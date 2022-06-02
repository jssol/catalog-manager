class Display
  attr_reader :display_decision

  def initialize
    @display_decision = {
      book: method(:display_books), musicalbum: method(:display_musics), game: method(:display_games)
    }
  end

  def display_main_options
    print "\nWelcome to your catalog manager!\n\n"
    puts 'Choose an option on the list:'
    print "-----------------------------\n\n"
    puts ['1 - Books', '2 - Music albums', '3 - Games', '4 - Save and exit', '']
  end

  def display_book_options
    print "\nBooks catalog\n\n"
    puts 'Choose an option on the list:'
    print "-----------------------------\n\n"
    puts ['1 - Add a book', '2 - Add a label', '3 - Add a genre', '4 - Add an author',
          '5 - List books', '6 - List labels', '7 - List genres', '8 - List authors',
          '9 - Go to main menu', '10 - Save and exit', '']
  end

  def display_music_options
    print "\nMusic catalog\n\n"
    puts 'Choose an option on the list:'
    print "-----------------------------\n\n"
    puts ['1 - Add a music album', '2 - Add a label', '3 - Add a genre', '4 - Add an author',
          '5 - List music albums', '6 - List labels', '7 - List genres', '8 - List authors',
          '9 - Go to main menu', '10 - Save and exit', '']
  end

  def display_game_options
    print "\nGame catalog\n\n"
    puts 'Choose an option on the list:'
    print "-----------------------------\n"
    puts ['1 - Add a game', '2 - Add a label', '3 - Add a genre', '4 - Add an author',
          '5 - List games', '6 - List labels', '7 - List genres', '8 - List authors',
          '9 - Go to main menu', '10 - Save and exit', '']
  end

  def display_books(book_list)
    if book_list.empty?
      puts 'No books available!'
      puts ''
      return
    end
    book_list.each_with_index do |book, index|
      puts "#{index + 1} - Publisher: #{book[:publisher]}, Cover state: #{book[:cover_state]}"
      puts ''
    end
  end

  def display_musics(music_list)
    if music_list.empty?
      puts 'No Music Albums available!'
      puts ''
      return
    end
    music_list.each_with_index do |music, index|
      puts "#{index + 1}) music album details:"
      puts "Music Album: #{music[:name]}"
      puts "On spotify: #{music[:on_spotify]}"
    end
    puts ''
  end

  def display_games(game_list)
    if game_list.empty?
      puts 'No games available!'
      puts ''
      return
    end
    game_list.each_with_index do |game, i|
      multiplayer_value = game[:multiplayer]
      multiplayer = 'yes' if multiplayer_value
      multiplayer = 'no' unless multiplayer_value
      print "\n#{i + 1} - Publish date: #{game[:publish_date]}, Multiplayer: #{multiplayer.capitalize}, "
      print "Last played: #{game[:last_played]}"
    end
    puts ''
  end

  def choose_item_to_label_prompt
    puts 'Choose the item to label by number:'
    puts '-----------------------------------'
    puts ''
  end

  def choose_label_prompt
    puts ''
    puts 'Choose from the list or create a new label:'
    puts '-------------------------------------------'
    puts 'Type an Id to choose or "New" to create a label'
    puts ''
  end

  def display_labels(label_list)
    if label_list.empty?
      puts 'No labels available!'
      puts ''
      return
    end
    puts ' Id |       Title       |       Color       '
    puts '---------------------------------------'
    label_list.each_with_index do |label, index|
      puts "  #{index + 1} |       #{label[:title]}       |     #{label[:color]}         "
      puts '---------------------------------------'
    end
    puts ''
  end

  def choose_item_to_genre_prompt
    puts 'Choose the item to add a genre by number:'
    print "------------------------------------------\n\n"
  end

  def choose_genre_prompt
    print "\nChoose from the list or create a genre:\n"
    puts '---------------------------------------'
    print "Type an Id to choose or \"New\" to create a Genre\n\n"
  end

  def display_genres(genre_list)
    if genre_list.empty?
      puts 'No genres available!'
      puts ''
      return
    end
    puts ' Id |       Title       '
    puts '---------------------------------------'
    genre_list.each_with_index do |genre, index|
      puts "  #{index + 1} |       #{genre[:title]}   "
      puts '------------------------------------------'
    end
    puts ''
  end

  def choose_item_to_set_author
    puts 'Choose the item to set an author by number:'
    puts '-------------------------------------------'
    puts ''
  end

  def choose_author_prompt
    puts ''
    puts 'Choose from the list or create a new author:'
    puts '-------------------------------------------'
    puts 'Type an number of the list to choose or "New" to create an author'
    puts ''
  end

  def display_authors(author_list)
    if author_list.empty?
      puts 'No authors available!'
      puts ''
      return
    end
    puts '       first name       |       last name       '
    puts '--------------------------------------------'
    author_list.each_with_index do |author, i|
      puts "  #{i + 1} |       #{author[:first_name]}       |       #{author[:last_name]}       "
      puts '------------------------------------------'
    end
    puts ''
  end
end
