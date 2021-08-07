FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    name_family           { '佐藤' }
    name_first            { '試験' }
    name_kana_family      { 'サトウ' }
    name_kana_first       { 'シケン' }
    birthday              { Faker::Date.between(from: '1930-01-01', to: Date.today) }
  end
end
