module ResponseHelper
  extend ActiveSupport::Concern

  def parse_response(data)
    response = {}.tap do |hash|
                 hash[:transaction_id] = data.dig(:transaction_risk).try(:transaction_id) || data.dig(:args, :transaction_id)
                 hash[:error] = data[:error]
    end
  end
end


