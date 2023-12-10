require "thor/error"
require "./app/products"

class Validator
  attr_reader :products, :errors
  private :products

  def initialize(products)
    @products = products
    @errors = []
  end

  def valid?
    validate_products

    errors.empty?
  end

  private

  def validate_products
    invalid_products = products.keys - PRODUCTS.keys
    unless invalid_products.empty?
      @errors << "Cart include invalid products: #{invalid_products.join(", ")}"
    end
  end
end
