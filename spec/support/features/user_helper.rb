module Features
  module UserHelpers
    def create_user
      visit admin_users_path
      find_link("ADD USER").click
      fill_in 'Email', with: "new_user@o2.pl"
      fill_in 'Age', with: "33"
      find(:select,"Gender").find(:option,"female").click
      find_link('add interest').click
      sleep 1
      fill_in "Name", with: "Programing"
      find(:select,"Type").find(:option,"work").click
      find_button("Create User").click
    end

    def edit_user
      visit admin_users_path
      page.all('td > a')[2].click
      fill_in 'Email', with: "new13_user@o2.pl"
      fill_in 'Age', with: "13"
      find(:select,"Gender").find(:option,"male").click
      fill_in "Name", with: "Snowboarding"
      find(:select,"Type").find(:option,"health").click
      find_button("Update User").click
    end

    def create_user_with_cosm
      visit admin_users_path
      find_link("ADD USER").click
      fill_in 'Email', with: "new_user@o2.pl"
      fill_in 'Age', with: "22"
      find(:select,"Gender").find(:option,"female").click
      find_link('add interest').click
      sleep 1
      fill_in "Name", with: "cosmopolitan"
      find(:select,"Type").find(:option,"health").click
      find_button("Create User").click
    end
  end
end
