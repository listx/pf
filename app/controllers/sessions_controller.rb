class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    # User model's 'has_secure_password' gives us the '#authenticate' method.
    if !user.nil? && user.authenticate(params[:session][:password])
      log_in user
      redirect_to dashboard_path
    else
      flash.now[:danger] = EINVALID_USERPASS
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
