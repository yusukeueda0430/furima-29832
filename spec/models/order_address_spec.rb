require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    describe '商品の購入' do
      context "商品の購入ができる場合" do
        it "カード情報、有効期限、セキュリティコード、郵便番号、都道府県、市区町村、番地、建物名、電話番号があれば、決済できる" do
          expect(@order_address).to be_valid
        end

        it "建物名は空でも、決済できる" do
          @order_address.building_name = nil
          expect(@order_address).to be_valid
        end
      end

      context "商品の購入ができない場合" do
        it "カード情報または有効期限またはセキュリティコードが空だと、決済できない" do
          @order_address.token = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Token can't be blank")
        end

        it "郵便番号が空だと、決済できない" do
          @order_address.postal = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal can't be blank")
        end
        it "郵便番号にハイフンがないと、決済できない" do
          @order_address.postal = 1111111
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal は-をお願いします")
        end

        it "都道府県を選択しないと、決済できない" do
          @order_address.consider_id = 1
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Consider must be other than 1")
        end
        it "市区町村が空だと、決済できない" do
          @order_address.municipality = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
        end
        it "番地が空だと、決済できない" do
          @order_address.address = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Address can't be blank")
        end
        it "電話番号が空だと、決済できない" do
          @order_address.phone_number = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
        end

        it "電話番号が12桁以上だと、決済できない" do
          @order_address.phone_number = 555566668888
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number はハイフンなし、11桁以下でお願いします")
        end
      end
    end
end
