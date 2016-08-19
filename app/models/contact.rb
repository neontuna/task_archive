class Contact < ActiveRecord::Base
  belongs_to :customer
  belongs_to :country
  has_many :tasks
end