Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions" }
  root to: 'products#index'
  resources :users do
    collection do
      get :profile
      get :profilechange
      get :authentication
      get :login
      get :logout
      get :registrationNewmenbar
    end
    resources :saling_products, only: [:index, :show, :destroy]
    resources :soldout_products, only: [:index]
  end

  resources :signups do
    collection do
      get :member_information_input
      get :authentication
      get :address
      get :carddata
      get :regist_complete # 登録完了後のページ
    end
  end
  resources :products do
    resources :buys, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :cards, only: [:index, :new, :create, :destroy] do
    collection do
      get :card_data_display
      get :card_data_buy
    end
  end
end