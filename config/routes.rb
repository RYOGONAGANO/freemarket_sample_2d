Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions" }
  root to: 'products#index'
  resources :tests
  resources :users do
    collection do
      get :profile
      get :profilechange
      get :authentication
      get :login
      get :logout
      get :registrationNewmenbar
      get :mypage
    end
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
    end
  end
end