class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.references :question, null: false, foreign_key: { on_delete: :cascade }
      t.string :statement, null: false
      t.boolean :correct, null: false, default: false

      t.timestamps
    end
  end
end
