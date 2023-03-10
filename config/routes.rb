Rails.application.routes.draw do
  devise_for :users
  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  get "/search"=>"searches#search"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create,:destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :groups do
    get "join" => "groups#join"
    resources :event_notices, only: [:new, :create]
    get "event_notices" => "event_notices#sent"
  end

end