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
  end

end
