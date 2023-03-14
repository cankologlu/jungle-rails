require 'rails_helper'


RSpec.describe Product, type: :model do
  describe 'Validations' do
   before(:each) do
    @category = Category.new(name:"grass")
    @product = Product.new(name:"green", price_cents: 100, image:"image", quantity:20, description:"description", category:@category)
   end
   it "checks if the product is valid" do
    expect(@product).to be_valid
   end
   
   it "checks if the product has invalid name" do
    @product.name = nil
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to include("Name can't be blank")
   end

   it "checks if the product has price" do
    @product.price_cents = nil
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to include("Price cents is not a number")
   end

   it "checks if the product has category" do
   @product.category = nil
   expect(@product).to_not be_valid
   expect(@product.errors.full_messages).to include("Category must exist", "Category can't be blank")
  end

  it "check if the product quantity is higher than 0"do
  @product.quantity = nil
  expect(@product).to_not be_valid
  expect(@product.errors.full_messages).to include("Quantity can't be blank")
  end
  
  end
end
