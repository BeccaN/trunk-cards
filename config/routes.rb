Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #welcome/home route
  root 'sessions#home'

  match '/auth/github/callback', to: 'sessions#github', via: [:get, :post]
  
  #signup route
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  #login route
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  #logout route
  delete '/logout', to: 'sessions#destroy'
  #create doesnt have to be nested
  resources :users do
    resources :groups, only: [:new, :index]
  end

  resources :users, only: [:new, :create, :index]
  resources :groups
  resources :categories, only: [:index, :show]

  get '/groups/:id/cards/front/index', to: 'cards#front', via: [:get], as: 'cards_front'
  get '/groups/:id/cards/back/index', to: 'cards#back', via: [:get], as: 'cards_back'
  resources :cards, only: [:index]
end
