Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/home" => "essentials#index"
  root "essentials#index"
  resources :users
  resources :symptoms
  namespace :admin do
    resources :users do
      get :activate
      member do
        get :doctors
      end
    end
  end
end
