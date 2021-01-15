class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :title, limit: 30

      t.timestamps
    end
    add_index :categories, :title, unique: true
  end
end
