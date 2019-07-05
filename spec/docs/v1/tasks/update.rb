# frozen_string_literal: true

module Docs
  module V1
    module Tasks
      module Update
        extend Dox::DSL::Syntax

        document :api do
          resource 'Tasks' do
            endpoint '/tasks/:id'
            group 'Tasks'
          end
        end

        document :update do
          action 'Update'
        end
      end
    end
  end
end
