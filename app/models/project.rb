class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :missions
  accepts_nested_attributes_for :missions,
                                allow_destroy: true,
                                reject_if: lambda{|attributes|attributes['title'].blank?}

  def image
    '1.png'
  end
  def avatar
    'avatar.jpg'
  end
  def content
    description
  end
  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
