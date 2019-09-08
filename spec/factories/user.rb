FactoryBot.define do
  factory :user do
    email { 'test@example.com' }
    password { '123456' }
    admin {false}

  end
end
