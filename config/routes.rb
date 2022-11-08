Rails.application.routes.draw do
  get 'foods/index'
  resources :foods, except: :update
  resources :users do
    resources :recipe_foods, except: :update
    resources :recipes, except: :update
  end
end
