class Task < ActiveRecord::Base
  belongs_to :mission, dependent: :destroy
end
