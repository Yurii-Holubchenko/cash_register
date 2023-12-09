require "./app/calculator"

describe Calculator do
  subject { Calculator.new(products) }

  let(:products) { "GR1,SR1,CF1" }

  context "#initialize" do
    context "with incorrect products in the list" do
      let(:products) { "GS1" }

      it do
        expect {
          Calculator.new(products)
        }.to raise_error(Thor::Error, "Cart include invalid products: #{products}")
      end
    end
  end

  context "#calculate_total_price" do
    context "with empty products list" do
      let(:products) { "" }

      it { expect(subject.calculate_total_price).to eq(0.0) }
    end

    context "with correct products in the list" do
      it { expect(subject.calculate_total_price).to eq(19.34) }
    end
  end
end
