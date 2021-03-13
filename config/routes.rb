Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/auth/:provider/callback' => 'sessions#create'

  resources :users, only: [:index, :new, :show]
  get '/home' => 'users#home'
end
