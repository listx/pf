module SessionsHelper
  def log_in(user)
    session[:user_id] = user._id.to_s
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete :user_id
    @current_user = nil
  end

  def current_user
    if @current_user.nil?
      if session[:user_id].nil?
        @current_user
      else
        @current_user = User.find(session[:user_id])
      end
    else
      @current_user
    end
  end

  def logged_in_user
    if !logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
