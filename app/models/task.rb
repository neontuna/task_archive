class Task < ActiveRecord::Base
  include Searchable
  searchable_fields :tasktitle, :description

  belongs_to :customer
  belongs_to :contact
  has_many :workrecords

  default_scope { order('entrydate DESC') } 
end