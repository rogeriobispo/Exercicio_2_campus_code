class Recipe < ApplicationRecord
  belongs_to :cuisine
  has_one :recipe
end
