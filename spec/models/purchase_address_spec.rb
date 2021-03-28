require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe "商品購入機能" do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, item_id: @item.id, user_id: @user.id)
      sleep(1)
    end

    context "購入できる時" do
      it "必要な値が正しく入力されていれば購入できること" do
        expect(@purchase_address).to be_valid
      end
    end

    context "購入できない時" do
      it "tokenが空では購入できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_codeが空では購入できないこと" do
        @purchase_address.postal_code = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeが半角のハイフンを含んだ正しい形式でないと購入できないこと" do
        @purchase_address.postal_code = "1234567"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code In the correct form with a half-width hyphen")
      end
      it "prefecture_idが空では購入できないこと" do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture Please select an item")
      end
      it "municipalitiesが空では購入できないこと" do
        @purchase_address.municipalities = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it "blockが空では購入できないこと" do
        @purchase_address.block = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Block can't be blank")
      end
      it "phone_numberが空では購入できないこと" do
        @purchase_address.phone_number = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberは10桁より少なければ購入できないこと" do
        @purchase_address.phone_number = "123456789"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid. An integer of 10 or 11 digits")
      end
      it "phone_numberは11桁より多ければ購入できないこと" do
        @purchase_address.phone_number = "090123456789"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid. An integer of 10 or 11 digits")
      end
      it "userが紐付いていない場合は購入できないこと" do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it "itemが紐付いていない場合は購入できないこと" do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
