Rails.application.routes.draw do

  root to: 'welcome#index'

  resources :posts,   only: [:show, :edit, :destroy, :create, :update] do
    resources :comments, only:[:create]
  end
  resources :comments, only: [:destroy]
  resources :versions,only: [:edit, :update ]
  resources :attachments, only: [:index, :create]

  devise_for :users, controllers: { registrations: "users/registrations" }

end
