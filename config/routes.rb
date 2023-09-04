Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :guesses, only: [:create]
  resources :topics, only: [:create]

  resources :games, only: [:new, :create, :show] do
    member do
      get :answer
    end
  end

  resources :questions do
    member do
      get :guess
      get :hint
    end
  end

end
