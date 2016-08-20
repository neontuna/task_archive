class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

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
