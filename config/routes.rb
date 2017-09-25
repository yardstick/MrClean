Rails.application.routes.draw do

  resources :employee
  resources :schedule

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get  '/schedule', to: 'schedule#index'
  get  '/employee', to: 'employee#index'
  post '/employee/new', to: 'employee#create'
  get '/', to: 'schedule#index'


end
