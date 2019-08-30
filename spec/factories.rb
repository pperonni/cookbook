FactoryBot.define do
  factory :user do
    email { 'test@example.com' }
    password { '123456' }
    admin {true}
    # using dynamic attributes over static attributes in FactoryBot

    # if needed
    # is_active true
  end
end
