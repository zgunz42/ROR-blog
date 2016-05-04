class Mission < ActiveRecord::Base
  has_and_belongs_to_many :projects
  has_many :stacks, as: :stucker, foreign_key: 'stucker_id'
  has_many :tasks, as: :tasker, foreign_key: 'tasker_id'
  has_and_belongs_to_many :workers,
                          class_name: 'User',
                          :join_table => 'workers',
                          :foreign_key => 'user_id',
                          :association_foreign_key => 'mission_id'# this an user who working on this mission
end
