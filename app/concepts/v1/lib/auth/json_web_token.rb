# frozen_string_literal: true

module V1::Lib::Auth
  class JsonWebToken
    SECRET_KEY = Rails.application.secret_key_base

    def self.encode(payload, exp = 36.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, SECRET_KEY)
    end

    def self.decode(token)
      JWT.decode(token, SECRET_KEY)
    end
  end
end
