# frozen_string_literal: true

module V1::Users::Representer
  class Login < ApplicationRepresenter
    type 'users'

    attributes :email
  end
end
