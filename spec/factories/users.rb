FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials}
    email {Faker::Internet.free_email}
    password {'test1234'}
    password_confirmation {password}
    last_name_zenkaku_kanji {'田中'}
    first_name_zenkaku_kanji {'太郎'}
    last_name_kana {'タナカ'}
    first_name_kana {'タロウ'}
    birth_day {'2020-10-01'}
  end
end
