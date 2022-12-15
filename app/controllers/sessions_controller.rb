class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if user.nil?
      flash.now[:errors] = ["Invalid credentials"]
      render :new

    elsif !user.activated?
      flash.now[:errors] = ['You must activate you account! Check your email.']
      render :new

    else 
      login_user!(user)
      redirect_to root_url
    end
  end

  def destroy
  end
end
