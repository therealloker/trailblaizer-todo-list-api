module V1
  class UsersController < ApplicationController
    def registration
      endpoint V1::Users::Operation::Register
    end
  end
end
