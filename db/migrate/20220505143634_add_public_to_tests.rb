class AddPublicToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :public, :boolean, default: false
  end
end
