# frozen_string_literal: true

module V1::Tasks::Operation
  class Index < Trailblazer::Operation
    step Contract::Build(constant: V1::Tasks::Contract::Index)
    step Contract::Validate()
    step :model
    step :renderer_options

    def model(ctx, params:, current_user:, **)
      ctx[:model] = V1::Tasks::Query::Index.call(user_id: current_user.id, important: params[:important],
                                                 done: params[:done])
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
