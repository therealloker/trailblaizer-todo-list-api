# frozen_string_literal: true

module V1::Projects::Operation
  class Create < Trailblazer::Operation
    step Model(Project, :new)
    step :assign_current_user!
    step Contract::Build(constant: V1::Projects::Contract::Default)
    step Contract::Validate()
    step Contract::Persist()
    step :renderer_options

    def assign_current_user!(ctx, current_user:, **)
      ctx[:model].user_id = current_user&.id
    end

    def renderer_options(ctx, **)
      ctx[:renderer_options] = {
        class: {
          Project: V1::Projects::Representer::Create
        }
      }
    end
  end
end
