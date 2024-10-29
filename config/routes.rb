# config/routes.rb

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_for :users, controllers: {
        registrations: 'api/v1/registrations',
        sessions: 'api/v1/sessions'
      }, path: '', path_names: {
        sign_in: 'sign_in',
        sign_out: 'sign_out',
        registration: 'sign_up'
      }
    end
  end




  resources :users, only: [:index, :show]
end
