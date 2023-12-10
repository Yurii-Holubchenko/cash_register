require "./app/discounts/cf1"

describe Discounts::CF1 do
  subject(:discount) { described_class.new(code, quantity) }

  let(:code) { "CF1" }

  context "#price_with_discount" do
    subject(:price_with_discount) { discount.price_with_discount }

    context "with '3 or more coffees' discount" do
      let(:quantity) { 3 }

      it { expect(price_with_discount).to eq(22.46) }
    end

    context "without '3 or more coffees' discount" do
      let(:quantity) { 2 }

      it { expect(price_with_discount).to eq(22.46) }
    end
  end
end
