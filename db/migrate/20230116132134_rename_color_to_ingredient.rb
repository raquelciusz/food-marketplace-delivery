class RenameColorToIngredient < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :color, :ingredient
  end
end
