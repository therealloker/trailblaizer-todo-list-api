# frozen_string_literal: true

module Docs
  module V1
    module Projects
      module Update
        extend Dox::DSL::Syntax

        document :api do
          resource 'Projects' do
            endpoint '/projects/:id'
            group 'Projects'
          end
        end

        document :update do
          action 'Update'
        end
      end
    end
  end
end
