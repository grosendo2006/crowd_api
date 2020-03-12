Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :movies do
        resources :people
      end
      resources :people do
        resources :movies_as_actor
        resources :movies_as_director
        resources :movies_as_producer
      end
    end
  end
end
