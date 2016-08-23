class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  skip_before_action :authenticate_user!

  def create
    #raise request.env['omniauth.auth'].to_yaml
    auth = request.env['omniauth.auth']

    # check for correct group membership
    if auth.extra.raw_info.id_token_claims.groups.include?(ENV['AZURE_GROUP_ID'])
      user = User.find_by_uid(auth["uid"]) || User.create_with_omniauth(auth)
      session[:user_id] = user.id

      flash[:success] = "Signed in!"
      redirect_to customers_path
    else
      flash[:warning] = "Cannot sign you in, check Azure group membership!"
      redirect_to root_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
