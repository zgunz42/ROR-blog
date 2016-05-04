class Project < ActiveRecord::Base
  # - AUTHOR 	-> USER
  # - TITLE  	-> STRING
  # - RESOURCES	-> RESOURCE[item need to complete this project]
  # - DESCRIPTION   -> TEXT
  # - WORKING	-> BOOLEAN
  # - WORKER	-> USER[user who work with this project they can working on this project]
  # - DURATION	-> DATETIME
  # - BUDGET	-> DOUBLE , EXP: 34.2
  # - MISSIONS	-> MISSION[List of mission]
  # - MAX_MISSION	-> INTEGER
  # - MIN_MISSION	-> INTEGER
  # - CONTRIBUTORS	-> USER[user who make contributtion who solve problem on mission and update mission]

  extend FriendlyId
  friendly_id :title, use: :slugged
  has_and_belongs_to_many :missions
  has_many :resources
  belongs_to :author, class_name: 'User', foreign_key: 'author_id' # you never add dude!
  has_and_belongs_to_many :contributors,
                          class_name: 'User',
                          join_table: 'contributors',
                          :foreign_key => 'user_id',
                          :association_foreign_key => 'project_id'
  # reject if title blank
  accepts_nested_attributes_for :missions,
                                allow_destroy: true,
                                reject_if: lambda{|attributes|attributes['title'].blank?}

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
