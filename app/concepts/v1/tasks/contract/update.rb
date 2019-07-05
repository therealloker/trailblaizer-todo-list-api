# frozen_string_literal: true

module V1::Tasks::Contract
  class Update < Reform::Form
    include Dry

    property :name

    validation :default do
      required(:name).filled
    end
  end
end
