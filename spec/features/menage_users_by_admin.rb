require 'rails_helper'

feature 'MenageUsersByAdmin'  do
  let!(:user) { create :user, email: "example22@o2.pl", password: "password" }

  background do
    sign_in_admin
    visit root_path
  end

  scenario 'admin can`t remove himself'  do
    expect {
    page.all('td > a')[1].click
    page.driver.browser.switch_to.alert.accept
    sleep 1
    }.to_not change { User.count }
    expect(page).to have_content("You can't delete yourself")
  end

  scenario 'admin can delete user'  do
    expect(page).to have_content("example22@o2.pl")
    page.all('td > a')[0].click
    page.driver.browser.switch_to.alert.accept
    sleep 1
    expect { page.to_not have_content("example22@o2.pl")
             page.to have_content("User was deleted") }
  end

  scenario 'admin cancel delete user'  do
    expect(page).to have_content("example22@o2.pl")
    page.all('td > a')[0].click
    page.driver.browser.switch_to.alert.dismiss
    sleep 1
    expect(page).to have_content("example22@o2.pl")
  end

  scenario 'admin can go to admin panel'  do
    find('ul > li > a', text: "Navigate to the admin panel").click
    sleep 1
    expect(page).to have_current_path(admin_path)
  end
end
