# frozen_string_literal: true

module V1::Users::Operation
  class Login < Trailblazer::Operation
    step Contract::Build(constant: V1::Users::Contract::Login)
    step Contract::Validate(), fail_fast: true
    step :find
    step :authenticate!
    fail :invalid_credentials!
    step :generate_token!
    step :renderer_options

    def find(ctx, params:, **)
      ctx[:model] = User.find_by(email: params[:email])
    end

    def authenticate!(ctx, params:, **)
      ctx[:model].authenticate(params[:password])
    end

    def invalid_credentials!(ctx, **)
      ctx['contract.default'].errors.add(:user, I18n.t('errors.invalid_credentials'))
    end

    def generate_token!(ctx, **)
      ctx[:jwt] = V1::Lib::Auth::JsonWebToken.encode(user_id: ctx[:model].id)
    end

    def renderer_options(ctx, jwt:, **)
      ctx[:renderer_options] = {
        meta: { token: jwt },
        class: { User: V1::Users::Representer::Login }
      }
    end
  end
end
