require_relative '../item'
require_relative '../author'

describe Author do

	it 'initialize author class' do
		author = Author.new('Saied','Gaffer')
		expect(author).to be_instance_of(Author)
		expect(author).to_not be_instance_of(Item)
		expect(author).to_not be_kind_of(Item)
	end

	it  'add_item method test existance' do
		mock = instance_double(Author)
		expect(mock).to receive(:add_item)
		mock.add_item('saied')
	end

	it  'add_item method add instance of item class' do
		author = Author.new('Saied','Gaffer')
		item = Item.new('2020-2-24')
        author.add_item(item)
		expect(author.items.length).to eq(1)
	end

	it  'add_item method add instance of item class twice' do
		author = Author.new('Saied','Gaffer')
		item = Item.new('2020-2-24')
        author.add_item(item)
        author.add_item(item)
		expect(author.items.length).to eq(1)
	end

	it  'add_item method pass wrong parameter' do
		author = Author.new('Saied','Gaffer')
        author.add_item('item')
		expect(author.items.length).to eq(0)
	end		
end