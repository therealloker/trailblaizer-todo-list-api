# frozen_string_literal: true

module V1::Projects::Representer
  class Index < ApplicationRepresenter
    type 'projects'

    attributes :name

    link :self do
      @url_helpers.project_path(@object.id)
    end
  end
end
