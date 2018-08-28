# frozen_string_literal: true

# rubocop:disable Style/StringLiterals
class CallbacksController < Devise::OmniauthCallbacksController
  def twitter
    @user = User.from_omniauth(request.env["omniauth.auth"])
    flash[:notice] = 'Signed in successfully through the twitter'
    sign_in_and_redirect @user
  end

  def github
    @user = User.from_omniauth(request.env["omniauth.auth"])
    flash[:notice] = 'Signed in successfully through the github'
    sign_in_and_redirect @user
  end
end
# rubocop:enable Style/StringLiterals
