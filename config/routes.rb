Rails.application.routes.draw do
  devise_for :users
  root to: 'users#new'
  resources :tests
  resources :users
  resources :logins
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
