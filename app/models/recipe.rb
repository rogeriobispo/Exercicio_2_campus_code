class Recipe < ApplicationRecord
  belongs_to :cuisine
  validates_presence_of :title, :recipe_type, :difficulty, :cook_time
  validates_presence_of :ingredients, :method

end
