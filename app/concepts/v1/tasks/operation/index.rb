# frozen_string_literal: true

module V1::Tasks::Operation
  class Index < Trailblazer::Operation
    step Policy::Guard(V1::Tasks::Lib::Policy::ProjectAccessGuard.new), fail_fast: true
    step :model
    step :renderer_options

    def model(ctx, params:, **)
      ctx[:model] = V1::Tasks::Query::Index.call(params[:project_id])
    end

    def renderer_options(ctx, **)
      ctx[:renderer_options] = {
        class: {
          Task: V1::Tasks::Representer::Index
        }
      }
    end
  end
end
