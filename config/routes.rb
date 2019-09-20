Rails.application.routes.draw do

  get 'welcome/index'
  
  resources :candidates
  resources :fights, only:[:index, :show, :new, :create]
  root 'welcome#index'
end
