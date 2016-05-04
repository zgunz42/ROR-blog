class Stack < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  belongs_to :user
  belongs_to :missions, polymorphic: true
end
