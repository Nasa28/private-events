class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user
      log_in user
      redirect_to pages_home_path
    else
      flash.now[:danger] = 'Invalid username'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to pages_home_path
  end
end
