class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, limit: 30, null: false
      t.integer :level, null: false, default: 0
      t.references :category, null: false, foreign_key: { on_delete: :cascade }
      t.references :creator, null: false, foreign_key: { to_table: :users, on_delete: :cascade }

      t.timestamps
    end
  end
end
