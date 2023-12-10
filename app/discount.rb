require "./app/products"

class Discount
  attr_reader :code, :quantity
  private :code, :quantity

  class << self
    def price_with_discount(code, quantity)
      new(code, quantity).price_with_discount
    end
  end

  def initialize(code, quantity)
    @code = code
    @quantity = quantity
  end

  # WARNING: Default discount rule
  def price_with_discount
    PRODUCTS[code][:price] * quantity
  end
end
