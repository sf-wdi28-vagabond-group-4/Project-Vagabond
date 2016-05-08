class AddHeaderPictureToCities < ActiveRecord::Migration
  def change
    add_column :cities, :header_picture, :string
  end
end
