# frozen_string_literal: true

module V1
  class ProjectsController < ApplicationController
    before_action :authorize_request!

    def index
    end

    def create
      endpoint V1::Projects::Operation::Create, current_user: current_user
    end

    def show
    end

    def update
    end

    def destroy
    end
  end
end
