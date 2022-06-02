
class display

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
          '9 - Go to main menu', '10 - Save and exit']

    puts ''
  end

  def display_music_options
    puts 'Music catalog'
    puts ''
    puts 'Choose an option on the list:'
    puts '-----------------------------'
    puts ''
    puts ['1 - Add a music album', '2 - Add a label', '3 - Add a genre', '4 - Add an author',
          '5 - List music albums', '6 - List labels', '7 - List genres', '8 - List authors',
          '9 - Go to main menu', '10 - Save and exit']
    puts ''
  end

  def display_game_options
    puts 'Game catalog'
    puts ''
    puts 'Choose an option on the list:'
    puts '-----------------------------'
    puts ''
    puts ['1 - Add a game', '2 - Add a label', '3 - Add a genre', '4 - Add an author',
          '5 - List games', '6 - List labels', '7 - List genres', '8 - List authors',
          '9 - Go to main menu', '10 - Save and exit']
    puts ''
  end

  def display_books(book_list)
   if app.item_list[:book].empty?
     puts 'No books available!'
     puts ''
     return
   end
   book_list.each_with_index do |book, index|
      puts "#{index + 1} - Publisher: #{book.publisher}, Cover state: #{book.cover_state}"
   puts ''
  end

  def display_musics(music_list)
   if app.item_list[:musicalbum].empty?
     puts 'No Music Albums available!'
     puts ''
     return
   end
   music_list.each_with_index do |music, index|
      puts "#{index + 1}) music album details:"
      puts "Music Album: #{music.name}"
      puts "On spotify: #{music.on_spotify}"
    end
   puts ''
  end

  def display_games(game_list)
	if app.item_list[:game].empty?
	  puts 'No games available!'
	  puts ''
	  return
	end
	game_list.each_with_index do |game, i|
      multiplayer_value = game.multiplayer
      multiplayer = 'yes' if multiplayer_value
      multiplayer = 'no' unless multiplayer_value
      print "\n#{i + 1} - Publish date: #{game.publish_date}, Multiplayer: #{multiplayer.capitalize}, "
      print "Last played: #{game.last_played_at}"
    end
	puts ''
  end

  def display_labels(label_list)
    if app.label_list[app.menu.to_s.to_sym].empty?
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

  def display_genres(genre_list)
    if app.genre_list[app.menu.to_s.to_sym].empty?
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

  def display_authors(author_list)
    if app.author_list[app.menu.to_s.to_sym].empty?
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