class AddFavoriteColorsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :favorite_colors, :string, array: true, default: []
  end
end
