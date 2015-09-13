class AddImgToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :img, :string
  end
end
