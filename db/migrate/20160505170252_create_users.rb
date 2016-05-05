class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :current_city
      t.string :profile_pic

      t.timestamps null: false
    end
  end
end
