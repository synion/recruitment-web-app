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
end

