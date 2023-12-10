require "./app/discount"

describe Discount do
  subject(:discount) { described_class.new(code, quantity) }

  let(:code) { "TEST_PRODUCT" }
  let(:quantity) { 3 }

  around do |example|
    original_value = PRODUCTS
    begin
      Object.send(:remove_const, :PRODUCTS)
      Object.const_set(:PRODUCTS, {code => {price: 5}})

      example.run
    ensure
      Object.send(:remove_const, :PRODUCTS)
      Object.const_set(:PRODUCTS, original_value)
    end
  end

  context ".price_with_discount" do
    it { expect(described_class.price_with_discount(code, quantity)).to eq(15) }
  end

  context "#price_with_discount" do
    subject(:price_with_discount) { discount.price_with_discount }

    it { expect(price_with_discount).to eq(15) }
  end
end
