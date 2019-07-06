# frozen_string_literal: true

module V1::Tasks::Operation
  class Index < Trailblazer::Operation
    step :model
    step :renderer_options

    def model(ctx, current_user:, **)
      ctx[:model] = V1::Tasks::Query::Index.call(current_user.id)
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
