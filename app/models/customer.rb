class Customer < ActiveRecord::Base
  include Searchable
  searchable_fields :custname, :city, :region

  has_many :contacts
  has_one :country
  has_many :tasks

  default_scope { order('LOWER(custname) ASC') } 
end