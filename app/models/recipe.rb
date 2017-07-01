class Recipe < ApplicationRecord
  belongs_to :cuisine
  belongs_to :recipe_type
  validates :title, :recipe_type_id, :difficulty, :cook_time, presence: true
  validates :ingredients, :method, presence: true
  scope :search, -> (search) {where('title like ?',search)}
end
