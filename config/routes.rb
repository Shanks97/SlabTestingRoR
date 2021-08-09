Rails.application.routes.draw do

  resources :slab_project_tasks
  patch 'slab_project_tasks/complete/:id', to: 'slab_project_tasks#complete'
  resources :slab_projects 
  patch 'slab_projects/complete/:id', to: 'slab_projects#complete'
  post 'auth/login'
  post 'auth/register'
  resources :projects
  get 'password/reset'
  post 'password/reset'
  get 'password/forgot'
  post 'password/forgot'
  resources :users
  get 'users/new'
  get 'users/create'
  get 'home/index'
  get 'home/login'
  get 'home/xd'
  post 'home/login'
  post 'home/index'
  
  root 'home#index'
  resources :crypto_prices
  resources :cryptocurrencies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
