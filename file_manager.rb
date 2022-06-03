require 'json'

class FileManager
  def save_file(path, file)
    File.write(path, to_json(file)) if file.size.positive?
  end

  def save_books(path, books)
    temp_books = []
    books.each do |book|
      temp_books << {
        ref: book,
        publisher: book.publisher,
        cover_state: book.cover_state,
        genre: book.genre,
        author: book.author,
        label: book.label,
        publish_date: book.publish_date
      }
    end
    save_file(path, temp_books)
  end

  def recover_books(add_book)
    books = get_file('./data/book_list.json')
    books.each do |book|
      date = book['publish_date']
      publisher = book['publisher']
      cover_state = book['cover_state']
      add_book.call(date, publisher, cover_state)
    end
  end

  def recover_labels(add_label)
    labels = get_file('./data/label_list.json')
    
    labels.each do |key, items_label|
      items_label.each do |label|
        title = label['title']
        color = label['color']
        label_ref = label['ref']
      end
    end
  end

  def get_item_to_label(label_ref, items_list)
    items_list.each do |item|
      return item if item['label'] == label_ref
    end
  end

  def get_file(path)
    response = []
    if path.include('author_list') || path.include('label_list') || path.include('genre_list')
      response = { book: [], musicalbum: [], game: [] }
    end
    response = from_json(File.read(path)) if File.exist?(path)
    response
  end

  def to_hash(object)
    hash = {}
    object.instance_variables.each do |var|
      hash[var.to_s.delete('@')] = object.instance_variable_get(var)
    end
    hash
  end

  private

  def to_json(file)
    JSON.pretty_generate(file)
  end

  def from_json(file)
    JSON.parse(file)
  end
end
