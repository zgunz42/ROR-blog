class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :stack, index: true
      t.references :sender, index: true, foreign_key: true
      t.text :answer, null: false
      t.boolean :work, default: false
      t.timestamps null: false
    end
  end
end
