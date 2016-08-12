class Workrecord < ActiveRecord::Base
  belongs_to :task
  belongs_to :technician
  has_many :workentries
end