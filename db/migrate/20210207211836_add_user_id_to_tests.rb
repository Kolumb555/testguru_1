class AddUserIdToTests < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :user, index: true, foreign_key: true
  end
end
