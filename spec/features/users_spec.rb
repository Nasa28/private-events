require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'create new user' do
    scenario 'should be successful' do
      visit new_user_path
      within('form') do
        fill_in 'user_username', with: 'chinasa', visible: true
      end
      click_button 'Sign Up'
      expect(current_path).to eq(events_path)
    end

    scenario 'should be successful' do
      visit new_user_path
      within('form') do
        fill_in 'user_username', with: ''
      end
      click_button 'Sign Up'
      expect(current_path).not_to eq(events_path)
    end
end
end
