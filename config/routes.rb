Rails.application.routes.draw do
  get 'foods/index'
  resources :foods, only:[:index,:new,:create,:destroy]
  get 'users/index'
  get 'users/show'
  devise_for :users
  root "users#index"
end
