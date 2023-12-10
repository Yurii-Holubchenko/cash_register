require "./app/discounts/gr1"

describe Discounts::GR1 do
  subject(:discount) { described_class.new(code, quantity) }

  let(:code) { "GR1" }
  let(:quantity) { 3 }

  context "#price_with_discount" do
    subject(:price_with_discount) { discount.price_with_discount }

    context "with 'buy-one-get-one-free' discount" do
      it { expect(price_with_discount).to eq(6.22) }
    end
  end
end
