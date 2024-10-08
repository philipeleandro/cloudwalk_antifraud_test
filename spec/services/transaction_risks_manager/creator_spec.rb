# frozen_string_literal: true

require "rails_helper"

RSpec.describe TransactionRisksManager::Creator do
  describe ".call" do
    subject(:result) { described_class.new(args).call }

    let(:args) do
      { transaction_id: "1",
        merchant_id: "1",
        user_id: "1",
        card_number: "Fake Number",
        transaction_date: "2024-08-14 19:50:33",
        transaction_amount: "9.999",
        device_id: "1" }
    end

    context "when success" do
      before do
        allow_any_instance_of(RiskAnalysisManager::Validation).to receive(:call).and_return(true)
      end

      it { expect(result).to include(:success, :transaction_risk) }
      it { expect(result[:success]).to be_truthy }
    end

    context "when failure" do
      before do
        allow_any_instance_of(RiskAnalysisManager::Validation).to receive(:call).and_return(false)
      end

      it { expect(result).to include(:success, :transaction_risk) }
      it { expect(result[:success]).to be_falsey }
    end

    context "when has some error" do
      before do
        allow_any_instance_of(RiskAnalysisManager::Validation).to receive(:call).and_raise(StandardError, "Teste")
      end

      it { expect(result).to include(:success, :error) }
      it { expect(result).not_to include(:transaction_risk) }
      it { expect(result[:error]).to eq("Teste") }
    end
  end
end
