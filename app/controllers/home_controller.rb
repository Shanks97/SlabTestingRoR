class HomeController < ApplicationController
  def index
    p params
    render :json => User.first()
  end
  def login
    if params['username']
      #user = User.find_by_username(params['username'])
      user = User.find_by(username: params['username'])
      #@user = user['username']
      @valid = user.authenticate(params['password'])
    end 
  end
  def xd
    render :json => User.last
  end
end
