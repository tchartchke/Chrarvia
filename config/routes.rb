Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/auth/:provider/callback' => 'sessions#create'

  resource :users, only:[:new]
end
