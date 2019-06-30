# frozen_string_literal: true

module V1::Projects::Operation
  class Destroy < Trailblazer::Operation
    step Policy::Guard(V1::Projects::Lib::Policy::AccessGuard.new), fail_fast: true
    step Model(Project, :find)
    step :destroy

    def destroy(_ctx, model:, **)
      model.destroy
    end
  end
end
