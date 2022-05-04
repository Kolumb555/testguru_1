class CreateGists < ActiveRecord::Migration[6.0]
  def change
    create_table :gists do |t|
      t.references :question, foreign_key: {on_delete: :cascade}
      t.string :gist_url
      t.references :user, foreign_key: true
    end
  end
end
