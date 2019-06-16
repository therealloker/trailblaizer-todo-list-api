class App
  extend Dry::Configurable

  setting :user do
    setting :magic_email_regex, /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    setting :password_min_length, 8
    setting :magic_password_regex, /\A(?=\S*?[A-Z])(?=\S*?[a-z])(?=\S*?[0-9])\S{8,}\z/
  end
end
