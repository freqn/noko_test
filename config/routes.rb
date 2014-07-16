Rails.application.routes.draw do
  devise_for :users
  root 'search#index'
  resources :tweets, only: [:index]
  get 'about' => 'pages#about'


end
