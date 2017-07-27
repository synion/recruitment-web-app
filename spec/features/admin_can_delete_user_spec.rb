require 'rails_helper'

feature 'AdminCanDeleteUser'  do
  let!(:user) { create :user, email: "example22@o2.pl", password: "password" }

  background do
    sign_in_admin
    visit root_path
  end

  scenario  do
    expect {
    page.all('td > a')[0].click
    page.driver.browser.switch_to.alert.accept
    sleep 1
    }.to change { User.count }.by(-1)
    expect(page).to have_content("User was deleted")
  end
end
