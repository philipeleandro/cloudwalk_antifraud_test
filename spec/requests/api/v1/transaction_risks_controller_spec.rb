# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::TransactionRisksController, type: :request do
  let(:body) do
    { "transaction_id": "1",
      "merchant_id": "1",
      "user_id": "1",
      "card_number": "Fake Number",
      "transaction_date": "2024-08-14 19:50:33",
      "transaction_amount": "9.99",
      "device_id": "1" }
  end

  before do
    allow_any_instance_of(TransactionRisksManager::Creator).to receive(:call).and_return(response_service)

    post "/api/v1/transaction_risks", params: body.to_json, headers: { CONTENT_TYPE: "application/json" }
  end

  context "when approve transaction" do
    let(:transaction_risk)  { create(:transaction_risk) }
    let(:response_service)  do
      { success: true,
        transaction_risk: transaction_risk }
    end

    it { expect(response).to have_http_status(:created) }
    it { expect(response.body).to include("transaction_id", "recommendation") }
  end

  context "when deny transaction" do
    let(:transaction_risk)  { build(:transaction_risk) }
    let(:response_service)  do
      { success: false,
        transaction_risk: transaction_risk }
    end

    it { expect(response).to have_http_status(:created) }
    it { expect(response.body).to include("transaction_id", "recommendation") }
  end

  context "when raise error" do
    let(:transaction_risk) { build(:transaction_risk) }
    let(:response_service) do
      { success: false,
        args: transaction_risk.attributes,
        error: "Error test" }
    end

    it { expect(response).to have_http_status(:unprocessable_entity) }
    it { expect(response.body).to include("transaction_id", "error") }
    it { expect(response.body).not_to include("recommendation") }
  end
end
