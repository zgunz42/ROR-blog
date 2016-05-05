class User < ActiveRecord::Base
  rolify
  validates :username, uniqueness: true, presence: true  # everysingle user has deferent email
  # Only allow letter, number, underscore and punctuation.
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, :foreign_key => :author_id
  has_many :projects, :foreign_key => :author_id
  has_many :missions, through: :projects
  has_many :hearts, dependent: :destroy
  has_one :profile, :foreign_key => :user_id
  serialize :preferences

  def heart!(post)
    self.hearts.create!(post_id: post.id)
  end
  def unheart!(post)
    heart = self.hearts.find_by_post_id(post.id)
    heart.destroy
  end
  def heart?(post)
    self.hearts.find_by_post_id(post.id)
  end
end
