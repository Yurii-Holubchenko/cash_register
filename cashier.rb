require "thor"

class CashierApp < Thor
  desc "calculate_total PRODUCTS", "Calculate total price for cashier"
  def calculate_total(products)
    puts products
  end
end

CashierApp.start(ARGV)
