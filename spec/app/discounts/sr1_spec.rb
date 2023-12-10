require "./app/discounts/sr1"

describe Discounts::SR1 do
  subject(:discount) { described_class.new(code, quantity) }

  let(:code) { "SR1" }

  context "#price_with_discount" do
    subject(:price_with_discount) { discount.price_with_discount }

    context "with '3 or more strawberries' discount" do
      let(:quantity) { 3 }

      it { expect(price_with_discount).to eq(13.50) }
    end

    context "without '3 or more strawberries' discount" do
      let(:quantity) { 2 }

      it { expect(price_with_discount).to eq(10.00) }
    end
  end
end
