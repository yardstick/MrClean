Rails.application.routes.draw do

  resources :employee
  resources :assignment
  resources :week

  post '/employee/new', to: 'employee#create'
  root to: 'assignment#index'


end
