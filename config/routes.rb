Chathip::Application.routes.draw do
  root to: "channels#index", constraints: User
  root to: "sessions#new", constraints: lambda { |request| !User.matches?(request) }

  resources :channels, only: [:index, :show, :create]

  match '/auth/:provider/callback' => 'sessions#create'

  match '/signin' => 'sessions#new', :as => :signin

  match '/signout' => 'sessions#destroy', :as => :signout

  match '/auth/failure' => 'sessions#failure'
end
