class Cuisine < ApplicationRecord
  validates_presence_of :name, message: 'Você deve informar o nome da cozinha'
  has_many :recipes
end
