require 'rails_helper'


RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    it "is valid with valid attributes of name, price, quantity and category" do
      @category = Category.new
      @category.id = 7
      @category.name = 'shoes'
      
      @product = Product.new
      @product.name = "prod"
      @product.price = 10000
      @product.quantity = 10000
      @product.category_id = @category

      @category.products = [@product]

      @product.save
      
      expect(@product).to be_valid
    end

    it "not valid without a name" do
      @category = Category.new
      @category.id = 7
      @category.name = 'shoes'

      @product = Product.new
      @product.name = nil
      @product.price = 10000
      @product.quantity = 10000
      @product.category_id = @category
      @category.products = [@product]

      @product.save
    
      expect(@product.errors.full_messages[0]).to eql("Name can't be blank")
      expect(@product).to_not be_valid
    end

    it "not valid without a price" do
      @category = Category.new
      @category.id = 7
      @category.name = 'shoes'

      @product = Product.new
      @product.name = 'shoes'
      @product.price = nil
      @product.quantity = 10000
      @product.category_id = @category
      @category.products = [@product]

      @product.save

      expect(@product.errors.full_messages[0]).to eql("Price cents is not a number")
      expect(@product).to_not be_valid

    end

    it "not valid without a quantity" do
      @category = Category.new
      @category.id = 7
      @category.name = 'shoes'

      @product = Product.new
      @product.name = 'shoes'
      @product.price = 1
      @product.quantity = nil
      @product.category_id = @category
      @category.products = [@product]
      @product.save

      expect(@product.errors.full_messages[0]).to eql("Quantity can't be blank")
      expect(@product).to_not be_valid

    end

    it "not valid without a category" do
      @category = Category.new
      @category.id = 7
      @category.name = 'shoes'

      @product = Product.new
      @product.name = 'shoes'
      @product.price = 1
      @product.quantity = 1
      @product.category_id = nil
      @product.save

      @category = [@product]


      expect(@product.errors.full_messages[0]).to eql("Category can't be blank")
      expect(@product).to_not be_valid
     end
   end
  end

