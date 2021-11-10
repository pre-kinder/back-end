Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :holidays, only: [:index]
      resources :forecast, only: [:index]
      resources :events
      resources :parents do
        get '/children', to: 'parents#children'
      end
      resources :teachers
      resources :children
      resources :events
      resources :classrooms, only: [:index, :create, :show]
    end
  end
end
