class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, :foreign_key => :author_id
  has_many :projects, :foreign_key => :author_id
  has_one :profile, :foreign_key => :user_id
end
