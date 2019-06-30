# frozen_string_literal: true

module V1::Projects::Representer
  class Show < ApplicationRepresenter
    type 'projects'

    attributes :name

    has_many :tasks do
      data do
        @object.tasks
      end

      link :related do
        @url_helpers.project_tasks_path(@object.id)
      end
    end

    link :self do
      @url_helpers.project_path(@object.id)
    end
  end
end
