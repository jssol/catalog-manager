# item classs
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

  def add_author; end

  def add_label; end

  def move_to_archive
    @archived = true if can_be_archived?(@publish_date)
  end

  private

  def can_be_archived?(date)
    (Date.today - Date.parse(date)).to_i > 10
  end
end
