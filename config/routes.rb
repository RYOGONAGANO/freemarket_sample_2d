Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: 'products#index'
  resources :tests
  resources :users do
    collection do
      get :profile
      get :profilechange
      get :authentication
      get :login
      get :logout
      get :member_information_input
      get :registrationNewmenbar
      get :address
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
