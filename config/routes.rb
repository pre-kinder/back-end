Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :holidays, only: [:index]
      resources :forecast, only: [:index]

      resources :parents

      resources :classrooms, only: [:create, :show] do
        # resources :events, only: [:index]
        # resources :children, only: [:index]
        # resources :teachers, only: [:index]
      end

      get '/parents/:id/children', to: 'children#index'
    end
  end
end
