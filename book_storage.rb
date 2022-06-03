require_relative './file_manager'
require_relative './book'

class BookStorage
  def save_books(books)
    data = []
    books.each do |book|
      hashed_book = to_hash(book)
      data.push(hashed_book)
    end
    FileManager.new.save_file('./data/books.json', data)
  end

  def load_books
    FileManager.new.get_file('./data/books.json')
  end

  private

  def to_hash(book)
    hash = {}
    book.instance_variables.each { |var| hash[var.to_s.delete('@').to_sym] = book.instance_variable_get(var) }
    hash[:label] = { title: book.label.title, color: book.label.color } unless book.label.nil?
    hash[:genre] = { name: book.genre.name } unless book.genre.nil?
    hash[:author] = { first_name: book.author.first_name, last_name: book.author.last_name } unless book.author.nil?
    hash
  end
end
