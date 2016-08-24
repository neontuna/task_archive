class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  
  def home
    session[:user_id] = 3
    if current_user
      redirect_to customers_path
    end
  end
end
