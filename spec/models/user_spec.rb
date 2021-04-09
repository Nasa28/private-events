require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validation test' do 
    it 'ensures username presence' do
      user = User.new(username: " ").save
      expect(user).to eq(false)
    end
    
    it 'should save successfully' do
      user = User.new(username: 'chinasa').save
      expect(user).to eq(true)
    end
  end
end
