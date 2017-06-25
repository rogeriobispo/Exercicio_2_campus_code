class Recipe < ApplicationRecord
  belongs_to :cuisine
  belongs_to :recipe_type
  validates_presence_of :title, :recipe_type_id, :difficulty, :cook_time
  validates_presence_of :ingredients, :method

end
