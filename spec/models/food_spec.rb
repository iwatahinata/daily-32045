require 'rails_helper'
describe Food do
  before do
    @food = FactoryBot.build(:food)
    @food.image = fixture_file_upload('app/assets/images/aiueo.png')
  end

  describe '商品情報の保存' do
    context '商品の保存がうまくいくとき' do
      it "全ての項目が存在すれば保存できる" do
        expect(@food).to be_valid
      end
    end

    context "商品の保存ができない場合" do
      it "タイトルがないと商品は保存できない" do
        @food.title = ''
        @food.valid?
        expect(@food.errors.full_messages).to include("商品名を入力してください")
      end     
      it "画像がないと商品は保存できない" do
        @food.image = nil
        @food.valid?
        expect(@food.errors.full_messages).to include("画像を入力してください")
      end
      it "価格についての情報がないと商品は保存できない" do
        @food.price = ''
        @food.valid?
        expect(@food.errors.full_messages).to include("価格を入力してください")
      end
      it "価格が300以上でないと商品は保存できない" do
        @food.price = '299'
        @food.valid?
        expect(@food.errors.full_messages).to include("価格は300以上の値にしてください")
      end
      it "価格が10000以下でないと商品は保存できない" do
        @food.price = '10001'
        @food.valid?
        expect(@food.errors.full_messages).to include("価格は10000以下の値にしてください")
      end
      it "価格が半角数字でないと商品は保存できない" do
        @food.price = '３０００'
        @food.valid?
        expect(@food.errors.full_messages).to include("価格は数値で入力してください")
      end
      it "ユーザーが紐付いていないと商品は保存できない" do
        @food.user = nil
        @food.valid?
        expect(@food.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
