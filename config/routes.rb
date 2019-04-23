Rails.application.routes.draw do

  root to: 'homes#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users


  resources :posts

  get '*path', controller: 'application', action: 'render_404'

end
