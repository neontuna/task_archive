class Technician < ActiveRecord::Base
  has_many :workrecords
end