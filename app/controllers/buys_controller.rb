class BuysController < ApplicationController
  require "payjp"
  before_action :authenticate_user!, only: [:new, :create]
  before_action :redirect_exhibiter, only: [:new]
  before_action :set_card, only: [:new, :create]

  def new
    @address = current_user.address
    @user_address = Prefecture.find(@product.shipping_area).name + " " + @address.city + @address.address
    @user = current_user.user_detail
    @name = @user.last_name + " " + @user.first_name
    
    if @card.present?
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
      exp_month = @card_information.exp_month.to_s
      exp_year = @card_information.exp_year.to_s.slice(2,3)
      @exp_data  = exp_month + " / " + exp_year
      # 《＋α》 登録しているカード会社のブランドアイコンを表示するためのコードです。---------
      @card_brand = @card_information.brand
      case @card_brand
      when "Visa"
        @card_src = "card-visa.svg"
      when "JCB"
        @card_src = "card-jcb.svg"
      when "MasterCard"
        @card_src = "card-master.svg"
      when "American Express"
        @card_src = "card-american.svg"
      when "Diners Club"
        @card_src = "card-dinersclub.svg"
      when "Discover"
        @card_src = "card-discover.svg"
      when "Saison"
        @card_src = "card-saison.svg"
      end
      # ---------------------------------------------------------------
    end
  end

  def create #クレジット購入
    # 購入した際の情報を元に引っ張ってくる

    if @card.blank?
      redirect_to action: "new"
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      @product = Product.find(params[:product_id])
      # テーブル紐付けてるのでログインユーザーのクレジットカードを引っ張ってくる
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      # キーをセットする(環境変数においても良い)
      Payjp::Charge.create(
      amount: @product.price, #支払金額
      customer: @card.customer_id, #顧客ID
      currency: 'jpy', #日本円
      )
      # ↑商品の金額をamountへ、cardの顧客idをcustomerへ、currencyをjpyへ入れる
      if @product.update(buyer_id: current_user.id)
        flash[:notice] = '購入しました。'
      else
        flash[:alert] = '購入に失敗しました。'
        redirect_to product_path(@product.id)
      end
      #↑この辺はこちら側のテーブル設計どうりに色々しています
    end
  end

  def set_card
    @card = current_user.card if current_user.card.present?
  end

  def redirect_exhibiter
    @product = Product.find(params[:product_id])
    redirect_to root_path if @product.exhibitor_id == current_user.id
  end
end
