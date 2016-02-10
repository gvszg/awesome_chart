Rails.application.routes.draw do
  root 'pages#home'
  
  resources :liquid_charts, only: %i(index)
  resources :pie_charts, only: %i(index)
  resources :line_charts, only: %i(index)
  resources :assay_charts, only: %i(index)
  
  namespace :dashboard do
    root action: :home
    resources :managers
    resources :assay_charts
    resources :pie_charts
    resources :line_charts
    resources :liquid_charts
  end
end