class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  
  helper_method :current_user

  private

  def authenticate_user!
    if !current_user
      flash[:warning] = "Please sign in first."
      redirect_to root_url
    end   
  end 

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def redirect_to_back(a=nil, b={})
    path = a.is_a?(String) ? a : root_path
    options = a.is_a?(Hash) ? a : b
    if request.env["HTTP_REFERER"].present? &&
       request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
      redirect_to(:back, options)
    else
      redirect_to(path, options)
    end
  end

end
