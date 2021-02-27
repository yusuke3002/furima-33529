require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_rubyとfirst_name_ruby、birthが存在すれば登録できる' do
        expect(@user).to be_valid
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
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_name_rubyが空では登録できない' do
        @user.last_name_ruby = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name ruby can't be blank")
      end
      it 'first_name_rubyが空では登録できない' do
        @user.first_name_ruby = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby can't be blank")
      end
      it 'birthが空では登録できない' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに＠が無いと登録できない' do
        @user.email = 'aaaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aaa00'
        @user.password_confirmation = 'aaa00'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは半角英数混合でないと登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Please include both letters and numbers')
      end
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = 'aaa000'
        @user.password_confirmation = '000123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameは全角でないと登録できない' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid Input full-width characters')
      end
      it 'first_nameは全角でないと登録できない' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid Input full-width characters')
      end
      it 'last_name_rubyは全角カナでないと登録できない' do
        @user.last_name_ruby = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name ruby is invalid Input full-width katakana characters')
      end
      it 'first_name_rubyは全角カナでないと登録できない' do
        @user.first_name_ruby = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name ruby is invalid Input full-width katakana characters')
      end
    end
  end
end
