Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :guesses, only: [:create]
  resources :games, only: [:new, :create, :show]
  resources :questions do
    member do
      get :guess
      get :hint
    end
  end
end
