FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6).to_s }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太朗' }
    last_name_ruby        { 'ヤマダ' }
    first_name_ruby       { 'タロウ' }
    birth                 { '1930-01-01' }
  end
end
