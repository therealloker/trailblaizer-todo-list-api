# frozen_string_literal: true

module Docs
  module V1
    module Projects
      module Destroy
        extend Dox::DSL::Syntax

        document :api do
          resource 'Projects' do
            endpoint '/projects/:id'
            group 'Projects'
          end
        end

        document :delete do
          action 'Delete'
        end
      end
    end
  end
end
