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
    if(item.kind_of?(Item) && !@items.include?(item)) do
      @items.push(item)
      item.add_label(self)
    end
  end
end