class Calculator
  PRODUCTS = {
    "GR1" => 3.11,
    "SR1" => 5.00,
    "CF1" => 11.23
  }

  def initialize(products)
    @products = products
  end

  def calculate_total_price
    return 0 if products.nil?

    products.sum do |code, quantity|
      PRODUCTS[code] * quantity
    end
  end

  private

  attr_reader :products
end
