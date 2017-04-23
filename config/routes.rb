Rails.application.routes.draw do
  get 'static/dashboard'

  get 'static/setting'

  get 'static/update'

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  
  resources :participants
  # resources :answers
  resources :questions
  resources :users

  get '/signin', to: 'session#new', as: 'signin'
  post '/signin', to: 'session#create'
  delete '/signout', to: 'session#destroy', as: 'signout'

  get '/setting', to: 'static#setting', as: 'setting'

  root 'static#dashboard'
 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
