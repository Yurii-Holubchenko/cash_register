require "thor/error"

class Calculator
  PRODUCTS = {
    "GR1" => 3.11,
    "SR1" => 5.00,
    "CF1" => 11.23
  }

  def initialize(products)
    @products = products.split(/,\s?/).group_by(&:itself).transform_values(&:size)
    validate_products
  end

  def calculate_total_price
    return 0 if products.empty?

    products.sum do |code, quantity|
      PRODUCTS[code] * quantity
    end
  end

  private

  attr_reader :products

  def validate_products
    invalid_products = products.keys - PRODUCTS.keys
    unless invalid_products.empty?
      raise Thor::Error, "Cart include invalid products: #{invalid_products.join(", ")}"
    end
  end
end
