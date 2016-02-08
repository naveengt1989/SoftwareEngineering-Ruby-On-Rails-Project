class RadioShow < ActiveRecord::Base
validate :valid_show_timing_edit, on: :update
validate :valid_show_timing, on: :create
validates_presence_of :name
validates_presence_of :description
#validate :day, on: :create or :update
belongs_to :user
has_many :show_timings, dependent: :destroy
  accepts_nested_attributes_for :show_timings, :reject_if => :all_blank, :allow_destroy => true

  def valid_show_timing
    show_timings.each do |show_timing|
  if (show_timing.endTime <= show_timing.startTime)
    errors.add( :Show, " Timing Info Error: END_TIME <= START_TIME !!!");
  end
  # start of any existing show is between start/end of new show
      @radio_shows_list1 = (RadioShow.all.where("user_id" => user_id).includes(:show_timings).where('show_timings.day' => show_timing.day, 'show_timings.startTime' => show_timing.startTime..show_timing.endTime )).uniq;
  # end of any existing show is between start/end of new show
  @radio_shows_list2 = (RadioShow.all.where("user_id" => user_id).includes(:show_timings).where('show_timings.day' => show_timing.day, 'show_timings.endTime' => (show_timing.startTime+1)..(show_timing.endTime) )).uniq;
  # start and end is oany existing show includes start/end of new show
  #@radio_shows_list3 = (RadioShow.all.where("user_id" => user_id).includes(:show_timings).where( 'show_timings.day' => show_timing.day).where( "show_timings.startTime <= ? and show_timings.endTime" >= ?",show_timing.startTime, show_timing.endTime)).uniq;
  @radio_shows_list3 = (RadioShow.all.where("user_id" => user_id).includes(:show_timings).where( 'show_timings.day' => show_timing.day).where( '"show_timings"."startTime" <= ? and "show_timings"."endTime" >= ?',show_timing.startTime, show_timing.endTime)).uniq;
@radio_shows_list4 = (RadioShow.all.where("user_id" => user_id, "name" => name)).uniq;

      if (!@radio_shows_list1.empty?)
    @radio_shows_list1.each do |radio_show|
      list = " Timings Overlap with existing show event: "+radio_show.name + " !!! "
      errors.add( :Show, list);
    end
      end
      if (!@radio_shows_list2.empty?)
    @radio_shows_list2.each do |radio_show|
      list = " Timings Overlap with existing show event: "+radio_show.name + " !!! "
      errors.add( :Show, list);
    end
      end
      if (!@radio_shows_list3.empty?)
    @radio_shows_list3.each do |radio_show|
      list = " Timings Overlap with existing show event: "+radio_show.name + " !!! "
      errors.add( :Show, list);
    end
      end
    end


if (!@radio_shows_list4.empty?)
    @radio_shows_list4.each do |radio_show|
      if (id != radio_show.id)
      	list = " Name Matches with existing show event: !!! "
      	errors.add( :Show, list);
      end
    end
      end



    show_timings.permutation(2).select{|a, b|
    if ( (b.day == a.day) && (b.startTime >= a.startTime) &&  (b.startTime <= a.endTime) )
   errors.add(:Show, " Timings Overlap in Submitted Info!!!! ");
    end
    }
  end

def valid_show_timing_edit
    show_timings.each do |show_timing|
  if (show_timing.endTime <= show_timing.startTime)
    errors.add( :Show, " Timing Info Error: END_TIME <= START_TIME !!!");
  end
  # start of any existing show is between start/end of new show
      @radio_shows_list1 = (RadioShow.all.where("user_id" => user_id).includes(:show_timings).where('show_timings.day' => show_timing.day, 'show_timings.startTime' => show_timing.startTime..show_timing.endTime )).uniq;
  # end of any existing show is between start/end of new show
  @radio_shows_list2 = (RadioShow.all.where("user_id" => user_id).includes(:show_timings).where('show_timings.day' => show_timing.day, 'show_timings.endTime' => (show_timing.startTime+1)..(show_timing.endTime) )).uniq;
  # start and end is oany existing show includes start/end of new show
  #@radio_shows_list3 = (RadioShow.all.where("user_id" => user_id).includes(:show_timings).where( 'show_timings.day' => show_timing.day).where( "show_timings.startTime <= ? and show_timings.endTime" >= ?",show_timing.startTime, show_timing.endTime)).uniq;
  @radio_shows_list3 = (RadioShow.all.where("user_id" => user_id).includes(:show_timings).where( 'show_timings.day' => show_timing.day).where( '"show_timings"."startTime" <= ? and "show_timings"."endTime" >= ?',show_timing.startTime, show_timing.endTime)).uniq;
@radio_shows_list4 = (RadioShow.all.where("user_id" => user_id, "name" => name)).uniq;

if (!@radio_shows_list4.empty?)
    @radio_shows_list4.each do |radio_show|
      if (id != radio_show.id)
      	list = " Name Matches with existing show event: !!! "
      	errors.add( :Show, list);
      end
    end
      end





      if (!@radio_shows_list1.empty?)
    @radio_shows_list1.each do |radio_show|
      if (id != radio_show.id)
      	list = " Timings Overlap with existing show event: "+radio_show.name + " !!! "
      	errors.add( :Show, list);
      end
    end
      end
      if (!@radio_shows_list2.empty?)
    @radio_shows_list2.each do |radio_show|
      if (id != radio_show.id)
      list = " Timings Overlap with existing show event: "+radio_show.name + " !!! "
      errors.add( :Show, list);
      end
    end
      end
      if (!@radio_shows_list3.empty?)
    @radio_shows_list3.each do |radio_show|
      if (id != radio_show.id)
      list = "Timings Overlap with existing show event: "+radio_show.name + " !!! "
      errors.add( :Show, list);
    end
    end

      end
    end
    show_timings.permutation(2).select{|a, b|
    if ( (b.day == a.day) && (b.startTime >= a.startTime) &&  (b.startTime <= a.endTime) )
   errors.add(:Show, " Timings Overlap in Submitted Info!!!! ");
    end
    }
  end

end
