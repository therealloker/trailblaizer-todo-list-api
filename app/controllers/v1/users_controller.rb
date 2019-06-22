# frozen_string_literal: true

module V1
  class UsersController < ApplicationController
    def registration
      endpoint V1::Users::Operation::Register
    end

    def login
      endpoint V1::Users::Operation::Login
    end
  end
end
