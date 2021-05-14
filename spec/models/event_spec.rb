require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'validate description presence' do
    it 'ensures description presence' do
      event = Event.new(date: 'Date.today').save
      expect(event).to eq(false)
    end

    it 'ensures date presence' do
      event = Event.new(description: 'this is my post').save
      expect(event).to eq(false)
    end
  end

  context 'association test for Events' do
    it 'it should belong to event creator' do
      first = Event.reflect_on_association(:creator).macro
      expect(first).to eq(:belongs_to)
    end

    it 'it should belong to event creator' do
      first = Event.reflect_on_association(:attendees).macro
      expect(first).to eq(:has_many)
    end

    it 'it should belong to event creator' do
      first = Event.reflect_on_association(:attendable_events).macro
      expect(first).to eq(:has_many)
    end
  end
end
