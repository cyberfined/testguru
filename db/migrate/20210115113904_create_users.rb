class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :login, limit: 30
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :login, unique: true
  end
end