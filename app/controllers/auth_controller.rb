class AuthController < ApplicationController
  
  skip_before_action :verify_authenticity_token, only: %i[ login register ]
  before_action :auth_params, only: %i[ login register ]

  def login
    p request
    c = {ok: true}
    render :json => c
  end

  def register
    c = { ok: true }
    render :json => c
  end

  def auth_params
    params.require(:auth).permit(:email, :password, :p)
  end
end
