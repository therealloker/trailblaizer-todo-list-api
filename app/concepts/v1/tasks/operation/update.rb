# frozen_string_literal: true

module V1::Tasks::Operation
  class Update < Trailblazer::Operation
    step Policy::Guard(V1::Tasks::Lib::Policy::AccessGuard.new), fail_fast: true
    step Model(Task, :find)
    step Contract::Build(constant: V1::Tasks::Contract::Update)
    step Contract::Validate()
    step Contract::Persist()
    step :renderer_options

    def renderer_options(ctx, **)
      ctx[:renderer_options] = {
        class: {
          Task: V1::Tasks::Representer::Default
        }
      }
    end
  end
end
