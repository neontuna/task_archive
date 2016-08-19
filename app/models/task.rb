class Task < ActiveRecord::Base
  belongs_to :customer
  belongs_to :contact
  has_many :workrecords

  default_scope { order('entrydate DESC') } 
end