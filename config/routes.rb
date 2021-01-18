Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #welcome/home route
  root 'sessions#home'

  #signup route
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  #login route
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  #logout route
  delete '/logout', to: 'sessions#destroy'

  #
  resources :users do
    resources :groups, only: [:new, :create, :index]
  end

  resources :users, only: [:new, :create, :index, :show] #eventually delete user#show once we replace all necessary links to users/id/groups
  resources :groups, only: [:edit, :show, :destroy]
  resources :categories, only: [:index, :show]

  resources :cards #might be able to delete, test this after the group form is complete and working
end
