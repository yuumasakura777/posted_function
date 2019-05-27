Rails.application.routes.draw do


  get 'likes/create'
  get 'likes/destroy'
  get 'imgposts/new'
  root to: 'homes#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :imgposts ,only:[:new, :index, :create, :destroy]
  resources :users
  resources :posts

  get '*path', controller: 'application', action: 'render_404'

end
