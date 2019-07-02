# frozen_string_literal: true

module V1::Projects::Contract
  class Default < Reform::Form
    include Dry

    property :name
    property :user_id

    validation :default do
      required(:name).filled
      required(:user_id).filled(:int?)
    end

    validation :project_name_unique, with: { form: true }, if: :default do
      configure do
        option :form
        config.messages = :i18n

        def project_name_unique?(name)
          Project.where(user_id: form.user_id).find_by(name: name).nil?
        end
      end

      required(:name).filled(:project_name_unique?)
    end
  end
end
