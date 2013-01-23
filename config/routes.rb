TwitterPostComments::Application.routes.draw do

  resources :comments,:only => [:create,:destroy]

  resources :articles,:only => [:index, :create, :destroy]

  resources :authentications,:only => [:create]

match '/auth/:provider/callback' => 'authentications#create'
  authenticated :user do
    root :to => 'articles#index'
  end
  root :to => "articles#index"
  devise_for :users
  resources :users
end