class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :curent_user , :logged_in?
  
  def curent_user
    @curent_user ||= User.find(session[:user_id]) if session[:user_id]
    
  end
  
  def logged_in?
    !!curent_user
    
  end
  
  def require_user
    if !logged_in?
      flash[:danger] ="You must be logged in to perform that action"
  
      redirect_to root_path
    end
    
  end
end
