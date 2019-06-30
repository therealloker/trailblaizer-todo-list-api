# frozen_string_literal: true

module V1::Projects::Representer
  class Create < ApplicationRepresenter
    type 'projects'

    attributes :name
  end
end
