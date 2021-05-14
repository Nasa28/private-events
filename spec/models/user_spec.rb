require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validation test' do
    it 'ensures username presence' do
      user = User.new(username: ' ').save
      expect(user).to eq(false)
    end

    it 'should save successfully' do
      user = User.new(username: 'chinasa').save
      expect(user).to eq(true)
    end
  end

  context 'association test'
  it 'should have many created events' do
    first = User.reflect_on_association(:created_events).macro
    expect(first).to eq(:has_many)
  end

  it 'should have many created events' do
    second = User.reflect_on_association(:attendable_events).macro
    expect(second).to eq(:has_many)
  end

  it 'should have many created events' do
    last = User.reflect_on_association(:attended_events).macro
    expect(last).to eq(:has_many)
  end
end
