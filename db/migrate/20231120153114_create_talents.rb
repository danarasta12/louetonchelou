class CreateTalents < ActiveRecord::Migration[7.1]
  def change
    create_table :talents do |t|

      t.timestamps
    end
  end
end
