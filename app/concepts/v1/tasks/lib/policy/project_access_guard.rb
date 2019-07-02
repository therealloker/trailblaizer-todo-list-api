# frozen_string_literal: true

module V1::Tasks::Lib::Policy
  class ProjectAccessGuard
    def call(_ctx, current_user:, params:, **)
      current_user.projects.pluck(:id).include?(params[:project_id].to_i)
    end
  end
end
