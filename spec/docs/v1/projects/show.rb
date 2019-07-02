# frozen_string_literal: true

module Docs
  module V1
    module Projects
      module Show
        extend Dox::DSL::Syntax

        document :api do
          resource 'Projects' do
            endpoint '/projects/:id'
            group 'Projects'
          end
        end

        document :get do
          action 'Get record'
        end
      end
    end
  end
end
