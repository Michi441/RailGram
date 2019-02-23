Rails.application.routes.draw do
  devise_for :users
  get 'landing/welcome'
  get 'landing/signin'


  resources :users, only: [:show] do
    member do
      get :follow
      get :unfollow
    end
    resources :posts
    resources :newsfeeds, only: [:index]
  end


  root 'landing#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
