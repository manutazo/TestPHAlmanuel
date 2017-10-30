class AddPublicToAlbum < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :public, :boolean
  end
end
