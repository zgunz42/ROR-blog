class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :location
      t.references :suppliers, polymorphic: true, index: true, required: true
      t.decimal :price, precision: 5, scale: 2
      t.decimal :rent_price, precision: 5, scale: 2
      t.integer :stock, default: 1  # how it can without see it

      t.timestamps null: false
    end
  end
end
