FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name_zenkaku_kanji{Faker::Name.initials}
    first_name_zenkaku_kanji{Faker::Name.initials}
    last_name_kana{Faker::Name.initials}
    first_name_kana{Faker::Name.initials}
    birth_day{Faker::Name.initials}
  end
end