Rails.application.routes.draw do

  resources :employee
  resources :assignment
  resources :week

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get  '/schedule', to: 'assignment#index'
  get  '/employee', to: 'employee#index'
  post '/employee/new', to: 'employee#create'
  get '/', to: 'assignment#index'


end
