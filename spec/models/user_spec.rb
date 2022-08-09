require 'rails_helper'

 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  context '新規登録できない場合' do
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
     it "パスワードは。6文字以上での入力が必須であること" do
      @user.password = 'ab1234'
      @user.password_confirmation = 'ab12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
     end
     it "パスワードとパスワード（確認）は、値の一致が必須であること" do
      @user.password = 'ab12345'
      @user.password_confirmation = 'ac123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
   end
 end