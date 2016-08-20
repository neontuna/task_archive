class Workentry < ActiveRecord::Base
  include Searchable
  searchable_fields :internal_notes, :summary_notes

  belongs_to :workrecord
end