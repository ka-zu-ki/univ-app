Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      
      resources :lessons do
        resources :myclasses
      end

      get 'time_table_lessons', to: 'lessons#time_table_lessons'
    end
  end
end
