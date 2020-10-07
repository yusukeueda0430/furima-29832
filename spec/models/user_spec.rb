require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation,first_name,first_hurigana,last_name,last_hurigana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = " "
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

      it "emailに＠が含まれていないと登録できない" do
        @user.email = "testcom"
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end

      it "passwordが空では登録できない" do
        @user.password = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが英語では登録できない" do
        @user.password = "fgfgfg"
        @user.password_confirmation = "fgfgfg"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 英数字混合でお願いします")
      end

      it "passwordが数字では登録できない" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 英数字混合でお願いします")
      end

      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "本名の名字が空では登録できない" do
        @user.first_name = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "本名の名前が空では登録できない" do
        @user.last_name = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "本名の名前が数字では登録できない" do
        @user.last_name = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 漢字、ひらがな、カタカナでお願いします")
      end

      it "本名の名字が数字では登録できない" do
        @user.first_name = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 漢字、ひらがな、カタカナでお願いします")
      end

      it "本名の名前が記号では登録できない" do
        @user.last_name = "%%%%%%"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 漢字、ひらがな、カタカナでお願いします")
      end

      it "本名の名字が記号では登録できない" do
        @user.first_name = "%%%%%%"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 漢字、ひらがな、カタカナでお願いします")
      end

      it "本名の名字のフリガナが漢字だと登録できない" do
        @user.first_hurigana = "山山"
        @user.valid?
        expect(@user.errors.full_messages).to include("First hurigana カタカナでお願いします")
      end

      it "本名の名前のフリガナが漢字だと登録できない" do
        @user.last_hurigana = "山山"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last hurigana カタカナでお願いします")
      end

      it "本名の名字のフリガナがひらがなだと登録できない" do
        @user.first_hurigana = "やまやま"
        @user.valid?
        expect(@user.errors.full_messages).to include("First hurigana カタカナでお願いします")
      end

      it "本名の名前のフリガナがひらがなだと登録できない" do
        @user.last_hurigana = "やまやま"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last hurigana カタカナでお願いします")
      end

      it "本名の名字のフリガナが空だと登録できない" do
        @user.first_hurigana = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("First hurigana カタカナでお願いします")
      end

      it "本名の名前のフリガナが空だと登録できない" do
        @user.last_hurigana = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Last hurigana カタカナでお願いします")
      end

        it "生年月日が空だと登録できない" do
        @user.birthday = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end