Sportistic::Application.routes.draw do
  root 'home#index'
  devise_for :users, path_prefix: "my"
  resources :users, only: [:show]
end
