require_relative '../genre'
require_relative '../music_album'

describe Genre do
  context 'It should create a Genre instance with name' do
    genre = Genre.new('Electro')
    music_album = MusicAlbum.new('Reflection', '2018-05-17', true)

    it 'creates new Genre with the given parameters' do
      expect(genre).to be_an_instance_of Genre
    end
    it 'Should check the Genre name' do
      expect(genre.name).to eq 'Electro'
    end

    it 'should add music_album item object to genre items array' do
      genre.add_item(music_album)
      expect(genre.items[0]).to eq music_album
    end
  end
end
