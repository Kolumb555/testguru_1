class AddTestsDefaultLevel < ActiveRecord::Migration[6.0]
  def change
    change_column :tests, :title, :integer, :default => 0
  end
end
