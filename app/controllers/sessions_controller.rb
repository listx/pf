class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(name: params[:session][:name].downcase)
    # User model's 'has_secure_password' gives us the '#authenticate' method.
    if !user.nil? && user.authenticate(params[:session][:password])
      log_in user
      redirect_to controller: :dashboard, action: :index
    else
      flash.now[:danger] = "Invalid username/password combination."
      render 'new'
    end
  end
end
