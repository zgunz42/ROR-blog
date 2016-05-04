class CreateJoinTableUserMission < ActiveRecord::Migration
  def change
    create_join_table :users, :missions, table_name: :workers, index: false do |t|
      t.index [:user_id, :mission_id]
      t.index [:mission_id, :user_id]
    end
  end
end
