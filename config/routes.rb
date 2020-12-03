Rails.application.routes.draw do

  devise_for :customers, controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations'
}
  root 'customers/homes#top'
  get 'about' => 'customers/items#about'
  namespace :customers do
    resources :foods,only: [:index, :show, :new, :create] do
      resources :comments, only: [:create]
      resources :favorites, only: [:create, :destroy]
    end

    resources :customers,only: [:show, :edit, :update] do
	    member do
        get 'withdrawal'
        patch 'withdrawal' => 'customers#change', as: "change"
      end
  	end
  end

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  get 'top'=>'customers#top'
  namespace :admins do
    resources :customers,only: [:index, :show, :edit, :update]
    resources :foods,only: [:index, :show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
