Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
  }
  namespace :admins do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :foods, only: [:index, :show]
  end

  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations',
    omniauth_callbacks: 'customers/omniauth_callbacks',
  }
  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'customers/sessions#new_guest'
  end
  
  root 'customers/homes#top'
  get 'about' => 'customers/homes#about'
  get "search" => "customers/customers#search"
  resources :tags do
    get 'search', to: 'customers/customers#search'
  end
  namespace :customers do
    resources :foods, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
  end

  scope module: :customers do
    resources :customers, only: [:show, :edit, :update] do
      member do
        get 'withdrawal'
        patch 'withdrawal' => 'customers#change', as: "change"
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
