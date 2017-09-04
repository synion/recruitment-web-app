require 'rails_helper'

feature 'admin panel menagment' do
  background do
    sign_in_admin
    visit admin_path
  end

  scenario 'has a link to all users' do
    find('ul > li > a', text: 'Back to all users').click
    expect(page).to have_current_path(root_path)
  end

  scenario 'has a logout link' do
    find('ul > li > a', text: 'Logout').click
    expect(page).to have_content('You need to sign in or sign up before continuing.')
    expect(page).to have_current_path(user_session_path)
  end
end
