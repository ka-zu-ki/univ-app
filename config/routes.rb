Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'user', controllers: {
        registrations: 'api/v1/auth/registrations'
      } 
      
      resources :lessons
      get 'time_table_lessons', to: 'lessons#time_table_lessons'
    end
  end
end
