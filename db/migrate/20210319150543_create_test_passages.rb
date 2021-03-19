class CreateTestPassages < ActiveRecord::Migration[6.0]
  def up
    create_table :test_passages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.integer :correct_questions, default: 0
      t.references :current_questions, null: false, foreign_key: true

      t.timestamps
    end
  end
end
