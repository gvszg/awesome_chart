Rails.application.routes.draw do
  root 'biocharts#index'
  resources :biocharts, only: [:index]
  namespace :dashboard do    
    resources :manager
  end
end