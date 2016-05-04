class Answer < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :stack
end
