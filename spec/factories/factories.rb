FactoryGirl.define do
  factory :user do
    email "bob@gmail.com"
    password "password"
  end

  sequence :title do |n|
    "Title#{n}"
  end

  factory :link do
    title
    url "https://www.google.com"
    user_id 1
  end

end
