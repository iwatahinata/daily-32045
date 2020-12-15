require 'rails_helper'

RSpec.describe AddressOrder, type: :model do
  describe '購入情報の保存' do
    before do
      @address_order = FactoryBot.build(:address_order)
    end

  context '購入情報の保存がうまくいくとき' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@address_order).to be_valid
    end
  end

  context "購入情報の保存ができない場合" do
    it 'postal_codeが空だと保存できないこと' do
      @address_order.postal_code = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Postal codeis invalid. Include hyphen(-)")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @address_order.postal_code = '1234567'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Postal codeis invalid. Include hyphen(-)")
    end
    it 'cityが空だと保存できないこと' do
      @address_order.city = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Cityを入力してください")
    end
    it 'streetが空だと保存できないこと' do
      @address_order.street = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Streetを入力してください")
    end
    it 'phone＿numberが空だと保存できないこと' do
      @address_order.phone_number = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone number11桁以内で入力してください")
    end
    it 'phone＿number11桁以上だと保存できないこと' do
      @address_order.phone_number = '090123456789'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone number11桁以内で入力してください")
    end
    it 'phone＿numberが数字のみでないと保存できないこと' do
      @address_order.phone_number = '090aaaa1234'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone number11桁以内で入力してください")
    end
    it 'tokenが空だと保存できないこと' do
      @address_order.token = nil
      @address_order.valid?
      expect(@address_order.errors.full_messages).to include("Tokenを入力してください")
    end
  end
 end
end
