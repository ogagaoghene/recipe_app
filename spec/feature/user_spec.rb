require 'rails_helper'

RSpec.feature 'User', type: :feature do
  background { visit new_user_session_path }
  scenario 'Page should have users names' do
    @first_user = User.create(name: 'Ogaga', email: 'ogaga@example.com', password: '11111', confirmed_at: Time.now)
    @second_user = User.create(name: 'Esi', email: 'esi@example.com', password: '11111', confirmed_at: Time.now)
    @third_user = User.create(name: 'Toun', email: 'toun@example.com', password: '11111', confirmed_at: Time.now)
    within 'form' do
      fill_in 'Email', with: @first_user.email
      fill_in 'Password', with: @first_user.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Ogaga'
    expect(page).to have_content 'Esi'
    expect(page).to have_content 'Toun'
  end
end
