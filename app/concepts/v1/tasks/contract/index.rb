# frozen_string_literal: true

module V1::Tasks::Contract
  class Index < Reform::Form
    include Dry

    property :done, virtual: true
    property :important, virtual: true

    validation :default do
      optional(:important).maybe(:bool?)
      optional(:done).maybe(:bool?)
    end
  end
end
