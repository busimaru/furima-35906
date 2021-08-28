require 'rails_helper'

RSpec.describe OrderAdress, type: :model do
  before do
    item = FactoryBot.build(:item)
    @order_adress = FactoryBot.build(:order_adress, item_id:item.id)
  end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_adress).to be_valid
    end
    it 'building_nameは空でも保存できること' do
      @order_adress.building_name = ''
      expect(@order_adress).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it '郵便番号が空欄では登録できない' do
      @order_adress.postcode = ''
      @order_adress.valid?
      expect(@order_adress.errors.full_messages).to include("Postcode can't be blank")
    end
    it '郵便番号は３桁ハイフン４桁以外は登録できない' do
      @order_adress.postcode = '6530055'
      @order_adress.valid?
      expect(@order_adress.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
    end
    it '都道府県が初期状態(未選択)では登録できない' do
      @order_adress.prefecture_id = 1
      @order_adress.valid?
      expect(@order_adress.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村が空欄では登録できない' do
      @order_adress.municipalities = ''
      @order_adress.valid?
      expect(@order_adress.errors.full_messages).to include("Municipalities can't be blank")
    end
    it '番地が空欄では登録できない' do
      @order_adress.address = ''
      @order_adress.valid?
      expect(@order_adress.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が空欄では登録できない' do
      @order_adress.phone_number = ''
      @order_adress.valid?
      expect(@order_adress.errors.full_messages).to include("Phone number can't be blank", "Phone number is number only")
    end
    it '電話番号は半角数字以外では登録できない' do
      @order_adress.phone_number = 'abcdefg1'
      @order_adress.valid?
      expect(@order_adress.errors.full_messages).to include("Phone number is number only")
    end
    it '電話番号は10桁以上11桁以内でなければ登録できない' do
      @order_adress.phone_number = '0907967'
      @order_adress.valid?
      expect(@order_adress.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
    end

    it "tokenが空では登録できないこと" do
      @order_adress.token = nil
      @order_adress.valid?
      expect(@order_adress.errors.full_messages).to include("Token can't be blank")
    end
  end
end