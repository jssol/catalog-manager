require_relative './file_manager'
require_relative './game'
class GameStorage
  def save_games(games)
    data = []
    games.each do |game|
      hashed_game = to_hash(game)
      data.push(hashed_game)
    end
    FileManager.new.save_file('./data/games.json', data)
  end

  def load_games
    FileManager.new.get_file('./data/games.json')
  end

  private

  def to_hash(game)
    hash = {}
    game.instance_variables.each { |var| hash[var.to_s.delete('@').to_sym] = game.instance_variable_get(var) }
    hash[:label] = { title: game.label.title, color: game.label.color } unless game.label.nil?
    hash[:genre] = { name: game.genre.name } unless game.genre.nil?
    hash[:author] = { first_name: game.author.first_name, last_name: game.author.last_name } unless game.author.nil?
    hash
  end
end
