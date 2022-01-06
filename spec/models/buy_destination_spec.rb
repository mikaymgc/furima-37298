require 'rails_helper'

RSpec.describe BuyDestination, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      sleep 0.2
      @buy_destination = FactoryBot.build(:buy_destination, user_id: user.id, item_id: item.id)

    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@buy_destination).to be_valid
      end
      it 'buildingは空でも購入できること' do
        @buy_destination.building = ''
        expect(@buy_destination).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "tokenが空では登録できないこと" do
        @buy_destination.token = nil
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Token can't be blank")
      end
      it 'postcodeが空だと保存できないこと' do
        @buy_destination.postcode = ''
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
        @buy_destination.postcode = '1234567'
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include('Postcode is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'prefectureを選択していないと購入できないこと' do
        @buy_destination.prefecture_id = 1
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと購入できないこと' do
        @buy_destination.city = ''
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが空だと購入できないこと' do
        @buy_destination.addresses = ''
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが空だと購入できないこと' do
        @buy_destination.phone_number = ''
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは、9桁以下と購入できない' do
        @buy_destination.phone_number = '123456789'
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'phone_numberは、12桁以上と購入できない' do
        @buy_destination.phone_number = '123456789012'
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'phone_numberは、全角数値と購入できない' do
        @buy_destination.phone_number = '１２３４５６７８９０'
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'userが紐付いていないと保存できないこと' do
        @buy_destination.user_id = nil
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと購入できないこと' do
        @buy_destination.item_id = nil
        @buy_destination.valid?
        expect(@buy_destination.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
