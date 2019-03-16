Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :teams, only: :show

  post '/api', controller: 'api/events', action: :create
  post '/api/register', controller: 'api/users', action: :create
  post '/api/unregister', controller: 'api/users', action: :destroy

  post '/api/beans/purchase', controller: 'api/beans', action: :purchase
  post '/api/beans/low', controller: 'api/beans', action: :low

  post '/api/teams/url', controller: 'api/teams', action: :url
end

