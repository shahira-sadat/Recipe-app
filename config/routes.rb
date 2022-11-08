Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'logout', to: 'devise/sessions#destroy'
    get 'confirmation_email', to: 'devise/confirmations#show'
  end
  root 'foods#index'
  get 'foods/index'
  resources :foods, except: :update
  resources :users do
    resources :recipe_foods, except: :update
    resources :recipes, except: :update
  end
end
