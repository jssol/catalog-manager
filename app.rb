require_relative './music_album'
require_relative './genre'
require_relative './utils'

require 'io/console'
class App
  attr_reader :music_list, :genre_list
  attr_accessor :menu

  def initialize
    @menu = 'main'
    @music_list = []
    @genre_list = {
      book: [
        # {
        #   title: 'title',
        #   color: 'color'
        # }
      ],
      music: [
        # {
        #   title: 'title',
        #   color: 'color'
        # }
      ],
      game: [
        # {
        #   title: 'title',
        #   color: 'color'
        # }
      ]
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

  def display_music_options
    puts 'Music catalog'
    puts ''
    puts 'Choose an option on the list:'
    puts '-----------------------------'
    puts ''
    puts ['1 - Add a Music', '2 - Add a Genre', '3 - List Musics', '4 - List Genres', '5 - Go to main menu',
          '6 - Save and exit']
    puts ''
  end

  def add_music(name, publish_date, on_spotify)
    music = MusicAlbum.new(name, publish_date, on_spotify)
    @music_list << music
  end

  def add_genre(item, name)
    genre = Genre.new(name)
    genre.add_item(item)
    @genre_list[:music] << { title: genre.name } if item.instance_of? MusicAlbum
  end

  def display_musics
    @music_list.each_with_index do |music, index|
      puts "#{index + 1}) music album details:"
      puts "Music Album: #{music.name}"
      puts "On spotify: #{music.on_spotify}"
      puts
    end
  end

  def display_genres
    return if @menu == 'main'

    puts ' Id |       Title       '
    puts '---------------------------------------'
    @genre_list[@menu.to_s.to_sym].each_with_index do |genre, index|
      puts "  #{index + 1} |       #{genre[:title]}   "
      puts '---------------------------------------'
    end
  end
end
