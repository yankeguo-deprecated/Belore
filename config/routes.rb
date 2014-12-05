Rails.application.routes.draw do

  root to: 'welcome#index'

  resources :posts
  resources :versions

  devise_for :users, controllers: { registrations: "users/registrations" }

end
