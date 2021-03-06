Rails.application.routes.draw do

  root to: "cocktails#index"
  resources :cocktails, only: [:new, :index, :show, :create, :destroy] do
    resources :doses, only: [:new, :create]
    resources :reviews, only: [:new, :create, :destroy]
  end
  resources :doses, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
