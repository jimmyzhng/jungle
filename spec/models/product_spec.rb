require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    it "creates and saves a product successfully" do
      category = Category.new(name: 'Cacti')
      product = Product.new(name: 'Cactus', price: 50, quantity: 20, category: category)
      expect(product).to be_valid
    end

    it "is not valid without a name" do
      category = Category.new(name: 'Cacti')
      product = Product.new(name: nil, price: 50, quantity: 20, category: category)
      expect(product).to_not be_valid
    end

    it "is not valid without a price" do
      category = Category.new(name: 'Cacti')
      product = Product.new(name: 'Cactus', quantity: 20, category: category)
      expect(product).to_not be_valid
    end

    it "is not valid without quantity" do
      category = Category.new(name: 'Cacti')
      product = Product.new(name: 'Cactus', quantity: nil, price: 50, category: category)
      expect(product).to_not be_valid
    end

    it "is not valid without a category" do
      category = Category.new(name: 'Cacti')
      product = Product.new(name: 'Cactus', price: 50, quantity: 20)
      expect(product).to_not be_valid
    end
  end

end
