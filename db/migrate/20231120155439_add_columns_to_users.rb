class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :address, :text
    add_column :users, :phone, :string
    add_column :users, :description, :text
    add_column :users, :profile_picture, :string
    add_column :users, :company_id, :string
    add_column :users, :chelou?, :boolean
  end
end
