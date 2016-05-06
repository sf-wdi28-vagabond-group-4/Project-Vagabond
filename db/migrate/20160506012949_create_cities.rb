class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :city_name
      t.string :state
      t.string :country
      t.string :city_picture

      t.timestamps null: false
    end
  end
end
