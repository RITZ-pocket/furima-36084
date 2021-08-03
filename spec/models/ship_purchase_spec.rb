require 'rails_helper'

RSpec.describe ShipPurchase, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @ship_purchase = FactoryBot.build(:ship_purchase, item_id: item.id, user_id: user.id)
    sleep(0.5)
  end
end
