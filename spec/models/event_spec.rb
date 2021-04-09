require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'validate description presence' do
    it 'ensures description presence'do
    event = Event.new(date: "Date.today").save
    expect(event).to eq(false)
    end

    it 'ensures date presence'do
    event = Event.new(description: 'this is my post').save
    expect(event).to eq(false)
    end

  end

  
end
