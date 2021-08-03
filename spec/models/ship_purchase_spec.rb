require 'rails_helper'

RSpec.describe ShipPurchase, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @ship_purchase = FactoryBot.build(:ship_purchase, item_id: item.id, user_id: user.id)
    sleep(0.5)
  end

  describe '商品購入' do
    context '商品が購入できる時' do
      it '必要事項が記入されているときに商品が購入できる' do
      end
    end
    context '商品の購入ができない時' do
      it '郵便番号が必須であること' do
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
      end
      it '都道府県が必須であること' do
      end
      it '市区町村が必須であること' do
      end
      it '番地が必須であること' do
      end
      it '建物名は任意であること' do
      end
      it '電話番号が必須であること' do
      end
      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
      end
    end
  end
end
