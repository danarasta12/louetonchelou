class AddColumnsToTalents < ActiveRecord::Migration[7.1]
  def change
    add_column :talents, :pseudo, :string
    add_column :talents, :working_area, :string
    add_column :talents, :talent_type, :string
    add_column :talents, :price, :float
    add_column :talents, :performance_duration, :string
    add_column :talents, :medias, :string
    add_column :talents, :description, :text
    add_reference :talents, :user, null: false, foreign_key: true
  end
end
