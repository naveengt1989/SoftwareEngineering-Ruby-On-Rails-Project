class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :match_password]
  #before_filter :save_login_state, :only => [:create]
  before_filter :authenticate_user, :only => [:index, :show, :update, :destroy]
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end


  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
	session[:user_id] = @user.id
        if (@user.userName == "admin")
		format.html {redirect_to :controller=>'users', :action => 'index', notice: 'User was successfully created.' };	
	else
		format.html {redirect_to :controller=>'radio_shows', :action => 'index', notice: 'User was successfully created.' };	
	end
        #format.html { redirect_to @user, notice: 'User was successfully created.' }
        #format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        #format.html { redirect_to @user, notice: 'User was successfully updated.' }
	if (@current_user.userName == "admin")
		format.html {redirect_to :controller=>'users', :action => 'index'};	
	else
		format.html {redirect_to :controller=>'radio_shows', :action => 'index'};
	end
        #format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html {redirect_to :controller=>'users', :action => 'index', notice: 'User was successfully destroyed.'};
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:userName, :hostName, :emailAddress, :timeServer, :password, :password_confirmation, :location, :flashTime)
    end
end
