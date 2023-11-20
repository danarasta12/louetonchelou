class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.string :price
      t.references :user, null: false, foreign_key: true
      t.references :talent, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.text :address

      t.timestamps
    end
  end
end
