Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/matches/pull_from_external_API', to: 'scoreboards#get_or_update_api'
  
      resources :matches
      resources :scores
      resources :scoreboards
      resources :users
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
