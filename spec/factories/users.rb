FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name_zenkaku_kanji{'田中'}
    first_name_zenkaku_kanji{'太郎'}
    last_name_kana{'タナカ'}
    first_name_kana{'タロウ'}
    birth_day{'20202-10-01'}
  end
end