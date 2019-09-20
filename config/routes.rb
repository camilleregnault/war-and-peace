Rails.application.routes.draw do

  get 'fights/index'
  get 'fights/show'
  get 'welcome/index'
  
  resources :candidates

  root 'welcome#index'
end
