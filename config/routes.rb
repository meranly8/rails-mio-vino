Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#home'

  get '/signup', to: 'sessions#new'
  post '/signup', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
