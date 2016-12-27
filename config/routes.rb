Rails.application.routes.draw do
  resources :child_fatalities, only: [:index, :show], path: 'facts-figures'

  root 'child_fatalities#index'
end
