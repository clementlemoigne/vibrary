Rails.application.routes.draw do
  # get 'reactions/create'
  # get 'reactions/destroy'
  # get 'profiles/show'
  # get 'profiles/edit'
  # get 'profiles/update'
  devise_for :users

  unauthenticated :user do
    root to: "pages#landing", as: "landing"
  end

  # authenticated :user do
  root to: "pages#home", as: "home"
  # end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :stories, only: [:index, :show] do
    resources :favorites, only: [:create]
    resources :reactions, only: [:create]
    resources :readings, only: [:create]
  end
  resources :favorites, only: [:destroy]
  resources :reactions, only: [:destroy]

  resources :authors do
    resources :favorite_authors, only: [:create]
  end
  resources :favorite_authors, only: [:destroy]

  resource :dashboard, only: [:show]
  resource :profile, only: [:show, :edit, :update]

  get "test", to: "pages#buttplug"
end
