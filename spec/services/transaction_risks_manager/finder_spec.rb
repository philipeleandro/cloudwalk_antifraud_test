# frozen_string_literal: true

require "rails_helper"

RSpec.describe TransactionRisksManager::Finder do
  describe ".call" do
    subject(:result) { described_class.new(args).call }

    let(:args) { { user_id: 1, recommendation: "approve", has_cbk: true } }
    let(:transactions_risk) { create_list(:transaction_risk, 3, recommendation: "approve", has_cbk: true) }

    before { transactions_risk }

    context "when has recommendation and has_ckb params" do
      it { expect(result.size).to eq(3) }
    end

    context "when has recommendation param" do
      let(:args) { { user_id: 1, recommendation: "deny", has_cbk: true } }

      before { TransactionRisk.last.update(recommendation: "deny") }

      it { expect(result.size).to eq(1) }
    end

    context "when has has_cbk param" do
      let(:args) { { user_id: 1, has_cbk: false } }

      before { TransactionRisk.last.update(has_cbk: false) }

      it { expect(result.size).to eq(1) }
    end
  end
end
