class AddLatitudeAndLongitudeToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :country, :string
    add_column :answers, :country_code, :string
    add_column :answers, :latitude, :float
    add_column :answers, :longitude, :float
  end
end
