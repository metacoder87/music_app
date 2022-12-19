class UsersController < ApplicationController

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    render :show
  end

  # GET /users/new
  def new
    @user = User.new
    render :new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

  
      if @user.save
        @user.activate!
        login_user!(@user)
        flash.alert = "Successfully created your account! Check your inbox for an activation email."
        redirect_to new_session_url
        # ApplicationMailer.activation_email(@user).deliver_now!
        # flash[:notice] = 'Successfully created your account! Check your inbox for an activation email.'
        # redirect_to new_session_url
      else
        flash.now[:errors] = @user.errors.full_messages
        render :new
      end

  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
