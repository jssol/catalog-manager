module RecoverFiles
  def recover_books
    BookStorage.new.load_books.each_with_index do |book, i|
      add_book(book['publish_date'], book['publisher'], book['cover_state'])
      added_book = @item_list[:book][i]
      book['label'] && (
        label = Label.new(book['label']['title'], book['label']['color'])
        label.add_item(added_book)
        @label_list[:book].push({ ref: label, title: label.title, color: label.color })
      )
      book['genre'] && (
        genre = Genre.new(book['genre']['name'])
        genre.add_item(added_book)
        @genre_list[:book].push({ ref: genre, title: genre.name })
      )
      book['author'] && (
        author = Author.new(book['author']['first_name'], book['author']['last_name'])
        author.add_item(added_book)
        @author_list[:book].push({ ref: author, first_name: author.first_name, last_name: author.last_name })
      )
    end
  end

  def recover_musics
    MusicStorage.new.load_musics.each_with_index do |music, i|
      add_music(music['name'], music['publish_date'], music['on_spotify'])
      added_music = @item_list[:musicalbum][i]
      music['label'] && (
        label = Label.new(music['label']['title'], music['label']['color'])
        label.add_item(added_music)
        @label_list[:musicalbum].push({ ref: label, title: label.title, color: label.color })
      )
      music['genre'] && (
        genre = Genre.new(music['genre']['name'])
        genre.add_item(added_music)
        @genre_list[:musicalbum].push({ ref: genre, title: genre.name })
      )
      music['author'] && (
        author = Author.new(music['author']['first_name'], music['author']['last_name'])
        author.add_item(added_music)
        @author_list[:musicalbum].push({ ref: author, first_name: author.first_name, last_name: author.last_name })
      )
    end
  end

  def recover_games
    GameStorage.new.load_games.each_with_index do |game, i|
      add_game(game['publish_date'], game['multiplayer'], game['last_played_at'])
      added_game = @item_list[:game][i]
      game['label'] && (
        label = Label.new(game['label']['title'], game['label']['color'])
        label.add_item(added_game)
        @label_list[:game].push({ ref: label, title: label.title, color: label.color })
      )
      game['genre'] && (
        genre = Genre.new(game['genre']['name'])
        genre.add_item(added_game)
        @genre_list[:game].push({ ref: genre, title: genre.name })
      )
      game['author'] && (
        author = Author.new(game['author']['first_name'], game['author']['last_name'])
        author.add_item(added_game)
        @author_list[:game].push({ ref: author, first_name: author.first_name, last_name: author.last_name })
      )
    end
  end
end
