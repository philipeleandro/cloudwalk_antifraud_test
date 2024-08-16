# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::TransactionRisksController, type: :request do
  describe "POST /api/v1/transaction_risks" do
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

  describe "GET /api/v1/transaction_risks" do
    let(:params) do
      { transaction_risk: { user_id: "1",
                            has_cbk: "true",
                            recommendation: "approve" } }
    end
    let(:transaction_risks) { create_list(:transaction_risk, 3, has_cbk: true, recommendation: "approve") }

    before do
      transaction_risks
      get "/api/v1/transaction_risks", params: params, headers: { CONTENT_TYPE: "application/json" }
    end

    context "when has has_cbk and recommendation params" do
      it { expect(response).to have_http_status(:ok) }
      it { expect(JSON.parse(response.body).size).to eq(3) }
    end

    context "when filter only one params" do
      let(:params) { { transaction_risk: { user_id: "2" } } }

      before do
        TransactionRisk.last.update(user_id: 2)
        get "/api/v1/transaction_risks", params: params, headers: { CONTENT_TYPE: "application/json" }
      end

      it { expect(JSON.parse(response.body).size).to eq(1) }
    end
  end
end
