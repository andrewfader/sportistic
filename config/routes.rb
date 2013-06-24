Sportistic::Application.routes.draw do
  root 'home#index'
  devise_for :users, path_prefix: "my", controllers: { registrations: "registrations" }
  resources :users, only: [:show, :edit, :update]
  resources :teams, only: [:new, :create, :edit, :show, :index, :update]
end
