class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.integer :user_id, null: false
      t.integer :question_id, null: false
      t.string :statement, null: false
      t.boolean :is_correct, null: false, default: false

      t.timestamps
    end
  end
end
