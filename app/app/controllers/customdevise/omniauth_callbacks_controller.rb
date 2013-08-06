class Customdevise::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    # Checks or create the new facebook user
    auth = request.env["omniauth.auth"]
    email = auth.info.email
    token = auth.credentials.token
    uid = auth.uid
    provider = auth.provider
    expiry = auth.credentials.expires_at
    @user = User.where(:email => email).first
    # Redirect to decided path with social_refs if user login first time
    redirect_to redirect_path
  end

end