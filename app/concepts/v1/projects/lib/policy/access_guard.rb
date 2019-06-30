# frozen_string_literal: true

module V1::Projects::Lib::Policy
  class AccessGuard
    def call(_ctx, current_user:, params:, **)
      current_user.projects.pluck(:id).include?(params[:id].to_i)
    end
  end
end
