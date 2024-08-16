# frozen_string_literal: true

module Devise
  def auth_token_for(user)
    Devise::Api::TokensService::Create.new(resource_owner: user).call
    token = Devise::Api::Token.find_by(resource_owner_id: user).access_token

    { Authorization: "Bearer #{token}", CONTENT_TYPE: "application/json" }
  end
end

RSpec.configure do |config|
  config.include Devise, type: :request
end
