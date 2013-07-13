TwitterPostComments::Application.routes.draw do

  resources :comments,:only => [:create,:destroy]

  resources :articles,:only => [:index, :create, :destroy]

  resources :authentications,:only => [:create]

match '/auth/:provider/callback' => 'authentications#create'
devise_scope :user do
    devise_for :users, :controllers => { :registrations => "registrations" }
  devise_for :users
  match '/:reference' => "registrations#new"
end
  authenticated :user do
    root :to => 'articles#index'
  end
  root :to => "articles#index"

  resources :users
end