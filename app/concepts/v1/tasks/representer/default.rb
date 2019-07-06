# frozen_string_literal: true

module V1::Tasks::Representer
  class Default < ApplicationRepresenter
    type 'tasks'

    attributes :name, :done, :important

    link :self do
      @url_helpers.task_path(@object.id)
    end
  end
end
