class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :content
      t.boolean :done
      t.references :tasker, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
