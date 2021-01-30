class AddRepliesBodyTestIdNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:replies, :body, false)
    change_column_null(:replies, :test_id, false)
  end
end
