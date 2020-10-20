require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品可能' do
      it '各項目が入力されていれば出品可能' do
        expect(@item).to be_valid
      end
    end

    context '出品不可' do
      it 'name未入力のため出品不可' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it 'description未入力のため出品不可' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("説明を入力してください")
      end

      it 'image未添付のため出品不可' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it 'category未選択のため出品不可' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは1より大きい値にしてください")
      end

      it 'condition未選択のため出品不可' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は1より大きい値にしてください")
      end

      it 'shipping_fee未選択のため出品不可' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は1より大きい値にしてください")
      end

      it 'shipping_area未選択のため出品不可' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域は1より大きい値にしてください")
      end

      it 'shipping_date未選択のため出品不可' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は1より大きい値にしてください")
      end

      it 'shipping_date未選択のため出品不可' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は1より大きい値にしてください")
      end

      it 'price未入力のため出品不可' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end

      it 'priceが半角数字以外のため出品不可' do
        @item.price = "\b\b２０００yen"
        @item.valid?
        expect(@item.errors.full_messages).to include( "価格は数値で入力してください")
      end

      it 'priceが300円未満の場合出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300以上の値にしてください")
      end

      it 'priceが10000000以上の場合出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は9999999以下の値にしてください")
      end
    end
  end
end

