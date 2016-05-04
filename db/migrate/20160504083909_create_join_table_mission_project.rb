class CreateJoinTableMissionProject < ActiveRecord::Migration
  def change
    create_join_table :missions, :projects, index: false do |t|
      t.index [:mission_id, :project_id]
      t.index [:project_id, :mission_id]
    end
  end
end
