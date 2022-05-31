require_relative '../book'

describe Book do
  before :each do
    @book = Book.new '2022-05-31', 'Universal', 'bad'
  end

  context 'initialization' do
    it 'should be an instance of Book' do
      expect(@book).to be_instance_of Book
    end

    it 'should not be an instance of Item' do
      expect(@book).not_to be_instance_of Item
    end

    it 'should be a kind of Item' do
      expect(@book).to be_kind_of Item
    end
  end

  context 'publisher' do
    it 'should be "Universal"' do
      expect(@book.publisher).to eql 'Universal'
    end
  end

  context 'cover state' do
    it 'should be "bad"' do
      expect(@book.cover_state).to eql 'bad'
    end
  end
end
