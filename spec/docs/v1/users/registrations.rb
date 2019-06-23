# frozen_string_literal: true

module Docs
  module V1
    module Users
      module Registrations
        extend Dox::DSL::Syntax

        document :api do
          resource 'Registration action' do
            endpoint '/users/registration'
            group 'User registration'
          end
        end

        document :signup do
          action 'Sign Up'
        end
      end
    end
  end
end
