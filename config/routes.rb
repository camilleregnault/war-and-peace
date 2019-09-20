Rails.application.routes.draw do

  get 'welcome/index'

  resources :candidates
  resources :fights, only: %i[index show create]
  root 'welcome#index'
end
