class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user
      log_in @user
      redirect_to events_path, notice: 'You have been successfully signed in'
    else
      flash.now[:notice] = 'Invalid username'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
