class SessionsController < ApplicationController
 before_filter :authenticate_user, :only => [:home, :profile, :setting]
 before_filter :save_login_state, :only => [:login, :login_attempt] 
 def login
	#Login Form
 end

 def login_attempt
	 authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
	if authorized_user
		session[:user_id] = authorized_user.id
		#flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.userName}"
		#redirect_to(:action => 'home')
		if (authorized_user.userName === "admin")
			redirect_to :controller=>'users', :action => 'index';	
		else
			redirect_to :controller=>'radio_shows', :action => 'index';
		end
	else
		flash.now[:error] = "Invalid Username or Password"
		flash[:color]= "invalid"
		render "login"	
	end 
 end
 def logout
  session[:user_id] = nil
  redirect_to :action => 'login'
 end 
  def home
  end

  def profile
  end

  def setting
  end
end


