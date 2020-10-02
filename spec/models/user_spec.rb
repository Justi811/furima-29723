require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameが空の場合登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空の場合登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに@がない場合登録できない' do
      @user.email = 'xxx.co.jp'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'passwordが空の場合登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下の場合登録できない' do
      @user.password = 'Abc45'
      @user.password_confirmation = 'Abc45'
      @user.valid?
    end
    it 'passwordは半角数字を含まない場合登録できない' do
      @user.password = 'XXXXxxxx'
      @user.password_confirmation = 'XXXXxxxx'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には半角6〜20文字、英大文字・小文字数字をそれぞれ1文字以上含む必要があります。")
    end

    it 'passwordは半角英字を含まない場合登録できない' do
      @user.password = '123456789'
      @user.password_confirmation = '123456789'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には半角6〜20文字、英大文字・小文字数字をそれぞれ1文字以上含む必要があります。")
    end

    it 'passwordが存在してもpassword_confirmationが空のとき登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'nameが空の場合登録できない' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it 'surnameが空の場合登録できない' do
      @user.surname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname can't be blank")
    end

    it 'kana_nameが空の場合登録できない' do
      @user.kana_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana name can't be blank")
    end

    it 'kana_surnameが空の場合登録できない' do
      @user.kana_surname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana surname can't be blank")
    end

    it 'birthdayが空の場合登録できない' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
