class AddAuthorToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :author, index: true, foreign_key: false
    add_foreign_key :posts, :users, column: :author_id
  end
end
