require 'date'
require_relative './item'
# game class

class Game < Item
  attr_reader :multiplayer, :last_played_at

  def initialize(date, multiplayer, last_played_at)
    super(date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    return true if super() && (Date.today - Date.parse(@last_played_at)).to_i > 2 * 365

    false
  end
end
