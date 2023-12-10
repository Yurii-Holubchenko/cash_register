require "./app/calculator"

describe Calculator do
  subject(:calculator) { described_class.new(products) }

  let(:products) { {"GR1" => 1, "SR1" => 1, "CF1" => 1} }

  context "#calculate_total_price" do
    subject(:calculate_total_price) { calculator.calculate_total_price }

    context "with empty products list" do
      let(:products) { {} }

      it { expect(calculate_total_price).to eq(0.0) }
    end

    context "with correct products in the list" do
      it { expect(calculate_total_price).to eq(19.34) }
    end

    context "with test cases from doc" do
      context "case 1" do
        let(:products) { {"GR1" => 2} }

        it { expect(calculate_total_price).to eq(3.11) }
      end

      context "case 2" do
        let(:products) { {"GR1" => 1, "SR1" => 3} }

        it { expect(calculate_total_price).to eq(16.61) }
      end

      context "case 3" do
        let(:products) { {"GR1" => 1, "SR1" => 1, "CF1" => 3} }

        it { expect(calculate_total_price).to eq(30.57) }
      end
    end
  end
end
