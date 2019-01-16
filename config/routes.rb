Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks',
    profiles: 'users/profiles'
  }
  resource :user do 
    resources :albums
  end
  resources :categories
  resources :pictures do
    resources :comments
  end

  post '/home', to: 'home#search'
  post '/pictures/:id', to: 'comments#create', as: :comments
  put '/pictures/:id', to: 'comments#update'

  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
