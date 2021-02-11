class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.references :current_question, null: false, foreign_key: { to_table: :questions }
      t.integer :points, null: false, default: 0

      t.timestamps
    end
  end
end
