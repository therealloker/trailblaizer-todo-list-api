# frozen_string_literal: true

module V1::Users::Contract
  class Login < Reform::Form
    include Dry

    with_options virtual: true do
      property :email
      property :password
    end

    validation do
      required(:email).filled(format?: App.config.user.magic_email_regex)
      required(:password).filled
    end
  end
end
