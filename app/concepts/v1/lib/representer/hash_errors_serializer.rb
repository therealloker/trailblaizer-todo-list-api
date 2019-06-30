# frozen_string_literal: true

module V1::Lib::Representer
  class HashErrorsSerializer
    def initialize(exposures)
      @errors = exposures[:object]
    end

    def as_jsonapi
      formatted_errors = errors.map do |field, messages|
        compose_errors(messages, field)
      end
      formatted_errors.flatten
    end

    private

    attr_reader :errors

    def compose_errors(messages, field)
      messages.map do |message|
        V1::Lib::Representer::ErrorRepresenter.new(field: field, message: message).as_jsonapi
      end
    end
  end
end
