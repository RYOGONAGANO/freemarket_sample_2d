Rails.application.routes.draw do
  devise_for :users
  root to: 'users#edit'
  root to: 'users#show'
  root to: 'products#show'
  resources :tests
  resources :users do
    collection do
      get :profile
      get :authentication
      get :login_page
      get :logout
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
