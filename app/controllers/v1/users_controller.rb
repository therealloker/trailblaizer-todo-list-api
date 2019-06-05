module V1
  class UsersController < ApiController
    def create
      endpoint V1::Users::Operation::Register
    end
 end
