# frozen_string_literal: true

module HeadersHelper
  def default_header
    {
      'Content-Type': 'application/json'
    }
  end

  def valid_token_headers(user_id)
    {
      'Content-Type': 'application/json',
      'Authorization': V1::Lib::Auth::JsonWebToken.encode(user_id: user_id)
    }
  end

  def invalid_token_headers(user_id)
    {
      'Content-Type': 'application/json',
      'Authorization': V1::Lib::Auth::JsonWebToken.encode({ user_id: user_id }, Time.now.to_i - 10)
    }
  end
end
