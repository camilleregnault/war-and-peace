Rails.application.routes.draw do

  get 'welcome/index'
  
  resources :candidates

  root 'welcome#index'
end
