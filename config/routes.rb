Rails.application.routes.draw do

  devise_for :users
  resources :offices do
    resources :employees
    resources :assignments
    resources :weeks
  end
  #resources :employees
  #resources :assignments
  #resources :weeks

  root to: 'offices#index'


end
