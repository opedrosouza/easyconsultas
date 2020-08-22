Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users
  devise_scope :user do
    unauthenticated :user do
      root 'home#index', as: :unauthenticated_root
    end
    authenticated do
      root 'dashboard#index', as: :authenticated_root
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
