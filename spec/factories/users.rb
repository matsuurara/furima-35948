FactoryBot.define do
  factory :user do
    id                    { 1 }
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { 'asdf12' }
    password_confirmation { password }
    last_name             { 'てすと' }
    first_name            { 'てすと' }
    last_name_kana        { 'テスト' }
    first_name_kana       { 'テスト' }
    birthday              { '1930-01-01' }
  end
end
