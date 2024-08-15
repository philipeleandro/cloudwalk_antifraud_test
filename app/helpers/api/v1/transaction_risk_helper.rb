module Api
  module V1
    module TransactionRiskHelper
      TRUE_CONDITION = ["true"]

      def parse_response(data)
        response = {}.tap do |hash|
                    hash[:transaction_id] = data.dig(:transaction_risk).try(:transaction_id) || data.dig(:args, :transaction_id)
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
        transaction_amount.strip.gsub(",",".")
      end

      def parse_has_cbk(has_cbk)
        return true if TRUE_CONDITION.include?(has_cbk.try(:downcase))

        false
      end
    end
  end
end
