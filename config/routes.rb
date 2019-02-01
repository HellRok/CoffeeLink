Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  post '/api', controller: 'api/events', action: :create
  post '/api/register', controller: 'api/users', action: :create
  post '/api/unregister', controller: 'api/users', action: :destroy
end
