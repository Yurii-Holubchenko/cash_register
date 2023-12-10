require "./app/discount"

module Discounts
  class CF1 < Discount
    def price_with_discount
      price = (quantity >= 3) ? (PRODUCTS[code][:price] * 2 / 3) : PRODUCTS[code][:price]
      price * quantity
    end
  end
end
