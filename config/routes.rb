Rails.application.routes.draw do
  root to: 'home#index'
  patch 'capture', to: 'pokemons#capture'
  patch 'damage', to: 'pokemons#damage'
  get 'pokemons/new', to: 'pokemons#new'
  post 'create', to: 'pokemons#create'
  get 'current', to: 'trainers#current'
  devise_for :trainers
  resources :trainers
end
