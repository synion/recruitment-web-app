require 'rails_helper'

feature "AdminCanSeeTrashIcon", type: :feature do
  let!(:user) { create :user, email: "example22@o2.pl", password: "password" }

  background do
    sign_in_admin
    visit root_path
  end

  scenario do
    expect(page).to have_selector(:css, "i.fa-trash")
  end
end
