class BuysController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
    if @card.present?
      Payjp.api_key = "sk_test_717aca1da4b849138cd2e0ee"
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
end
