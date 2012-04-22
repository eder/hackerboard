class UsersController < ApplicationController
  layout "window"

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    render :layout => "application"
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      Mailer.welcome({
        :name => @user.name,
        :email => @user.email,
        :url => login_url
      }).deliver

      flash.notice = t("flash.user.create")
      redirect_to login_path
    else
      render :new
    end
  end
end
