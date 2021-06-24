require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    before do
      @user =FactoryBot.build(:user)
    end

    context "ユーザー登録ができる場合" do

      #ユーザー情報

      it "フォームの内容に空欄がなければ登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上で半角英数字混合であれば登録できる" do
        @user.password = "asdf12"
        expect(@user).to be_valid
      end


    end

    context "ユーザー登録ができない場合" do

      #ユーザー情報について

      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが一意性でなければ登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it "emailに＠が含まれていなければ登録できない" do
        @user.email = 'aaaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが6文字未満では登録できない" do
        @user.password = 'aaa11'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角英字だけでは登録できない" do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")

      end
      it "passwordが半角数字だけでは登録できない" do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")

      end

      it "passwordとpassword_confirmationが一致していなければ登録できない" do
        @user.password = 'bbb111'
        @user.password_confirmation = 'aaa111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      #本人確認情報について

      ##本名入力欄

      it "last_nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "last_nameが半角では登録できない" do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it "last_nameが英字では登録できない" do
        @user.last_name = 'ＹＡＭＡＤＡ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end


      it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "first_nameが半角では登録できない" do
        @user.first_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "first_nameが英字では登録できない" do
        @user.first_name = 'ＹＡＭＡＤＡ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      #カナ入力欄

      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it "last_name_kanaが半角では登録できない" do
        @user.last_name_kana = 'yamada1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it "last_name_kanaがひらがなでは登録できない" do
        @user.last_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it "last_name_kanaが漢字では登録できない" do
        @user.last_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it "last_name_kanaが英字では登録できない" do
        @user.last_name_kana = 'ＹＡＭＡＤＡ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")

      end

      it "last_name_kanaが数字では登録できない" do
        @user.last_name_kana = '１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end



      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "first_name_kanaが半角では登録できない" do
        @user.first_name_kana = 'yamada1'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "first_name_kanaがひらがなでは登録できない" do
        @user.first_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "first_name_kanaが漢字では登録できない" do
        @user.first_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "first_name_kanaが英字では登録できない" do
        @user.first_name_kana = 'ＹＡＭＡＤＡ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")

      end

      it "first_name_kanaが数字では登録できない" do
        @user.first_name_kana = '１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end


      ##誕生日入力

      it "birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end


    end







  end

end
