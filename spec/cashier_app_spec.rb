require "./cashier_app"

describe CashierApp do
  subject(:cashier_app) { described_class.new }

  context "#calculate_total" do
    let(:products_list) { "GR1,SR1,CF1" }

    context "without list of products" do
      it do
        expect {
          cashier_app.invoke(:calculate_total, [""])
        }.to output(/Total price expected: 0.00€/).to_stdout
      end
    end

    context "with list of products" do
      it do
        expect {
          cashier_app.invoke(:calculate_total, [products_list])
        }.to output(/Total price expected: 19.34€/).to_stdout
      end
    end

    context "with incorrect products in the list" do
      let(:products_list) { "GS1" }
      let(:error_messages) { ["Cart include invalid products: #{products_list}"].join("\n") }

      it do
        expect {
          cashier_app.invoke(:calculate_total, [products_list])
        }.to raise_error(Thor::Error, error_messages)
      end
    end
  end
end
