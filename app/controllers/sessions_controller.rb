class SessionsController < ApplicationController
  def new
  end

  def create
    user = authenticate_session(session_params)

    if sign_in(user)
      redirect_to root_path
    else
      flash.now.notice = "Invalid Email or Password"
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to new_session_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
