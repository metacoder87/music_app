class UsersController < ApplicationController
    before_action :require_no_user!

    def new
        @user = User.new
        render :new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to users_url
        else flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def show
        user = User.find_by_credentials(email, password)
        render users_url(user)
    end

private

    def user_params
        params.require(:user).permit(:email, :password)
    end

end
