require 'rails_helper'

describe UsersCsvExport do
  context "#generate" do
    let!(:user) { create :user , email: "salomon@o2.pl", password: "password", age: 22, gender: :male,
                  interests_attributes: [name: "snowboarding", type: "health"] }
    let!(:user2) { create :user , email: "salomon@o3.pl", password: "password", age: 33, gender: :female,
                  interests_attributes: [name: "programing", type: "work"] }
    let(:generate) { UsersCsvExport.new(User.all).generate }
    let(:generate2) { UsersCsvExport.new(User.where(email:"salomon@o2.pl")).generate }

    it { expect(generate).to include("email", "age", "gender", "Interests") }
    it { expect(generate).to include("salomon@o2.pl", "22", "male", "snowboarding") }
    it { expect(generate).to include("salomon@o3.pl", "33", "female", "programing") }

    it { expect(generate2).to_not include("salomon@o3.pl", "33", "female", "programing")}
    it { expect(generate2).to include("salomon@o2.pl", "22", "male", "snowboarding")}
  end
end
