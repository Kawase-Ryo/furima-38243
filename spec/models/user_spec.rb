require 'rails_helper'

 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  context '新規登録できない場合' do
     it "ニックネームが必須であること" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "メールアドレスが必須であること" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it "メールアドレスが一意性であること" do
      @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
     end
     it "メールアドレスは、＠を含む必要があること" do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
     end
     it "パスワードが必須であること" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it "パスワードは、6文字以上での入力が必須であること" do
      @user.password = 'ab123'
      @user.password_confirmation = 'ab123'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
     end
      it 'パスワードが半角英数字混合での入力が必須であること' do
        @user.password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
     end
     it "パスワードとパスワード（確認）は、値の一致が必須であること" do
      @user.password = 'ab12345'
      @user.password_confirmation = 'ab123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
      it 'お名前が（全角）は、名字と名前がそれぞれ必須であること' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it 'お名前が（全角）は、名字と名前がそれぞれ必須であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'お名前カナ（全角）は、全角（カタカナ）での入力が必須であること' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end
      it 'お名前カナ（全角）は、全角（カタカナ）での入力が必須であること' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it '生年月日が必須であること' do
          @user.birth_day = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
   end
end