class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :prompt_id
      t.integer :choice_id
      t.string :answer_text

      t.timestamps null: false
    end
  end
end
