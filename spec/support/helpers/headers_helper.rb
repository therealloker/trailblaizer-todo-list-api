# frozen_string_literal: true

module HeadersHelper
  def default_header
    {
      'Content-Type': 'application/json'
    }
  end

  def valid_token_headers(user_id)
    default_header.merge('Authorization': V1::Lib::Auth::JsonWebToken.encode(user_id: user_id))
  end

  def invalid_token_headers(user_id)
    default_header.merge('Authorization': V1::Lib::Auth::JsonWebToken.encode({ user_id: user_id }, 1.week.ago))
  end
end
