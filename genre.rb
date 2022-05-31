require_relative 'item'
class Genre
  attr_accessor :name
  attr_reader :items

  def initialize(name)
    @id = rand(1..10_000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.is_a?(Item) && !@items.include?(item) && (
        @item.push(item)
        item.add_genre(self)
      )
  end
end
