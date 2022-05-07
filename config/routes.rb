Rails.application.routes.draw do
  devise_for :users

  get '/categories', to: 'categories#index', as: 'user_root'
  get '/categories', to: 'categories#index', as: 'user'

  
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
  
  # unauthenticated do
  #   root "users#index"
  # end

  # authenticated do
  #   root "categories#index", as: "authenticated_root"
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "categories#index", as: "category_track"
end
