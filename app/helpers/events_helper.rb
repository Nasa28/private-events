module EventsHelper
	def attend_button(event, current_user)
   return unless log_in?
    return unless event[:creator_id] != current_user[:id]
    return if event[:date] < Time.zone.now

    button_to 'Attend this event', action: :attend, method: :post
  end

  def attendee_list
    html_values = ''
    @event.attendees.each do |attender|
      text = attender.username
      html_values << (content_tag :ul, text.capitalize)
    end
    html_values.html_safe
  end
	
  # def event_home(events)
  #   html_code = ''
  #   events.each do |event|
  #     html_code << "<li><a href='events/#{event[:id]}'>#{event[:description]}</a>; #{event[:date]}</li>"
  #   end
  #   html_code.html_safe
  # end
end
