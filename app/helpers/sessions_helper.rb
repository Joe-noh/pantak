module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    user_id = session[:user_id]
    if (user_id)
      @current_user ||= User.find_by(id: user_id)
    end
  end

  def logged_in?
    !(current_user.nil?)
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url]  || default)
    session.delete(:forwarding_url)
  end
end
