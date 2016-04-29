class Profile < ActiveRecord::Base
  belongs_to :user, :foreign_key => :user_id


  def self.gender_txt
    ["Not Telling", "Male", "Female"][gender - 1]
  end
end
