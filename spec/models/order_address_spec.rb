require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order = FactoryBot.build(:order_address)
  end

  describe '商品購入機能' do
    context '購入可能' do
      it '必須項目が入力されていれば購入できる' do
        expect(@order).to be_valid
      end

      it '建物名が空でも購入できる' do
        @order.building = nil
        @order.valid?
        expect(@order).to be_valid
      end

    end

    context '商品購入不可' do
      it 'tokenが存在しない場合購入できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("カード情報を入力してください")
      end

      it 'postcodeにハイフンがない場合購入できない' do
        @order.postcode = '5550000'
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号は不正な値です")
      end

      it 'postcodeが未入力の場合購入できない' do
        @order.postcode = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号を入力してください")
      end

      it 'prefectureが未選択の場合購入できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("都道府県は1より大きい値にしてください")
      end

      it 'cityが未入力の場合購入できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("市区町村を入力してください")
      end

      it 'cityが漢字・ひらがな・カタカナ以外の文字を使用している場合購入できない' do
        @order.city = 'Reykjavik'
        @order.valid?
        expect(@order.errors.full_messages).to include("市区町村には全角(漢字・ひらがな・カタカナ)を使用してください")
      end

      it 'addressが未入力の場合購入できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("番地を入力してください")
      end

      it 'phoneが未入力の場合購入できない' do
        @order.phone = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号を入力してください")
      end

      it 'phoneが11桁よりも大きな数の場合購入できない' do
        @order.phone = '012345678910'
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号は11文字以内で入力してください")
      end
      it 'phoneにハイフンが入力されている場合購入できない' do
        @order.phone = '12-21-1234'
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号は不正な値です")
      end
    end
  end
end
