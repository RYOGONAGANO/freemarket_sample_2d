require 'rails_helper'
describe Address do
  describe '#create' do
    context 'can`t save' do
      example "postal_codeが空の場合、保存できない" do
        address = build(:address, postal_code: nil)
        address.valid?
        expect(address.errors[:postal_code]).to include("を入力してください")
      end

      example "postal_codeは「数字3桁-４桁」の場合以外、保存できない" do
        address = build(:address, postal_code: 1111-111)
        address.valid?
        expect(address.errors[:postal_code]).to include("は不正な値です")
      end

      example "prefecture_idが空の場合、保存できない" do
        address = build(:address, prefecture_id: nil)
        address.valid?
        expect(address.errors[:prefecture_id]).to include("を入力してください")
      end

      example "cityが空の場合、保存できない" do
        address = build(:address, city: nil)
        address.valid?
        expect(address.errors[:city]).to include("を入力してください")
      end

      example "addressが空の場合、保存できない" do
        address = build(:address, address: nil)
        address.valid?
        expect(address.errors[:address]).to include("を入力してください")
      end
    end
    context "can save" do
      example "postal_codeとprefecture_idとcityとaddressがあると、保存できる" do
        expect(build(:address)).to be_valid
      end
    end
  end
end