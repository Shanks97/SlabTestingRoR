class PasswordController < ApplicationController
  def reset
    token = request.query_parameters['token'] or not_found
    user = User.find_by(reset: token)
    #render :json => user
    render plain: user.username
  end

  def forgot
    if params['email']
      user = User.find_by(username: params['email']) or not_found
      if user
        token = SecureRandom.hex(10)
        user.reset = token
        user.save
      end
      render plain: "A link to reset your password has been sent to you email"
    end
  end

  def not_found
    raise ActionController::RoutingError.new('Not found')
  end
end
