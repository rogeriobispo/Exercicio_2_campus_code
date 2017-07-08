class Cuisine < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :recipes
end
