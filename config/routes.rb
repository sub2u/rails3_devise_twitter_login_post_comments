TwitterPostComments::Application.routes.draw do

  resources :comments

  resources :articles

  resources :authentications

match '/auth/:provider/callback' => 'authentications#create'
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end