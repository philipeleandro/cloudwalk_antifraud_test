module ResponseHelper
  extend ActiveSupport::Concern

  def parse_response(data)
    response = {}.tap do |hash|
                 hash[:transaction_id] = data.dig(:transaction_risk).try(:transaction_id) || data.dig(:args, :transaction_id)
    end

    if data[:error]
      response[:error] = data[:error]

      return response
    end

    response[:recommendation] = "approve" if data[:success]

    response[:recommendation] = "deny" unless data[:success]

    response
  end
end


