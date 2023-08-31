Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :guesses, only: [:create]
  resources :games, only: [:new, :create, :show]
  resources :questions do
    member do
      get :guess
      get :hint
    end
  end
  post "api/post_guess", to: "guesses#api"
end
