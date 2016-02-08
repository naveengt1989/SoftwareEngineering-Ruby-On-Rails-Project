class RadioShowsController < ApplicationController
  layout 'homeLayout', :except => [:loadEvents, :showList]
  before_action :set_radio_show, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user, :only => [:index, :viewEdit, :show, :edit, :update, :destroy, :new, :create, :showList, :loadEvents, :loadClock]
  # GET /radio_shows
  # GET /radio_shows.json
  def index
    #@radio_shows = RadioShow.all;
    if (@current_user.userName == "admin")
 	redirect_to :controller=>'users', :action => 'index'; 
    end

    @date = formatAMPM();
    Time.zone = @current_user.timeServer;
    weekday = Time.zone.now.strftime("%A");
    radio_shows_list = (RadioShow.all.where("user_id" => @current_user.id).includes(:show_timings).where('show_timings.day' => weekday)).uniq;
    @radio_shows = radio_shows_list;
  end

  def viewEdit
    @radio_shows = RadioShow.all.where("user_id" => @current_user.id);
  end
  # GET /radio_shows/1
  # GET /radio_shows/1.json
  def show
  end

  # GET /radio_shows/new
  def new
    @radio_show = RadioShow.new
  end

  # GET /radio_shows/1/edit
  def edit
  end

  def loadClock
    #Net::NTP.get('2.us.pool.ntp.org')
    #@date = Net::NTP.get.time
    #@date = Time.now
    #@date = @date.strftime("%B %d, %Y %H:%M:%S")
    @date = formatAMPM();
    #render _timer
    render plain: @date;
  end

  def formatAMPM()
    #date= Time.now;
    #Time.zone = "Central Time (US & Canada)";
    Time.zone = @current_user.timeServer;
    date = Time.zone.now;
    #date = date.strftime("%B %d, %Y %H:no implicit conversion of Fixnum into S%M:%S")
    weekday = ["Sunday", "Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
    day = date.strftime("%A");
    hours = date.hour;
    minutes = date.min;
   seconds = date.sec;
  ampm = hours >= 12 ? "PM" : "AM";
  hours = hours % 12;
  if hours == 0
    hours = 12;
  end
  hours = hours < 10 ? ("0" + hours.to_s) : hours.to_s;
  minutes = minutes < 10 ? "0" + minutes.to_s : minutes.to_s;
  seconds = seconds < 10 ? "0"+seconds.to_s : seconds.to_s;
  strTime = hours + ':' + minutes + ':' + seconds + ' ' + ampm + ' ' +day ;
  return strTime;
  end

  
  def loadEvents
     Time.zone = @current_user.timeServer;
     weekday = Time.zone.now.strftime("%A");
     radio_shows_list = (RadioShow.all.where("user_id" => @current_user.id).includes(:show_timings).where('show_timings.day' => weekday)).uniq;
     @radio_shows = radio_shows_list;
    render :partial => "loadEvents"
  end

  def showList
    weekday = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    if (weekday.include?(params[:id]))
      #radio_shows_list2 = (RadioShow.joins(:show_timings).where('show_timings.day' => params[:id])).uniq;
      #radio_shows_list2 = (RadioShow.includes(:show_timings).where('show_timings.day' => params[:id])).uniq;
      radio_shows_list2 = (RadioShow.all.where("user_id" => @current_user.id).includes(:show_timings).where('show_timings.day' => params[:id])).uniq;
      @radio_shows_list = radio_shows_list2;
    else
      @radio_shows_list = RadioShow.all.where("id" => params[:id], "user_id" => @current_user.id);
    end
    render :layout => false
  end



  # POST /radio_shows
  # POST /radio_shows.json
  def create
    @radio_show = RadioShow.new(radio_show_params)
    respond_to do |format|
      if @radio_show.save
        format.html { redirect_to @radio_show, notice: 'Radio show was successfully created.' }
        format.json { render :show, status: :created, location: @radio_show }
      else
        format.html { render :new }
        format.json { render json: @radio_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /radio_shows/1
  # PATCH/PUT /radio_shows/1.json
  def update
    respond_to do |format|
      if @radio_show.update(radio_show_params)
        format.html { redirect_to @radio_show, notice: 'Radio show was successfully updated.' }
        format.json { render :show, status: :ok, location: @radio_show }
      else
        format.html { render :edit }
        format.json { render json: @radio_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /radio_shows/1
  # DELETE /radio_shows/1.json
  def destroy
    @radio_show.destroy
    respond_to do |format|
      format.html { redirect_to radio_shows_url, notice: 'Radio show was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_radio_show
      @radio_show = RadioShow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def radio_show_params
      #params.require(:radio_show).permit(:user_id, :name, :description)
      params.require(:radio_show).permit(:user_id, :name, :description, 
  show_timings_attributes: [:day, :segment_name, :startTime, :endTime, :_destroy, :id])
    end
end
