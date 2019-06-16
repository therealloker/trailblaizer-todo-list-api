# frozen_string_literal: true

  module Authentication
    def self.included(base)
      base.class_eval do
        rescue_from UnauthorizedError do
          exception_respond(:unauthorized, I18n.t('errors.unauthenticated'))
        end
      end
    end

    def authorize_request!
      auth_header = request.headers['Authorization']
      token = auth_header.split(' ').last
      @auth_payload = V1::Lib::Auth::JsonWebToken.decode(token)
      raise UnauthorizedError if invalid_payload?
    rescue JWT::DecodeError => e
      raise UnauthorizedError
    end

    def current_user
      @current_user ||= User.find_by(id: auth_payload['user_id'])
    end

    private

    attr_reader :auth_payload

    def exception_respond(status, message)
      errors = { base: [message] }

      render jsonapi_errors: errors,
            class: { Hash: V1::Lib::Representer::HashErrorsSerializer },
            status: status
    end
    
    def invalid_payload?
      auth_payload['user_id'].blank? || Time.at(auth_payload['exp']) < Time.now
    end

    class UnauthorizedError < StandardError; end
  end
