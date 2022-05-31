class Genre
  attr_accessor :name
  attr_reader :items

  def initialize(name)
    @id = rand(1..10_000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.genre = self
    @items << item unless @items.include? item
  end
end
