class CreateGists < ActiveRecord::Migration[6.1]
  def change
    create_table :gists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.string :git_hash, null: false
      t.string :url, null: false

      t.timestamps
    end
  end
end
