require "rails_helper"

RSpec.describe RiskAnalysisManager::Validation do
  describe ".call" do
    let(:args)  { { transaction_id: "1",
                    merchant_id: "1",
                    user_id: "1",
                    card_number: "Fake Number",
                    transaction_date: "2024-08-14 19:50:33",
                    transaction_amount: "9.999",
                    device_id: "1" } }
    subject(:result) { RiskAnalysisManager::Validation.new(args).call }

    context "when transaction is rejected" do
      context "when client already has chargeback" do
        before do
          new_args = args
          new_args[:user_id] = "1"
          new_args[:transaction_date] = "2024-08-12"
          new_args[:transaction_amount] = "10.00"

          TransactionRisk.create(new_args.merge(has_cbk: true))
       end

        it { expect(result).to eq(false) }
      end

      context "when exceeds retries" do
        let(:transaction_risks) { create_list(:transaction_risk, 5, args) }

        before do
          args[:transaction_date] = Time.zone.now.to_s

          transaction_risks
        end

        it { expect(result).to eq(false) }
      end

      context "when exceed limit value transaction" do
        before do
          args[:transaction_date] = Time.zone.now.to_s
          args[:transaction_amount] = "1500.00"
        end

        it 'refuses transactions' do
          stub_const("RiskAnalysisManager::Validation::LIMIT_HOUR", Time.zone.now.hour)

          expect(result).to eq(false)
        end
      end

      context "when many card changes" do
        before do
          new_args = args
          new_args[:user_id] = "1"
          new_args[:transaction_date] = "2024-08-12"
          new_args[:transaction_amount] = "10.00"
          new_args[:card_number] = "Another card"

          TransactionRisk.create(new_args.merge(has_cbk: true))
        end

        it 'refuses transactions' do
          stub_const("RiskAnalysisManager::Validation::CARD_NUMBER_LIMIT", 1)

          expect(result).to eq(false)
        end
      end
    end

    context "when transaction is approved" do
      before do
         args[:user_id] = "2"
      end

      it { expect(result).to eq(true) }
    end
  end
end
