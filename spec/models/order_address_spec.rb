require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe 'オーダーの住所登録' do
    before do
      @item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: @item.user.id, item_id: @item.id)
    end

    context '注文登録できる場合' do
      it '入力に不備がなければ登録できる' do
        expect(@order_address).to be_valid
      end

      it 'floorが空でも登録できる' do
        @order_address.floor = ''
        expect(@order_address).to be_valid
      end
    end

    context '注文登録できない場合' do
      it 'postal_codeが空の場合は登録できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが全角だと登録できない' do
        @order_address.postal_code = '１１１−１１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid')
      end

      it 'postal_codeにハイフンが含まれていないと登録できない' do
        @order_address.postal_code = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid')
      end

      it 'postal_codeがハイフンを挟んで3桁と4桁の数字でないと登録できない' do
        @order_address.postal_code = '1111-111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid')
      end

      it 'region_idが空だと出品できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Region must be other than 1')
      end

      it 'cityが空では登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空では登録できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'telephone_numberが空では登録できない' do
        @order_address.telephone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが10桁未満では登録できない' do
        @order_address.telephone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone number is too short (minimum is 10 characters)')
      end
      it 'telephone_numberが11桁より多ければ登録できない' do
        @order_address.telephone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone number is too long (maximum is 11 characters)')
      end
      it 'telephone_numberが半角数字のみでないと登録できない' do
        @order_address.telephone_number = '123asdf1234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'telephone_numberが全角数字では登録できない' do
        @order_address.telephone_number = '１２３４５６７８９０１２'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone number is invalid')
      end

      it 'tokenが空では登録できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空では登録できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
