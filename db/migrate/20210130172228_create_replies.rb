class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.primary_key :id
      t.text :body
      t.integer :test_id

      t.timestamps
    end
  end
end
