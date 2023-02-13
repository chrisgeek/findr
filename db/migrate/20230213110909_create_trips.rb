class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.date :start_date
      t.date :end_date
      t.references :user, null: false, foreign_key: true
      t.string :city
      t.string :country
      t.string :name
      t.string :description
      t.jsonb :weather_condition

      t.timestamps
    end
  end
end
