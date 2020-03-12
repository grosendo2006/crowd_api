Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :movies do
        scope module: :movies do
          resources :people, only: [:index]
        end
      end
      resources :people do
        scope module: :people do
          resources :movies, only: [:index]
        end
      end
      resources :rols
      resources :participations
    end
  end
end
