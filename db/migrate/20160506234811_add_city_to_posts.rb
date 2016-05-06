class AddCityToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :city, index: true, foreign_key: true
  end
end
