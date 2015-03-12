class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.is_password?(params[:user][:password])
      flash[:notice] = "Thanks for logging in!"
      login!(@user)
      redirect_to @user
    else
      @user = User.new(user_params)
      flash.now[:errors] = ["Incorrect email/password combination"]
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
