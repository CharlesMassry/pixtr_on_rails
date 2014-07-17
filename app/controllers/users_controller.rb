class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params) # #sign_up - monbon method

    if @user.valid?              # #valid? - ar method
      sign_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
