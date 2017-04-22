Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  
  resources :participants
  # resources :answers
  resources :questions
  resources :users

  get '/signin', to: 'session#new', as: 'signin'
  post '/signin', to: 'session#create'
  delete '/signout', to: 'session#destroy', as: 'logout'

  

  get 'session/create'
  root 'session#new'
 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
