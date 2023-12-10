require "thor"
require "./app/calculator"
require "./app/validator"

class CashierApp < Thor
  def self.exit_on_failure?
    false
  end

  desc "calculate_total PRODUCTS", "Calculate total price for cashier. WARNING: PRODUCTS should be comma separated."
  def calculate_total(products)
    products = products.split(/,\s?/).group_by(&:itself).transform_values(&:size)
    validator = Validator.new(products)

    if validator.valid?
      total_price = Calculator.new(products).calculate_total_price
      puts "Total price expected: #{format("%.2f", total_price)}€"
    else
      raise Thor::Error, validator.errors.join("\n")
    end
  end
end

CashierApp.start(ARGV)
