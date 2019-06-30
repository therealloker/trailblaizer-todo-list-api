# frozen_string_literal: true

module V1::Projects::Operation
  class Index < Trailblazer::Operation
    step :model
    step :renderer_options

    def model(ctx, current_user:, **)
      ctx[:model] = V1::Projects::Query::Index.call(current_user.id)
    end

    def renderer_options(ctx, **)
      ctx[:renderer_options] = {
        class: {
          Project: V1::Projects::Representer::Index
        }
      }
    end
  end
end
