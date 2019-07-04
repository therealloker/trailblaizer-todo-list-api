# frozen_string_literal: true

module Docs
  module V1
    module Tasks
      module Show
        extend Dox::DSL::Syntax

        document :api do
          resource 'Tasks' do
            endpoint '/tasks/:id'
            group 'Tasks'
          end
        end

        document :get do
          action 'Get'
        end
      end
    end
  end
end
