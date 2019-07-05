# frozen_string_literal: true

module V1::Tasks::Contract
  class Create < Reform::Form
    include Dry

    property :name
    property :project_id

    validation :default do
      required(:name).filled
      required(:project_id).filled(:int?)
    end
  end
end
