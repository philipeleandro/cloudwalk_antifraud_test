# frozen_string_literal: true

module TransactionRisksManager
  class Creator
    attr_reader :args

    def initialize(args)
      @args = args
    end

    def call
      recommendation_set(validate_transaction)
      persist_transaction_risk(@transaction_risk)
      response
    rescue StandardError => e
      { success: false, args: args, error: e.message }
    end

    private

    def validate_transaction
      @validate_transaction ||= RiskAnalysisManager::Validation.new(args).call
    end

    def response
      {}.tap do |hash|
        hash[:success] = @validate_transaction
        hash[:transaction_risk] = @transaction_risk
      end
    end

    def transaction_risk
      @transaction_risk ||= TransactionRisk.new(args)
    end

    def recommendation_set(analysis_response)
      return transaction_risk.recommendation = "approve" if analysis_response

      transaction_risk.recommendation = "deny"
    end

    def persist_transaction_risk(transaction_risk)
      transaction_risk.save
    end
  end
end
