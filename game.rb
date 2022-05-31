require 'date'
require_relative 'item'
# game class

class Game < Item
	def initialize(date,multiplayer,last_played)
        super(date)
        @multiplayer = multiplayer
        @last_played_at = last_played
	end

	def can_be_archived?
	 super(@publish_date) && 
	 (Date.today - Date.parse(@last_played_at)).to_i > 2 * 365
	end	
end	