require 'rails_helper'

RSpec.feature 'Login', type: :feature do
  it 'can enter a name and receive a greeting' do
    visit user_session_path
    expect(page).to have_content 'Log in'
  end

  it 'user can see inputs and button' do
    visit user_session_path
    expect(page).to have_current_path(user_session_path)
  end

  it 'click the login error' do
    visit user_session_path
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end
end
