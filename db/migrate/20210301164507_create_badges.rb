class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, limit: 30, null: false, index: { unique: true }
      t.string :image_url, null: false
      t.references :rule, null: false, foreign_key: true
      t.integer :rule_argument

      t.timestamps
    end
  end
end
