class Contact < ActiveRecord::Base
  include Searchable
  searchable_fields :firstname, :lastname

  belongs_to :customer
  belongs_to :country
  has_many :tasks

  default_scope { order('LOWER(lastname) ASC') } 
end