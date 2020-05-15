Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "essentials#index"

  root "users#index"

  resources :essentials do
    get :screening
    post :screening
    get :patient
    post :patient
  end

  resources :conversations do
    resources :messages
  end

  resources :users do
    get :doctors
    get :online_status
  end

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
