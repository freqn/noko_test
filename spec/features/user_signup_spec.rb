require 'spec_helper'
feature "Sign up as a user" do
  scenario "with an email address" do
    user = FactoryGirl.build(:user)
    visit new_user_registration_path

    expect(current_path).to eq new_user_registration_path

    fill_in 'user_email',                   with: user.email
    fill_in 'user_password',                with: user.password
    fill_in 'user_password_confirmation',   with: user.password_confirmation
    click_button 'Sign up'

    expect(User.count).to eq(1)
    expect(page).to have_content 'Welcome! You have signed up successfully.'
    expect(page).to have_link 'Sign out',       href: destroy_user_session_path
  end
end
