class CreateBadgeUsersJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :badges, :users
  end
end
