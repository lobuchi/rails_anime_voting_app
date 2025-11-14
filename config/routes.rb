Rails.application.routes.draw do
  get "rankings/index"
  get "my_lists/index"
  get "users/show"
  resource :session
  resources :passwords, param: :token
  resources :animes do
      resource :comments, only: [:create]
      resource :like, only: [:create, :destroy]
      resource :watchlist, only: [:update, :destroy]
      resource :scoring, only: [:update, :destroy]
  end
  resources :users, only: [:show,:edit,:update]
  get 'my_list',to: 'my_lists#index', as: :my_list
  get 'top_anime', to: 'rankings#index', as: :top_anime
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "animes#index"
end
