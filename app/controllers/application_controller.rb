class ApplicationController < ActionController::Base
  protected

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path, alert: "You need to sign in or sign up before continuing"
    end
  end
end
