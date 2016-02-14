Rails.application.routes.draw do
  root 'pages#home'
  
  resources :liquid_charts, only: %i(index)
  resources :pie_charts, only: %i(index)
  resources :line_charts, only: %i(index)
  resources :assay_charts, only: %i(index)
  resources :posts, only: %i(index show)
  resources :comments, only: %i(new create)
  resources :subscribes, only: %i(new create)
  
  namespace :dashboard do
    root action: :home
    resources :managers
    resources :assay_charts
    resources :pie_charts
    resources :line_charts
    resources :liquid_charts
    resources :posts do
      member do
        post '/switch_to_enable', to: "posts#switch_to_enable"
        post '/switch_to_disable', to: "posts#switch_to_disable"
      end
    end
    resources :comments, only: [:index]
    resources :subscribes, only: [:index]
  end
end