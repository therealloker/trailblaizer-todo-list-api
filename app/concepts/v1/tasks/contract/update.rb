# frozen_string_literal: true

module V1::Tasks::Contract
  class Update < Reform::Form
    include Dry

    property :name

    validation :default do
      required(:name).filled
    end

    validation :task_name_unique, with: { form: true }, if: :default do
      configure do
        option :form
        config.messages = :i18n

        def task_name_unique?(name)
          Task.where(project_id: form.project_id).find_by(name: name).nil?
        end
      end

      required(:name).filled(:task_name_unique?)
    end
  end
end
