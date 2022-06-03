require_relative './file_manager'
require_relative './music_album'
class MusicStorage
  def save_musics(musics)
    data = []
    musics.each do |music|
      hashed_music = to_hash(music)
      data.push(hashed_music)
    end
    FileManager.new.save_file('./data/musics.json', data)
  end

  def load_musics
    FileManager.new.get_file('./data/musics.json')
  end

  private

  def to_hash(music)
    hash = {}
    music.instance_variables.each { |var| hash[var.to_s.delete('@').to_sym] = music.instance_variable_get(var) }
    hash[:label] = { title: music.label.title, color: music.label.color } unless music.label.nil?
    hash[:genre] = { name: music.genre.name } unless music.genre.nil?
    hash[:author] = { first_name: music.author.first_name, last_name: music.author.last_name } unless music.author.nil?
    hash
  end
end
