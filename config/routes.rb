Rails.application.routes.draw do

  resources :employees
  resources :assignments
  resources :weeks

  root to: 'assignments#index'


end
