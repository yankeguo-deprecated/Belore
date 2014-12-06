Rails.application.routes.draw do

  root to: 'welcome#index'

  resources :posts,   only: [:show, :edit, :destroy, :create, :update]
  resources :versions,only: [:edit, :update ]
  resources :attachments, only: [:index, :create]

  devise_for :users, controllers: { registrations: "users/registrations" }

end
