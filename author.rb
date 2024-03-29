require_relative './item'
# author class

class Author
  attr_reader :id, :first_name, :last_name, :items

  def initialize(first_name, last_name)
    @id = Random.rand(1..1000)
    @first_name = first_name
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
