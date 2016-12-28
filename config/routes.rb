Rails.application.routes.draw do
  resources :partners, only: [:index, :show]
  resources :child_fatalities, only: [:index, :show], path: 'facts-figures'

  root 'child_fatalities#index'
end
