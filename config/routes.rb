Rails.application.routes.draw do

  resources :employee
  resources :assignment
  resources :week

  post '/employee/new',    to: 'employee#create'
  post '/assignment/new',  to: 'assignment#create'
  root to: 'assignment#index'


end
