require_relative './item'

class Label
  attr_reader :id, :title, :color, :items

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    item.is_a?(Item) && !@items.include?(item) && (
      @items << item
      item.add_label(self)
    )
  end
end
