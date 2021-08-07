require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、name_first、name_family、name_kana_family、name_kana_first、passwordとpassword_confirmation、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
        expect(@user).to be_valid
      end
      it 'name_firstが全角であれば登録できる' do
        @user.name_first = 'シ検'
      end
      it 'name_familyが全角であれば登録できる' do
        @user.name_family = 'サ藤'
      end
      it 'name_kana_firstが全角であれば登録できる' do
        @user.name_kana_family = 'シケン'
      end
      it 'name_kana_familyが全角であれば登録できる' do
        @user.name_kana_first = 'サトウ'
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aa111'
        @user.password_confirmation = 'aa111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'name_firstが全角英字では登録できない' do
        @user.name_first = 'ｓｉｋｅｎｎ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name first is invalid')
      end
      it 'name_firstが半角英字では登録できない' do
        @user.name_first = 'siken'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name first is invalid')
      end
      it 'name_familyが全角英字では登録できない' do
        @user.name_family = 'ｓａｔｏ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name family is invalid')
      end
      it 'name_familyが半角英字では登録できない' do
        @user.name_family = 'sato'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name family is invalid')
      end
      it 'name_kana_firstが半角英字では登録できない' do
        @user.name_kana_first = 'siken'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kana first is invalid')
      end
      it 'name_kana_firstが全角英字では登録できない' do
        @user.name_kana_first = 'ｓｈｉｋｅｎｎ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kana first is invalid')
      end
      it 'name_kana_firstが全角平仮名では登録できない' do
        @user.name_kana_first = 'しけん'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kana first is invalid')
      end
      it 'name_kana_firstが全角漢字では登録できない' do
        @user.name_kana_first = '試験'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kana first is invalid')
      end
      it 'name_kana_familyが半角英字では登録できない' do
        @user.name_kana_family = 'sato'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kana family is invalid')
      end
      it 'name_kana_familyが全角英字では登録できない' do
        @user.name_kana_family = 'ｓａｔｏ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kana family is invalid')
      end
      it 'name_kana_familyが全角平仮名では登録できない' do
        @user.name_kana_family = 'さとう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kana family is invalid')
      end
      it 'name_kana_familyが全角漢字では登録できない' do
        @user.name_kana_family = '佐藤'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kana family is invalid')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
