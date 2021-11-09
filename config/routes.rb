Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :holidays, only: [:index]
      resources :forecast, only: [:index]
      resources :events
      resources :parents do
        get '/children', to: 'parents#children'
      end


      resources :classrooms, only: [:create, :show] do
        resources :children
        resources :teachers
        resources :events
      end
    end
  end
end
