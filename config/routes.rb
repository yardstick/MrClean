Rails.application.routes.draw do

  devise_for :users
  resources :employees
  resources :assignments
  resources :weeks

  root to: 'assignments#index'


end
