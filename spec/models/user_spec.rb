require 'rails_helper'
RSpec.describe User, type: :model do
   before do
    @user = FactoryBot.build(:user)
   end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
     it "nicknameとemail、passwordとpassword_confirmation,
     onamae_kanji_zenkaku,onamae_kana_zenkaku,birth_dayが存在すれば登録できる" do
       expect(@user).to be_valid
     end 
    end
    context '新規登録がうまくいかないとき' do
        it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに@が空では登録できない" do
        @user.email = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end
      it "お名前(漢字全角名字)がないと登録できない" do
        @user.last_name_zenkaku_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name zenkaku kanji can't be blank")
      end
      it "お名前(漢字全角名前)がないと登録できない" do
        @user.first_name_zenkaku_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name zenkaku kanji can't be blank")
      end
      it "お名前名字はローマ字では登録できない" do
        @user.last_name_zenkaku_kanji = "text"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name zenkaku kanji 全角文字を使用してください")
        end
      it "お名前本名はローマ字では登録できない" do
        @user.first_name_zenkaku_kanji = "text"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name zenkaku kanji 全角文字を使用してください")
      end  
      it "お名前(全角カナ名字)がないと登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "お名前(全角カナ名前)がないと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "ユーザー名字フリガナは、ローマ字では登録できない" do
        @user.last_name_kana = "text"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カナ文字を使用してください")
        end        
      it "ユーザー本名の名前フリガナは、ローマ字では登録できない" do
        @user.first_name_kana = "text"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カナ文字を使用してください")
      end  
      it "ユーザー名字フリガナは、漢字では登録できない" do
        @user.last_name_kana = "text"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カナ文字を使用してください")
      end
      it "ユーザー名字フリガナは、ひらがなでは登録できない" do
        @user.last_name_kana = "text"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カナ文字を使用してください")
      end
      it "ユーザー本名の名前フリガナは、ひながなでは登録できない" do
        @user.first_name_kana = "text"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カナ文字を使用してください")
      end
      it "生年月日がないと登録できない" do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end