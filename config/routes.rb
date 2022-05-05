Rails.application.routes.draw do
  devise_for :users

  unauthenticated do
    root to: 'user#index'
  end
  
  resources :users

  resources :categories_expenses
  resources :expenses
  resources :categories, only: [:index, :show, :new, :create, :destroy] do
    resources :expenses, only: [:new, :create, :destroy, :show]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "categories#index", as: "category_track"
end
