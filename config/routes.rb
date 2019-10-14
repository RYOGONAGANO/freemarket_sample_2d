Rails.application.routes.draw do
  devise_for :users
  root to: 'tests#index'
  resources :tests
  resources :users do
    collection do
      get :profile
      get :profilechange
      get :card_data_delete
      get :card_data_input
      get :card_data_create
      get :authentication
      get :login_page
      get :logout
      get :registrationNewmenbar
      get :address
      get :buyComplete
      get :mypage
      get :member_information_input
    end
  end
  resources :products 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
