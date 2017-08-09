require 'rails_helper'

feature "RegularUserOperation", type: :feature do
  let!(:user) { create :user, email: "example22@o2.pl", password: "password" }

  background do
    sign_in
    visit root_path
  end

  scenario 'not alowed information on index page' do
    expect(page).to_not have_selector(:css, "i.fa-trash")
    expect(page).to_not have_selector('ul > li > a', text: "Navigate to the admin panel")
  end


   scenario 'has a logout link' do
    find('ul > li > a', text: 'Logout').click
    expect(page).to have_content('You need to sign in or sign up before continuing.')
    expect(page).to have_current_path(user_session_path)
  end

  scenario 'search user by email' do
    expect(page).to have_content('example.email@gmail.com')
    expect(page).to have_content('example22@o2.pl')

    fill_in "Email contains", with: "22@o2.pl"
    click_on "Search"

    expect(page).to have_content('example22@o2.pl')
    expect(page).not_to have_content('example.email@gmail.com')
  end
end

