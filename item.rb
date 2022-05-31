require 'date'
require_relative './author'
# item classs
class Item
  attr_reader :id, :archived, :genre, :label, :author, :publish_date

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
    !author.is_a?(Author) && (
      puts 'Wrong paramater. This method only accepts instances of Author class'
      return
    )  
    @author.nil? && (
      @author = author
      author.add_item(self)
    )
  end

  def add_label; end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    (Date.today - Date.parse(@publish_date)).to_i > 365 * 10
  end
end
