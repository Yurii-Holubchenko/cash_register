require "thor"
require "./app/calculator"

class CashierApp < Thor
  def self.exit_on_failure?
    false
  end

  desc "calculate_total PRODUCTS", "Calculate total price for cashier. WARNING: PRODUCTS should be comma separated."
  def calculate_total(products)
    total_price = Calculator.new(products).calculate_total_price
    puts "Total price expected: #{format("%.2f", total_price)}€"
  end
end

CashierApp.start(ARGV)
