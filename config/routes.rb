Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  resources :pokemons
  patch 'pokemons/capture/:id', to: 'pokemons#capture', as: 'capture'
  patch 'pokemons/damage/:id', to: 'pokemons#damage', as: 'damage'
  post 'pokemons/new', to: 'pokemons#new', as: 'new'

  
end
