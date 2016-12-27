Rails.application.routes.draw do
  resources :child_fatalities, only: [:index, :show]

  root 'child_fatalities#index'
end
