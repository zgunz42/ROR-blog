class CreateStacks < ActiveRecord::Migration
  def change
    create_table :stacks do |t|
      # - CONTENT	-> TEXT
      # - ANSWERS	-> ANSWER
      t.text :content
      t.references :stucker, polymorphic: true, index: true, required: true
      t.references :answers

      t.timestamps null: false
    end
  end
end
