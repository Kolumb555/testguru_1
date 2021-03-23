class CreateTestPassages < ActiveRecord::Migration[6.0]
  def up
    create_table :test_passages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.integer :correct_questions, default: 0
      t.references :current_question, foreign_key: false

      t.timestamps
    end
  end

  def down
    drop_table :test_passages, if_exists: true
  end

end
