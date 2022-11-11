class Food < ApplicationRecord
  has_many :recipe_foods, inverse_of: 'food', foreign_key: 'food_id', dependent: :destroy
end
