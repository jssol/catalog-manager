# item classs
class Item
  def initialize(date)
    @id = Random.rand(1..1000)
    @genre = nil
    @author = nil
    @label = nil
    @publish_date = date
    @archived = move_to_archive(@publish_date)
  end

  def add_genre; end

  def add_author; end

  def add_label; end

  def can_be_archived?(date)
    (Date.today - Date.parse(date)).to_i > 10
  end

  def move_to_archive(date)
    can_be_archived?(date)
  end
end
