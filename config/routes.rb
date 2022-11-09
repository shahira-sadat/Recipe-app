Rails.application.routes.draw do
  get 'foods/index'
  resources :foods, only:[:index,:new,:create,:destroy]
  get 'users/index'
  get 'users/show'
  devise_for :users
  devise_scope :user do
   get 'logout', to: 'devise/sessions#destroy' 
  end
  root "users#index"
end
