class SessionsController < ApplicationController
  layout "window"

  def new
  end

  def create
    user = Authenticator.authenticate(params[:email], params[:password])

    if user
      reset_session
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash.now[:alert] = t("flash.login.fail")
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
