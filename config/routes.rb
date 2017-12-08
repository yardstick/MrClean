Rails.application.routes.draw do

  devise_for :users
  resources :offices do
    resources :employees
    resources :assignments
    resources :weeks
    resources :assignment_swap, only:[:index, :create]
  end

  root to: 'offices#index'
end
