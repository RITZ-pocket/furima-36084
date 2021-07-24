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
      end
      it '商品の説明が必須であること' do
      end
      it 'カテゴリーの情報が必須であること' do
      end
      it '商品の状態の情報が必須であること' do
      end
      it '配送料負担の情報が必須であること' do
      end
      it '発送元の地域の情報が必須であること' do
      end
      it '発送までの日数の情報が必須であること' do
      end
      it '価格の情報が必須であること' do
      end
      it '価格は¥300~¥9,999,999の間のみ保存可能であること' do
      end
      it '価格は半角数値のみ保存可能であること' do
      end
      it '入力された価格によって販売手数料や販売利益の表示が変わること' do
      end
      it 'エラーハンドリングができること' do
      end
      it 'エラーハンドリングで出品ページに戻っても、入力済みの項目は消えないこと' do
      end
      it 'エラーハンドリングの際、重複したエラーメッセージが表示されないこと' do
      end
    end
end