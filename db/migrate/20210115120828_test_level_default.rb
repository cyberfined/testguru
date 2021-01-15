class TestLevelDefault < ActiveRecord::Migration[6.1]
  def up
    change_column_default :tests, :level_id, 1
  end

  def down
    change_column_default :tests, :level_id, nil
  end
end
