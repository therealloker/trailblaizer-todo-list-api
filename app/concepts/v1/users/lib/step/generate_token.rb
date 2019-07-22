# frozen_string_literal: true

module V1::Users::Lib::Step
  class GenerateToken
    extend Uber::Callable

    def self.call(ctx, **)
      ctx[:jwt] = V1::Lib::Auth::JsonWebToken.encode(user_id: ctx[:model].id)
    end
  end
end
