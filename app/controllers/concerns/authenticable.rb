# Authenticable modulo
module Authenticable
  def authenticate_with_token
    @token ||= request.headers['Authorization']

    unless valid_token?
      render json: { erros: 'Provide an Authorization header to identify yourself (anyone with 10 digits)' },
             status: :unauthorized
    end
  end

  def valid_token?
    @token.present? && @token.size >= 10
  end
end
