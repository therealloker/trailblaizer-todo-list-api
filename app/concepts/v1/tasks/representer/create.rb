# frozen_string_literal: true

module V1::Tasks::Representer
  class Create < ApplicationRepresenter
    type 'tasks'

    attributes :name

    link :self do
      @url_helpers.task_path(@object.id)
    end
  end
end
