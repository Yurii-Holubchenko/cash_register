require "./app/calculator"

describe Calculator do
  subject(:calculator) { described_class.new(products) }

  let(:products) do
    {
      "GR1" => 1,
      "SR1" => 1,
      "CF1" => 1
    }
  end

  context "#calculate_total_price" do
    context "with empty products list" do
      let(:products) { "" }

      it { expect(calculator.calculate_total_price).to eq(0.0) }
    end

    context "with correct products in the list" do
      it { expect(calculator.calculate_total_price).to eq(19.34) }
    end
  end
end
