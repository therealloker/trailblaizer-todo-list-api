# frozen_string_literal: true

module Docs
  module V1
    module Projects
      module Create
        extend Dox::DSL::Syntax

        document :api do
          resource 'Projects' do
            endpoint '/projects'
            group 'Projects'
          end
        end

        document :create do
          action 'Create'
        end
      end
    end
  end
end
