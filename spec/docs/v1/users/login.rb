# frozen_string_literal: true

module Docs
  module V1
    module Users
      module Login
        extend Dox::DSL::Syntax

        document :api do
          resource 'Login action' do
            endpoint '/users/login'
            group 'Users'
          end
        end

        document :signin do
          action 'Sign In'
        end
      end
    end
  end
end
