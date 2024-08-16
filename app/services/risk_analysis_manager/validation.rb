# frozen_string_literal: true

module RiskAnalysisManager
  class Validation
    attr_reader :args

    LIMIT_VALUE = 1000.00
    LIMIT_HOUR = 22
    MAX_TRANSACTIONS = 5
    CARD_NUMBER_LIMIT = 5

    def initialize(args)
      @args = args
    end

    def call
      return false if cbk?
      return false if exceed_retries?
      return false if exceed_limit_value_transaction?
      return false if many_card_changes?

      true
    end

    private

    def cbk?
      transaction_cbk = TransactionRisk.has_cbk?(args[:user_id])

      return true if transaction_cbk.any?

      false
    end

    def exceed_limit_value_transaction?
      return true if parsed_time.hour == LIMIT_HOUR && args[:transaction_amount].to_d > LIMIT_VALUE

      false
    end

    def exceed_retries?
      recent_transactions_count = TransactionRisk.by_date(args[:user_id], 1.minute.ago).size

      return true if recent_transactions_count == MAX_TRANSACTIONS

      false
    end

    def many_card_changes?
      card_number_transactions = TransactionRisk.by_date(args[:user_id], 1.day.ago).pluck(:card_number).last(5)
      card_numbers_quantity = card_number_transactions.uniq

      return true if card_numbers_quantity.size == 5

      false
    end

    def parsed_time
      Time.parse(args[:transaction_date]) # rubocop:disable Rails/TimeZone
    end
  end
end
