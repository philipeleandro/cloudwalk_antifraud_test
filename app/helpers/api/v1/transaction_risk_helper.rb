# frozen_string_literal: true

module Api
  module V1
    module TransactionRiskHelper
      def parse_response(data)
        {}.tap do |hash|
          hash[:transaction_id] = data[:transaction_risk].try(:transaction_id) ||
                                  data.dig(:args, :transaction_id)
          hash[:error] = data[:error]
        end
      end

      def parsed_params(params)
        params[:transaction_amount] = parse_transaction_amount(params[:transaction_amount])
        params[:has_cbk] = parse_has_cbk(params[:has_cbk])

        params
      end

      private

      def parse_transaction_amount(transaction_amount)
        transaction_amount.strip.tr(",", ".") if transaction_amount.is_a?(String)
      end

      def parse_has_cbk(has_cbk)
        return true if has_cbk.try(:downcase) == "true"

        false
      end
    end
  end
end
