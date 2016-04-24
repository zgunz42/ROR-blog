class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  def image
    '1.png'
  end
  def avatar
    'avatar.jpg'
  end
end
