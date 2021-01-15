class MakeColumnsNonNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :login, false
    change_column_null :users, :password_digest, false

    change_column_null :categories, :title, false

    change_column_null :levels, :title, false

    change_column_null :tests, :title, false

    change_column_null :questions, :statement, false

    change_column_null :answers, :statement, false
    change_column_null :answers, :is_correct, false
  end
end
