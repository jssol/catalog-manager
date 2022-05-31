require_relative './item'
# author class

class Author
  attr_reader :id, :frist_name, :last_name, :items

  def initialize(frist_name, last_name)
    @id = Random.rand(1..1000)
    @frist_name = frist_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    item.is_a?(Item) && !@items.include?(item) && (
      @items.push(item)
      item.add_author(self)
    )
  end
end
