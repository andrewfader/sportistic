Sportistic::Application.routes.draw do
  root 'home#index'
  devise_for :users, path_prefix: "my", controllers: { registrations: "registrations", invitations: "invitations" }
  resources :users, only: [:show, :edit, :update, :index] do
    get 'approve'
  end
  resources :teams, only: [:new, :create, :edit, :show, :index, :update] do
    resources :players
    resources :games
    get 'join'
  end
resources :games
end
