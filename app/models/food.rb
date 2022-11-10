class Food < ApplicationRecord
  has_many :recipe_foods, dependent: :destroy_async
end
