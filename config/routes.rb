Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      scope module: :auth do
        post '/signup', to: 'registrations#signup'
        
        post '/login', to: 'sessions#login'
        delete '/logout', to: 'sessions#logout'
        get '/logged_in', to: 'sessions#logged_in?'
      end

      resources :lessons
      
      resources :myclasses, only: [:index]

      scope '/myclasses' do
        post 'lessons/:lesson_id', to: 'myclasses#create'
      end

      get 'time_table_lessons', to: 'lessons#time_table_lessons'
    end
  end
end
