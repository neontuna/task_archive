class Contact < ActiveRecord::Base
  belongs_to :customer
  has_one :country
  has_many :tasks
end