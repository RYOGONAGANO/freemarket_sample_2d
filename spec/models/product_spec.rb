require 'rails_helper'
describe Product do
  before do
    @product = build(:product)
  end

  shared_examples "price_save" do
    # @product = build(:product)
    binding.pry
    expect(@product).to be_valid
  end

  describe '#create' do
    context 'can`t save' do
      example "nameが空の場合、保存できない" do
        @product.name = nil
        @product.valid?
        expect(@product.errors[:name]).to include("を入力してください")
      end

      example "priceが空の場合、保存できない" do
        @product.price = nil
        @product.valid?
        expect(@product.errors[:price]).to include("を入力してください")
      end

      example "descriptionが空の場合、保存できない" do
        @product.description = nil
        @product.valid?
        expect(@product.errors[:description]).to include("を入力してください")
      end

      example "statusが空の場合、保存できない" do
        @product.status = nil
        @product.valid?
        expect(@product.errors[:status]).to include("を入力してください")
      end

      example "feeが空の場合、保存できない" do
        @product.fee = nil
        @product.valid?
        expect(@product.errors[:fee]).to include("を入力してください")
      end
    end
  end

  describe '#name length' do
    context 'can`t save' do
      example "nameは「文字数41桁以上」の場合、保存できない" do
        @product.name = "a" * 41
        @product.valid?
        expect(@product.errors[:name]).to include("は40文字以内で入力してください")
      end
    end

    context 'can save' do
      example "nameは「文字数40桁以内」の場合、保存できる" do
      @product.name = "a" * 40
      expect(@product).to be_valid
      end
    end
  end

  describe '#price numeric' do
    context 'can`t save' do
      example "priceは数字以外の場合、保存できない" do
        @product.price = "aaa"
        @product.valid?
        expect(@product.errors[:price]).to include("は数値で入力してください")
      end
    end

    context 'can save' do
      example "priceは数字の場合、保存できる" do
        @product.price = 111
        expect(@product).to be_valid
      end
    end
  end

  describe '#price length' do
    context 'can`t save' do
      example "priceは2文字以内の場合、保存できない" do
        @product.price = 11
        @product.valid?
        expect(@product.errors[:price]).to include("は3文字以上で入力してください")
      end
    end

    context 'can save' do
      example "priceは3文字以上の場合、保存できる" do
        @product.price = 111
        expect(@product).to be_valid
      end
    end
  end

  describe '#price float' do
    context 'can`t save' do
      example "priceは整数以外の場合、保存できない" do
        @product.price = 111.1
        @product.valid?
        expect(@product.errors[:price]).to include("は整数で入力してください")
      end
    end

    it_behaves_like "price_save"

  end
end

