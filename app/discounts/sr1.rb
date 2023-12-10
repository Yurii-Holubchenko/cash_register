require "./app/discount"

module Discounts
  class SR1 < Discount
    def price_with_discount
      price = (quantity >= 3) ? 4.50 : PRODUCTS[code][:price]
      price * quantity
    end
  end
end
