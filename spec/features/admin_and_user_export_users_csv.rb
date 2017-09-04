require 'rails_helper'

feature 'AdminAndUserEporterUsersCSV', type: :feature do
  let!(:user2) do
    User.create_by_admin(
      email: 'lola1@o2.pl',
      age: 33,
      gender: :female,
      interests_attributes: [name: 'cosmopolitan', type: :health]
    )
  end
  let(:content_for_user) do
    "email,age,gender,Interests\n" \
    "lola1@o2.pl,33,female,cosmopolitan\n" \
    'example.email@gmail.com,,,'
  end
  let(:content_for_admin) do
    "email,age,gender,Interests\n" \
    "lola1@o2.pl,33,female,cosmopolitan\n" \
    "example@o2.pl,,,\"\"\n"
  end
  let(:file_name) { "users-#{Date.today}.csv" }

  scenario 'user and admin can export users to users.Date.today.csv' do
    sign_in
    visit users_path
    click_on 'Export to CSV'
    expect(DownloadHelpers.download_content).to include content_for_user
    expect(DownloadHelpers.download).to include file_name
  end

  scenario 'user and admin can export users to users.Date.today.csv' do
    sign_in_admin
    visit users_path
    click_on 'Export to CSV'
    expect(DownloadHelpers.download_content).to include content_for_admin
    expect(DownloadHelpers.download).to include file_name
  end
end
