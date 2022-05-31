require_relative './book'
require_relative './label'

require 'io/console'
class App
  attr_reader :book_list, :label_list
  attr_accessor :menu

  def initialize
    @menu = 'main'
    @book_list = []
    @label_list = []
  end

  def display_main_options
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
    puts ['1 - Create a book', '2 - List all books', '3 - Go to main menu', '4 - Save and exit'] 
    puts ''
  end

  def add_book(date, publisher, cover_state)
    book = Book.new(date, publisher, cover_state)
    @book_list << book
  end

  def add_label(item, title, color)
    label = Label.new(title, color)
    label.add_item(item)
    @label_list << label
  end

  def display_books
    @book_list.each { |book| puts %(Publisher: "#{book.publisher}") }
  end
end
