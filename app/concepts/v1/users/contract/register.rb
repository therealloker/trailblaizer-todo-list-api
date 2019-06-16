module V1::Users::Contract
  class Register < Reform::Form
    include Dry

    property :email
    property :password
    property :password_confirmation

    validation :default do
      required(:email).filled(format?: App.config.user.magic_email_regex)
      required(:password).filled(
        :str?,
        min_size?: App.config.user.password_min_length,
        format?: App.config.user.magic_password_regex
      ).confirmation
    end

    validation :email_unique, if: :default do
      configure do
        config.messages = :i18n
        config.namespace = :user

        def email_unique?(email)
          User.where(email: email).empty?
        end
      end

      required(:email).filled(:email_unique?)
    end
  end
end
