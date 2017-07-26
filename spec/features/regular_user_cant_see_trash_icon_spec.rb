require 'rails_helper'

feature "RegularUserCantSeeTrashIcon", type: :feature do
  let!(:user) { create :user, email: "example22@o2.pl", password: "password" }

  background do
    sign_in
    visit root_path
  end

  scenario do
    expect(page).to_not have_selector(:css, "i.fa-trash")
  end

end

