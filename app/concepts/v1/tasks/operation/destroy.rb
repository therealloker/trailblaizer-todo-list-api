# frozen_string_literal: true

module V1::Tasks::Operation
  class Destroy < Trailblazer::Operation
    step Policy::Guard(V1::Tasks::Lib::Policy::TaskAccessGuard.new), fail_fast: true
    step Model(Project, :find)
    step :destroy

    def destroy(_ctx, model:, **)
      model.destroy
    end
  end
end
