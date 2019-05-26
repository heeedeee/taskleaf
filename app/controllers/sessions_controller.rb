class SessionsController < ApplicationController
  def new
  end

  def create
    usee = User.find_by(email: session_params[:email])

    if user&.authenticate(sessions_params[:password])
      session[:user_id] = user.id
      redirect_to root_path,notice: 'ログインしました。'
    else
      render :new
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password,)
  end
end