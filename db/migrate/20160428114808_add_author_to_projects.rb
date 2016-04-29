class AddAuthorToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :author, index: true
  end
end
