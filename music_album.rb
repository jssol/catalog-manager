require './item'
class MusicAlbum < Item
  attr_accessor :name, :on_spotify

  def initialize(name, publish_date, on_spotify)
    super(publish_date)
    @name = name
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && @on_spotify
  end

  def on_spotify?
    @on_spotify == true
  end
end
