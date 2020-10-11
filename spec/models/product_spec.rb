require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品の出品' do
    context "商品の出品ができる場合" do
      it "画像、商品名、商品の説明が存在し、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数が選択されていると出品できる" do
        expect(@product).to be_valid
      end
    end
    context "商品の出品ができない場合" do
      it "画像がないと、出品できない" do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image ファイルを添付してください")
      end   
      
      it "商品名がないと、出品できない" do
        @product.name = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it "商品説明がないと、出品できない" do
        @product.details = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Details can't be blank")
      end


      it "カテゴリを選択していないと、出品できない" do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1")
      end

      it "商品の状態を選択していないと、出品できない" do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Status must be other than 1")
      end

      it "配送料の負担を選択していないと、出品できない" do
        @product.fee_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Fee must be other than 1")
      end

      it "発送元の地域を選択していないと、出品できない" do
        @product.consider_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Consider must be other than 1")
      end

      it "発送までの日数を選択していないと、出品できない" do
        @product.days_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Days must be other than 1")
      end

      it "価格がないと、出品できない" do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it "価格が300より安いと、出品できない" do
        @product.price = 200
        @product.valid?
        expect(@product.errors.full_messages).to include("Price は半角数字、また300~999999円でお願いします")
      end

      it "価格が9999999より高いと、出品できない" do
        @product.price = 100000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price は半角数字、また300~999999円でお願いします")
      end

      it "価格が半角数字ではないと、出品できない" do
        @product.price = '山'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price は半角数字、また300~999999円でお願いします")
      end

      it "ユーザーが紐付いていないと、出品できない" do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("User must exist")
      end
    end
  end
end