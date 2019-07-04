# frozen_string_literal: true

module Docs
  module V1
    module Tasks
      module Create
        extend Dox::DSL::Syntax

        document :api do
          resource 'Tasks' do
            endpoint '/projects/:id/tasks'
            group 'Tasks'
          end
        end

        document :create do
          action 'Create'
        end
      end
    end
  end
end
