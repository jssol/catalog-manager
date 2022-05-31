require_relative './book'
require_relative './label'

require 'io/console'
class App
  attr_reader :book_list, :label_list

  def initialize
    @book_list = []
    @label_list = []
  end

  def display_options
    puts 'Welcome to your catalog manager!'
    puts ''
    puts 'Choose an option on the list:'
    puts '-----------------------------'
    puts '1 - Books'
    puts '2 - Music albums'
    puts '3 - Games'
    puts '4 - Save and exit'
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
    @book_list.each { |_book| puts %(Publisher: "#{book.publisher}") }
  end

  def run
    display_options
  end
end
