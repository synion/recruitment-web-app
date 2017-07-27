require 'rails_helper'

feature 'AdminCanDeleteUser'  do
  let!(:user) { create :user, email: "example22@o2.pl", password: "password" }

  background do
    sign_in_admin
    visit root_path
  end

  scenario  do
    expect {
    page.all('td > a')[1].click
    page.driver.browser.switch_to.alert.accept
    sleep 1
    }.to_not change { User.count }
    expect(page).to have_content("You can't delete yourself")
  end
end
