Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "homes#top"
  get "home/about" => "homes#about"

  resources :books, only: [:new,:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorite, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update,:create,:new] do
    resource :relationships, only: [:create, :destroy]
    get 'following' => 'relationships#following', as: 'following'
    get 'followeds' => 'relationships#followeds', as: 'followeds'
  end
  
  get "/search", to: "searches#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
