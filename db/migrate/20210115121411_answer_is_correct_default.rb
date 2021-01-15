class AnswerIsCorrectDefault < ActiveRecord::Migration[6.1]
  def up
    change_column_default :answers, :is_correct, false
  end

  def down
    change_column_default :answers, :is_correct, nil
  end
end
