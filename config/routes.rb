# config/routes.rb

Rails.application.routes.draw do
  namespace :api do               # Make sure this is all lowercase
    namespace :v1 do               # Make sure this is all lowercase
      devise_for :users, controllers: {
        registrations: 'api/v1/registrations',
        sessions: 'api/v1/sessions'
      }, path: '', path_names: {
        sign_in: 'sign_in',
        sign_out: 'sign_out',
        registration: 'sign_up'
      }

      # Example of a protected route
      resources :users, only: [:index, :show]
    end
  end
end
