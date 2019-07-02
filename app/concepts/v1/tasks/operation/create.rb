# frozen_string_literal: true

module V1::Tasks::Operation
  class Create < Trailblazer::Operation
    step Policy::Guard(V1::Tasks::Lib::Policy::ProjectAccessGuard.new), fail_fast: true
    step Model(Task, :new)
    step Contract::Build(constant: V1::Tasks::Contract::Create)
    step Contract::Validate()
    step Contract::Persist()
    step :renderer_options

    def renderer_options(ctx, **)
      ctx[:renderer_options] = {
        class: {
          Task: V1::Tasks::Representer::Create
        }
      }
    end
  end
end
