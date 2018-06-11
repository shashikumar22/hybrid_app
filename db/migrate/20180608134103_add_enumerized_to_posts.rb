class AddEnumerizedToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :enumerized, :string
  end
end
