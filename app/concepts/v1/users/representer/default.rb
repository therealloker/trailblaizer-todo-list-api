# frozen_string_literal: true

module V1::Users::Representer
  class Default < ApplicationRepresenter
    type 'users'

    attributes :email
  end
end
