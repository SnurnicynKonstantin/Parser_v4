class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all
    @user = User.find_for_twitter_oauth(request.env['omniauth.auth'],current_user)
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
    else
      session['devise.twitter_uid'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  alias_method :twitter, :all
  alias_method :linkedin, :all
  alias_method :facebook, :all

end

  #Есть провайдеры? -> Вошел? -> Есть ли с мэйлом? Нет, созд.нов. пользователя

  #test

  #delay_job (web) - rake jobs (t) -