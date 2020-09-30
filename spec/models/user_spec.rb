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

      #it"英数字両方であれば登録できる"do
      #end
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
      it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't to be too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end