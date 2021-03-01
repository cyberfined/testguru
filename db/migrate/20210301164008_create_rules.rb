class CreateRules < ActiveRecord::Migration[6.1]
  def change
    create_table :rules do |t|
      t.string :title, limit: 30, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
