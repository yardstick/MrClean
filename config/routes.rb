Rails.application.routes.draw do

  devise_for :users
  resources :offices do
    resources :employees
    resources :assignments
    resources :weeks
    resources :assignment_swap, only:[:index, :create]
  end

  #get '/offices/:id/swap', to: 'assignments#swap'
  #post '/offices/:id/swap', to: 'assignments#update_swap'
  root to: 'offices#index'


end
