class Customer < ActiveRecord::Base
  has_many :contacts
  has_one :country
  has_many :tasks

  default_scope { order('LOWER(custname) ASC') } 
end