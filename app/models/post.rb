class Post < ActiveRecord::Base
  resourcify
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :author, :class_name => "User", :foreign_key => :author_id

  def image
    '1.png'
  end
  def avatar
    'avatar.jpg'
  end
  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
