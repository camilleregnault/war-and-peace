Rails.application.routes.draw do

  get 'welcome/index'
  get 'fights/history'
  
  resources :candidates
  resources :fights, only: %i[index show create]
  root 'welcome#index'
end
