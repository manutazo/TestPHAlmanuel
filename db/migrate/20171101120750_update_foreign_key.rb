class UpdateForeignKey < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :albums, :users
    add_foreign_key :albums, :users, on_delete: :cascade
  end
end
