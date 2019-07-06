# frozen_string_literal: true

module Docs
  module V1
    module Tasks
      module Index
        extend Dox::DSL::Syntax

        document :api do
          resource 'Tasks' do
            endpoint '/tasks'
            group 'Tasks'
          end
        end

        document :list do
          action 'List'
        end
      end
    end
  end
end
