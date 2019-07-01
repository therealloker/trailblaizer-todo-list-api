# frozen_string_literal: true

module V1::Projects::Operation
  class Update < Trailblazer::Operation
    step Policy::Guard(V1::Projects::Lib::Policy::AccessGuard.new), fail_fast: true
    step Model(Project, :find)
    step Contract::Build(constant: V1::Projects::Contract::Default)
    step Contract::Validate()
    step Contract::Persist()
    step :renderer_options

    def renderer_options(ctx, **)
      ctx[:renderer_options] = {
        class: {
          Project: V1::Projects::Representer::Show
        }
      }
    end
  end
end
