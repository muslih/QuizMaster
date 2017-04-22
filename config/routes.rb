Rails.application.routes.draw do
  resources :participants
  resources :answers
  resources :questions
  get '/signin', to: 'session#new', as: 'signin'
  post '/signin', to: 'session#create'

  resources :users

  get 'session/create'
  get 'session/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
