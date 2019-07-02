# frozen_string_literal: true

module V1::Tasks::Lib::Policy
  class TaskAccessGuard
    def call(_ctx, current_user:, params:, **)
      Task.joins(:project).where(projects: { user_id: current_user.id }).pluck(:'tasks.id').include?(params[:id].to_i)
    end
  end
end
