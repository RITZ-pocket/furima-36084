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
        expect(@ship_purchase).to be_valid
      end
    end
    context '商品の購入ができない時' do
      it "トークンが必須であること" do
        @ship_purchase.token = ''
        @ship_purchase.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が必須であること' do
        @ship_purchase.post_code = ''
        @ship_purchase.valid?
        expect(@ship_purchase.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号はハイフンを含めた半角文字列のみ保存可能なこと' do
        @ship_purchase.post_code = '1111111'
        @ship_purchase.valid?
        expect(@ship_purchase.errors.full_messages).to include("")
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @ship_purchase.post_code = '111-111'
        @ship_purchase.valid?
        expect(@ship_purchase.errors.full_messages).to include("")
      end
      it '郵便番号は、半角文字列のみ保存可能なこと' do
        @ship_purchase.post_code = '１１１ー１１１１'
        @ship_purchase.valid?
        expect(@ship_purchase.errors.full_messages).to include("")
      end
      it '都道府県が必須であること' do
        @ship_purchase.shipping_area_id = 1
        @ship_purchase.valid?
        expect(@ship_purchase.errors.full_messages).to include("Shipping area can't be blank")
      end
      it '市区町村が必須であること' do
        @ship_purchase.city = ''
        @ship_purchase.valid?
        expect(@ship_purchase.errors.full_messages).to include("City can't be blank")
      end
      it '番地が必須であること' do
        @ship_purchase.address = ''
        @ship_purchase.valid?
        expect(@ship_purchase.errors.full_messages).to include("Address can't be blank")
      end
      it '建物名は任意であること' do
        @ship_purchase.building_name = ''
        @ship_purchase.valid?
        expect(@ship_purchase.errors.full_messages).to include("")
      end
      it '電話番号が必須であること' do
        @ship_purchase.phone_number = ''
        @ship_purchase.valid?
        expect(@ship_purchase.errors.full_messages).to include("Phone numnber can't be blank")
      end
      it '電話番号は、9桁以下の半角数字では保存できないこと' do
        @ship_purchase.phone_number = '111111111'
        @ship_purchase.valid?
        expect(@ship_purchase.errors.full_messages).to include("")
      end
      it '電話番号は、12桁以上の半角数字では保存できないこと' do
        @ship_purchase.phone_number = '111111111111'
        @ship_purchase.valid?
        expect(@ship_purchase.errors.full_messages).to include("")
      end
      it '電話番号は、全角数字では保存できないこと' do
        @ship_purchase.phone_number = '１１１１１１１１１１'
        @ship_purchase.valid?
        expect(@ship_purchase.errors.full_messages).to include("")
      end
    end
  end
end
