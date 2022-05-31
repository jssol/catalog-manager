require 'date'
require_relative './item'

# book class
class Book < Item
  attr_reader :publisher, :cover_state

  def initialize(date, publisher, cover_state)
    super(date)
    @publisher = publisher
    @cover_state = cover_state.to_s
  end

  private

  def can_be_archived?
    res = false
    res = true if super() || @cover_state == 'bad'
    res
  end
end