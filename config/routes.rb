Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :tests
  resources :users do
    collection do
      get :profile
      get :profilechange
      get :authentication
      get :login_page
      get :logout
      get :registrationNewmenbar
      get :address
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
