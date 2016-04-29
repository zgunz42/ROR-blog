class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.integer :gender, null: false, default: 1
      t.references :user
      t.string :fb_link
      t.string :twitter_link
      t.string :github_link

      t.timestamps null: false
    end
  end
end
