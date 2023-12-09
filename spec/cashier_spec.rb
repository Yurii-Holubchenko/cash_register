require "./cashier_app"

describe CashierApp do
  subject { CashierApp.new }

  context "#calculate_total" do
    let(:products_list) { "GR1,SR1,CF1" }

    context "without list of products" do
      it do
        expect {
          subject.invoke(:calculate_total, [""])
        }.to output(/Total price expected: 0.00€/).to_stdout
      end
    end

    context "with list of products" do
      it do
        expect {
          subject.invoke(:calculate_total, [products_list])
        }.to output(/Total price expected: 19.34€/).to_stdout
      end
    end
  end
end
