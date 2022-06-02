require 'date'
require_relative './item'
# game class

class Game < Item
  attr_reader :multiplayer, :last_played

  def initialize(date, multiplayer, last_played)
    super(date)
    @multiplayer = multiplayer
    @last_played = last_played
  end

  private

  def can_be_archived?
    return true if super() && (Date.today - Date.parse(@last_played)).to_i > 2 * 365

    false
  end
end
