require 'space'
require 'pg'
require_relative 'database_helpers'

describe Space do
  subject(:space) { described_class.new(name: name, description: description, price: price, user_id: user_id) }
  let(:name) { '1 Space Avenue' }
  let(:description) { 'Ugly, Fear-Inducing Bungalow' }
  let(:price) { '50.00' }
  let(:user_id) { 1 }

  describe '#name' do
    it 'returns the space name' do
      expect(space.name).to eq('1 Space Avenue')
    end
  end

  describe '#describe' do
    it 'returns the space description' do
      expect(space.description).to eq('Ugly, Fear-Inducing Bungalow')
    end
  end

  describe '#price' do
    it 'returns the space price' do
      expect(space.price).to eq('50.00')
    end
  end

  describe '.all' do
    it 'returns a list of spaces' do
      connection = PG.connect(dbname: 'makersbnb_test')
      connection.exec_params("INSERT INTO users (id) VALUES ($1)", [1])
  
      space = Space.add(name: 'New space', description: 'Hilarious fun description', price: '22.34', user_id: 1)
  
      spaces = Space.all
  
      expect(spaces.size).to eq 1
      expect(spaces.first).to be_a Space
      expect(spaces.first.description).to eq 'Hilarious fun description'
      expect(spaces.last.user_id).to eq '1'
    end
  end

  describe '.add' do
    it 'adds a space' do
      connection = PG.connect(dbname: 'makersbnb_test')
      connection.exec_params("INSERT INTO users (id) VALUES ($1)", [1])
      space = Space.add(name: 'Newer space', description: 'Boring description', price: '22.34', user_id: 1)

      expect(space).to be_a Space
      expect(space.description).to eq 'Boring description'
      expect(space.price).to eq '22.34'
    end
  end
end