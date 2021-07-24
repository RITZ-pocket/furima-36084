require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品の出品ができる時' do
      it '必要事項が記入されているときに商品が出品できる' do
      end
    end
    context '商品の出品ができない時' do
      it '商品画像を一枚添付することが必須であること' do
      end
      it '商品名が必須であること' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が必須であること' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = ''
        @item.valid? 
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態の情報が必須であること' do
        @item.item_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
      it '配送料負担の情報が必須であること' do
        @item.postage_payer_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer can't be blank")
      end
      it '発送元の地域の情報が必須であること' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it '発送までの日数の情報が必須であること' do
        @item.day_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Day to ship can't be blank")
      end
      it '価格の情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格は¥300~¥9,999,999の間のみ保存可能であること' do
      end
      it '価格は半角数値のみ保存可能であること' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end