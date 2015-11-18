class CreatePrompts < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
      t.integer :user_id
      t.string :prompt_text
      t.string :prompt_placeholder_text
      t.string :prompt_type
      t.boolean :active

      t.timestamps null: false
    end
  end
end
