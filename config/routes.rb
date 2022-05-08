Rails.application.routes.draw do
  devise_for :users

  unauthenticated do
    root "users#home"
  end

  root 'categories#index', as: "categorytrack"

  resources :users

  resources :categories, only: [:index, :show, :new, :create, :destroy] do
    resources :expenses, only: [ :new, :show, :create, :destroy]
  end

end