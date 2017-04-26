Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  
  namespace :api do 
    namespace :v1 do 
      resources :exams #, only: [:index,:edit,  :update] 
    end 
  end


  get 'static/dashboard'

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
