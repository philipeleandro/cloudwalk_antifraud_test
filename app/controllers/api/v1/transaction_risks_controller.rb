# frozen_string_literal: true

module Api
  module V1
    class TransactionRisksController < ApplicationController
      include ResponseHelper

      def create
        instance = TransactionRisksManager::Creator.new(transaction_risks_params)
        result = instance.call

        if result[:error]
          render json: parse_response(result), status: :unprocessable_entity
        else
          render json: parse_response(result), status: :created
        end
      end

      private

      def transaction_risks_params
        params.require(:transaction_risk).permit(:transaction_id, :merchant_id, :user_id, :card_number,
                                                 :transaction_date, :transaction_amount)
      end

      def serialized_transaction_risk(result)
        ActiveModelSerializers::SerializableResource.new(
          result,
          each_serializer: TransactionRiskSerializer
        )
      end
    end
  end
end
