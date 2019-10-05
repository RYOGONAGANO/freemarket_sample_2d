Rails.application.routes.draw do
  devise_for :users
  root to: 'products#show'
  resources :tests
  resources :users do
    collection do
      get :profile
      get :authentication
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
