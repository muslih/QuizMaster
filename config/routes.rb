Rails.application.routes.draw do
  get 'static/dashboard'

  get 'static/setting'

  get 'static/update'

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  
  resources :participants
  put '/submit' => 'participants#submit', as: :submit_exam

  resources :questions
  resources :users
  resources :exams, except: [:destroy]

  get '/signin', to: 'session#new', as: 'signin'
  post '/signin', to: 'session#create'
  delete '/signout', to: 'session#destroy', as: 'signout'

  root 'static#dashboard'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
