class Workrecord < ActiveRecord::Base
  belongs_to :task
  belongs_to :technician
  has_many :workentries

  default_scope { order('entrytimestamp DESC') } 

  # little aliasing so we're not typing workentries.first all the time
  def e
    if workentries.any?
      workentries.first
    else
      nil
    end
  end

end