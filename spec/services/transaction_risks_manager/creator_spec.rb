require "rails_helper"

RSpec.describe TransactionRisksManager::Creator do
  describe ".call" do
    let(:args)  { { transaction_id: "1",
                    merchant_id: "1",
                    user_id: "1",
                    card_number: "Fake Number",
                    transaction_date: "2024-08-14 19:50:33",
                    transaction_amount: "9.999",
                    device_id: "1" } }
    subject(:result) { described_class.new(args).call }

    before do
      allow_any_instance_of(RiskAnalysisManager::Validation).to receive(:call).and_return(true)
    end

    context "when success" do
      it { expect(result).to include(:success, :transaction_risk) }
      it { expect(result[:success]).to be_truthy }
    end

    context "when failure" do
      before do
        allow_any_instance_of(TransactionRisk).to receive(:save).and_return(false)
      end

      it { expect(result).to include(:success) }
      it { expect(result).not_to include(:transaction_risk) }
      it { expect(result[:success]).to be_falsey }
    end

    context "when has some error" do
      before do
        allow_any_instance_of(TransactionRisk).to receive(:save).and_raise(StandardError, "Teste")
      end

      it { expect(result).to include(:success, :error) }
      it { expect(result).not_to include(:transaction_risk) }
      it { expect(result[:error]).to eq("Teste") }
    end
  end
end
