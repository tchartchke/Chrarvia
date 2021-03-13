Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # TODO: set root
  root :to => 'application#welcome'

  get '/auth/:provider/callback' => 'sessions#create'

  resources :users, only: [:index, :new, :show]

  resources :quizzes, only: [:index, :new, :create, :show, :edit, :update]
  

  get '/home' => 'users#home'
  get '/signin' => 'users#new'

end
