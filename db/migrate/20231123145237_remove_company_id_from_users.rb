class RemoveCompanyIdFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :company_id
  end
end
