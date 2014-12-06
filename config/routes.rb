Rails.application.routes.draw do

  root to: 'welcome#index'

  resources :posts,   only: [:show, :edit, :destroy, :create, :update]
  resources :versions,only: [:edit, :update ]

  devise_for :users, controllers: { registrations: "users/registrations" }

end
