require 'date'
require_relative './label'
require_relative './author'

class Item
  attr_reader :genre, :label, :author, :date

  def initialize(date)
    @id = Random.rand(1..1000)
    @genre = nil
    @author = nil
    @label = nil
    @publish_date = date
    @archived = false
  end

  def add_genre; end

  def add_author(author)
    author.is_a?(Author) && @author.nil? && (
      @author = author
      author.add_item(self)
    )
    puts 'There is already an author. You can\'t change it' unless @author.nil?
    puts 'Wrong parameter. This method only accept instances of the Author class' unless author.is_a?(Author)
  end

  def add_label(label)
    label.is_a?(Label) && @label.nil? && (
      @label = label
      label.add_item(self)
    )
    puts 'There is already a label. You can\'t change it' unless @label.nil?
    return if label.is_a?(Label)

    puts 'Wrong parameter. This method only accepts instances of the Label class'
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    (Date.today - Date.parse(@publish_date)).to_i > 365 * 10
  end
end
