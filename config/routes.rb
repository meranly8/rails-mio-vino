Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#home'

  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  get '/user/:id', to: 'users#show', as: '/user'

  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/:provider/callback', to: 'sessions#omniauth'

  resources :wines
  resources :wineries, only: [:index, :show, :new, :create]
end
