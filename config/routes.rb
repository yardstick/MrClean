Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :employees
  resources :assignments
  resources :weeks

  root to: 'assignments#index'


end
