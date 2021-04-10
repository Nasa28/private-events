class EventsController < ApplicationController
  def index
    @events = Event.all
    @upcoming_events = Event.upcoming.order('created_at ASC')
    @past_events = Event.past.order('created_at DESC')
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
    @event = Event.find(params[:id])
  end

  def attend
    event = Event.find(params[:id])

    event.attendees.each.map do |attendee|
      if attendee[:id] == current_user[:id]
        flash[:alert] = "#{current_user[:username]} is already attending the event"
        return redirect_to request.referrer
      end
    end

    current_user.attended_events << event

    if current_user.save
      flash[:notice] = 'You are now attending the event'
      redirect_to event
    else
      flash[:alert] = "Event didn't save"
      redirect_to request.referrer
    end
  end

  private

  def event_params
    params.require(:event).permit(:description, :date)
  end
end
