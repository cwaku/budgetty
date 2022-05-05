Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users', to: 'users#index'
    get '/', to: 'users#index'

    authenticated :user do
      get '/users/sign_out', to: 'devise/sessions#destroy'
      root 'categories#index', as: :authenticated_root
    end
    unauthenticated :user do
      root 'users#index', as: :unauthenticated_root
    end
  end


  # resources :categories_expenses
  resources :expenses
  resources :categories

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "categories#index", as: "category_track"
end
