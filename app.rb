require_relative './book'
require_relative './label'

require 'io/console'
class App
  attr_reader :book_list, :label_list
  attr_accessor :menu

  def initialize
    @menu = 'main'
    @book_list = []
    # This file structure below represents the template for the label, the author and the genre classes
    # because we have to differentiate them by the item type.
    # Important: You should customize the implementation according to the class you are working on.
    @label_list = {
      book: [
        # {
        #   title: 'title',
        #   color: 'color'
        # }
      ],
      musicalbum: [
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

  def display_book_options
    puts 'Books catalog'
    puts ''
    puts 'Choose an option on the list:'
    puts '-----------------------------'
    puts ''
    puts ['1 - Add a book', '2 - Add a label', '3 - List books', '4 - List labels', '5 - Go to main menu',
          '6 - Save and exit']
    puts ''
  end

  def add_book(date, publisher, cover_state)
    book = Book.new(date, publisher, cover_state)
    @book_list << book
  end

  def add_label(item, title, color)
    label = Label.new(title, color)
    label.add_item(item)
    @label_list[:book] << { title: label.title, color: label.color } if item.instance_of? Book
  end

  def display_books
    @book_list.each_with_index do |book, index|
      puts "#{index + 1} - Publisher: #{book.publisher}"
    end
  end

  def display_labels
    return if @menu == 'main'

    puts ' Id |       Title       |       Color       '
    puts '---------------------------------------'
    @label_list[@menu.to_s.to_sym].each_with_index do |label, index|
      puts "  #{index + 1} |       #{label[:title]}       |     #{label[:color]}         "
      puts '---------------------------------------'
    end
  end
end
