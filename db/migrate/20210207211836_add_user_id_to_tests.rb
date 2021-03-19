class AddUserIdToTests < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :author, index: true, foreign_key: { to_table: :users }
  end
end
