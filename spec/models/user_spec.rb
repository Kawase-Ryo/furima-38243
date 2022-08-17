require 'rails_helper'

 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザ登録ができる時' do
      it '全ての入力事項が、存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'メールアドレスが@及び空欄でなければ登録できること' do
        @user.email = 'test@.com'
        expect(@user).to be_valid
      end
      it 'パスワードが6文字以上半角英数字であれば登録できる' do
        @user.password = '1234abc'
        @user.password_confirmation = '1234abc'
        expect(@user).to be_valid
      end
      it '名字が全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.family_name = '山田'
        expect(@user).to be_valid
      end
      it '名前が全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.first_name = '陸太郎'
        expect(@user).to be_valid
      end
      it '名字のフリガナが全角（カタカナ）であれば登録できる' do
        @user.family_name_kana = 'ヤマダ'
        expect(@user).to be_valid
      end
      it '名前のフリガナが全角（カタカナ）であれば登録できる' do
        @user.first_name_kana = 'リクタロウ'
        expect(@user).to be_valid
      end
      it '生年月日があれば登録できる' do
        @user.birth_day = '2000-01-01'
        expect(@user).to be_valid
    end
  end

  context 'ユーザ登録ができない時' do
     it "ニックネームが必須であること" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
     end
     it "メールアドレスが必須であること" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
     end
     it "メールアドレスが一意性であること" do
      @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
     end
     it "メールアドレスは、＠を含む必要があること" do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
     end
     it "パスワードが必須であること" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
     end
     it "パスワードは、6文字以上での入力が必須であること" do
      @user.password = 'ab123'
      @user.password_confirmation = 'ab123'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
     end
      it 'パスワードが半角英数字混合での入力が必須であること（数字）' do
        @user.password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
        it 'パスワードが半角英数字混合での入力が必須であること（英字）' do
          @user.password = 'abcdefg'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
     end
     it "パスワードとパスワード（確認）は、値の一致が必須であること" do
      @user.password = 'ab12345'
      @user.password_confirmation = 'ab123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
     end
     it "パスワードが全角だと登録できないこと" do
      @user.password = 'ああああああ'
      @user.password_confirmation = 'ああああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードInclude both letters and numbers')
     end
      it 'お名前が（全角）は、姓（全角）に半角文字が含まれていると登録できない' do
        @user.family_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字(漢字)は不正な値です')
      end
      it 'お名前が（全角）は、姓が空では登録できないこと' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字(漢字)は不正な値です')
      end
      it 'お名前が（全角）は、名（全角）に半角文字が含まれていると登録できない' do
        @user.first_name = 'ﾘｸﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(漢字)は不正な値です')
      end
        it 'お名前が（全角）は、名が空では登録できないこと' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('名前(漢字)を入力してください')
      end
      it 'お名前カナ（全角）は、全角（カタカナ）で姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.family_name_kana = '山田a1/'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字(カナ)は不正な値です')
      end
      it 'お名前カナ（全角）は、全角（カタカナ）で姓（カナ）空では登録できないこと' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字(カナ)を入力してください')
      end
      it 'お名前カナ（全角）は、全角（カタカナ）で名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.first_name_kana = '隆太郎a1/'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(カナ)は不正な値です')
      end
      it 'お名前カナ（全角）は、全角（カタカナ）で名（カナ）空では登録できないこと' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(カナ)を入力してください')
      end
      it '生年月日が必須であること' do
          @user.birth_day = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end