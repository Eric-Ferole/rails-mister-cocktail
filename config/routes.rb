Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'
  get 'cocktails/' => 'cocktails#index'
  get 'cocktails/new/' => 'cocktails#new', as: 'new'
  post 'cocktails/' => 'cocktails#create'
  get 'cocktails/:id/' => 'cocktails#show', as: 'cocktail'
  delete 'cocktails/:id/' => 'cocktails#destroy'
  get 'cocktails/:cocktail_id/doses/new/' => 'doses#new', as: 'new_dose'
  post 'cocktails/:cocktail_id/doses' => 'doses#create', as: 'cocktail_doses'
  # delete 'cocktails/:cocktail_id/doses'
end
