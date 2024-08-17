# frozen_string_literal: true

module TransactionRisksManager
  class Finder
    attr_reader :params

    def initialize(params)
      @params = params
    end

    def call
      filtered_query
    end

    private

    def filtered_query
      query = scope
      query = apply_has_cbk_filter(query)
      apply_recommendation_filter(query)
    end

    def scope
      params.key?(:user_id) ? TransactionRisk.where(user_id: params[:user_id]) : TransactionRisk.all
    end

    def apply_has_cbk_filter(query)
      params.key?(:has_cbk) ? query.where(has_cbk: params[:has_cbk]) : query
    end

    def apply_recommendation_filter(query)
      params.key?(:recommendation) ? query.where(recommendation: params[:recommendation]) : query
    end
  end
end
