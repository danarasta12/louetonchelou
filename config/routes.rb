Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  get 'reviews/create'
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/destroy'
  devise_for :users
  root to: "talents#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :talents, only: %i[index show create edit update destroy]
  resources :users, only: %i[edit update]

  # Defines the root path route ("/")
  #root "pages#home"
end
