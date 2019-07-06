# frozen_string_literal: true

module V1::Tasks::Operation
  class Create < Trailblazer::Operation
    step Model(Task, :new)
    step :assign_current_user!
    step Contract::Build(constant: V1::Tasks::Contract::Create)
    step Contract::Validate()
    step Contract::Persist()
    step :renderer_options

    def assign_current_user!(ctx, current_user:, **)
      ctx[:model].user_id = current_user&.id
    end

    def renderer_options(ctx, **)
      ctx[:renderer_options] = {
        class: {
          Task: V1::Tasks::Representer::Default
        }
      }
    end
  end
end
