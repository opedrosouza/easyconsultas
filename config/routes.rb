Rails.application.routes.draw do
  devise_for :users
  
  devise_scope :user do
    unauthenticated :user do
      root 'home#index', as: :unauthenticated_root
    end
    authenticated do
      root 'dashboard#index', as: :authenticated_root
    end
  end

  resources :doctors
  resources :patients
  resources :appointments
  resources :dashboard, only: [:index] do
    collection do
      get :search
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
