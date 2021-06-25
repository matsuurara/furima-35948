require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "商品出品機能" do

    before do
      @item = FactoryBot.build(:item)
    end

    context "商品出品できる場合" do

      it "フォームの内容に問題がなければ登録できる" do
        expect(@item).to be_valid
      end


    end

    context "商品出品に失敗する場合" do

      it "imageに画像がないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "nameが空だと出品できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "nameが40文字より多いと出品できない" do
        @item.name = '12345678901234567890123456789012345678901'
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end


      it "infoが空だと出品できない" do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it "category_idが1だと出品できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "status_idが1だと出品できない" do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it "delivery_charager_idが1だと出品できない" do
        @item.delivery_charger_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charger must be other than 1")
      end

      it "region_idが空だと出品できない" do
        @item.region_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Region must be other than 1")
      end

      it "delivery_date_idが1だと出品できない" do
        @item.delivery_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date must be other than 1")
      end

      it "priceが空だと出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceが300より小さいと出品できない" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "priceが999999より大きいと出品できない" do
        @item.price = '1000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 999999")
      end

      it "priceが全角では出品できない" do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "priceが英字では出品できない" do
        @item.price = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end











    end



  end



end
