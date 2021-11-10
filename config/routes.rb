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
        resources :attendances, shallow:true
        # resources :attendances, only: [:index, :new, :create]
      end
      # resources :attendances, only: [:show, :edit, :update, :destroy]
    end
  end
end
