class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def self.up
    create_table :feedbacks do |t|
      t.string :subject
      t.string :comment
      t.references :user, foreign_key: true
      t.timestamps
    end
  end

  def self.down
    drop_table :feedbacks
  end
end
