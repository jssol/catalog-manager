require_relative '../item'
require_relative '../game'

describe Game do

	it 'initialize game class' do
		game = Game.new('2020-2-24',true,'2022-5-31')
		expect(game).to be_instance_of(Game)
		expect(game).to_not be_instance_of(Item)
		expect(game).to be_kind_of(Item)
	end

	it  'move_to_archive method test existance' do
		mock = instance_double(Game)
		expect(mock).to receive(:move_to_archive)
		mock.move_to_archive
	end

	it  'move_to_archive method test false case' do
		game = Game.new('2020-2-24',true,'2022-5-31')
        game.move_to_archive
		expect(game.archived).to eq(false)
	end

	it  'move_to_archive method test true case' do
		game = Game.new('2010-2-24',true,'2020-1-1')
        game.move_to_archive
		expect(game.archived).to eq(true)
	end		
end