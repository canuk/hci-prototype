class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.integer :user_id
      t.integer :prompt_id
      t.string :choice_text
      t.integer :order

      t.timestamps null: false
    end
  end
end
