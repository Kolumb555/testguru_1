class AddIndex < ActiveRecord::Migration[6.0]
  def change
    add_index(:users, :email, name: 'email_index', unique: true)
  end
end
