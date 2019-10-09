Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :tests
  resources :users do
    collection do
      get :profile
      get :profilechange
      get :card_data_delete
      get :card_data_input
      get :authentication
      get :login_page
      get :logout
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
