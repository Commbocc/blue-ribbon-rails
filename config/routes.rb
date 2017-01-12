Rails.application.routes.draw do
  resources :partners, only: [:index, :show]
  resources :child_fatalities, only: [:index, :show], path: 'facts-figures'

  root to: redirect('http://hcflgov.net/en/government/boards-and-committees/a-d/blue-ribbon-committee-for-child-safety')
end
