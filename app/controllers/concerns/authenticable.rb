# Authenticable modulo
module Authenticable
  def authenticate_with_token
    @token ||= request.headers['Authorization']

    unless valid_token?
      render json: { erros: 'Forneça um header Authorization para se identificar (qualquer um com 10 digitos)' },
             status: :unauthorized
    end
  end

  def valid_token?
    @token.present? && @token.size >= 10
  end
end
