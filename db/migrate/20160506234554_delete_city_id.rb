class DeleteCityId < ActiveRecord::Migration
  def change
    remove_column :posts, :city_id
  end
end
