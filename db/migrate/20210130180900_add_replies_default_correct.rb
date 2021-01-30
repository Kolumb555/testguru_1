class AddRepliesDefaultCorrect < ActiveRecord::Migration[6.0]
  def change
    add_column :replies, :correct, :boolean, :default => 0
  end
end
