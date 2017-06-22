class Changeingredientscollumn < ActiveRecord::Migration[5.1]
  def change
  change_table :recipes do |t|
    t.change :ingredients, :string
   end
  end
end
