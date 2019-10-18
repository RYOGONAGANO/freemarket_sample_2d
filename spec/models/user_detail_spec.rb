require 'rails_helper'
describe UserDetail do
  describe '#create' do
    context 'can`t save' do
      example "first_nameが空の場合、保存できない" do
        user_detail = build(:user_detail, first_name: nil)
        user_detail.valid?
        expect(user_detail.errors[:first_name]).to include("を入力してください")
      end

      example "first_nameが35文字以上の場合、保存できない" do
        user_detail = build(:user_detail, first_name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        user_detail.valid?
        expect(user_detail.errors[:first_name]).to include("は35文字以内で入力してください")
      end

      example "last_nameが空の場合、保存できない" do
        user_detail = build(:user_detail, last_name: nil)
        user_detail.valid?
        expect(user_detail.errors[:last_name]).to include("を入力してください")
      end

      example "last_nameが35文字以上の場合、保存できない" do
        user_detail = build(:user_detail, last_name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        user_detail.valid?
        expect(user_detail.errors[:last_name]).to include("は35文字以内で入力してください")
      end

      example "first_name_kataが空の場合、保存できない" do
        user_detail = build(:user_detail, first_name_kata: nil)
        user_detail.valid?
        expect(user_detail.errors[:first_name_kata]).to include("を入力してください")
      end

      example "first_name_kataが35文字以上の場合、保存できない" do
        user_detail = build(:user_detail, first_name_kata: "アアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアア")
        user_detail.valid?
        expect(user_detail.errors[:first_name_kata]).to include("は35文字以内で入力してください")
      end

      example "first_name_kataがカタカナ以外の場合、保存できない" do
        user_detail = build(:user_detail, first_name_kata: "a")
        user_detail.valid?
        expect(user_detail.errors[:first_name_kata]).to include("は不正な値です")
      end

      example "last_name_kataが空の場合、保存できない" do
        user_detail = build(:user_detail, last_name_kata: nil)
        user_detail.valid?
        expect(user_detail.errors[:last_name_kata]).to include("を入力してください")
      end

      example "last_name_kataが35文字以上の場合、保存できない" do
        user_detail = build(:user_detail, last_name_kata: "アアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアアア")
        user_detail.valid?
        expect(user_detail.errors[:last_name_kata]).to include("は35文字以内で入力してください")
      end

      example "last_name_kataがカタカナ以外の場合、保存できない" do
        user_detail = build(:user_detail, last_name_kata: "a")
        user_detail.valid?
        expect(user_detail.errors[:last_name_kata]).to include("は不正な値です")
      end

      example "birthdayが空の場合、保存できない" do
        user_detail = build(:user_detail, birthday: nil)
        user_detail.valid?
        expect(user_detail.errors[:birthday]).to include("を正しく入力してください")
      end
    end

    context 'can save' do
      example "first_nameとlast_nameとfirst_name_kataとlast_name_kataとbirthdayがあると、保存できる" do
        expect(build(:user_detail)).to be_valid
      end
    end
  end
end