class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def auth
    request.env['omniauth.auth'] # AuthHash를 return (auth라는 객체가 만들어져 사용할 수 있음)
  end

  def facebook
    service = Service.where(provider: auth.provider, uid: auth.uid).first

    if service.present?
      user = service.user
    else
      user = User.create(
        email: auth.info.email,
        # name: auth.info.nam,
        password: Devise.friendly_token[0, 20]
      )
      user.services.create(
        provider: auth.provider,
        uid: auth.uid,
        expires_at: Time.at(auth.credentials.expires_at),
        access_token: auth.credentials.token
      )
    end
    redirect_to root_path
    # sign_in_and_redirect user, event: authentication
    set_flash_message :notice, :success, kind: "Facebook"
  end

end
