class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:notice] = 'User is created successfully!'
      redirect_to events_path
    else
      flash.now[:notice] = 'Username is taken!'
      render :new
    end
  end

  def show
    @user = current_user
    @attending_events = current_user.attended_events
    @created_events_upcoming = current_user.created_events.upcoming.order('created_at DESC')
    @created_events_past = current_user.created_events.past.order('created_at DESC')
    @upcoming_attending_events = current_user.attended_events.upcoming.order('created_at DESC')
    @attended_events_past = current_user.attended_events.past.order('created_at DESC')
    @user = current_user
    @my_events = current_user.created_events
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
