# frozen_string_literal: true

module Docs
  module V1
    module Projects
      module Index
        extend Dox::DSL::Syntax

        document :api do
          resource 'Projects' do
            endpoint '/projects'
            group 'Projects'
          end
        end

        document :list do
          action 'List'
        end
      end
    end
  end
end
