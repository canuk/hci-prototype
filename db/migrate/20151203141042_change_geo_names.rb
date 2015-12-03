class ChangeGeoNames < ActiveRecord::Migration
  def change
    add_column :answers, :administrative_area_level_1, :string
    add_column :answers, :country_short, :string
    add_column :answers, :lat, :float
    add_column :answers, :lng, :float
  end
end