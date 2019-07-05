# frozen_string_literal: true

module Docs
  module V1
    module Tasks
      module Destroy
        extend Dox::DSL::Syntax

        document :api do
          resource 'Tasks' do
            endpoint '/tasks/:id'
            group 'Tasks'
          end
        end

        document :delete do
          action 'Delete'
        end
      end
    end
  end
end
