# frozen_string_literal: true

module V1::Tasks::Representer
  class Show < ApplicationRepresenter
    type 'tasks'

    attributes :name

    belongs_to :project do
      link :self do
        @url_helpers.project_path(@object.project_id)
      end
    end

    link :self do
      @url_helpers.task_path(@object.id)
    end
  end
end
