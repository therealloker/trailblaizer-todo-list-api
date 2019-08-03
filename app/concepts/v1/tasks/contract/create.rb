# frozen_string_literal: true

module V1::Tasks::Contract
  class Create < Reform::Form
    include Dry

    property :name
    property :done
    property :important

    validation :default do
      required(:name).filled
      optional(:done).filled(:bool?)
      optional(:important).filled(:bool?)
    end
  end
end
