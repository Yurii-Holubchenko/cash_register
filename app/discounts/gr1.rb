require "./app/discount"

module Discounts
  class GR1 < Discount
    def price_with_discount
      PRODUCTS[code][:price] * (quantity / 2 + quantity % 2)
    end
  end
end
