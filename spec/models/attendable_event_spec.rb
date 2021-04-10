require 'rails_helper'

RSpec.describe AttendableEvent, type: :model do
  context 'attendable events test' do
    it 'belongs to event attendee' do
      first = AttendableEvent.reflect_on_association(:event_attendee).macro
      expect(first).to eq(:belongs_to)
    end

    it 'belongs to  attended event' do
      first = AttendableEvent.reflect_on_association(:attended_event).macro
      expect(first).to eq(:belongs_to)
    end
  end
end
