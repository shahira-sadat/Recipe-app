Rails.application.routes.draw do
  get 'foods/index'
  resources :foods, only:[:index,:new,:create,:destroy]
  resources :shopping_list, only:[:index]
  get 'users/index'
  get 'users/show'
  resources :recipes, except:[:update]
  resources :recipe_foods, except:[:update]
  devise_for :users
  devise_scope :user do
   get 'logout', to: 'devise/sessions#destroy' 
  end
  root "recipes#public"
  resources :inventories, only: [:index, :show, :new, :create, :destroy]
  resources :users do
    resources :recipes do
      resources :recipe_foods, only: [:new, :create, :destroy, :update, :edit]
    end
  end
end
