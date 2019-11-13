class CardsController < ApplicationController
  require "payjp"
  before_action :set_card

  def index #CardのデータをPayjpに送って情報を取り出す
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

  def destroy #PayjpとCardのデータベースを削除
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    if @card.destroy #削除に成功した時にポップアップを表示します。
      redirect_to action: "index", notice: "削除しました"
    else #削除に失敗した時にアラートを表示します。
      redirect_to action: "index", alert: "削除できませんでした"
    end
  end

  def new # カードの登録画面。送信ボタンを押すとcreateアクションへ。
    @card = current_user.card
    redirect_to action: "index" if @card.present?
  end

  def create #PayjpとCardのデータベースを作成
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]

    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      # トークンが正常に発行されていたら、顧客情報をPAY.JPに登録します。
      customer = Payjp::Customer.create(
        description: 'test', # 無くてもOK。PAY.JPの顧客情報に表示する概要です。
        email: current_user.email,
        card: params['payjp-token'], # 直前のnewアクションで発行され、送られてくるトークンをここで顧客に紐付けて永久保存します。
        metadata: {user_id: current_user.id} # 無くてもOK。
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        binding.pry
        if request.path == card_data_buy_cards_path
          redirect_to new_product_buy_path(session[:id])
        else
          redirect_to action: "index"
        end
      else
        redirect_to action: "create"
      end
    end
  end

  def card_data_display
    @product = Product
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

  def card_data_buy
    session[:id] = params[:id]
    card = Card.find_by(user_id: current_user.id)
  end

  private

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end