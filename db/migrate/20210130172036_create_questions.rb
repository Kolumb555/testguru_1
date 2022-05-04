class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :body, null: false
      t.references :test, index: true, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
