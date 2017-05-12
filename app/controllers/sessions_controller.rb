class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password_digest])
      session[:user_id] = user.id
      redirect_to episodes_path
    else
      flash[:notice] = "Sorry no username and/or was found, try again."
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

  private

  def session_params
    params.require(:session).permit(:username, :password_digest)
  end

end
