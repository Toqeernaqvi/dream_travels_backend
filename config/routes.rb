Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  # Devise routes with custom controllers
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  # Route to display users in Rails app
  resources :users, only: [:index, :show]

  # You can add other routes here
end
