class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name, limit: 30, null: false
      t.string :last_name, limit: 30, null: false
      t.string :email, limit: 30, null: false, index: { unique: true }
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
