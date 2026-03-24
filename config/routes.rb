Rails.application.routes.draw do
  resources :posts
  root "home#index"
  get "home/index"

  get "up" => "rails/health#show", as: :rails_health_check
end
