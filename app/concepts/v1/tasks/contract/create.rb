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

    validation :task_name_unique, with: { form: true }, if: :default do
      configure do
        option :form
        config.messages = :i18n

        def task_name_unique?(name)
          Task.where(user_id: form.model.user_id).find_by(name: name).nil?
        end
      end

      required(:name).filled(:task_name_unique?)
    end
  end
end
