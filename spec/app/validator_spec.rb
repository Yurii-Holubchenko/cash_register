require "./app/validator"

describe Validator do
  subject(:validator) { described_class.new(products) }

  let(:products) do
    {
      "GR1" => 1,
      "SR1" => 1,
      "CF1" => 1
    }
  end

  context "#valid?" do
    subject(:valid?) { validator.valid? }

    context "with correct products in the list" do
      it { expect(valid?).to be_truthy }
    end

    context "with incorrect products in the list" do
      let(:products) { {"GS1" => 1} }

      it { expect(valid?).to be_falsy }
      it do
        valid?
        expect(validator.errors).to contain_exactly("Cart include invalid products: GS1")
      end
    end
  end
end
