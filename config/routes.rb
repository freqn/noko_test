Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :tweets
  get 'about' => 'pages#about'
  get 'saved' =>  'tweets#saved_tweets'
end
