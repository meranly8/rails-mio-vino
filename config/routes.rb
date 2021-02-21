Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/user/:id', to: 'users#show', as: '/user'
end
