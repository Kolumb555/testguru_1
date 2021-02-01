class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.text :body, null: false
      t.references :test, index: true
      t.references :question, index: true
      t.boolean :correct, default: 'false'

      t.timestamps
    end
  end
end
