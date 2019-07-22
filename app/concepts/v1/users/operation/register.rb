# frozen_string_literal: true

module V1::Users::Operation
  class Register < Trailblazer::Operation
    step Model(User, :new)
    step Contract::Build(constant: V1::Users::Contract::Register)
    step Contract::Validate()
    step Contract::Persist()
    step V1::Users::Lib::Step::GenerateToken
    step :renderer_options

    def renderer_options(ctx, jwt:, **)
      ctx[:renderer_options] = {
        meta: { token: jwt },
        class: { User: V1::Users::Representer::Default }
      }
    end
  end
end
