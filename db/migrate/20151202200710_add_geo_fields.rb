class AddGeoFields < ActiveRecord::Migration
  def change
    add_column :prompts, :results_text, :string
    add_column :prompts, :people_around_text, :string
  end
end
