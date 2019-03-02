Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations}
  get 'landing/welcome'
  get 'landing/signin'


  resources :users, only: [:show] do
    get :autocomplete_user_username, :on => :collection
    member do
      get :follow
      get :unfollow
    end
    resources :posts do
      resources :comments, only: [:create, :destroy]
      member do
        get :like
        get :unlike
      end
    end
    resources :newsfeeds, only: [:index]
  end


  root 'landing#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
