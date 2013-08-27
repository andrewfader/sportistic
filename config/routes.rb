Sportistic::Application.routes.draw do
  root 'home#index'
  devise_for :users, path_prefix: "my", controllers: { registrations: "registrations", invitations: "invitations" }
  resources :users, only: [:show, :edit, :update, :index] do
    get 'approve'
    resources :teams, only: [:destroy]
    get :autocomplete_team_name, on: :collection
  end
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
end
