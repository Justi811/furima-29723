require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameが空の場合登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it 'emailが空の場合登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
    end

    it 'emailが登録済みのemailと重複している場合登録できない' do
      @user.save
      @another_user = FactoryBot.build(:user, email: @user.email)
      @another_user.valid?
      expect(@another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
    end

    it 'emailに@がない場合登録できない' do
      @user.email = 'xxx.co.jp'
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
    end

    it 'passwordが空の場合登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
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
      expect(@user.errors.full_messages).to include('パスワードには半角6〜20文字、英大文字・小文字数字をそれぞれ1文字以上含む必要があります。')
    end

    it 'passwordは半角英字を含まない場合登録できない' do
      @user.password = '123456789'
      @user.password_confirmation = '123456789'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードには半角6〜20文字、英大文字・小文字数字をそれぞれ1文字以上含む必要があります。')
    end

    it 'passwordが存在してもpassword_confirmationが空のとき登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'nameが空の場合登録できない' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
    end

    it 'nameが全角(漢字・ひらがな・カタカナ)の以外の場合登録できない' do
      @user.name = '12！？'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前には全角(漢字・ひらがな・カタカナ)を使用してください')
    end

    it 'surnameが空の場合登録できない' do
      @user.surname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字を入力してください")
    end

    it 'surnameが全角(漢字・ひらがな・カタカナ)の以外の場合登録できない' do
      @user.surname = '12！？'
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字には全角(漢字・ひらがな・カタカナ)を使用してください')
    end

    it 'kana_nameが空の場合登録できない' do
      @user.kana_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前（カナ入力）を入力してください")
    end

    it 'kana_surnameが空の場合登録できない' do
      @user.kana_name = '平仮名'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前（カナ入力）にはカナを使用してください')
    end

    it 'kana_surnameが空の場合登録できない' do
      @user.kana_surname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字（カナ入力）を入力してください")
    end

    it 'kana_surnameが空の場合登録できない' do
      @user.kana_surname = '片仮名'
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字（カナ入力）にはカナを使用してください')
    end

    it 'birthdayが空の場合登録できない' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("誕生日を入力してください")
    end
  end
end
