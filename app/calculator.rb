require "./app/products"
require "./app/discount"
Dir.glob(File.join(Dir.pwd, 'app', "discounts", '*.rb'), &method(:require))

class Calculator
  attr_reader :products
  private :products

  def initialize(products)
    @products = products
  end

  def calculate_total_price
    return 0.00 if products.nil?

    products.sum { |code, quantity| price_with_discount(code, quantity) }.round(2)
  end

  private

  def price_with_discount(code, quantity)
    discount_klass = begin
      Object.const_get("Discounts::#{code}")
    rescue
      Discount
    end

    discount_klass.price_with_discount(code, quantity)
  end
end
