class CreateLevels < ActiveRecord::Migration[6.1]
  def change
    create_table :levels do |t|
      t.string :title, limit: 30

      t.timestamps
    end
    add_index :levels, :title, unique: true
  end
end
