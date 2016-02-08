class ShowTiming < ActiveRecord::Base
  validates_presence_of :segment_name
  belongs_to :radio_show
end
