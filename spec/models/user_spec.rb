require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'ニックネームが必須であること' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが必須であること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'sample'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = '00000'
      @User.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      
      expect(@user.errors.full_messages).to include("")
    end
    it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
      @user.password = '000000'
      @user.password_confirmation = '000001'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'お名前（全角）は、名字と名前がそれぞれ必須であること' do
      @user.family_name = ''
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end
    it 'お名前（全角）は、全角（漢字・ひらがな・カタカナ）での入力が必須である' do
      @user.family_name = 'zenkaku'
      @user.first_name = 'zenkaku'
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end
    it 'お名前カナ（全角）は、名字と名前がそれぞれ必須であること' do
      @user.family_name = ''
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end
    it 'お名前カナ（全角）は、全角（カタカナ）での入力が必須であること' do
      @user.family_name = 'kana'
      @user.first_name = 'kana'
      @user.valid?
      expect(@user.errors.full_messages).to include ()
    end
    it '生年月日が必須であること' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth_date can't be blink")
    end
  end
end
