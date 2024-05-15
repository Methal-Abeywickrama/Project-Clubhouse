class RemoveNameFromAuthors < ActiveRecord::Migration[7.1]
  def change
    remove_column :authors, :name, :string
  end
end
