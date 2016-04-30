class Heart < ActiveRecord::Base
  validates :user_id, uniqueness: {scope: :post_id}

  belongs_to :posta
  belongs_to :user
end
