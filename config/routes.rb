Rails.application.routes.draw do
  resources :users
  resources :foods
  # this root will be used later on
  # root "users#index"
  resources :users do
    resources :recipe_foods, except: :update
    resources :recipes, except: :update
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
