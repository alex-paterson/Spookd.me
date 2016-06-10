Rails.application.routes.draw do
  root 'static_pages#home'
  resources :pictures
  get '/popular_tags', to: 'tags#index'
  get '/tags', to: 'tags#index'
  get '/tags/:id', to: 'tags#show'
  resources :users, only: :destroy
  resources :stories, except: :index
  resources :articles, except: :index
  resources :tags, only: :destroy

  get '/home', to: 'static_pages#home', as: :home
  get '/account', to: 'static_pages#account', as: :account
  get '/claim', to: 'static_pages#claim', as: :claim
  get '/search', to: 'static_pages#search', as: :search

  get 'auth/facebook/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

end
