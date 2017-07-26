FactoryGirl.define do
  factory :user do
    email { "example.email@gmail.com" }
    password { "password" }
  end
  factory :admin, class: User do
    email { "example@o2.pl" }
    password { "password"}
    admin      true
  end
end
