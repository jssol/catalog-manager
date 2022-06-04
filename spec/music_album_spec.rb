require_relative '../music_album'

describe MusicAlbum do
  context 'It should create a musicAlbum instance with name, onspotify and published date' do
    music = MusicAlbum.new('Reflection', '2018-05-17', true)

    it 'creates new musicAlbum with the given parameters' do
      expect(music).to be_an_instance_of MusicAlbum
    end

    it 'Should check the musicAlbum name' do
      expect(music.name).to eq 'Reflection'
    end

    it 'Should check the musicAlbum Published Date' do
      expect(music.publish_date).to eq '2018-05-17'
    end

    it 'should check if it can be archived' do
      expect(music.on_spotify).to eq true
    end
  end
end
