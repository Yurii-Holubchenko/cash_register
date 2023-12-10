require "./cashier_app"

describe CashierApp do
  subject(:cashier_app) { described_class.new }

  context "#calculate_total" do
    subject(:calculate_total) { cashier_app.invoke(:calculate_total, [products_list]) }

    let(:products_list) { "GR1,SR1,CF1" }

    context "without list of products" do
      let(:products_list) { "" }

      it do
        expect {
          calculate_total
        }.to output(/Total price expected: 0.00€/).to_stdout
      end
    end

    context "with list of products" do
      it do
        expect {
          calculate_total
        }.to output(/Total price expected: 19.34€/).to_stdout
      end
    end

    context "with incorrect products in the list" do
      let(:products_list) { "GS1" }
      let(:error_messages) { ["Cart include invalid products: #{products_list}"].join("\n") }

      it do
        expect {
          calculate_total
        }.to raise_error(Thor::Error, error_messages)
      end
    end

    context "with test cases from doc" do
      context "case 1" do
        let(:products_list) { "GR1,GR1" }

        it do
          expect {
            calculate_total
          }.to output(/Total price expected: 3.11€/).to_stdout
        end
      end

      context "case 2" do
        let(:products_list) { "SR1,SR1,GR1,SR1" }

        it do
          expect {
            calculate_total
          }.to output(/Total price expected: 16.61€/).to_stdout
        end
      end

      context "case 3" do
        let(:products_list) { "GR1,CF1,SR1,CF1,CF1" }

        it do
          expect {
            calculate_total
          }.to output(/Total price expected: 30.57€/).to_stdout
        end
      end
    end
  end
end
