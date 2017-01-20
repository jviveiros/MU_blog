class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :biography, :text
    add_column :users, :image_link, :string
  end
end
