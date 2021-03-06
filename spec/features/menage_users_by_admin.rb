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
    expect(page).to_not have_content("example22@o2.pl")
    expect(page).to have_content("User was deleted")
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
    expect(page).to have_current_path(admin_path)
  end

  scenario 'admin can add new user' do
    visit admin_users_path
    expect(page).to_not have_content("new_user@o2.pl")
    expect(page).to_not have_content('33')
    expect(page).to_not have_content("female")
    expect(page).to_not have_content("Programing")
    expect(page).to_not have_content("work")
    create_user
    visit admin_users_path
    expect(page).to have_content("new_user@o2.pl")
    expect(page).to have_content('33')
    expect(page).to have_content("female")
    expect(page).to have_content("Programing")
    expect(page).to have_content("work")
  end

  scenario 'admin can edit new user' do
    create_user
    visit admin_users_path
    expect(page).to have_content("new_user@o2.pl")
    expect(page).to have_content('33')
    expect(page).to have_content("female")
    expect(page).to have_content("Programing")
    expect(page).to have_content("work")
    edit_user
    visit admin_users_path
    expect(page).to_not have_content("new_user@o2.pl")
    expect(page).to_not have_content('33')
    expect(page).to_not have_content("female")
    expect(page).to_not have_content("Programing")
    expect(page).to_not have_content("work")

    expect(page).to have_content("new13_user@o2.pl")
    expect(page).to have_content('13')
    expect(page).to have_content("male")
    expect(page).to have_content("Snowboarding")
    expect(page).to have_content("health")
  end

  scenario 'admin see how many woman interest health in 20 to 30 age ' do
    visit admin_users_path
    expect(page).to have_content("Amout of women in age 20 to 30 interested: 0")
    create_user_with_cosm
    visit admin_users_path
    expect(page).to have_content("Amout of women in age 20 to 30 interested: 1")
  end
end

