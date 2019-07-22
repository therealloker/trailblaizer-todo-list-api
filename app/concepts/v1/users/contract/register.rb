# frozen_string_literal: true

module V1::Users::Contract
  class Register < Reform::Form
    include Dry

    property :email
    property :password
    property :password_confirmation, virtual: true

    validation :default do
      required(:email).filled(format?: App.config.user.magic_email_regex)
      required(:password).filled(
        :str?,
        min_size?: App.config.user.password_min_length,
        format?: App.config.user.magic_password_regex
      )
    end

    validation :same_password, with: { form: true }, if: :default do
      configure do
        option :form
        config.messages = :i18n

        def same_password?(value)
          value == form.password
        end
      end

      required(:password_confirmation).filled(:same_password?)
    end

    validation :email_unique, if: :same_password do
      configure do
        config.messages = :i18n

        def email_unique?(email)
          User.where(email: email).empty?
        end
      end

      required(:email).filled(:email_unique?)
    end
  end
end
