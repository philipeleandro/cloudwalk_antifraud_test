# frozen_string_literal: true

module TransactionRisksManager
  class Creator
    attr_reader :args

    def initialize(args)
      @args = args
    end

    def call
      response if valid_transaction?
    end

    private

    def valid_transaction?
      RiskAnalysisManager::Validation.new(args).call
    end

    def response
      {}.tap do |hash|
        hash[:success] = transaction_risk.persisted? ? true : false
        hash[:transaction_risk] = transaction_risk
      end
    rescue StandardError => e
      { success: false, args: args, error: e.message }
    end

    def transaction_risk
      @transaction_risk ||= TransactionRisk.create(args)
    end
  end
end
