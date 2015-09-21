require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
  test "product attributes must not be empty" do
  # свойства товара не должны оставаться пустыми
  product = Product.new
  assert product.invalid?
  assert product.errors[:title].any?
  assert product.errors[:description].any?
  assert product.errors[:price].any?
  assert product.errors[:image_url].any?
  end

  test "Product price must be positive" do
  product = Product.new(title: "proverka",
                        description: "oohuet opisanie",
                        image_url: "djfjifgfdji.jpg")
  product.price = -1
  assert product.invalid?
  product.price = 0
  assert product.invalid?
  product.price = 1
  assert product.valid?
  end
end
