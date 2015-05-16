class SessionsController < ApplicationController

  def callback
    auth = request.env["omniauth.auth"]
    user = User.find_by_twitter_token(auth.credentials.token)
    if user.nil?
      user = User.save_twitter(auth)
    else
      user.update_twitter(auth)
    end
    sign_in(user)
    redirect_to root_url, :notice => "Signed In!"
  end

  def destroy
    sign_out
    redirect_to root_url, :notice => "Signed Out!"
  end

end
