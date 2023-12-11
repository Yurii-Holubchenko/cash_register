require "thor"
require "pstore"
require "./app/calculator"
require "./app/validator"

class CashierApp < Thor
  def self.exit_on_failure?
    false
  end

  desc "calculate_total PRODUCTS", "Calculate total price for products in the cart."
  def calculate_total
    products = pstore.transaction { |store| store.delete(:products) }
    if products.nil?
      puts "Cart is empty" and return
      return
    end

    products = products.join(",").split(/,\s?/).group_by(&:itself).transform_values(&:size)
    validator = Validator.new(products)

    if validator.valid?
      total_price = Calculator.new(products).calculate_total_price
      puts "Total price expected: #{format("%.2f", total_price)}€"
    else
      raise Thor::Error, validator.errors.join("\n")
    end
  end

  desc "add_products PRODUCTS", "Add products to the cart. WARNING: Multiple PRODUCTS should be comma separated."
  def add_products(products)
    pstore.transaction do |store|
      store[:products] = (store[:products] || []) << products
    end
  end

  private

  no_commands do
    def pstore
      PStore.new("/tmp/cart.txt")
    end
  end
end

CashierApp.start(ARGV)
