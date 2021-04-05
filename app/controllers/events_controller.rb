class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = current_user.created_events.build
    
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
        redirect_to showpage_path, notice: 'Event was successfully created.'
      else
        render 'new'
      end
  end

  def show
    # @event = Event.all.where(user_id: params[:id]) 
    # @event = Event.find(params[:id])
    #  @users = User.all 
     @event = Event.find(params[:id])
  end
  
  def attend
    @event.attendees << current_user
    @event.save
  end

  private
  def event_params
    params.require(:event).permit(:description, :date)
  end
end
