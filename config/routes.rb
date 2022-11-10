Rails.application.routes.draw do
  get 'foods/index'
  resources :foods, only:[:index,:new,:create,:destroy]
  get 'users/index'
  get 'users/show'
  resources :recipes, except:[:update]
  resources :recipe_foods, except:[:update]
  devise_for :users
  devise_scope :user do
   get 'logout', to: 'devise/sessions#destroy' 
  end
  root "recipes#public"
  resources :users do
    resources :recipes do
      resources :recipe_foods, only: [:new, :create, :destroy, :update, :edit]
    end
  end
end
