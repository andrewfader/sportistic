Wavrr::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  root 'launch#index'
  devise_for :users, path_prefix: "my", controllers: { registrations: "registrations", invitations: "invitations" }

  resources :users, only: [:show, :edit, :update, :index] do
    get 'approve'
    resources :teams, only: [:destroy]
    get :autocomplete_team_name, on: :collection
  end
  resources :user_sports
  resources :leagues
  resources :sports, only: :index
  resources :teams do
    resources :players, except: [:destroy]
    resources :games, except: [:destroy]
    get 'join'
    get :email
    post :send_email
  end
  resources :games do
    get 'join'
    get :autocomplete_team_name, on: :collection
  end
  get :about, to: 'about#index'
  get :launch, to: 'launch#index'
  get :welcome, to: 'home#index'
end
