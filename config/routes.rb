Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :tests
  resources :products do
    collection do
      get :show
    end
  end
  resources :users do
    collection do
      get :profile
      get :profilechange
      get :authentication
      get :login_page
      get :logout
      get :registrationNewmenbar
      get :address
      get :member_information_input
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
