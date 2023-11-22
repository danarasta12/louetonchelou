class RemoveMedias < ActiveRecord::Migration[7.1]
  def change
    remove_column :talents, :medias
  end
end
