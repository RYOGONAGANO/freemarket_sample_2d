Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: 'products#index'
  resources :tests
  resources :users do
    collection do
      get :profile
      get :profilechange
      get :login
      get :logout
      get :registrationNewmenbar
    end
  end

  resources :signups do
    collection do
      get :member_information_input
      get :authentication
      get :address
      get :regist_complete # 登録完了後のページ
      get :member_information_input
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
