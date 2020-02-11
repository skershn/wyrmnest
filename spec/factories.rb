FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@gmail.com"
    end
    sequence :username do |x|
      "wyrm#{x}user"
    end    
    password { "secretPassword" }
    password_confirmation { "secretPassword" }
  end

  factory :topic do
    title { "hello" }
    content { "hello world" }
    association :user
  end

end