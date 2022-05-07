Rails.application.routes.draw do
  devise_for :users

  get '/users', to: 'users#index', as: 'splash'
  get '/users', to: 'users#index', as: 'user'

  
  root 'categories#index', as: "categorytrack"
  
  resources :users, only: [:index]
  resources :categories
  resources :expenses
  
  devise_scope :user do
    authenticated :user do
      root "categories#index", as: "authenticated_root"
      get '/users/sign_out' => 'devise/sessions#destroy'
    end
    unauthenticated :user do
      root "users#index"
    end
  end
end
